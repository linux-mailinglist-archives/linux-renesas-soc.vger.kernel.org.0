Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9223964A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbhEaQGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 12:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbhEaQED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 12:04:03 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1604BC08EAEE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:41:03 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id v14so8491423pgi.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6p3TJtPnYZH79QLqU1Q3CyGfYRMazzEvPMnBWts+BLw=;
        b=dzo0tneAFfsJj1p75XlWdYtgc9mDau2UaxQVOPIGFrrp91oLKAHsywlHdKw3qL19Jz
         2wanbKNAgeAIuS82fi13jlvT/jD51IcgM5Mk8jH/RAcHOhIcvxYCh5vF5CGfCZ40iu0m
         /hNHCD+KWj5JmJoJUdk6mvDkhMnKfZlSCRLejap2PDbQh6upMhqHje960A/ny1PXBoke
         qZL2l92D1DV4iDAOspdraFii2mIbIKGJIFm0YHSM+6XCjdJmy4DTmIUCz5sjVVinF3vj
         yxavBiV+z8isAXCbXhVSJVYF4Tm75IZS31pavkJeXDc1scrRZS3MWN1LDvKHDoCiKa9O
         s7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6p3TJtPnYZH79QLqU1Q3CyGfYRMazzEvPMnBWts+BLw=;
        b=QXLreOc3fZdHDLmrZVUubs8ZEmUqz31DIveoO3lM2OvAP3GhkS6nPuPp2nhVAmTc6G
         3JRT2YTQi6mOXbo6ZdM2Xi5LbBVCk9uFb65z8khfI4L60GQH4idYU+SPveLYgHjGcqQK
         LT6nVN5hrwqcstk+HhXgJOPh0Dwx3IDB1Wvdql6PitDdfQNM56HTz+h7ZWyleyYUzC6q
         sFGoEFnh89Z0reVGHpeGm4V2VbAclb/l6ZNzvkJEQImbZkTc46+YT+AHoOPawhSOrw9J
         IlbemXlWNKQ7YWTzWtVHa9DnfNRcEFzh4awu97d9DeHJ5qWirFIjRooxLCQjHNvTNb6C
         nt4Q==
X-Gm-Message-State: AOAM530yQdn0UbmmsY07QjH65GR7ZgXAkgv9PsricwGtVJhP9fS5ulTX
        arXjzkZozQhhNoUdg9Eoy0VMwtKQNDWFlQ9w
X-Google-Smtp-Source: ABdhPJzkU0Qg0yAqk046FMiGby/pfIqwUXpJnazWM9BK3W802UfJLmZiB+LqeGrGpxO1Cddtp+lufA==
X-Received: by 2002:a05:6a00:c91:b029:2dd:4fff:204 with SMTP id a17-20020a056a000c91b02902dd4fff0204mr17272189pfv.46.1622472062424;
        Mon, 31 May 2021 07:41:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm4400511pfr.99.2021.05.31.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:41:02 -0700 (PDT)
Message-ID: <60b4f57e.1c69fb81.dfd7.ca58@mx.google.com>
Date:   Mon, 31 May 2021 07:41:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-31-v5.13-rc4
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master usb: 3 runs,
 1 regressions (renesas-devel-2021-05-31-v5.13-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 3 runs, 1 regressions (renesas-devel-2021-05-31-v5.13-r=
c4)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-31-v5.13-rc4/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-31-v5.13-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a17b18482334959148cabda392caea262c68ba77 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60b4e4632fce91c80ab3afae

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60b4e4632fce91c80=
ab3afb1
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3)

    2021-05-31 13:22:54.395000+00:00  + lsusb
    2021-05-31 13:22:54.395000+00:00  + awk {print $6}
    2021-05-31 13:22:54.395000+00:00  + sort
    2021-05-31 13:22:54.395000+00:00  + seq 1 3
    2021-05-31 13:22:54.396000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-05-31 13:22:54.396000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-05-31 13:22:54.396000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon May 31 13:22:56 2021
    2021-05-31 13:22:54.451000+00:00  <6>[   16.435926] PM: suspend entry (=
s2idle)
    2021-05-31 13:22:54.452000+00:00  <6>[   16.440504] Filesystems sync: 0=
.000 seconds
    2021-05-31 13:22:54.452000+00:00  <6>[   16.446893] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (150 line(s) more)  =

 =20
