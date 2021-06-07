Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A01A39DE57
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 16:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhFGOIx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 10:08:53 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:34795 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhFGOIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 10:08:52 -0400
Received: by mail-pg1-f170.google.com with SMTP id l1so13904168pgm.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=R/pkj7JI+OknKebcbKiVOAStq6c7/UIHA2oczsUGgdo=;
        b=oy7aOhU8p1LLbVvWoz3ZAYctCavdGTWnzm9wStY8r3tXI0GOfULNvRZYZGZDxwNKg4
         Xw5yS3RbFq/D3cevh9U5VgDRm/zZZAXW33nzJDYGjaAc8biQ6Q0or+T6AiCvgq9s6e7F
         eKk1OmWESqFnw9Eajoy3Y5a4BgOC2hwQ/jvxvqnv2ulrNOOqGnuWk/8ZB5/NbTEjxYrj
         Kh9vAVbpZ0+pNX9Yp8kAtxe7nzxD7coqUxy3vrPm9nXwsNdih0y8GNpslScSrNFsNAx1
         7ecGsoiLP0+vIp860C5eU/yvlsYTbLeTelrbWK1fpRgt5Vn01tcfZnYBd6on+giNFiSM
         CKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=R/pkj7JI+OknKebcbKiVOAStq6c7/UIHA2oczsUGgdo=;
        b=tAikWFNCpi4Pf+2qw5oFW9z00gboUnZvVCCICDsRLgaAw2oiNWG0g3LNGQH8jUxl/t
         aeHHobIcD76ZhDL8wc+GXQQV1O4U+fH25j25HZ3q2EA0va5sYx2Q39442C4rVKcKEm0c
         dkcq3JwKgH+GPE61sL8WUazC6ClxzbTamQfxWQo4KG3uhqBLNP3hPRSwmO1IReCn1TYJ
         5zAe/sgP5hRRPeWDAEhd9MCxH53x4VftHohf392YeyT/bw4Nw94nQtWTG8rOWZjCu5mF
         RSWNpx8S3makB9ORGXGKRyad2/6XbMwgW5Nvi+13u+l9hyAqS0ZrrVL9qjeTDu5Q03kz
         MtGA==
X-Gm-Message-State: AOAM533WE0CTfH+mM5Qtpbj3fxsbUab644e/fNZ15lcIF0zYwPJWVxhE
        fPIgD5yay0WMstdqaxa3qyjJ3BisW8R+1L8m
X-Google-Smtp-Source: ABdhPJyH3BsmUCyhehFIW95LpEDzVEXI8FKqY9cvYO1i7GT37YAwqggUJlsI84A//Nu6CLu5GFKhhA==
X-Received: by 2002:a63:4d47:: with SMTP id n7mr18115454pgl.82.1623074747600;
        Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k20sm9792347pgl.72.2021.06.07.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Message-ID: <60be27bb.1c69fb81.a6a0c.de20@mx.google.com>
Date:   Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-07-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next usb: 5 runs,
 1 regressions (renesas-next-2021-06-07-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 5 runs, 1 regressions (renesas-next-2021-06-07-v5.13-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-07-v5.13-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-07-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e1833059a1c5dac43b9e7352890ec727247341e0 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60be14af2070011de50c0e01

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60be14af2070011de=
50c0e04
        failing since 7 days (last pass: renesas-next-2021-05-27-v5.13-rc1,=
 first fail: renesas-next-2021-05-31-v5.13-rc1)

    2021-06-07 12:39:28.498000+00:00  + lsusb
    2021-06-07 12:39:28.499000+00:00  + awk {print $6}
    2021-06-07 12:39:28.499000+00:00  + sort
    2021-06-07 12:39:28.499000+00:00  + seq 1 3
    2021-06-07 12:39:28.499000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-06-07 12:39:28.499000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-06-07 12:39:28.499000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon Jun  7 12:39:31 2021
    2021-06-07 12:39:28.555000+00:00  <6>[   16.333462] PM: suspend entry (=
s2idle)
    2021-06-07 12:39:28.555000+00:00  <6>[   16.338039] Filesystems sync: 0=
.000 seconds
    2021-06-07 12:39:28.556000+00:00  <6>[   16.344500] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (149 line(s) more)  =

 =20
