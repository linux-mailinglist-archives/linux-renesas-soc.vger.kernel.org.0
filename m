Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 320F3521081
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 11:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiEJJVW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 05:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238514AbiEJJVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 05:21:18 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D928209B66
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2022 02:17:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id iq10so15378678pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2022 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BtHBoXWpEt+GlKTA8O9EGR1jJOYDkybQD9RD+7OrGAw=;
        b=X8zs4yoYlvip4CrnkmRgT1puscc9jvOk2c/KfgVpfHL+7FhxdEjYcX0qT0Ju0XMgWd
         Via8GAa01j4j4B8+R9FZJ3gJdFDBwveFDAAOrdAq85k1HvvysUremmFDkUEus3zl9R7+
         zMI9LZ8L4dQ2cU9sVvnw9bf522MUKNmZFMpBw2WiHImroCqQTnx9ssuAlZtAiDnOJEGe
         CuZDjV72bm8hcKLjUattC0CDD38TUh1eISnVY3EvT8k+iLyq/kdFGxOHiJUEcW+K4YBr
         3DH6UFgc96iPZogz3+pKGUxp2mQVhnzYVGPO5iFAVqFP4FQOHWanhX5+wn4J6/XF9LYm
         HtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BtHBoXWpEt+GlKTA8O9EGR1jJOYDkybQD9RD+7OrGAw=;
        b=vEKK5JQM+1bA5xXadDwR0mPTOaSnaFfiKg6XJXR92dfXpombPPWxCYFf2dgmYEOtZ5
         h0RjJ1BKikraiNIPhN++65HrRRTMK1VwCmVQopmzEnW+ed8lnGYzKtx9qfI5fqp32R4z
         MC3BKQCioavVsfVkoOzLhbohvzCDbyxtxvQh35SvTlQyaHJqoKTMg2fOuPKBDPKAOK0X
         cnfy7Te1nEnjoUlQoxFUeGDTMsoIBtbL5MCaPWmJ5okCGmFECeBvkU0rhBeQjFsEuC7v
         KTL72i43Tf+8BhrSkobRcWQGFOBw2jFp91PfhlHPDJ/kcFxqO16JsyUWJYXf6K3EpoXM
         mD4w==
X-Gm-Message-State: AOAM531Kul3FiRaXYkrxi8W4Fc9SAJHX8kAMGdP6FO3/A/zuLOsbZUzH
        BKmTAL7vIKsot7fSxrCYWbiKNMm+P3R+iy9YJw8=
X-Google-Smtp-Source: ABdhPJxpBFSu1vFMQMqN7b4sYqmoNgR7xH561LrLvGKweJGpJQHljtWN4HyS0yWeGoDlGCGlzaZ03Q==
X-Received: by 2002:a17:90b:1b4d:b0:1dc:c33c:3fc9 with SMTP id nv13-20020a17090b1b4d00b001dcc33c3fc9mr21997194pjb.123.1652174239627;
        Tue, 10 May 2022 02:17:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902b70800b0015e8d4eb2b4sm1439985pls.254.2022.05.10.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 02:17:19 -0700 (PDT)
Message-ID: <627a2d9f.1c69fb81.24d00.3a81@mx.google.com>
Date:   Tue, 10 May 2022 02:17:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-09-v5.18-rc6
Subject: renesas/master baseline: 314 runs,
 12 regressions (renesas-devel-2022-05-09-v5.18-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 314 runs, 12 regressions (renesas-devel-2022-05-09=
-v5.18-rc6)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-09-v5.18-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-09-v5.18-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      96a98dbdcdfa4ace2fe647058d40c5950b1204cd =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6279783f2e9bd8bd4d8f5776

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6279783f2e9bd8bd4d8f5=
777
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95=
ae4ce1f1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6279738f01acda3d828f57b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6279738f01acda3d828f5=
7b6
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95=
ae4ce1f1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62797597299e78af028f5789

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62797597299e78af028f5=
78a
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95=
ae4ce1f1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62797eab8a6b755c538f571a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62797eab8a6b755c538f5=
71b
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6279790ff4756dc5058f5721

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6279790ff4756dc5058f5=
722
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62797ec2215bb12a6f8f573b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62797ec2215bb12a6f8f5=
73c
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/627979735091fffa778f5719

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627979735091fffa778f5=
71a
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62797ebe215bb12a6f8f5732

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62797ebe215bb12a6f8f5=
733
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/627979374fdd5edc8d8f5757

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627979374fdd5edc8d8f5=
758
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62797ebf215bb12a6f8f5735

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62797ebf215bb12a6f8f5=
736
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6279794b4fdd5edc8d8f575e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6279794b4fdd5edc8d8f5=
75f
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62797d236e291426ca8f5737

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62797d246e291426ca8f5759
        failing since 62 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-09T20:43:56.456653  <8>[   34.208012] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-09T20:43:57.483713  /lava-6313063/1/../bin/lava-test-case
    2022-05-09T20:43:57.494791  <8>[   35.246247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
