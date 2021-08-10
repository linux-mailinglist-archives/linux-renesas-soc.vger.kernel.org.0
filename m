Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5EBB3E5090
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 03:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhHJBNi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 21:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbhHJBNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 21:13:38 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F027BC061796
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 18:13:16 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so1847992pjn.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 18:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TTII+IZOWaAN+5V/wAu+HVCuJUqtomxinLFvArhZyRs=;
        b=2ACctyVdQxPu1mrVTKeR7UKkwIhmo7WK/oa0o+G1S7GZZvBbfxmI5Ie1pg394ak2qh
         JEghnkOp2mrDVcU+O507N1cPCjNS/xkl37vFZBDCdC1AtdvG77z/59YzkR1SaMUCYKjR
         9RHPda8y7aZMrpam2kGynJ8/wznk7I5vU+W50au7pgaF58qRohtBZ5kPPP12Bw82XYg9
         O+VuNO4BLTNmmXkMFnWCEpmj1/qNYVkIpAfMfw9axVcdH5EUnhx6KN8pRUjUVugoGA5S
         QzzhL58TuJ5/ZIV+x+6AXjgaOxfyVGbsuLDNzCEeMqjxi+/4pPnVBSsXyi/hzlQUm0dI
         WOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TTII+IZOWaAN+5V/wAu+HVCuJUqtomxinLFvArhZyRs=;
        b=LJmxjG0AVJcag5Gmdm0xQi+xwVKnwD5YQqcn8XPhONzkh45AnGEYgwQXIGJ8gS3lGI
         7Yv6mUXsN8s6fL4wcoJLEftsp+Jds/J3WHLNc+Ve42Diswd4PUnL5Pi3KReCFBgKFVgM
         8ECFMNsNhsuMo6Nv9GIYdQo6UjOgfN4Pw7h3EaLnrnixuJUCDbBDNaZzHZpRv0yLQAmb
         A0rhagt/hYW2PAzf3F01dwTXecULjQZ9kXZzbyItP4KzReykondoUuY+BVN9egxmxoGa
         AipXmJB5ppmQDgzCH1WseBHzsZaBXH/bO5LVQKY68hBc+exXu8sXc8UVVip/nJ5inXxI
         uP1w==
X-Gm-Message-State: AOAM531dkXOFDesRE3DRlmOUhK2X1pCs7PB3PTOMQUOASkAhwa7AzYuS
        jW1Gx4amFGni3NCdGi9aiZFTCw/XXGbKGMFB
X-Google-Smtp-Source: ABdhPJyMhZKugYWana2SaczZ9y3UwrmB34BBBLXzymRtTtEvReaA61iWVFy1eo5cVLOULD218zJM6g==
X-Received: by 2002:a62:e211:0:b029:3c7:ed35:7463 with SMTP id a17-20020a62e2110000b02903c7ed357463mr19353842pfi.14.1628557996279;
        Mon, 09 Aug 2021 18:13:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 8sm10584790pfo.153.2021.08.09.18.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 18:13:15 -0700 (PDT)
Message-ID: <6111d2ab.1c69fb81.fb336.f269@mx.google.com>
Date:   Mon, 09 Aug 2021 18:13:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: v5.14-rc5-549-g3b20129c119f
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 7 runs,
 3 regressions (v5.14-rc5-549-g3b20129c119f)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 7 runs, 3 regressions (v5.14-rc5-549-g3b20129c119f)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =

rk3288-veyron-jaq  | arm    | lab-collabora | gcc-8    | multi_v7_defconfig=
           | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
4-rc5-549-g3b20129c119f/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: v5.14-rc5-549-g3b20129c119f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b20129c119f50f3534a0e1a5c353bb502ffe2c6 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6111ba9fe65f81ecb0b13672

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/sle=
ep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/sle=
ep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-3: https://kernelci.org/test/case/id/6111ba9fe65f8=
1ecb0b1367b
        new failure (last pass: renesas-devel-2021-07-27-v5.14-rc3) =

 =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
