Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC833E82E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 20:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbhHJSVs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 14:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbhHJSVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:21:33 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314C9C09B125
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 11:04:43 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w14so3718111pjh.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hvpkSDgDLtF6EIay3U6aBhIJMl6awW0PY2HjLKaxDt4=;
        b=1NrpARXbnw67mw/Fvf+HEc0+FHBz5XyYY42nNVRI4lv2MgfQMAQD6+CHi/lYgFwjp5
         8IXmY7bXgvCh/7TYZ4Uz6aRQ+7Yz1xoCNYX9XqRWhjDbZkvBjcvPJoTqxrGR+HBNQ9kX
         kHoOk8qiljuNqtZAuqXm1HGSiRywtpxHbPc4hCueP0Th/iT4yt2NGGlkW0eR2FDb6i9a
         hJNdyPO5GxM6Cl4iy4sIjt2SS5Y4FhRohMqWcwhMxm2NG4wyc5objgggiXhFZWIcwAgg
         MnaboaqqSc5E8tZNeDv197PTLfxuphoTownsEgoJV7gnqg577zk1pikWAmJicT/k0I6l
         Odfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hvpkSDgDLtF6EIay3U6aBhIJMl6awW0PY2HjLKaxDt4=;
        b=nasOCLBoKRbn8VlKRoeSYc2LdgT7OTG81Wjso/Y5rkdR1fWZ5oZ/8qujTxgBr6NUaL
         3EkG19Yq14RHSRl0XyHgv12v76hpA7jVWC8X9sawfEm/x8ZXRe1XQk8IIuocii2TcngB
         SMzGvuz+amugpUw63tq+QWS86545GQNIa/t3Apz3FgfsVyJ5MGi2xoTymvF8kStoVfpa
         KfujUnNwsoJ5guyLrbbk5th9crSD8LHgrgl9um3E+2jqeXtn5ZwBrEFKVyjBtTu8XXLw
         hlPGMZojRcxJ1uif5knetb8Ly+r20BHLWhyQbZfztCBU0K+tqTbz6DDVYjGnp5NT6y3r
         JUuA==
X-Gm-Message-State: AOAM530Y7Kiea/M98zhHan5FoR6Nm5XZ56VzUN/ntFsbq7fZ488J3+6Q
        n4KzSgqVyNHGLQgLqku+JX7vPvPj22+CXg5s
X-Google-Smtp-Source: ABdhPJxMXsEZDORef0kb2XD3fI7nSgB1hQzNhpXwQfkzeUawSeq052aYuWgjrP1UmrD7RFKIfaNPFg==
X-Received: by 2002:a62:8143:0:b029:3a9:bdb9:b2c3 with SMTP id t64-20020a6281430000b02903a9bdb9b2c3mr24599112pfd.7.1628618682597;
        Tue, 10 Aug 2021 11:04:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d22sm28023347pgi.73.2021.08.10.11.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 11:04:42 -0700 (PDT)
Message-ID: <6112bfba.1c69fb81.b1fa2.357c@mx.google.com>
Date:   Tue, 10 Aug 2021 11:04:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-08-10-v5.14-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next sleep: 7 runs,
 2 regressions (renesas-next-2021-08-10-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 7 runs, 2 regressions (renesas-next-2021-08-10-v5.14-rc=
1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-08-10-v5.14-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-08-10-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3d3aec53bf89e3aebe1b92e693fe78efd5f49978 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/6112b1593f30637f72b1366a

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/6112b1593f30637f=
72b1367d
        failing since 77 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-10T17:01:18.116482  rtcwake: assuming RTC uses UTC ...
    2021-08-10T17:01:18.121932  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Aug 10 17:01:24 2021
    2021-08-10T17:01:18.138402  <6>[  102.547145] PM: suspend entry (deep)
    2021-08-10T17:01:18.138669  <6>[  102.551805] Filesystems sync: 0.000 s=
econds
    2021-08-10T17:01:18.156358  <6>[  102.559852] Freezing user space proce=
sses ... (elapsed 0.002 seconds) done.
    2021-08-10T17:01:18.156611  <6>[  102.570458] OOM killer disabled.
    2021-08-10T17:01:19.170456  <6>[  102.574453] Freezing remaining freeza=
ble tasks ... =

    2021-08-10T17:01:19.170774  <3>[  103.576514] usb 2-1: device descripto=
r read/64, error -110
    2021-08-10T17:01:19.515227  <6>[  103.926572] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-08-10T17:01:24.764541  <3>[  109.176571] usb 2-1: device descripto=
r read/64, error -110 =

    ... (16 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/6112b1593f30637f=
72b1367e
        failing since 77 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-10T17:00:57.834119  <4>[   82.156110]  panel_simple nvmem_rockc=
hip_efuse panfrost gpu_sched rk_crypto md5 sha256_generic libsha256 sha1_ge=
neric libdes phy_rockchip_dp snd_soc_rockchip_i2s snd_soc_rockchip_pcm snd_=
soc_max98090 pwm_rockchip rtc_rk808 clk_rk808 uvcvideo videobuf2_vmalloc vi=
deobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc tpm_i2c_infineon=
 snd_soc_ts3a227e snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm snd_timer=
 snd soundcore tpm pwm_bl backlight spi_rockchip rockchipdrm dw_mipi_dsi an=
alogix_dp dw_hdmi
    2021-08-10T17:00:57.834665  rtcwake: assuming RTC uses UTC ...
    2021-08-10T17:00:57.839478  <4>[   82.241728] CPU: 3 PID: 70 Comm: kwor=
ker/3:5 Tainted: G        W         5.14.0-rc2 #1
    2021-08-10T17:00:57.852614  <4>[   82.254341] Hardware name: Rockchip (=
Device Tree)
    2021-08-10T17:00:57.853068  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Aug 10 17:01:04 202<4>[   82.259885] Workqueue: usb_hub_wq hub_event
    2021-08-10T17:00:57.857502  1
    2021-08-10T17:00:57.863125  <4>[   82.271057] [<c0311090>] (unwind_back=
trace) from [<c030ba68>] (show_stack+0x10/0x14)
    2021-08-10T17:00:57.876497  <4>[   82.280283] [<c030ba68>] (show_stack)=
 from [<c0fc54a8>] (dump_stack_lvl+0x40/0x4c)
    2021-08-10T17:00:57.876995  <6>[   82.280290] PM: suspend entry (deep)
    2021-08-10T17:00:57.894528  <4>[   82.280294] [<c0fc54a8>] (dump_stack_=
lvl) from [<c0344814>] (__warn+0xec/0x104) =

    ... (56 line(s) more)  =

 =20
