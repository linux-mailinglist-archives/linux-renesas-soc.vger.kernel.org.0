Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1C3421CBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 04:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhJEC51 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 22:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhJEC50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 22:57:26 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49D0C061745
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 19:55:36 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id a11so244541plm.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vg9AHorjEtbWeIKDiuSM2zWXNUKFsUPKCWh7H/cwoAs=;
        b=LkLHlHftjBd47WSE0390LTAVtgRwQyOZ8yrD4Le6fh9p0QN4z1vliW4Gmlx8H5I3dd
         /wh46pZCSbGaG2tQr03gfXOH2hob2kd3j9fXXNkP7Jy9iwMK3xVLIqhuWvSkqUIg8qZW
         RoCRqxv56QVPvBrWnujSFEGKwHgnLNapnMTC1iP6LrkCPNrviUpyCVXXQXcL0bXnHsZu
         Z1pzsbIi0+na9b8Rz66hZ8TfrrkQudiplllXrG3l17u+9rtnpwABYtz56npVCHK0pEeb
         fe+4IZQKeNJud/eIKUJgQHqBYHkff04V/w7TVFM3C59zXYMgtCXiciArFVnnws5sEy0d
         X3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vg9AHorjEtbWeIKDiuSM2zWXNUKFsUPKCWh7H/cwoAs=;
        b=gZzEL2/nUueoDAD0OQ5ae/fO2z651jeLrDKPI4mXpiZJJX+HZu9LB2YOGso889e220
         CnOyMCXMH9j5S+RIWU2mHO1I4oNThXagOSgRs0Za43JXU7ux3KDwcF8qKy7fZGUTFJOl
         FD4+e1ePLIjwoFPplS40szJv0F06CQyVQGV7Pn8l9E82WwMtKMxHMWsysatNcMqsVyUN
         rVFVRUTvfayBxdyvraIKtSTg1O4BAhh4IawtL4KXxVxE3IAl+IIvt/B4V8Qcxma2wrmh
         YnsSwiBmQqVMrshhmAJ16DiC8rDKG3cES/gZTdEwtPcfrudQpzZ3aN2OYHoESq08wEF6
         Ovpg==
X-Gm-Message-State: AOAM533P6rKwTi74k8ZLCfH26Ee1TpnjopUn7gJnQ+s5XJvBmBZh6RWy
        JKWaBKaJN53ywa4gFB1mO7cOWs3GllMObdrT
X-Google-Smtp-Source: ABdhPJxbysGjrItU3Iz3wfTfpzJoxFJhuFTFRuFxmsWdrx5bR7NknIBIwt/o8ezXyFI+ObQwwL7c5A==
X-Received: by 2002:a17:90b:1646:: with SMTP id il6mr759573pjb.129.1633402536083;
        Mon, 04 Oct 2021 19:55:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a26sm15621015pgm.87.2021.10.04.19.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 19:55:35 -0700 (PDT)
Message-ID: <615bbea7.1c69fb81.73cdd.0b07@mx.google.com>
Date:   Mon, 04 Oct 2021 19:55:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-04-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 54 runs,
 10 regressions (renesas-devel-2021-10-04-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 54 runs, 10 regressions (renesas-devel-2021-10=
-04-v5.15-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+ima        =
        | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+crypto     =
        | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-04-v5.15-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-04-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      022b9ed809ab70e8e1cac03f6a50d8cb91cf4098 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615b9c9561e03985c599a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/615b9c9561e03985c=
599a2e4
        failing since 83 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
hip07-d05        | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/615ba298b6b6f3db3b99a32a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/615ba298b6b6f3db3=
b99a32b
        failing since 83 days (last pass: renesas-devel-2021-06-14-v5.13-rc=
6, first fail: renesas-devel-2021-07-13-v5.14-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+ima        =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/615b83372c466310a899a34f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt=
8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt=
8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/615b83372c466310a=
899a350
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615b859d909436623f99a354

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/615b859d909436623=
f99a355
        failing since 13 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/615b87019590dc7c5499a2fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/615b87019590dc7c5=
499a2fe
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+crypto     =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/615b871ecc6194363199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+crypto/gcc-8/lab-collabora/baseline-nfs=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/615b871ecc6194363=
199a2db
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/615b8f51f5d723d95899a312

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/615b8f51f5d723d95899a318
        failing since 83 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-10-04T23:33:26.536194  <8>[   42.888428] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-10-04T23:33:27.582203  /lava-4644859/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/615b8f51f5d723d95899a319
        failing since 83 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-10-04T23:33:26.501344  /lava-4644859/1/../bin/lava-test-case   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/615b95ba92394b58de99a2e0

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/615b95ba92394b58de99a2e6
        failing since 83 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-10-05T00:00:44.334940  /lava-4644995/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/615b95ba92394b58de99a2e7
        failing since 83 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-10-05T00:00:43.253744  /lava-4644995/1/../bin/lava-test-case
    2021-10-05T00:00:43.291715  <8>[   42.159797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
