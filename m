Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2FA1409F3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 23:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344964AbhIMVhD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 17:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245192AbhIMVhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 17:37:00 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE36C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 18so10098169pfh.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bsImrEigALN6e2cuf/S3r0w3Q+vymP6lz1gDsgWDAlI=;
        b=tRP2RDkCSrSDIfq9X9trp0X2beHM9Rr43Qqcmeuhd4ho+78IkXCh/I9s15Jiv07nlV
         zPQDe0lhLEnX6KSJe5J87gMy+5M5mLvTlg9Csw7Fk6x3JNtdqkrH+OFKdq8hKjP/uUtS
         GDm4qzfgz+YXgKuT5n1riEf6xa1YktEbr0Y7fiai9kTuctzv4DjtOuqwd3r+8nN1ZUHA
         kMxkJkp+tqgdT4StHKrVWDdJqWIgJumgj+gegU9qzr7xiTrF5U6tSFIXxxu9jRgirz0D
         zfAT+oilov8xshrfyHO/whjg4cZfs3YgSSZJyKxIaThTI5KZPoQGvy16PY7xLCXJ+4WT
         nIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bsImrEigALN6e2cuf/S3r0w3Q+vymP6lz1gDsgWDAlI=;
        b=b60mG+7RHSUa1hgWDOVXSq4UcAn6aaJ10yovkamTJHHPbbbpoT13mz3L1M7K+i94UA
         lr5KA7tSXSJEkhR8WjorUv91VmZfNX1B+ZidefrdjZUAoq9ZrHU99LuP+OOgqMEJWcyD
         lDLmSm7Uqs0DBwpPPzKQQSM85c0cREVn7FfqJt6+xPtIw6g/bp57Ov7o47cZ+qqMHd/f
         GFbbLBoeNaNDYnJ0V+VXwug3yxXA6PulVaZFy3AltSNLbEvZ/sN00B5eR94A16kOsBdr
         84BXn877uArPDAC8Nd1iNudWTMtnKAHv0e+sSUCJUU7g9egQZTGfbUgBR1s46x/5o40n
         F+bg==
X-Gm-Message-State: AOAM532IwtIiD3Zqq5Wbzyy/Dy1cV+1cir04dFnqvT5QNyPExqNKwZgx
        hUDxyM2PTfDNrm99Iw9X0HscEa+9oQzNxA87
X-Google-Smtp-Source: ABdhPJyvNPpHHMsUaWgR28ALsfPu6jra28QNwQVjEAolBXcsLzO87Se5rYWgBMt2xjUBSEMqyEH4XQ==
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id j11-20020aa7800b0000b0290330455f57a8mr1364526pfi.7.1631568943804;
        Mon, 13 Sep 2021 14:35:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o6sm7907528pjk.4.2021.09.13.14.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 14:35:43 -0700 (PDT)
Message-ID: <613fc42f.1c69fb81.d83c6.7057@mx.google.com>
Date:   Mon, 13 Sep 2021 14:35:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-39-gcbbd8f16ae1c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 2 regressions (v5.15-rc1-39-gcbbd8f16ae1c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 2 regressions (v5.15-rc1-39-gcbbd8f1=
6ae1c)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.15-=
rc1-39-gcbbd8f16ae1c/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: v5.15-rc1-39-gcbbd8f16ae1c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cbbd8f16ae1c24d6f82712bf5ef798a8a62b0233

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
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/613fbb8e86fe4495a099a347

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210827.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/613fbb8e86fe4495a099a3cf
        failing since 62 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-13T20:57:00.628642  <6>[   84.951877] Console: switching to col=
our dummy device 80x25
    2021-09-13T20:57:00.633449  <14>[   84.958579] [IGT] kms_vblank: execut=
ing
    2021-09-13T20:57:00.649132  IGT-Version: 1.26-g1afd52c (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   84.965261] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-09-13T20:57:00.650456  =

    2021-09-13T20:57:00.654218  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-09-13T20:57:00.737046  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-09-13T20:57:00.767159  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-09-13T20:57:00.774433  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Sep 13 20:55:31 2021
    2021-09-13T20:57:00.787225  <6>[   85.112700] PM: suspend entry (deep)
    2021-09-13T20:57:00.792925  <6>[   85.117084] Filesystems sync: 0.000 s=
econds =

    ... (126 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
13fbb8e86fe4495a099a3ed
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1)

    2021-09-13T20:56:06.447203  <8>[   46.544044] <LAVA_SIGNAL_TESTSET STOP>
    2021-09-13T20:56:06.488659  <8>[   46.584627] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-09-13T20:56:06.527692  <6>[   46.622495] Console: switching to col=
our dummy device 80x25
    2021-09-13T20:56:06.532774  <14>[   46.629602] [IGT] kms_setmode: execu=
ting
    2021-09-13T20:56:06.544681  IGT-Version: 1.26-g1afd52c (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   46.634880] [IGT] kms_setmode: starting subtest=
 basic
    2021-09-13T20:56:06.545441  =

    2021-09-13T20:56:06.548087  Starting subtest: basic
    2021-09-13T20:56:06.551979  Testing: basic 1 connector combinations
    2021-09-13T20:56:06.677129    Test id#1 CRTC count 1
    2021-09-13T20:56:06.683185      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (66 line(s) more)  =

 =20
