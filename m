Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A514C42A3E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbhJLMJj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236322AbhJLMJb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:31 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CE8C061745
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1707290pjc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RyNSrNkZM22PaW/KAbDoAAefrTNEViJl+T6JAgZh7C4=;
        b=RFqMsWhq6NWTYDwWsiu1v0H6snNrPHWVM7OZgylNv9nDLQlfzVXOlYAcqJq0Oyr1S9
         y8Aid9kZF4lqMupdqKhVAGIWYD2xAKk7ZXZ/tgFyzkXywEdGDCKWdihR+Y0NfN/C1X4g
         dSaqX5PwZTRpB7XrpQf1SZYz1RiHz9aQj2/+M4OUjaIDjBNbpZsNPyejPpi1cKopidXJ
         Uxm1McTVBezyvHefl0heil7jGIyX+YlptEB4Qluhxxs6h79Dq1UoJvitcUNYCABmf2Ed
         /LbYZi3F3fJvMYT1mavsRwpq8+pUh+UHmKRRNiY+ckdylZnMKVWBHrbE+Y7bpttzcWrJ
         5AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RyNSrNkZM22PaW/KAbDoAAefrTNEViJl+T6JAgZh7C4=;
        b=Qo214uyT64Hhwq7vmVyk/wz/mGMcGfs75mtFX5U4bEIomTMeXbxQf/nydFxCqNabaD
         4hi02eo/ZfZ4V+AzOwDNL+4boD8+dOa52dvSnJefF4I5EsOK+haSuj/xeVGmnVa7gDw8
         1f6AZ+D59DjiDgd9ywrLCk1lskLz9Gvx3cZbxcomQ+GU5kb6+JqEkJiT1X+n+t2R0qLP
         agResQF9HFMWRPb5CUVMbPb8mxsrTVKvAfAk3LO+5GTNuly8EJr9SEFrNGzBg927eSQr
         SBt15w4JfmLPgc7FL3jW09TdLEJ9U8mlpsnXUVJTxkqmmeON930eTRuAO3InS5WqIY4Y
         znCQ==
X-Gm-Message-State: AOAM532DjfNX+mRbQp50hzhcP3ZTU4sPHORvRSqrExhi7jIL0RTTIjzK
        /JIi2NkZjN0UiFinH6o/nUjlFmhkzsgXhMgJ
X-Google-Smtp-Source: ABdhPJx1IMNHtI9HRatAZf7JvQCW3QdanRnWTgD2fKDsib30z01n6vqXmadvpwfb4mh3bGH1JVw1aw==
X-Received: by 2002:a17:902:e846:b0:13f:551b:ba23 with SMTP id t6-20020a170902e84600b0013f551bba23mr2302868plg.77.1634040449438;
        Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d12sm11269971pgf.19.2021.10.12.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Message-ID: <61657a81.1c69fb81.5dff9.f07e@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next igt-kms-rockchip: 2 runs,
 3 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 3 regressions (renesas-next-2021-10-=
11-v5.15-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  b232a092b9e1b10a8be13601acaa440903b226bc =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6165691cafe2807a7a08faea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211008.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/6165691cafe28=
07a7a08faeb
        failing since 20 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-09-20-v5.15-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 2          =


  Details:     https://kernelci.org/test/plan/id/616565b755a498940108fac0

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211008.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/616565b755a498940108fb48
        failing since 91 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-10-12T10:37:03.815385  <6>[   81.571085] Console: switching to col=
our dummy device 80x25
    2021-10-12T10:37:03.820839  <14>[   81.577934] [IGT] kms_vblank: execut=
ing
    2021-10-12T10:37:03.834695  IGT-Version: 1.26-gb232a09 (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   81.585015] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-10-12T10:37:03.835379  =

    2021-10-12T10:37:03.840471  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-10-12T10:37:03.927503  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-10-12T10:37:03.956802  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-10-12T10:37:03.963521  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Oct 12 09:28:43 2021
    2021-10-12T10:37:03.976288  <6>[   81.734970] PM: suspend entry (deep)
    2021-10-12T10:37:03.981611  <6>[   81.739402] Filesystems sync: 0.000 s=
econds =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
16565b755a498940108fb66
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-10-12T10:36:13.880373  <8>[   46.766666] <LAVA_SIGNAL_TESTSET STOP>
    2021-10-12T10:36:13.923631  <8>[   46.808253] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-10-12T10:36:13.961110  <6>[   46.845141] Console: switching to col=
our dummy device 80x25
    2021-10-12T10:36:13.966901  <14>[   46.852233] [IGT] kms_setmode: execu=
ting
    2021-10-12T10:36:13.978933  IGT-Version: 1.26-gb232a09 (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   46.857491] [IGT] kms_setmode: starting subtest=
 basic
    2021-10-12T10:36:13.979113  =

    2021-10-12T10:36:13.982093  Starting subtest: basic
    2021-10-12T10:36:13.986109  Testing: basic 1 connector combinations
    2021-10-12T10:36:14.093852    Test id#1 CRTC count 1
    2021-10-12T10:36:14.100439      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (63 line(s) more)  =

 =20
