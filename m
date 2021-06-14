Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194773A6996
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 17:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbhFNPIQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 11:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhFNPIQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 11:08:16 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E776C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 08:06:05 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so10266519pjz.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dkhQU3EkcGLeWXE7GeiMAtnC+Vx4D9ZsIz/vwRGjspk=;
        b=SvC+STSHHeMqI/CjZavr07T1j2Ua/pNihwJo6IHNQRLVDE9OgjdX4PBJiu72Q1mHR2
         5w06iVegxocD6nh+iiuWsYJZjxyiIwLKpANCjn1BiRwJG9R2hXYzp6iAxRtBKuukkYFY
         gdZ6nYqstgUngTvpVa9QIE4IF1HsWWDBXM4OrvBUvitXTFQxyaXG1e9PJlfLjKgzX7Oc
         X0CziaOqCVX+yB9EYYj3tftOuA94yIUz5DB+B4xppWsrLJ+TQCJAvkAI0lod2QqdceU5
         jb9Kvwq8xUCYFzEZATPgu1Gm08Jz8VjC3Tjqa5w3pUvt6Y8U7XvNR57afGwUCF3Umq6K
         URpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dkhQU3EkcGLeWXE7GeiMAtnC+Vx4D9ZsIz/vwRGjspk=;
        b=ZkIoyMbNpyh+wwIkVTwK8bxJ2KwHmLHb/X7/BJuydo9x9cq/xWQJfnzlzpJ+Y4lUTN
         tg9uLJ+ba/DGYZmNWv/tWuMiOQbYVbMw+zJK0NsGxZ/iYz5gGJhcvZRcXeqKUymPnoHk
         rPAcw/gy8RAzT0DsRbN69eEYSrLAugVKb/bOgPgJjgwFMB1aXd6eW1D2+47JZLh7WKry
         +aEmISrGOdLksbMfX4/mkR1zD0rYvDjI5gWrRWX53UdFx525U7nmGbKtohifdZPWW+2j
         xJ+4jkXakA3O1UoJGiCYAc+fGXnBnboh9s4iHQsxNpnHwjDdeHVOxRRYpu9UT/iZWbPg
         w3uw==
X-Gm-Message-State: AOAM5335QMN46/gXDny5TP2VmDYSEMn+sl6/AFFsJhpsCbEAt94B5DbY
        R0A+4ItJzaVSV+KgW4B8aE0xXh/Yl54TAzUb
X-Google-Smtp-Source: ABdhPJw25bJhkn0Bcm2f8OMLzFXLjPSJzte33jMtWbubAzJkLG416k1nzzFAP0voJAR0adhGxcleNQ==
X-Received: by 2002:a17:90a:fc1:: with SMTP id 59mr23863550pjz.94.1623683164564;
        Mon, 14 Jun 2021 08:06:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p17sm18374810pjg.54.2021.06.14.08.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Message-ID: <60c7705b.1c69fb81.d658b.62dc@mx.google.com>
Date:   Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-06-14-v5.13-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 5 runs,
 1 regressions (renesas-devel-2021-06-14-v5.13-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 5 runs, 1 regressions (renesas-devel-2021-06-14-v5.13-r=
c6)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-14-v5.13-rc6/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-14-v5.13-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      62ebef21d49093d77b84633283806c94630e3694 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60c76a747047d845d49cd0bf

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60c76a747047d845d=
49cd0c2
        failing since 14 days (last pass: renesas-devel-2021-05-27-v5.13-rc=
3, first fail: renesas-devel-2021-05-31-v5.13-rc4)

    2021-06-14T14:08:44.884381  3: ID 0ea0:2168 Bus 003 Device 002: ID 05e3=
:0608 Bus 003 Device <8>[   14.759165] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dusb-presence RESULT=3Dpass>
    2021-06-14T14:08:44.884733  001: ID 1d6b:0002 \"
    2021-06-14T14:08:44.885043  + lsusb
    2021-06-14T14:08:44.885351  + awk {print $6}
    2021-06-14T14:08:44.885653  + sort
    2021-06-14T14:08:44.885960  + seq 1 3
    2021-06-14T14:08:44.886213  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-06-14T14:08:44.886525  rtcwake: assuming RTC uses UTC ...
    2021-06-14T14:08:44.886770  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Jun 14 14:08:47 2021
    2021-06-14T14:08:44.941415  <6>[   14.806807] PM: suspend entry (s2idle=
) =

    ... (148 line(s) more)  =

 =20
