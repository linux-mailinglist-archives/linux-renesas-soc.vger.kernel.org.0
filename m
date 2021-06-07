Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F7339DE56
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 16:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhFGOIj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 10:08:39 -0400
Received: from mail-pj1-f48.google.com ([209.85.216.48]:39604 "EHLO
        mail-pj1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhFGOIi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 10:08:38 -0400
Received: by mail-pj1-f48.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so12007530pjp.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rqdDdmp1gIwrQTnubh0EAquRE9Qpm/eTLg8PWrqoAhg=;
        b=Q1Fswh/A8cvMtFzQSQKw44AhrjFqJtP8XTsObB/clgvxj6RnZU/B7QvhAgMlIn9Uat
         n2tWZvoDSIykmRic/hG7n6zKv85B1rnM7qjAEZkFIED1vFezfi9QOBzkq7bLOdjpb82b
         SgTM5EQJFj6EbYgtDEjfoqRD5A+aVRRAzV83iwI4Zz0iFlMBiR93W5P0niHPXeu4ORUT
         golxEHXDfj1yTh/GjtR3A2udamDKS/1ai1V7Y89ro1rskQIPcoAhj4OPhKw5gay19pBe
         cWZ7f0wqSlGoDpwbvgNvVJJp49QDerFp2cILYuCa9aORNEYOm6CLSBgqOC/RXYNTbkE5
         7Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rqdDdmp1gIwrQTnubh0EAquRE9Qpm/eTLg8PWrqoAhg=;
        b=o62DV+o0Wph+2cinf2MUvM5es4iBQrt6dSpK/mRslO5fZNvIe0/ESqw2qlBT1fAXdg
         B6Ec2Pm0kj5dUTVbZywpke+K76FX+PtZekpoxwuOe/fFcfAh99MMEGgxOJGNFkc8/doY
         6s4OiZ6poZ4xAIBvvsv1IJPw/YX4sp0P9T7Q1Xab6EeMOGa+g/B5kjNE+ao9uMRUfKl5
         jsm+qQOEMjqKllIP6+Pv0Uxf/H5RWesKyfonXsrWdoOMBCmvhVLwLEh+g0q/JGZLgSL2
         0+YpW46lfGnt5eFOQSZUYO4TpV8jxZLvRKtW4s+bEBleQ4NA98i6JNgyxB+fqx9tjmYX
         ZKlw==
X-Gm-Message-State: AOAM533BrZ50nGSxWxv3V8fhgTT/Jks2kZtfJv4JSQHrg6J15LQvWlGJ
        +h9fMgAldOApQFa8W8tkVupiiRW45I6isOVX
X-Google-Smtp-Source: ABdhPJwAJTzgKZ6kwLnSNDkaL7vOt/yEjfltwj6nZtggazlrMFTddrmKGsriPsoraXsmqbtzMxh1pQ==
X-Received: by 2002:a17:902:6b04:b029:10d:8c9e:5f56 with SMTP id o4-20020a1709026b04b029010d8c9e5f56mr18145584plk.8.1623074747150;
        Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c21sm8336754pfi.44.2021.06.07.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:05:46 -0700 (PDT)
Message-ID: <60be27ba.1c69fb81.e97fd.9780@mx.google.com>
Date:   Mon, 07 Jun 2021 07:05:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-07-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 2 runs,
 1 regressions (renesas-next-2021-06-07-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 1 regressions (renesas-next-2021-06-=
07-v5.13-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-07-v5.13-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-07-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e1833059a1c5dac43b9e7352890ec727247341e0

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


  Details:     https://kernelci.org/test/plan/id/60be23c6cc9dd333820c0e1e

  Results:     92 PASS, 3 FAIL, 139 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60be23c6cc9dd333820c0e8f
        failing since 12 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-06-07 13:47:23.048000+00:00  <14>[  168.378635] [IGT] kms_vblank: =
executing
    2021-06-07 13:47:23.065000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc3 armv7l)<14>[  168.384907] [IGT] kms_vblank: starting subtest=
 pipe-A-ts-continuation-suspend
    2021-06-07 13:47:23.065000+00:00  =

    2021-06-07 13:47:23.066000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-06-07 13:47:23.124000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-06-07 13:47:23.149000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-06-07 13:47:23.158000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Mon Jun  7 13:47:39 2021
    2021-06-07 13:47:23.176000+00:00  <6>[  168.503659] PM: suspend entry (=
deep)
    2021-06-07 13:47:23.176000+00:00  <6>[  168.508037] Filesystems sync: 0=
.000 seconds
    2021-06-07 13:47:23.191000+00:00  <6>[  168.513771] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (102 line(s) more)  =

 =20
