Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786093E5037
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 02:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhHJAFy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 20:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhHJAFy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 20:05:54 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E97EC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 17:05:33 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso1320429pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 17:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0FJQmsU+tdwyEk0teO/8a113CQbgifx8pRfZqVwFMnQ=;
        b=mRd8uhbP6R8SBIP/KFdS1qOah8s2gKjMvOdK6h3mFve/4GqbkJoIVaeUO96gB9nZaC
         OX4zCU1OvcScsu0TDhjQvBYTg4YrvuWEI4Qp81utLTfCVINMH7JI1/gpuO9/sm0a9avn
         cWu6pNDNCL9Zhu0z/a8E1hdHY/yJ7HeoTIGDr8YmZBVQJhKzaZdIiWEZ6iXVSsO9G6lc
         6hT2yCkwNaKMRFBBlCgZirnV8Z7m4DWc8h+druWHKF6qDzrLYq9ZwDVYZMU+4wJAjc1l
         OXRWbta6ItBtpp4C/Wso/RQSU1EB+080Ztawx6DA0KPzXXJdR/RIkDZ6Tpg4lWZCzB1L
         rqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0FJQmsU+tdwyEk0teO/8a113CQbgifx8pRfZqVwFMnQ=;
        b=S2NRV2hrVzN+fgOoPW9ODW/4Kkdd+/uYqjL3WhqvS0MmpiK7wOx3XGJozzeXEBpDCr
         WGwlIxaY1/AD29mHdxLNmP7mAzd6mOIE/T4DxoOFNiiMB0+KaXRQlNQz2JkmNhn3xcqU
         XRxK0pHYhTtSgl05F2pJkAQ7udimNIVMdr594e+Na2PoXjzOpvjW/oSblgcvNqCA6IkC
         PSDRgx0ZFTTryak2bmWJck/hPnbEwP3vyqXbqeg3qSW0zZvfm38nymUMLpZ9jyT55X+p
         ZGlZc/ejiA1pmXNMYfmSLzO3mK/dyh4cnx0vfxzwd0fW6jOCvkNgkW6Ar1WD1Ml6icgL
         QnDw==
X-Gm-Message-State: AOAM531ZPVTt3bSQcMSLYOIjF9FHnPISNHmGIHe2wYuuj7C8VcOR3Zjm
        W1fn7DvbjRBE5Wv1jxFisgKXNwfAbNXVPhrb
X-Google-Smtp-Source: ABdhPJzVh4exf5kVpBWB5WlyytvSjO9g74i1USek3UVh1MRHAwnJjyeqSspFjry0fah6KxLrz/XKKA==
X-Received: by 2002:a17:90a:4bcf:: with SMTP id u15mr27745595pjl.62.1628553932814;
        Mon, 09 Aug 2021 17:05:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j128sm22078753pfd.38.2021.08.09.17.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 17:05:32 -0700 (PDT)
