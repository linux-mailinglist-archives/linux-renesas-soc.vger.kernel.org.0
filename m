Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEC03CEF0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 00:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346518AbhGSVYX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 17:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381295AbhGSSHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 14:07:16 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9D6C0613DE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 11:33:25 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id cu14so12019631pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UWyQQNmaUKaTRM1JO507Yk/9KHKIAlepMEmeNzWyWOI=;
        b=Apx/5TrTljHG9lE8XayReR3DW8dbgvaRUsmt+/E6IsmwQa3N5DCFLuTwYOfjwXkktF
         foYkH5ugSiBBI4LSsCNziZuWWWru39bXx42FtMvPGxvUKroWvNZ73jQpBkecqM4LxbEP
         wd9EP8qac2YNxzpDwUfaQyUTOarhDKiejEZq0ci8bVbDCSL11wId5LBAnoliEyaz9x6O
         Ow+BfzUquvWQBwURm6qzBd7NlyP3UwoNGuJPT0cZUpHcJykuqpTDQiDSrh1nWsJA9u8L
         HxXgjet4swVwSUCW/kChVuKU5wPuD+nI+l78o7PkBpMvriqBXA1EiJ6DFs8UqlYGgyic
         IxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UWyQQNmaUKaTRM1JO507Yk/9KHKIAlepMEmeNzWyWOI=;
        b=EHsBwj4ioU73ek+/wm7PjqvMfLlZk73FkEq+F0szH1EVDXKI6LsaBXsr1RQ7/c/Tyq
         7BtvQO5KK+PpQ9kYTs3HTRG1nuEsPBxaNPWNQSs2S4mFO8+7RnIFW/pSm2bkYSc7nBai
         6bkgJ4f89zDkDvy0kCl3Hgp6VB0SihvZE6Ejz9Gmg5AK1E2pglK9/X1u5H0wenUntqO9
         xnvD7O1NPclh8eqdN/S50y3ZKvaEL1mLMEF2gXUixqd4B3AdX2UZQhBXbAUdCfreDwKn
         NRqAV0qiMLGzEtgoEuuEBIVctzIW/HCCZHq729MViQDlzTQzlGohZFWAwC+BbV+XmAf2
         T64g==
X-Gm-Message-State: AOAM533pc+EE1yv7jOa9uNwdibV5nQag4n6+oal9A1MTVAgDJbwJHUOr
        GmgDhiEVCpwPKdXZMMOIJQbKm2ZBg/oCOQ1J
X-Google-Smtp-Source: ABdhPJyrdK7y7ynytQ+v6Fs0UYUXkioLFkko8LxYtIf6ZxDCgLA3wnvPFVPICuTXtirMPjWFMRYA0A==
X-Received: by 2002:a17:902:ea09:b029:12b:1dc0:ac74 with SMTP id s9-20020a170902ea09b029012b1dc0ac74mr20397138plg.82.1626720340358;
        Mon, 19 Jul 2021 11:45:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m24sm22633118pgv.24.2021.07.19.11.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 11:45:39 -0700 (PDT)
Message-ID: <60f5c853.1c69fb81.2969a.4b7c@mx.google.com>
Date:   Mon, 19 Jul 2021 11:45:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-19-v5.14-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 10 runs,
 2 regressions (renesas-next-2021-07-19-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 10 runs, 2 regressions (renesas-next-2021-07-19-v5.14-r=
c1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-19-v5.14-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-19-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a022240886d918d1f09a50b86a4065256caac42 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60f5bbbf51d1b9d24f1160c0

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60f5bbbf51d1b9d2=
4f1160d3
        failing since 55 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-19T17:49:34.538664  rtcwake: assuming RTC uses UTC ...
    2021-07-19T17:49:34.543815  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jul 19 17:49:41 2021
    2021-07-19T17:49:34.558227  <6>[  102.121180] PM: suspend entry (deep)
    2021-07-19T17:49:34.558785  <6>[  102.125696] Filesystems sync: 0.000 s=
econds
    2021-07-19T17:49:34.574221  <6>[  102.133156] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-19T17:49:34.574776  <6>[  102.143189] OOM killer disabled.
    2021-07-19T17:49:35.696278  <6>[  102.147182] Freezing remaining freeza=
ble tasks ... =

    2021-07-19T17:49:35.696836  <3>[  103.256493] usb 2-1: device descripto=
r read/64, error -110
    2021-07-19T17:49:36.040722  <6>[  103.606532] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-07-19T17:49:41.289659  <3>[  108.856486] usb 2-1: device descripto=
r read/64, error -110 =

    ... (19 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60f5bbbf51d1b9d2=
4f1160d4
        failing since 55 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-19T17:49:14.231951  <6>[   81.781704] smsc95xx 2-1.1:1.0 eth0: =
Link is Down
    2021-07-19T17:49:14.232177  rtcwake: assuming RTC uses UTC ...
    2021-07-19T17:49:14.232525  <4>[   81.793127] ------------[ cut here ]-=
-----------
    2021-07-19T17:49:14.257038  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jul 19 17:49:21 202<4>[   81.802064] WARNING: CPU: 2 PID: 152 at fs/ker=
nfs/dir.c:1509 kernfs_remove_by_name_ns+0xa8/0xb0
    2021-07-19T17:49:14.257265  1
    2021-07-19T17:49:14.257454  <4>[   81.818292] kernfs: can not remove 'a=
ttached_dev', no directory
    2021-07-19T17:49:14.269906  <4>[   81.825472] Modules linked in: btmrvl=
_sdio btmrvl
    2021-07-19T17:49:14.270216  <6>[   81.825477] PM: suspend entry (deep)
    2021-07-19T17:49:14.270648  <4>[   81.825479]  mwifiex_sdio mwifiex blu=
etooth
    2021-07-19T17:49:14.281208  <6>[   81.831038] Filesystems sync: 0.000 s=
econds =

    ... (64 line(s) more)  =

 =20
