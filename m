Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D1051C56C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 18:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344772AbiEEQzP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 12:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiEEQzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 12:55:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA06245ACA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 09:51:34 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id bo5so4101520pfb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 May 2022 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cqk5tE+Bphd4u2BeCDvZ+fnX6sCojxzjLob6WQmmODs=;
        b=BzAFikV23rIjgpU3vqazgochZeyiYL9ulgQiae3dsXAiSUN/69sK7krpUvMs9O4Sdx
         Ifilm9vvcc1Rzw9U9gkoxuIjl2scz/CIy2L+b0iUztNrqLLSIXSfAQyq1LdIEk/4shXi
         FxdCzE6AaBttB64A1CwZpX63+4TQxRM2rJQRbeh3g3rpq1/8hllL/9O6plPHIm2pLJru
         4IDuBh8rIk1p3TT3NLKd5hsOFEr6mJ6arcwOis3v7/enm8wMvGQfVHOOjYy2vpaeJcXa
         sTu0MVMh4uCwiZBj5ZTyQl6vNBugyveEJJTYL++z6qJJsVxRQieQYWVPL/Kz5wg4lp6+
         9sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cqk5tE+Bphd4u2BeCDvZ+fnX6sCojxzjLob6WQmmODs=;
        b=DptTjES8RnVuPih2SqQqkshyvRR0awDJsjTVWove7Eh7WQcrexOEJ6TIBgHmQWDQCG
         76xs8TcZULBcR2bfoW0LqlrBSEpczdERWbIBaW2s9w/AOz0/aZc2lhNhtws8BVHVM5K0
         jO7w39698w33yg6vilsaJfR/KahgEF1UwoceO4q56GIsHyCNXa94xuuz/y/y7S+5olmo
         DXrowFHxiGePalwJlx20sjiEyVtFtCVgBPyUNwYdszkOWT+Xa6C2Vcn/kyziW/ZLj9sb
         Ach/2/QSFXioCUgRTOlk4tSPN8F8zm/Jmh+1syOeezLfYkV7aPZ50CCtOGgy52Ub68kb
         Buzg==
X-Gm-Message-State: AOAM533/eFvgH+2a7NckaqE8TGofJpeQWjF264z9INcgdcWpex7SxR7m
        KHd2Vhw2z7zEa0UXol9CduHoWv/ul3vl2UScKBE=
X-Google-Smtp-Source: ABdhPJx0Vm0dWywZ7LcHzMP1PFUErqPp01OhV2Un9izomVzlyYUkXUOBieLExnUJBh640idpSgJumA==
X-Received: by 2002:aa7:8094:0:b0:505:b544:d1ca with SMTP id v20-20020aa78094000000b00505b544d1camr27093682pff.26.1651769493953;
        Thu, 05 May 2022 09:51:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w25-20020aa79559000000b0050dc7628199sm1627983pfq.115.2022.05.05.09.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 09:51:33 -0700 (PDT)
Message-ID: <62740095.1c69fb81.af72d.3609@mx.google.com>
Date:   Thu, 05 May 2022 09:51:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-05-05-v5.18-rc1
Subject: renesas/next baseline-nfs: 81 runs,
 8 regressions (renesas-next-2022-05-05-v5.18-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 81 runs, 8 regressions (renesas-next-2022-05-05-=
v5.18-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+ima                | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-05-05-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-05-05-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d51e220c34ad3ba0cdc5237674386886fb842169 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6273d10ed5879715d68f572f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273d10ed5879715d=
68f5730
        new failure (last pass: renesas-next-2022-05-03-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6273d4190f22002ffe8f5717

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273d4190f22002ff=
e8f5718
        new failure (last pass: renesas-next-2022-05-03-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6273e3a471d8eaf2a38f5729

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273e3a471d8eaf2a=
38f572a
        new failure (last pass: renesas-next-2022-05-03-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6273d68bacab6cb02d8f5744

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273d68bacab6cb02=
d8f5745
        failing since 15 days (last pass: renesas-next-2022-04-13-v5.18-rc1=
, first fail: renesas-next-2022-04-19-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6273dbb35d33eb49ee8f5732

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273dbb35d33eb49e=
e8f5733
        new failure (last pass: renesas-next-2022-04-19-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6273de1fde47bbf2dd8f5717

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273de1fde47bbf2d=
d8f5718
        new failure (last pass: renesas-next-2022-04-19-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6273e24392dfa063068f5723

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273e24392dfa0630=
68f5724
        failing since 15 days (last pass: renesas-next-2022-04-11-v5.18-rc1=
, first fail: renesas-next-2022-04-19-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6273cd42c725a4a3708f5767

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6273cd42c725a4a3708f5789
        failing since 29 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-05-05T13:12:20.221361  /lava-6275623/1/../bin/lava-test-case   =

 =20
