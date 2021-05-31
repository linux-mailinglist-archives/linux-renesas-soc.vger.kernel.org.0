Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0928396362
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 17:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhEaPPQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 11:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhEaPNF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 11:13:05 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA624C035428
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:10:03 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 6so8423786pgk.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6PXtfqlvAHu2iMoRUTZ7ncZze1FG65bRRNtLY3SBh+k=;
        b=u5/TC6AsZmvbuSuv4pk01WuC+lafhBbbktEWxrCggWPMBWbA2PV7VLy7RvkK0rzIOA
         VExQ9vwqdMwv8yNDFZhnsnfetEaNtAk4teoCUXkp4p8PmQ/00npVTEfcttj3GePaqvoO
         4EkTPbqp33P+SOp0SER74FVsoOvnpTpTLlEnQZqipuMod/ihRpx5ZcyXjIB3mj/H9cE1
         PNp8EGcSmjq+MUTTwRK5Zl9XqZRJQy7M3w0UXiFj9ZJ8jOTMNyvWgkEY/tRWM7BOExJM
         29fQ7rrdeT34kt+cFHIN9v/UCCqJf3cj/zJ4VNCDRLbaatoMCGMuCXx7i3xcDM67ZLGX
         AAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6PXtfqlvAHu2iMoRUTZ7ncZze1FG65bRRNtLY3SBh+k=;
        b=S6kulibsNkVn+e6Wn4UcAqiwM9njJzk8vMctNKnToFx90xX5mBSAEBRmgbY0kS+e9g
         8+VGDhKTgFIbvoq8zgm5kD5D+uO+snyE/sxp38YWAx/lpU91X+ZxSQjCMOxv3nj01V2k
         rQ2CeIbnJJjShkZfy967IKlbNMN/N7gh1IVZyHULknUAmiBC3ZN5JFdCNZZQsM3nLFbG
         oHHZ65gMpuffVv8VV+P/C+ZbTd7MCt54MlAIwI3h2BE0bha4r7wicZGldZSwrDFLMdUb
         hwfhcbl60xkrWuBfTnXkPjy2OUim7a/i8xvy62iaatpNQbV8XhHHQ4CCHgiyfGTmyg3w
         a0vw==
X-Gm-Message-State: AOAM533hKahdbj4VhOMrxv9eJeMS+JgfSibk1IO4w5zIHLLgJw2C6eBU
        E1nNcBgBLiOZgbBxdCLjo4tLCG2+NaFMWS1w
X-Google-Smtp-Source: ABdhPJwscyQaplV/YpmJNh0sv/VMGiuDpuGUCVGFrjMtR9MVPaSnvocTU/ZzM5HxWoMi0HGiaH/sHw==
X-Received: by 2002:a05:6a00:2313:b029:2e9:af5d:2b69 with SMTP id h19-20020a056a002313b02902e9af5d2b69mr10395866pfh.66.1622470203163;
        Mon, 31 May 2021 07:10:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y129sm10619413pfy.123.2021.05.31.07.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:10:02 -0700 (PDT)
Message-ID: <60b4ee3a.1c69fb81.9bc5e.1a08@mx.google.com>
Date:   Mon, 31 May 2021 07:10:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-31-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next igt-kms-rockchip: 2 runs,
 1 regressions (renesas-next-2021-05-31-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 1 regressions (renesas-next-2021-05-=
31-v5.13-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-31-v5.13-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-31-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      acad452912fc6a5cd2171fbe6af0ecbb3aad265c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4c8365183ec52e9309ecae45c725aa315562854d
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  8eeb9c130e75d4063d0dc2ed69c8acde66b6b5d0 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/60b4d9c99b2ac528a2b3af9c

  Results:     92 PASS, 3 FAIL, 139 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60b4d9c99b2ac528a2b3b00d
        failing since 5 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-05-31 12:41:03.324000+00:00  <14>[  169.326978] [IGT] kms_vblank: =
executing
    2021-05-31 12:41:03.337000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc3 armv7l)
    2021-05-31 12:41:03.343000+00:00  <14>[  169.332840] [IGT] kms_vblank: =
starting subtest pipe-A-ts-continuation-suspend
    2021-05-31 12:41:03.343000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-05-31 12:41:03.390000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-05-31 12:41:03.427000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-05-31 12:41:03.427000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Mon May 31 12:41:19 2021
    2021-05-31 12:41:03.445000+00:00  <6>[  169.443626] PM: suspend entry (=
deep)
    2021-05-31 12:41:03.445000+00:00  <6>[  169.448035] Filesystems sync: 0=
.000 seconds
    2021-05-31 12:41:03.460000+00:00  <6>[  169.453701] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (114 line(s) more)  =

 =20
