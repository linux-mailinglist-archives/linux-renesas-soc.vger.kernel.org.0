Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E1F4733C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 19:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbhLMSSQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 13:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238893AbhLMSSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 13:18:15 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387DBC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:18:15 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so15274812pja.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JecvUkv+prObsOj2F+C77q+kzTipVzsFUBAndGElTak=;
        b=dIbX7V3eTzhwEToE3WRtBSuCuf9PsxkcS30MEkI97E65GTnidNOVT6ZC9f0Or9Elev
         d5i2URK4EI+SNYWhucyfMkewPk6LC8lsPNrG9FCeoDy/MxIXP7rxVIzJvPutMqrtkenf
         xTBAv2IGYZ9V13UQMRlvOouaQtB0SLEoV1NIvzap36j3NXES6UR7xVr32aW5O5gkrGJg
         nLeM2rkN15aD9vKJdDltACGFhU/TcY+o33YKCld/IIuN6EyvH58d0dtqNxlu/HFx2oQL
         fUCiV9UyW8RULxlE/20ZAOEXF8EqJFAsTAQIo7UAGMCDzrfiOQ9XVhq71VKvspfbGInv
         2v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JecvUkv+prObsOj2F+C77q+kzTipVzsFUBAndGElTak=;
        b=bpJDal/ZKj/fdViqpLfkOVsfUIqM5C7gCuELK0MUC8K9v3XSaag4BsHgY7N5aP91sZ
         dVLYQeiza5yX3fJR/XLdi98CxyjghOv4LphBYhYXsiySFtwluueTeF921epH3afD9hjl
         M6x4RHy63zy73XGXr6mBrfTQe/yRiZUJ/39MK045mFlnyIN++QMvJxuf/dD9T2IBvv/u
         d9Fv4n8XKV/gwdMKl7RXYxrIZpY39rubwaJXZUTEc/gr71Egwf18z2nSmtA1EGGopZ8S
         GP1Y/18Du/DZeC7fN8oi507s/106xH15glpaaklqubQTay2BKIdeD9G9ZigmNmcdFC5k
         0/wA==
X-Gm-Message-State: AOAM532Yz/VYid4RHyJHBkwjQ3eI+O9dSrwWdqZ15zdiXCDN+Gpv3un4
        l3yYBHdRZKXz1yZI6O68VIhXoIhWcs3qs6r4
X-Google-Smtp-Source: ABdhPJxbgg91LQxT6CsZoTbgtoE4kw7THKAxGIboH+LPya/X+WprCm6xYD+Z1g3wcmOa7gwc+S48Ug==
X-Received: by 2002:a17:902:db12:b0:142:3ac:7ec3 with SMTP id m18-20020a170902db1200b0014203ac7ec3mr87467plx.2.1639419494594;
        Mon, 13 Dec 2021 10:18:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id pj12sm7731499pjb.51.2021.12.13.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 10:18:14 -0800 (PST)
Message-ID: <61b78e66.1c69fb81.32b4e.431a@mx.google.com>
Date:   Mon, 13 Dec 2021 10:18:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-13-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-12-13-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-12-13-v5.16-r=
c5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-13-v5.16-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-13-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2d93a61c003c8e6bbc9e44c5ffc3eb00242028ef =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/61b786656f81bfa258397179

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211203.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/61b786656f81bfa25=
839717b
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95=
ae4ce1f1)

    2021-12-13T17:38:51.496178  G Controller Bus 003 Device 003: ID 0ea0:21=
68 USB Flash Disk Bus 003 Device 002: ID 05e3:0608 USB2.0 Hub Bus 003 Devic=
e 001: ID 1d6b:0002 Linux 5.16.0-rc5 ehci_hcd EHCI Host Controller\"
    2021-12-13T17:38:51.496685  + lsusb
    2021-12-13T17:38:51.497096  + awk {print $6}
    2021-12-13T17:38:51.497481  + sort
    2021-12-13T17:38:51.497854  + seq 1 3
    2021-12-13T17:38:51.498310  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-12-13T17:38:51.498679  rtcwake: assuming RTC uses UTC ...
    2021-12-13T17:38:51.499034  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Dec 13 17:38:53 2021
    2021-12-13T17:38:51.499386  <6>[   15.999874] PM: suspend entry (s2idle)
    2021-12-13T17:38:51.499782  <6>[   16.004612] Filesystems sync: 0.000 s=
econds =

    ... (138 line(s) more)  =

 =20
