Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019D72F65BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 17:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbhANQWs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 11:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbhANQWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 11:22:47 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAF5C061575
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 08:22:07 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y8so3142591plp.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 08:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=H/P6bBb1tDO9eHG3PpJ7tLMfP+UbDkHt5c14ZMYBlcw=;
        b=OQQtqITESuMeLpq7PjfHPc+HBJctC17ujykfZ8oVubfR44xjs1tc7W5Fvk/HiPwn5Y
         aDqxB9COv4+mESjrrmQHMDEH1BqWnUbRwD2ffvhOQgh1DXz5YHa0LQN5+TATtByTpk/K
         un/L3jY3QVAh7n+3fD3p5x2CYKlbfYg9zfEi7k9J+gwdsl4SrdX84uNmBKNsCS56nWUF
         Q7/uWJJYdSptjapwPhswVLLCI+eWUzk2O1gavydyQ1SBQXIqXeEvkPVw8YgXKV1Ig/wT
         5iLaugTVStOmygov5c2m9LY7nLfXPHr+VO0YH+neeBy0KY4CbxyU5ZXp0EZPULQ0Ike2
         OJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=H/P6bBb1tDO9eHG3PpJ7tLMfP+UbDkHt5c14ZMYBlcw=;
        b=DHC6fulR8hNFZFbX3P3Jtr+wGuDWtRVb8KTquLZBcODa1wIs6lTv01ykPuJKyrGWft
         gZOnndZDbWcQfGOnF/VtMY1kPVRYsKxISACXCm5n2glrML43j206oKIA/A5Ev0FDa8nm
         +5kGoGcmTWxYUaLJGe7jmUjW993wVzaHB3qzudMsfaKLYO9t0gAgndfBTAX+xWBmo0hJ
         bpQ40KCrBYeIABb04OcPw0KH9OM2s+tYZeG9flox0wG9E1bLb+zD4mvjiFirHcogXQx/
         7lOjC6Hf4SbrunxCMxQO9rIw3aRtSMlo0UKgqll+P1G6gX5K2oWmcBrhxjI91N5QBncF
         zFgg==
X-Gm-Message-State: AOAM532eqA7Vqm+Yu4b5J4G4HpDiTnrPNBZuHpt/b+VsS3DrkJCH4Z/Q
        OHr9ERdxF6ywUxzh2bqHTAOY+4WjFw91zw==
X-Google-Smtp-Source: ABdhPJxzjJH0HOFdC2sNYnapI6hcwBL6GYx/5mwPtvowSNqRWq/MU9u93eqR66BPIg/CeI/7wrWTJg==
X-Received: by 2002:a17:90a:b110:: with SMTP id z16mr5553841pjq.167.1610641326586;
        Thu, 14 Jan 2021 08:22:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ay21sm5975385pjb.1.2021.01.14.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:22:05 -0800 (PST)
Message-ID: <60006fad.1c69fb81.18f60.db46@mx.google.com>
Date:   Thu, 14 Jan 2021 08:22:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-01-14-v5.11-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 268 runs,
 8 regressions (renesas-devel-2021-01-14-v5.11-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 268 runs, 8 regressions (renesas-devel-2021-01-14-=
v5.11-rc3)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
bcm2837-rpi-3-b-32       | arm  | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig   | 1          =

imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig  | 2          =

qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig | 1          =

qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig | 1          =

qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-14-v5.11-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-14-v5.11-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b41ea2d5be5e4c959415456cd276cc8dc7fdfa95 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
bcm2837-rpi-3-b-32       | arm  | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig   | 1          =


  Details:     https://kernelci.org/test/plan/id/600036e6c2a2f55c3ac94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm28=
37-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600036e6c2a2f55c3ac94=
cd4
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3) =

 =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/600037bfa03fa976cbc94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600037bfa03fa976cbc94=
cc3
        failing since 73 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig  | 2          =


  Details:     https://kernelci.org/test/plan/id/6000367d801e3eb4a3c94ce6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6=
q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6=
q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6000367d801e3eb=
4a3c94cea
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3)
        4 lines

    2021-01-14 12:17:00.020000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2021-01-14 12:17:00.021000+00:00  kern  :alert : pgd =3D (ptrval)<8>[  =
 39.169187] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D4>
    2021-01-14 12:17:00.021000+00:00  =

    2021-01-14 12:17:00.021000+00:00  kern  :alert : [00000313] *pgd=3D491e=
c831   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6000367d801e3eb=
4a3c94ceb
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3)
        59 lines

    2021-01-14 12:17:00.079000+00:00  kern  :emerg : Process udevd (pid: 12=
9, stack limit =3D 0x(ptrval))
    2021-01-14 12:17:00.079000+00:00  kern  :emerg : Stack: (0xc3ab5c00 to =
0xc3ab6000)
    2021-01-14 12:17:00.080000+00:00  kern  :emerg : 5c00: c3ad39b0 c3ad39b=
4 c3ad3800 c3ad3814 c1438650 c09c3dc8 c3ab4000 ef86d560
    2021-01-14 12:17:00.080000+00:00  kern  :emerg : 5c20: c09c5188 c3ad380=
0 000002f3 0000000c c19bafbc c2001d80 c3aa6500 ef86d4c0
    2021-01-14 12:17:00.080000+00:00  kern  :emerg : 5c40: c09d16e0 c143865=
0 c19bafa0 1aae14a9 c19bafbc c3aab980 c325a880 c3ad3800
    2021-01-14 12:17:00.122000+00:00  kern  :emerg : 5c60: c3ad3814 c143865=
0 c19bafa0 0000000c c19bafbc c09d16b0 c1436294 00000000
    2021-01-14 12:17:00.122000+00:00  kern  :emerg : 5c80: c3ad380c c3ad380=
0 c22c5410 c225e4c0 c2260f80 c09a7240 c3ad3800 fffffdfb
    2021-01-14 12:17:00.122000+00:00  kern  :emerg : 5ca0: c22c5410 bf04d13=
4 c2262fc0 c2233d08 00000120 c225e4c0 c2260f80 c0a01684
    2021-01-14 12:17:00.123000+00:00  kern  :emerg : 5cc0: c25ad600 c25ad60=
0 00000040 c25ad600 c2260f80 00000000 c19bafb4 bf074084
    2021-01-14 12:17:00.123000+00:00  kern  :emerg : 5ce0: bf075014 0000001=
8 00000028 c0a01764 c226ac10 00000000 bf075014 00000000 =

    ... (33 line(s) more)  =

 =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6000385c3877a18f0fc94ce2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6000385c3877a18f0fc94=
ce3
        failing since 57 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6000353ebbd36858edc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6000353ebbd36858edc94=
cc9
        failing since 57 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6000359e282afb39e6c94d09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6000359e282afb39e6c94=
d0a
        failing since 57 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
      | regressions
-------------------------+------+---------------+----------+---------------=
------+------------
qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60004319f107fcd595c94cd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60004319f107fcd595c94=
cd1
        failing since 57 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