rk3288-veyron-jaq  | arm    | lab-collabora | gcc-8    | multi_v7_defconfig=
           | 2          =


  Details:     https://kernelci.org/test/plan/id/6111c3f4a6bdf3a1dfb136b1

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-veyron=
-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-veyron=
-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/6111c3f4a6bdf3a1=
dfb136c4
        failing since 91 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-10T00:08:03.809719  rtcwake: assuming RTC uses UTC ...
    2021-08-10T00:08:03.814572  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Aug 10 00:08:10 2021
    2021-08-10T00:08:03.827276  <6>[  102.231872] PM: suspend entry (deep)
    2021-08-10T00:08:03.827534  <6>[  102.236201] Filesystems sync: 0.000 s=
econds
    2021-08-10T00:08:03.841334  <6>[  102.242012] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-08-10T00:08:03.841574  <6>[  102.251340] OOM killer disabled.
    2021-08-10T00:08:04.615291  <6>[  102.255243] Freezing remaining freeza=
ble tasks ... =

    2021-08-10T00:08:04.615677  <3>[  103.016606] usb 2-1: device descripto=
r read/64, error -110
    2021-08-10T00:08:04.960114  <6>[  103.366485] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-08-10T00:08:10.209067  <3>[  108.616479] usb 2-1: device descripto=
r read/64, error -110 =

    ... (19 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/6111c3f4a6bdf3a1=
dfb136c5
        failing since 91 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-10T00:07:43.210196  <4>[   81.604686] ------------[ cut here ]-=
-----------
    2021-08-10T00:07:43.210545  rtcwake: assuming RTC uses UTC ...
    2021-08-10T00:07:43.222934  <4>[   81.616254] WARNING: CPU: 0 PID: 5 at=
 fs/kernfs/dir.c:1509 kernfs_remove_by_name_ns+0xa8/0xb0
    2021-08-10T00:07:43.223177  <4>[   81.629575] kernfs: can not remove 'a=
ttached_dev', no directory
    2021-08-10T00:07:43.296590  <4>[   81.636487] Modules linked in: mwifie=
x_sdio mwifiex btmrvl_sdio btmrvl bluetooth cfg80211 ecdh_generic ecc libae=
s cros_ec_debugfs cros_ec_sysfs cros_ec_chardev cros_ec_dev cros_ec_keyb i2=
c_cros_ec_tunnel cros_ec_spi cros_ec panel_simple snd_soc_rockchip_max98090=
 rk_crypto md5 gpio_charger nvmem_rockchip_efuse sha256_generic libsha256 r=
tc_rk808 clk_rk808 uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4=
l2 phy_rockchip_dp panfrost videobuf2_common gpu_sched sha1_generic libdes =
snd_soc_rockchip_i2s snd_soc_rockchip_pcm videodev snd_soc_ts3a227e snd_soc=
_max98090 snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd sou=
ndcore pwm_rockchip tpm_i2c_infineon rockchipdrm mc dw_mipi_dsi analogix_dp=
 pwm_bl tpm dw_hdmi backlight spi_rockchip
    2021-08-10T00:07:43.309477  <4>[   81.710655] CPU: 0 PID: 5 Comm: kwork=
er/0:0 Tainted: G        W         5.14.0-rc5 #1
    2021-08-10T00:07:43.322093  <4>[   81.719700] Hardware name: Rockchip (=
Device Tree)
    2021-08-10T00:07:43.322315  <4>[   81.725245] Workqueue: usb_hub_wq hub=
_event
    2021-08-10T00:07:43.335096  <4>[   81.730215] [<c0311090>] (unwind_back=
trace) from [<c030ba68>] (show_stack+0x10/0x14)
    2021-08-10T00:07:43.335320  <4>[   81.739167] [<c030ba68>] (show_stack)=
 from [<c0fc6978>] (dump_stack_lvl+0x40/0x4c) =

    ... (60 line(s) more)  =

 =20
