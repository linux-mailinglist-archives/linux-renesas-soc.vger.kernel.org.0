Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74AA440A131
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 01:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348722AbhIMXCd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 19:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349859AbhIMXCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 19:02:22 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FD8C0617A8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 15:47:09 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id n4so6845070plh.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 15:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lcsDcf5NqoRvnNK6hqQfCyZt0dVxtiWw55R0tByyBOs=;
        b=eqsoLx/8N7AOd7wz26zTxu6MZBXdbXML5E9o6PH5iKsZJZhVTVCLVFx5S+5HyBsG+E
         iGjZlAXjBtIebM1WkrmoDE2sWKjmAnz9m/8Ox7sUowWbiGiPLDp+QrCDNoCN8njCGsed
         JIs07NWbI2/sNHzQdtqEgZ1h3hy1TVBc2HfVHmDrpsRePRqRfiTg6slL9CRLFe80fMqv
         m7oFp8lariGsVCIO0Ec0W1OeDCEt791h/OnICOeu+aM/4ZH5MtEjOutQztzUnKO0/UMe
         PL59k/OrDdeKcnmoGKd1/KKlVoQr8GCpDv/uYbOEYnz6qULXgBmHa+5QLYxzamPw5qwo
         gC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lcsDcf5NqoRvnNK6hqQfCyZt0dVxtiWw55R0tByyBOs=;
        b=6SWzhSAgWyTr7yCiKA1g4jjRgC6um+4Sa2qzkaHpfk2oSzcCn0uu2NbDzHDGtpjkZU
         2NeLtXtJiYkYotD3DaMta50HV9q2r2Xq5MhXsADgSynyygXHrveA8Mlo3Nh0TXZ0jppN
         D7IlDPulDs0cigZvadC7RGX8u1DwxGXTCIgFq7nFh4Zvl368ZOS8cFfzlmLh6Zfb6ln0
         LECrn82vPt+i3e6gr84DhH63bnKd+OJqBPOONqmSG2fbVda9QuvNc2/ogHKYC8WAWJj2
         vh59jfe2Im1ZBxTRcn9kW0UZ/tzf50zPXkYa1P3ia4jAiWgsdnKRhqGORDokcc6INY5l
         C0VQ==
X-Gm-Message-State: AOAM5306AB9Am0ed+fDbV3PoDkr2agjNsAKrCv64FOH2M2mKDSsZzLD+
        Ab0cmxQvtF018A0N9CsYObFoz4b5DmxfHo0t
X-Google-Smtp-Source: ABdhPJysJnftegJ9T7LfXFqwfKXise/eF45D1p3hwKTWpT2MpL2X1MfIs5bU4HFbI/H39r1IV9D4Lg==
X-Received: by 2002:a17:90a:2bc1:: with SMTP id n1mr1969794pje.100.1631573229101;
        Mon, 13 Sep 2021 15:47:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id on6sm6070092pjb.19.2021.09.13.15.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 15:47:08 -0700 (PDT)
Message-ID: <613fd4ec.1c69fb81.b6479.2d16@mx.google.com>
Date:   Mon, 13 Sep 2021 15:47:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-564-ge23d26d2dc9a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 63 runs,
 13 regressions (v5.15-rc1-564-ge23d26d2dc9a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 63 runs, 13 regressions (v5.15-rc1-564-ge23d26=
d2dc9a)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
        | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+crypto | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+ima    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+crypto | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+ima    | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+crypto | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
        | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config  | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
5-rc1-564-ge23d26d2dc9a/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: v5.15-rc1-564-ge23d26d2dc9a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e23d26d2dc9ad4831b447fc9ef348b1621fac32d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/613fbd33a94ad518a999a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613fbd33a94ad518a=
999a2db
        failing since 61 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima    | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9caa93194dd52a99a32c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613f9caa93194dd52=
a99a32d
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9f9fbd257ba22c99a30b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g12b-a31=
1d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g12b-a31=
1d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613f9f9fbd257ba22=
c99a30c
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa11ab47951e28499a2fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613fa11ab47951e28=
499a2fb
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+ima    | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9c7da264cf692b99a30d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613f9c7da264cf692=
b99a30e
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9f6ab5141bf84099a30f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-meson-g12b-a3=
11d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-meson-g12b-a3=
11d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613f9f6ab5141bf84=
099a310
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa0958d1c1829fd99a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613fa0958d1c1829f=
d99a2eb
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+ima    | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9c8acaa0d57ae999a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt8173-el=
m-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt8173-el=
m-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613f9c8acaa0d57ae=
999a2f4
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/613f9f8c124920f2e599a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173-elm-ha=
na.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173-elm-ha=
na.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613f9f8d124920f2e=
599a2e4
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/613fa09dbd3a4b5b4f99a370

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613fa09dbd3a4b5b4=
f99a371
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
        | 2          =


  Details:     https://kernelci.org/test/plan/id/613fa5153963e7c93f99a2e3

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/613fa5153963e7c93f99a2e9
        failing since 61 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-09-13T19:22:52.710635  [   43.854321] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-09-13T19:22:53.759500  /lava-4512985/1/../bin/lava-test-case
    2021-09-13T19:22:53.802544  [   44.946852] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/613fa5153963e7c93f99a2ea
        failing since 61 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-09-13T19:22:52.666102  /lava-4512985/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config  | 1          =


  Details:     https://kernelci.org/test/plan/id/613fcea5d9dbd2abee99a304

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-a20-=
olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-a20-=
olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/613fcea5d9dbd2abe=
e99a305
        failing since 160 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
