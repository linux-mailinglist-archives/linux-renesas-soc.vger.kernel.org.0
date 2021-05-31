Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E6E3964A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 18:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhEaQGO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 12:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbhEaQEB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 12:04:01 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A7FC08EAEC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:41:01 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id j12so8480470pgh.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=REpilejvJZCjJ6J2M+Q4OnXDl1au07g6Ck5PDazXQ0Q=;
        b=y03PiGMw8Yp1A+mMpdfqYY3ZLZwrRJaGgPWOvoF6QbRGTK9ir3PWpxEo/3yL+pfcoN
         U8Po16Y3O2ukzhPLtrOw2lLfHYQmg2beK1lGniBc0BN8zrbDmrv4yLIVJ8ByAKXZ9TAY
         bw1LFlb8rk6wRvGN3Vmdmtv2U8fbmfzmaUAef40Ze0MASuAYUjJjG1SU+dXvzD/uQsOJ
         hIuP7vCYUtaaQ7HfQjA/DFbtjm6rLtaqu/lm2XFCHbfOPJ1Fb8upj2FjjnyQV81jDT3n
         lr7OgtlaHTc1ESCxU5IT5+bj75fA6U1Rj/yQU+5dbVoDdTBJkPdG7NsoEfgx1F3agotS
         hDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=REpilejvJZCjJ6J2M+Q4OnXDl1au07g6Ck5PDazXQ0Q=;
        b=f6sfZunrn78vvpxFEVdn+M3KVYj2sGWqCXmt89UtXunH3lXQRfmjBAvF+ap7/N67ds
         uSNgzVl+3Avkgl7egIdGkGS+jfyY1K3oSUaBpdvVGEl0Fq5Ivahscmx3u8C5LoUUFr+0
         iM4UvhxmjVmN/yWxUrBLdqj+2edh3OqKYVsMIfviTIspVpsjg3qDuKTvo4Q5hX2cn7/7
         gaTMIfQgJVjL3RRTCholEsDZZzbehOH3n9EjzATnBnuK+JZUTTYLek8PH/jIjAQ7/tnG
         OSASciKphM7w8G86f93zzDUbdBTg6S23g5bxBaMlUAoeWUabzp2aQ9yNGmXMe3eADo50
         FkdQ==
X-Gm-Message-State: AOAM531qQTe973yB1LL0wxwQI/9wAvRVrbF73eA9PnW48rzX1n+y23om
        Mj7J/jHgeOZxjnXKsB2bbMXPiHqwBKrxKB3q
X-Google-Smtp-Source: ABdhPJxBx9d7CSPvLhM1HXuG9OqHbNnHErsakqHwGyPpkKxSynBjESWqkTPMlCb1dC4qwTm/S68vpg==
X-Received: by 2002:aa7:9983:0:b029:2e9:e086:7917 with SMTP id k3-20020aa799830000b02902e9e0867917mr2941915pfh.57.1622472061202;
        Mon, 31 May 2021 07:41:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v6sm12800884pgk.33.2021.05.31.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:41:00 -0700 (PDT)
Message-ID: <60b4f57c.1c69fb81.6cc1b.8243@mx.google.com>
Date:   Mon, 31 May 2021 07:41:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-31-v5.13-rc4
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-05-31-v5.13-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
05-31-v5.13-rc4)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-31-v5.13-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-31-v5.13-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a17b18482334959148cabda392caea262c68ba77

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


  Details:     https://kernelci.org/test/plan/id/60b4e9f87ea90de03eb3afac

  Results:     92 PASS, 3 FAIL, 139 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60b4e9f97ea90de03eb3b01d
        failing since 20 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-31 13:50:10.348000+00:00  <14>[  168.507258] [IGT] kms_vblank: =
executing
    2021-05-31 13:50:10.359000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc4 armv7l)
    2021-05-31 13:50:10.365000+00:00  <14>[  168.513111] [IGT] kms_vblank: =
starting subtest pipe-A-ts-continuation-suspend
    2021-05-31 13:50:10.366000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-05-31 13:50:10.423000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-05-31 13:50:10.457000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-05-31 13:50:10.458000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Mon May 31 13:50:26 2021
    2021-05-31 13:50:10.476000+00:00  <6>[  168.632154] PM: suspend entry (=
deep)
    2021-05-31 13:50:10.477000+00:00  <6>[  168.636531] Filesystems sync: 0=
.000 seconds
    2021-05-31 13:50:10.490000+00:00  <6>[  168.642280] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (103 line(s) more)  =

 =20
