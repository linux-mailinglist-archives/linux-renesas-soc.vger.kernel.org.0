Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29393D6B8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhG0Avc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhG0Avb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:51:31 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE444C061760
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so2629466pjh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oGqX69g3PQpI4o7f92smHp3PeOzPfmZfrQNx88QzSKE=;
        b=V18XuSTHxtavQasL1td4ejFYdoX/aZHxcEQbYdx/114tpDxC7KJ53qJI/nqK9qaliJ
         4xDv5d1E2ZqWdhLoHsJIkprOEcDx6VwBcnbOO06cU6gN+EodlY3dzhIg0Y3mZzpE32SY
         FXZDaUvoXfcfkXxUoZlkfOMW7OLgCb1enQvtnv6u1mHYYC+r7m4SkIwMBC5K+iM6srPd
         hiKSxy5GYvIwuzviegiFRu77Lmt8x9ZSLJDSygD5nkAsBRuRnE0E3zm7oGTKAbOtjOVp
         mBGSbUhhijoA9Yb7cZHpH13ohKCBy8WfLlrdb+tKoiwGjvMe8W4VlmFpbz4Os9t+2n7h
         vTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oGqX69g3PQpI4o7f92smHp3PeOzPfmZfrQNx88QzSKE=;
        b=LvNoV10igtygmJzVK8YfxkehG+k+sg7DvAacZTa+QxbY7vcSNdECClNnKlVOB9G69v
         405rbCWgvQ5HggAc6MB2KRYbvokwe7eAEjqK96mdFNRo3PKRDihjgVaKe644tYtUvOqN
         rnHolb23oeP5PQMU54FanuLmSL8YlMK5F3IucQG/y4UxgvD7DxBVqq9+7/X3GBDMEZyJ
         HvvXobNn1DBoEp9f/He5mRaViRmaJetO6VFeX+qYMdQCyfxULc1cHLriqcmNTgJ2TMJN
         Y/PNgTUPinyCdKEIKkL4UTEZRN3XNs7Bdtw2G+Dj310zZbBjlD+OVC7XxA+dBLVCl55c
         nrKA==
X-Gm-Message-State: AOAM5306OmIhBv/ci5RHqDphiS0UlUio7FouI5efZcaXbcjEosP5UZl7
        0fkqwlp4vzRx3nL5w/AYQsRy7lT1DHW3nsFJ
X-Google-Smtp-Source: ABdhPJxLymS/D/Dkcq+Z4y0Qjd8AmD9ChbDLmnw9pXilUBVe7JFzd/s8czvJ+4WIWJESw9tyk8SZCA==
X-Received: by 2002:a17:90a:8b0b:: with SMTP id y11mr1741391pjn.166.1627349518347;
        Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w2sm710805pjd.35.2021.07.26.18.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
Message-ID: <60ff620e.1c69fb81.60c03.35ad@mx.google.com>
Date:   Mon, 26 Jul 2021 18:31:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-26-v5.14-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-07-26-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
07-26-v5.14-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-26-v5.14-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-26-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      42d1095acf6e228a6baeec100d31a57c0c4d7704

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  87a68fe9e49605d200ab2604e45b8a9d868d1922
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f3994c2cd99a1acfe991a8cc838a387dcb36598a =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/60ff4a3930202f84573a2f3e

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210722.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60ff4a3930202f84573a2fc6
        failing since 13 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-26T23:48:41.926964  <6>[   79.319703] Console: switching to col=
our dummy device 80x25
    2021-07-26T23:48:41.933012  <14>[   79.327162] [IGT] kms_vblank: execut=
ing
    2021-07-26T23:48:41.947234  IGT-Version: 1.26-gf3994c2 (aarch64) (Linux=
: 5.14.0-rc3 aarch64)<14>[   79.333376] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-07-26T23:48:41.947896  =

    2021-07-26T23:48:41.952614  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-26T23:48:42.029392  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-26T23:48:42.057930  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-26T23:48:42.064573  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Jul 26 23:47:57 2021
    2021-07-26T23:48:42.077678  <6>[   79.472343] PM: suspend entry (deep)
    2021-07-26T23:48:42.083224  <6>[   79.476789] Filesystems sync: 0.000 s=
econds =

    ... (125 line(s) more)  =

 =20
