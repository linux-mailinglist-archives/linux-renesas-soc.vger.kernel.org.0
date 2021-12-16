Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C87C477DA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 21:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241443AbhLPUcN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 15:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241439AbhLPUcN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 15:32:13 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1B9C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 12:32:13 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id i12so345981pfd.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=V238N01T5TbLPdS0rAJkhP2vnhnW28+QijpR3YeXXtQ=;
        b=7q7CBJpSRz1WvkLtc3mpNUa6B6pZoFjDL6nUXpkqoI/yjdUXctitKvH0BieLkZqQxU
         4hbZjSFfqsu0QeSEu3t7vwGXBTm3tIXVuBV7Kl8uvWmaP0bSYWoAhGGOqhUXX9snTICr
         VB7ewIAkRnFQrWFZ48uXa85C3dID5195qO4ocCmaoTHYfAiej7X7KPvWrZzisHMgeec1
         Q5ciC7BN5p+TsERYRmV178W8WP+ewMEmIt4bmQynFBWC0Yda1UU3LWAPq+qhqwxaHrFc
         sqJrwrvRm/v7h7sx2QmboihfGbCnYWY9zaNVF0e3+UsfIj73TtN+DAGMwJOOvQvmrlO2
         w59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=V238N01T5TbLPdS0rAJkhP2vnhnW28+QijpR3YeXXtQ=;
        b=74UrgWXdrdqsDKlxYxaqNWD4u5MWaoudsS4Rj0C9pszXBjAqcyRZsLNa6ti9Wp5Vw/
         oiyquKonJQiCt480GElo43r6oZBmW0a88IqrAnfQPssu18hcKrHK0ChOvajGKag6hIiF
         FF8+X0S+hO6HDs0owzdJc1sT3hnh8RGzjxN+8oBqemoAga6a/fYOt4UKM9Ha/vQRHVdO
         KsiNLIkbzAmz7BbfY6jt0uxijbQwPZcC9kE+9ficRYmcY5S57ESYzMF6MiIh7s+GzCnj
         8er2GurhGCdbBV7GLFfU0zF69r7hpiJjW6sMt24R06/2j+5DiXrRCWOJP9eWzuXGAGsT
         2F5g==
X-Gm-Message-State: AOAM531Sw5B4Zps6a7PEvBsA0A+Rx0vqdRP5buKivhkX66cb1HSTn9nl
        h1X6gXHYo0D8JfnwUv+VrprCGlObsrXYedVP
X-Google-Smtp-Source: ABdhPJwrs9LO9CFydZAv0Byx4d4gqwDOirK6WCrGYAZgGEdRW7zgWn5WVXz4qLLp1C1Y+27SCiz3cQ==
X-Received: by 2002:a63:2a81:: with SMTP id q123mr14041989pgq.510.1639686732518;
        Thu, 16 Dec 2021 12:32:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f8sm7070100pfc.77.2021.12.16.12.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:32:12 -0800 (PST)
Message-ID: <61bba24c.1c69fb81.f1767.32f2@mx.google.com>
Date:   Thu, 16 Dec 2021 12:32:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-16-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 518 runs,
 4 regressions (renesas-devel-2021-12-16-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 518 runs, 4 regressions (renesas-devel-2021-12-16-=
v5.16-rc5)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-16-v5.16-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-16-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b33e75b3e597788be243c04aba22d39431b9ecfb =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb76b85a06f399243971b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bb76b85a06f39924397=
1b5
        failing since 30 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61bb6b0b08718dfb3a39711e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylibre/ba=
seline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylibre/ba=
seline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61bb6b0b08718df=
b3a397122
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5)
        11 lines

    2021-12-16T16:36:17.129079  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 10ffff0000040f14
    2021-12-16T16:36:17.129373  kern  :alert : Mem abort info:
    2021-12-16T16:36:17.129553  kern  :alert :   ESR =3D 0x96000044
    2021-12-16T16:36:17.129715  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-12-16T16:36:17.129870  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-12-16T16:36:17.130022  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-12-16T16:36:17.130172  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-12-16T16:36:17.130336  kern  :alert : Data abort info:
    2021-12-16T16:36:17.130508  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
044
    2021-12-16T16:36:17.130657  kern  :alert :   CM =3D 0, WnR =3D 1 =

    ... (2 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61bb6b0b08718df=
b3a397123
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5)
        2 lines

    2021-12-16T16:36:17.574555  kern  :emerg : Internal error: Oops: 960000=
44 [#1] PREEMPT SMP
    2021-12-16T16:36:17.574797  kern  :emerg : Code: 910003fd f9000bf3 aa00=
03f3 941b7889 (f9000660) =

    2021-12-16T16:36:17.730211  <8>[   49.270002] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb6885322d64308039713e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/la=
b-collabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/la=
b-collabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bb6885322d643080397=
13f
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5) =

 =20