Message-ID: <6111c2cc.1c69fb81.fa1f1.0778@mx.google.com>
Date:   Mon, 09 Aug 2021 17:05:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
X-Kernelci-Report-Type: test
Subject: renesas/next sleep: 8 runs,
 3 regressions (renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 8 runs, 3 regressions (renesas-next-2021-07-27-v5.14-rc=
1-14-g57ec7ff3f83a)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      57ec7ff3f83a19aa366c58bd0f6a47a8844ac3fe =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6111ac1a3f8d2276c6b13682

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/x86_64/x86_64_defconfig+x86-chromebook/gc=
c-8/lab-collabora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/x86_64/x86_64_defconfig+x86-chromebook/gc=
c-8/lab-collabora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/6111ac1a3f8d2=
276c6b1368c
        new failure (last pass: renesas-next-2021-07-27-v5.14-rc1)

    2021-08-09T22:27:31.154470  rtcwake: assuming RTC uses UTC ...
    2021-08-09T22:27:31.161019  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Aug  9 22:27:37 2021
    2021-08-09T22:27:31.163731  <6>[   33.998846] PM: suspend entry (deep)
    2021-08-09T22:27:31.170471  <6>[   34.003089] Filesystems sync: 0.000 s=
econds
    2021-08-09T22:27:31.174186  <6>[   34.007720] PM: suspend entry (s2idle)
    2021-08-09T22:27:31.177041  <6>[   34.011741] PM: suspend exit
    2021-08-09T22:27:31.177413  rtcwake: write error
    2021-08-09T22:27:31.186836  <6>[   34.015469] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-08-09T22:27:31.190369  <6>[   34.024474] OOM killer disabled.
    2021-08-09T22:27:31.193240  <6>[   34.027966] Freezing remaining freeza=
ble tasks ...  =

    ... (1150 line(s) more)  =

 =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
rk3288-veyron-jaq  | arm    | lab-collabora | gcc-8    | multi_v7_defconfig=
           | 2          =


  Details:     https://kernelci.org/test/plan/id/6111b07ab657cbecb4b13661

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-collabor=
a/sleep-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-collabor=
a/sleep-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/6111b07ab657cbec=
b4b13674
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:45:03.628983  rtcwake: assuming RTC uses UTC ...
    2021-08-09T22:45:03.634087  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Aug  9 22:45:10 2021
    2021-08-09T22:45:03.650523  <6>[  101.955823] PM: suspend entry (deep)
    2021-08-09T22:45:03.650757  <6>[  101.960201] Filesystems sync: 0.000 s=
econds
    2021-08-09T22:45:03.664211  <6>[  101.965612] Freezing user space proce=
sses ... (elapsed 0.000 seconds) done.
    2021-08-09T22:45:03.664445  <6>[  101.974591] OOM killer disabled.
    2021-08-09T22:45:04.714326  <6>[  101.978515] Freezing remaining freeza=
ble tasks ... =

    2021-08-09T22:45:04.714789  <3>[  103.016432] usb 2-1: device descripto=
r read/64, error -110
    2021-08-09T22:45:05.058887  <6>[  103.366431] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-08-09T22:45:10.307577  <3>[  108.616495] usb 2-1: device descripto=
r read/64, error -110 =

    ... (19 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/6111b07ab657cbec=
b4b13675
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:44:43.250611  <6>[   81.536366] PM: suspend exit
    2021-08-09T22:44:43.250877  =

    2021-08-09T22:44:43.324906  <4>[   81.563125]  bluetooth cfg80211 ecdh_=
generic ecc libaes cros_ec_chardev cros_ec_sysfs cros_ec_debugfs cros_ec_ke=
yb i2c_cros_ec_tunnel cros_ec_dev cros_ec_spi cros_ec gpio_charger panel_si=
mple snd_soc_rockchip_max98090 rk_crypto md5 nvmem_rockchip_efuse panfrost =
gpu_sched sha256_generic libsha256 sha1_generic libdes snd_soc_rockchip_i2s=
 snd_soc_rockchip_pcm rtc_rk808 clk_rk808 phy_rockchip_dp snd_soc_max98090 =
pwm_rockchip uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 vid=
eobuf2_common videodev mc snd_soc_ts3a227e tpm_i2c_infineon snd_soc_core ac=
97_bus snd_pcm_dmaengine snd_pcm tpm snd_timer snd soundcore spi_rockchip r=
ockchipdrm dw_mipi_dsi analogix_dp dw_hdmi pwm_bl backlight
    2021-08-09T22:44:43.325313  rtcwake: assuming RTC uses UTC ...
    2021-08-09T22:44:43.336777  <4>[   81.631718] CPU: 2 PID: 136 Comm: kwo=
rker/2:10 Tainted: G        W         5.14.0-rc2 #1
    2021-08-09T22:44:43.350717  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Aug  9 22:44:50 202<4>[   81.644523] Hardware name: Rockchip (Device Tr=
ee)
    2021-08-09T22:44:43.351011  1
    2021-08-09T22:44:43.351352  <4>[   81.656282] Workqueue: usb_hub_wq hub=
_event
    2021-08-09T22:44:43.361879  <4>[   81.661529] [<c0311090>] (unwind_back=
trace) from [<c030ba68>] (show_stack+0x10/0x14)
    2021-08-09T22:44:43.374209  <4>[   81.670480] [<c030ba68>] (show_stack)=
 from [<c0fc54a8>] (dump_stack_lvl+0x40/0x4c) =

    ... (62 line(s) more)  =

 =20
