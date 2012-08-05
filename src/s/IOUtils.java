/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package s;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class IOUtils {

  /**
   * Get the contents of an <code>InputStream</code> as a <code>byte[]</code>.
   * <p>
   * This method buffers the input internally, so there is no need to use a
   * <code>BufferedInputStream</code>.
   * 
   * @param input
   *          the <code>InputStream</code> to read from
   * @return the requested byte array
   */
  public static byte[] toByteArray(InputStream input) {
    try {
      ByteArrayOutputStream output = new ByteArrayOutputStream();
      copy(input, output);
      return output.toByteArray();
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }

  private static int copy(InputStream input, OutputStream output)
      throws IOException {
    long count = copyLarge(input, output);
    if (count > Integer.MAX_VALUE) {
      return -1;
    }
    return (int) count;
  }

  private static long copyLarge(InputStream input, OutputStream output)
      throws IOException {
    byte[] buffer = new byte[4096];
    long count = 0;
    int n = 0;
    while (-1 != (n = input.read(buffer))) {
      output.write(buffer, 0, n);
      count += n;
    }
    return count;
  }

}