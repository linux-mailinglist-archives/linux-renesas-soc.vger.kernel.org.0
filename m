Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9F82D99C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 15:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440157AbgLNOXX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 09:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440163AbgLNOXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 09:23:17 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E46C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 06:22:37 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id w5so11767185pgj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 06:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DnJgM4u1s1Tu1LJlAwB2Mtp3xdKVq/7OCKyStWN3ke0=;
        b=Q3TKi7xjE29p9ynjXzPgwabNxZnCkqtbBo8RGUHCd1YKswpl6X3MYDVMuyHLuF2aXQ
         L7E6AdlTHWDbEYjrSj7NFQYCtuYfoqxnlOMsQP0VdpwoRfIUU+xP/0yLIE4pWvA9dXHx
         ljVuNfvKwjzxb8b3N2Wray7hK/HnICjRLiitOqCz9uHknQFNBb/qKtZcWlsQRtI9TVaE
         ZjrYSSpM5NdLGUlpN0IsoJemR7Zb1BP3D0dOqCoBm59mkCZWs0c9+3ZUTDDAbByC/i+8
         lEVW4EnWACXXqmI0FxLep/jLKEM23BWfyxddUo7I2sS7xBVW6szntnYUbK56Af5czmae
         RCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DnJgM4u1s1Tu1LJlAwB2Mtp3xdKVq/7OCKyStWN3ke0=;
        b=IoSk06wA2uE18TVRCDZp9p1RI5BHaIKPBUV3Pqb19/zQUxr43O0j4t2Kl+SWMZKBuD
         0PPIfDFX731FYHBjeh6Y8gcS1n3Rz8aII1wLH5QGS3y/oDC170qi1aDOz2wYR00SCrgD
         vX8EKv3RpwBDM/T4S2+ooWJj/sK0SAEVtrsJSyF43vc08bF//SI4du3PW9O9f7AjMUtI
         3LGgt20v5YeLm7/nCWKjN4CzxXGCHdLGfQHSMQ2/yBfH10FdoA9EaJf/GGEjhDdD3uP8
         R7H7RmCiGDNWjFTEORCPvxe6ieVelWCWDFKZWEUW74isiziKfQK7bsXtsZW9SRxxMRQ9
         o0sA==
X-Gm-Message-State: AOAM530lC9sNmUtzA6RmVlRPP/Cf5fjDAHOUpnFkiC1/DlvOEBHTp9H6
        k/TrXIk4aHWWWNnTN7wH7bUydFscLBAvWQ==
X-Google-Smtp-Source: ABdhPJzKYCiAk35PdDelHTDwnSXxcM8/K4LndcE2Ey+cvdhh11xjP/nLXvaDZQoxtAlvvBJSlXP5ww==
X-Received: by 2002:a63:62c3:: with SMTP id w186mr4759925pgb.83.1607955756597;
        Mon, 14 Dec 2020 06:22:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f64sm20531191pfb.146.2020.12.14.06.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:22:35 -0800 (PST)
Message-ID: <5fd7752b.1c69fb81.94a32.93ce@mx.google.com>
Date:   Mon, 14 Dec 2020 06:22:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-12-14-v5.10
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 226 runs,
 6 regressions (renesas-devel-2020-12-14-v5.10)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 226 runs, 6 regressions (renesas-devel-2020-12-14-=
v5.10)

Regressions Summary
-------------------

platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd            | arm  | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 2          =

qemu_arm-versatilepb     | arm  | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-12-14-v5.10/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-12-14-v5.10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c308f63de590dadc2c668e9d347da00b0fa76ade =



Test Regressions
---------------- =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd            | arm  | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd73ebdfe323873e0c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd73ebdfe323873e0c94=
cc3
        failing since 41 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd73d395b20d7e931c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd73d395b20d7e931c94=
ccd
        failing since 41 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd7416804df15c839c94cb9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-va=
r-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-va=
r-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd7416804df15c=
839c94cbd
        new failure (last pass: renesas-devel-2020-12-07-v5.10-rc7)
        4 lines

    2020-12-14 10:41:21.561000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-12-14 10:41:21.561000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd7416804df15c=
839c94cbe
        new failure (last pass: renesas-devel-2020-12-07-v5.10-rc7)
        26 lines

    2020-12-14 10:41:21.604000+00:00  kern  :emerg : Process kworker/1:1 (p=
id: 53, stack limit =3D 0x(ptrval))
    2020-12-14 10:41:21.604000+00:00  kern  :emerg : Stack: (0xc244feb0 to =
0xc2450000)
    2020-12-14 10:41:21.605000+00:00  kern  :emerg : fea0:                 =
                    1e9b10fe 35365bc8 c3975480 cec60217
    2020-12-14 10:41:21.605000+00:00  kern  :emerg : fec0: 00000000 0000000=
0 00000003 00000000 00000000 35365bc8 c3909840 cec6008f
    2020-12-14 10:41:21.605000+00:00  kern  :emerg : fee0: cec6020f ef7ad40=
0 00000000 c09b43f0 fffffc84 fffffc84 c3a37c00 ef7ad400
    2020-12-14 10:41:21.646000+00:00  kern  :emerg : ff00: 00000000 c1a1ec6=
0 00000000 c09b48d8 c3a37da0 c2338000 ef7aa1c0 c0360764
    2020-12-14 10:41:21.647000+00:00  kern  :emerg : ff20: c2147800 ef7aa1c=
0 00000008 c2338000 c2338014 ef7aa1c0 00000008 c1803d00
    2020-12-14 10:41:21.647000+00:00  kern  :emerg : ff40: ef7aa1d8 ef7aa1c=
0 ffffe000 c0360d50 c2147800 c1a1e357 c137fcb8 c0360aa8
    2020-12-14 10:41:21.648000+00:00  kern  :emerg : ff60: c2338000 c23f258=
0 c2331040 00000000 c244e000 c0360aa8 c2338000 c2137ea4
    2020-12-14 10:41:21.648000+00:00  kern  :emerg : ff80: c23f25a4 c0366ed=
0 00000001 c2331040 c0366d80 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd73ccf0a4ddb3f9bc94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd73ccf0a4ddb3f9bc94=
cce
        failing since 26 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb     | arm  | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd73ce40a4ddb3f9bc94cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd73ce40a4ddb3f9bc94=
cdd
        failing since 26 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
