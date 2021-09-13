Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFB9409E0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 22:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240606AbhIMUS0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 16:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242637AbhIMUS0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 16:18:26 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FC0C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 13:17:10 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id t1so10522597pgv.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 13:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/n/qz963BoIeqtM8/qJlKIpwdcpRvyCGYi1sFHVyxVU=;
        b=hsBv4GcKA+XIIgg5MbQCV8CSE8i1+ITBLepepSxlBYZVIUQJxV5bszB2Eo10sN/JgH
         ++lGPm1IRXvnWt38K+hiycMnf9slAI0+DtmFpZOA0uHnI1tN3MAX6TEIiKx2dmmlJkyX
         nka68uchl4lqGXWgb3J0iAsq3B7SNR9O/6oKjrDU1hLhaXtxoAabiFAFUqBNW1e1IyHq
         D4uAbi2fLTE3EIQP4YinUx2rPZt2fpiUBbLXSorfJ2S0Dt2GWdHg7zIIuFtELB1Qh9Jw
         SZRirHspV/srhKolwzDXHXR4YWlFH61AJ3VAPUSlEsqSkjaeFqfDduu2tjgehSVHg3FC
         16cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/n/qz963BoIeqtM8/qJlKIpwdcpRvyCGYi1sFHVyxVU=;
        b=j/wKS5aemKrc5ct+sfEDROzKjT0RrHt9+dOEEOkYcynkfQ/1yksS0c1DNQn/Vt7pU/
         AvtAyCu9LcBKw0n6GSJAB4fJcWBmzoO6jEo3QBouzblgZrQ7WGbJqQD/k+eFSgnK3+Hb
         RzVxXZyrLUEcyPyf4L5NQZMiBc8ZseO305EV4ae/XoYaHeKPuYQQis4KcqtDDq0hpjk3
         SHJhGpplTiHofggtMoxmRsW8PEnNpvESkUzeny3eT+6M37DQZGqStVqXBSJuK9OIhgKT
         fjyENZAfdu67CPw++xt0ZyBj92/FiL+D5klKR9uPk84XjAXr7Dnqry0MbtunDIiX3WIv
         JwUQ==
X-Gm-Message-State: AOAM5300Tkio2961oBRHTw5LNoYMGT1WYngw4Fw2hjO4ByK7rJ+4LAP5
        2YVTQlrR/6Fgj1Ny94exxMm0W+uYO8VFjDH5
X-Google-Smtp-Source: ABdhPJynAydRSA/6VhF5y737RO3zqNth/cE41Pow6Ud8mzfTX2NYyh99Bjrxk+IQtUNLMVszhU1ozQ==
X-Received: by 2002:a63:7453:: with SMTP id e19mr12500330pgn.243.1631564229499;
        Mon, 13 Sep 2021 13:17:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q5sm4753845pjd.30.2021.09.13.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 13:17:09 -0700 (PDT)
Message-ID: <613fb1c5.1c69fb81.89d40.df61@mx.google.com>
Date:   Mon, 13 Sep 2021 13:17:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-564-ge23d26d2dc9a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (v5.15-rc1-564-ge23d26d2dc9a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (v5.15-rc1-564-ge23d=
26d2dc9a)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
5-rc1-564-ge23d26d2dc9a/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: v5.15-rc1-564-ge23d26d2dc9a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e23d26d2dc9ad4831b447fc9ef348b1621fac32d

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1afd52c1471dafdf521eae431f3e228826de6de2 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/613fa6eb6e451a0ff399a2fc

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210827.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
13fa6ec6e451a0ff399a3a2
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7)

    2021-09-13T19:28:08.475810  <8>[   46.348871] <LAVA_SIGNAL_TESTSET STOP>
    2021-09-13T19:28:08.517688  <8>[   46.389745] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-09-13T19:28:08.554737  <6>[   46.426266] Console: switching to col=
our dummy device 80x25
    2021-09-13T19:28:08.560052  <14>[   46.433361] [IGT] kms_setmode: execu=
ting
    2021-09-13T19:28:08.572698  IGT-Version: 1.26-g1afd52c (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   46.438627] [IGT] kms_setmode: starting subtest=
 basic
    2021-09-13T19:28:08.572925  =

    2021-09-13T19:28:08.575163  Starting subtest: basic
    2021-09-13T19:28:08.579497  Testing: basic 1 connector combinations
    2021-09-13T19:28:08.686407    Test id#1 CRTC count 1
    2021-09-13T19:28:08.692683      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (72 line(s) more)  =

 =20
