Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8793E8295
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 20:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbhHJSMa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 14:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbhHJSML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:12:11 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02058C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:39:29 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id l11so10563018plk.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DjwEBMUavFkjfBW9vyLqByFkXiLbXIVgUcLOWvstLSQ=;
        b=I2OntiSBt9m1/8lijpU0OJTmlceW2MDGuf1qLkp9tPhEciL35rhAjsXsE70QxxbkR/
         /9uLhdDM3Qai0fgQdZNsqQ4IsFnoeNkMlFWjJzwd9HAk1i22ZFuCstoU0Ku37hxyg2jZ
         F7CWnNFuv190YwZl+qcpTgRGzo5FgtW0qDjjMAP8bYfvqHIAyIdYWWrX69muO3KDWGOI
         CdkL6dyJ2Nu2LZJ9fvMGQNlA9PMZKitIqK1U4VkZHdG4bACDfCyOhAe95C7ToACLJnXA
         e6vln2BcLYcgyyc2lnJ9Jgrmg8aaFJyUTB149SJMQ6YC7/oi4UAtu9WYmNrS7WCB1Fku
         D2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DjwEBMUavFkjfBW9vyLqByFkXiLbXIVgUcLOWvstLSQ=;
        b=bwL0o/B+Y3GjXhgYlIyXklBcGKOjaeIK9QwlMt78qBq9BU9+yL74gL5h5ryI+oVoom
         xT8XDd0G2ULVx2JGHayesqWeKQ16OqcOiYzpkUVC744bIAo9gWa/v3pq00+4VV5lxsWM
         GV2ZyScoCRGX2OWbvUGmIzlP7fxxC1hDAjxxsMkvRN7MjALsDHW8OPNHL7BIb1/bPSbs
         30EJnYb6WGPRlP+CRU7YkHQajxUotDORxylIYHdgEnNX09LiOW//YkVmCwTZfEismsKo
         3v3nlmUeuozyQAmzU2ubbKfF5fWqHb7GlNUQCg6qWsZuQIpdu37xugSVWHMtbZdChj+K
         OZSQ==
X-Gm-Message-State: AOAM530/dBAfp6b/Koy3q977z94mnsdQqYSDrenX/nA3G7uP/jhR+YCj
        KnjdrBvgBhcbAAHhfaH2j58eLEVghXUcvFEh
X-Google-Smtp-Source: ABdhPJyXa+5NNgS5cJf7ptliYpgOJfJt/ApKXriraxb0OGtXxP2To+gstz17gnKle2SosLxd2ND7fQ==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr761921pgv.442.1628617168427;
        Tue, 10 Aug 2021 10:39:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v10sm3714700pjd.29.2021.08.10.10.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 10:39:28 -0700 (PDT)
Message-ID: <6112b9d0.1c69fb81.31643.ab65@mx.google.com>
Date:   Tue, 10 Aug 2021 10:39:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-10-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 2 runs,
 2 regressions (renesas-devel-2021-08-10-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 2 regressions (renesas-devel-2021-=
08-10-v5.14-rc5)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-10-v5.14-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-10-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      998b2a51c195410ed92f4f3a5ad117c2b567819f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4ac7d6bf5dd1d7aae893fafee98a309d357e5bd6
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6112a3fc4fa106a678b13662

  Results:     92 PASS, 3 FAIL, 140 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6112a3fd4fa106a678b136ea
        failing since 91 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-10T16:04:53.983132  <6>[  156.767467] smsc95xx 2-1.1:1.0 eth0: =
hardware isn't capable of remote wakeup
    2021-08-10T16:04:54.001470  <14>[  156.795119] [IGT] kms_vblank: execut=
ing
    2021-08-10T16:04:54.015189  IGT-Version: 1.26-g6135b9c (arm) (Linux: 5.=
14.0-rc5 armv7l)<14>[  156.801388] [IGT] kms_vblank: starting subtest pipe-=
A-ts-continuation-suspend
    2021-08-10T16:04:54.015687  =

    2021-08-10T16:04:54.016298  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-10T16:04:54.109043  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-10T16:04:54.142697  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-10T16:04:54.143195  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Aug 10 16:05:10 2021
    2021-08-10T16:04:54.162118  <6>[  156.956340] PM: suspend entry (deep)
    2021-08-10T16:04:54.162683  <6>[  156.960750] Filesystems sync: 0.000 s=
econds =

    ... (96 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6112a3c891407ed337b136d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/6112a3c891407=
ed337b136d9
        new failure (last pass: v5.14-rc5-549-g3b20129c119f) =

 =20
