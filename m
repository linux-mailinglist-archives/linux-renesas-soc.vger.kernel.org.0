Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CB651C444
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 17:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241278AbiEEPxB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 11:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiEEPxA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 11:53:00 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9865A174
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 08:49:20 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id fv2so4555630pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 May 2022 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tH893ZK6HzJcrf5pnzw+infse4SGrp/zqREEZR6OrGM=;
        b=14Z+25bIpjJGBkmatFiHsG1puy3LVEMd4IXicuVuxsyF1HJb6aSLpeNYMdtO0GGm9X
         7XajPB/dDQwg3/TXUXdcvzoDQTEnOJL/pwr6JJV8aRXK5YPKxIYD4OF8/e9Hn9oEsd6t
         6YtlC/8H8KFjXUaGcmhRYc4UYDaLp6Df2XeRQKaYwB8YIjA6HgyeCu14T5bxL8Zi1W2i
         n1mfPbrN0P5ejXMfPXFsa7/b+xfWY0ph/yY/WS2JmghlWHjjlxjrr9XjEFNTny5aObRk
         m9EyJiOyF5kEA3A9RS0TwXy2je8bXC3TkZxRlzCp9EVvvTTCHB2ueg+QxdusyaQwAUSm
         F5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tH893ZK6HzJcrf5pnzw+infse4SGrp/zqREEZR6OrGM=;
        b=s3cFab0BMzy9x1FySTepdneFvdd2hqr1pUGqDt2jRpFEqL2Sk/SaYvr9Wx/olw6aNk
         +0nqAVOtc7FsLj6cgBnDyp7PP2Kk9FFV+cYOPM9SyCl0CMnqYdN2synTUUgElPGFb4cZ
         /k7+/EizEg4N96rip7lW/Zfy9rnoO0ZKp00WKf4V/MZMrLG4URsjO794PYAWSQNeeRdA
         Gy4E2nkPKV2oT/G12qCPy9IBMN7LlaRfrq1m1FmIHTB22Sza4AGn0cULpqhLtJQA2b3H
         J896VGbdh3M/DePgGEXRAOLOWrKsiuqPjDTSyNB1kBdtRuu6zjGITNvz64WLH26BiWLx
         IpDw==
X-Gm-Message-State: AOAM53279vFrusHkOzTYGA3wDfjoT6NJdcR99lpfWjz2YvkV5u5o8e6C
        LXd9a5M1zL5b1o2T/oZLF8ZlKw+WwlW3NClr59c=
X-Google-Smtp-Source: ABdhPJzl8WwsRdHcG9grVVZlxtxcUr35IlV9TOevMxLIfc2hIjdYaHoKLD+oqO0hQV1bFBPXQ22ZEA==
X-Received: by 2002:a17:90a:c08a:b0:1d9:88de:d192 with SMTP id o10-20020a17090ac08a00b001d988ded192mr6970637pjs.8.1651765759680;
        Thu, 05 May 2022 08:49:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c14c00b0015e8d4eb29asm1712924plj.228.2022.05.05.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:49:19 -0700 (PDT)
Message-ID: <6273f1ff.1c69fb81.95391.389c@mx.google.com>
Date:   Thu, 05 May 2022 08:49:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-05-v5.18-rc5
Subject: renesas/master baseline-nfs: 86 runs,
 7 regressions (renesas-devel-2022-05-05-v5.18-rc5)
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

renesas/master baseline-nfs: 86 runs, 7 regressions (renesas-devel-2022-05-=
05-v5.18-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config            | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-05-v5.18-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-05-v5.18-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d1312c8c2b58ca08cd1d871e77474e7b2af0d3ce =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bedf9c496a44228f5753

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273bedf9c496a442=
28f5754
        new failure (last pass: renesas-devel-2022-05-03-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6273be5e52bebbc8f38f574c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273be5e52bebbc8f=
38f574d
        new failure (last pass: renesas-devel-2022-05-03-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bfefa2766f174e8f571e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273bfefa2766f174=
e8f571f
        new failure (last pass: renesas-devel-2022-05-02-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima              | 1          =


  Details:     https://kernelci.org/test/plan/id/6273c1ad98558a5c658f5719

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-me=
son-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-me=
son-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273c1ad98558a5c6=
58f571a
        new failure (last pass: renesas-devel-2022-05-03-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/6273c33c6197ddb4348f5743

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273c33c6197ddb43=
48f5744
        new failure (last pass: renesas-devel-2022-04-19-v5.18-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima              | 1          =


  Details:     https://kernelci.org/test/plan/id/6273c508888182f72e8f5749

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6273c508888182f72=
e8f574a
        new failure (last pass: renesas-devel-2022-04-19-v5.18-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bdffbed364fe318f571c

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6273bdffbed364fe318f573d
        failing since 57 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-05T12:07:11.827999  /lava-6274515/1/../bin/lava-test-case
    2022-05-05T12:07:11.856471  <8>[   38.888375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
