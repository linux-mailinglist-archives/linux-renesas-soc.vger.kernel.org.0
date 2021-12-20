Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8205C47AAB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 14:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhLTN4F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 08:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhLTN4E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 08:56:04 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E66C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 05:56:04 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id y9so9469242pgj.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 05:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vl1K34C6CZ172eelDxUFvglsb+b8rGoaCQYPsTetOlw=;
        b=AH+1naXAHH+s5wjGZPBfQ+hvX12l1SLmpBIj2Lx2CJ6yu0aSqsAvcdKDeYk+QIBw61
         77mjCEXHyqJ6L7Tzc2dPT/V1XulJpLaPvNJFs3SHf+ctR/zRZaZNZ24XbhmHcC+hJE2R
         aBT2MbkiZEDfdJFpSN9kDefrHZQ9O5uf98pzgf1cPcXaEaIN0A2TCuYCU8SlFTza9Oal
         2/PSKSszzP99qbEPYDUX+LHqN9QGi2kjY9dtEtEn0+dnnnHM3Vof/YHHakY4tB07bMv8
         4YYRMIiFs6CwY0AIbIOpCUUAQ1VdNdam6xeJ1ND+ixiW8mEVaGkcZtpPeA71/JL8KU8p
         YiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vl1K34C6CZ172eelDxUFvglsb+b8rGoaCQYPsTetOlw=;
        b=QWWwIeE77FWRvGAiZTmLqvwMfz3SXeREUIebkUgk9ksQxBx25lV2/banFLHR2oc4SC
         OxCtxQcx4jH/6sr4sFz6UIXqNSonCIz11t1mOd8RYJjZaqaWE6SB/zkbkApxF8xR5pEf
         LTIzr3DrBWqECn+M49xbRrMcKkyijF6XVfhj8w2swD3x3OgzN9MLO4EjFOMkm6t8OAXs
         q2zI+GgKkL9RNY+PlwLKN+gs+svYSzcAMq/7Mf0MIVBVUhflneB13VPT113Hj5WVWJVO
         mkNM321eJv/SF2/xzklKGwNhHYaA0FP9SJg2xkvPkB/j52SZ23Y8PzC2rUrrTZPnt99k
         pqOQ==
X-Gm-Message-State: AOAM533NxfhZ4XU5nYUHpzKMWtDUvxsLG5STxgcM+DhOPso/cO2D/biE
        173vkb+GLVNHqQT0p58wfwP8V/kSYtUdjleQ
X-Google-Smtp-Source: ABdhPJxhhu4VrEoLBkRQIPg6c51YVVXSI2L/vnt4D/1tWq4QpSUYaqDvESlU2zmWtvAlWmrKWeHoaw==
X-Received: by 2002:a63:114:: with SMTP id 20mr11245324pgb.342.1640008563942;
        Mon, 20 Dec 2021 05:56:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t3sm18928394pfj.207.2021.12.20.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 05:56:03 -0800 (PST)
Message-ID: <61c08b73.1c69fb81.1d7bd.401b@mx.google.com>
Date:   Mon, 20 Dec 2021 05:56:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-20-v5.16-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 383 runs,
 6 regressions (renesas-devel-2021-12-20-v5.16-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 383 runs, 6 regressions (renesas-devel-2021-12-20-=
v5.16-rc6)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-20-v5.16-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-20-v5.16-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8398a361cd075d8ec3e1d68b246a67148a1486d1 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c054cdc1b68664ba39714d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c054cdc1b68664ba397=
14e
        failing since 34 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0520eab491cedc03971c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-m=
innowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-m=
innowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0520eab491cedc0397=
1c6
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61c054b6217f7a5989397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collab=
ora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collab=
ora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c054b6217f7a5989397=
149
        new failure (last pass: renesas-devel-2021-12-17-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61c056640cad28d433397122

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/la=
b-collabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/la=
b-collabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c056640cad28d433397=
123
        failing since 3 days (last pass: renesas-devel-2021-12-14-v5.16-rc5=
, first fail: renesas-devel-2021-12-16-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c05be7ca53f77c49397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c05be7ca53f77c49397=
121
        new failure (last pass: renesas-devel-2021-12-17-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0799a2e1452d288397124

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
61c0799a2e1452d28839715f
        new failure (last pass: renesas-devel-2021-12-17-v5.16-rc5)

    2021-12-20T12:39:35.244215  /lava-5269758/1/../bin/lava-test-case<8>[  =
 12.950480] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =20
