Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990DA3D6B8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbhG0Avd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhG0Avc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:51:32 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE029C061757
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id c11so13829553plg.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7dV6BFX5I+Xq1m6ba7v2qc/2rbBr3efzIhGZQySxpBI=;
        b=ytHMW6nF9vzcwVZkDy6qdi76qM+aMavWLdP8tFsWZlolDMTSyjo6GTWT3Xw/DYW10s
         bJ4gG2E5vDJNB0FvFb/yx/aqnzgtBooEzRNxNvnFfBLIDOFsKsvWcmY7hj3jMZDveyx9
         ohFTvQvY9vMAXfUE2kat7ZY29G1VynE6wGW+M6clAbWt2onbW+WEqH01zPl8y1OC7mSn
         E5HZGmbwiVfCLdaQ/O5H5CsdC4gy/uLehi921xaZdEBTl3GFoObWhKu3uBzbU9SeWgDK
         vOz03wuuW9MCzTdUzeMTp8wkNtj8TgCmJAGmdjro/U9GJF3liwGKxvAq3xe4KQuq2XwK
         Q0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7dV6BFX5I+Xq1m6ba7v2qc/2rbBr3efzIhGZQySxpBI=;
        b=YelB0qsCe+uC27OQyNh28q7qCuIao/mcyFBIlcEfW1tDEqHP8STQXwyJ5LO45QKTyf
         ZCscduJURJoPO3DPui8FEmVpgfHrP63MNJDaJXhBOw/0tRoG177OVZL/iXkCdlDiQobm
         B1ty1gAhUWQXrtoaAwJEuCngIYsoFddoDG/eEteLtDRlmfWB8RN3i3OFnZyv1KeHzH7L
         kjfIbXGUFaEqoEHd6lsLyM2tZsOBGptTyqWgKwNWlxEnzfYoxn4Qud+6QWjDsVJ60aA3
         xg2SkpHUOMRtRoRrvMgwhRvY0fOMnUKD3Hh6BsdzzgEr/5P9eBFipl//xiTz4Q5dbMIr
         u50w==
X-Gm-Message-State: AOAM533FBrMKf6LFTVJZHOxcwtQXdXrKpADkIlLsXp9UwoKFi+mNcH7R
        XGR+5VBmrjUqmpgj5LUC0zljrkQb5RRlx8md
X-Google-Smtp-Source: ABdhPJxnyWElsxQm6/sp2sbXSpXyAZ8DF6p+cxgZJ0v0l3m3rPGGCnNI1e3j6YYAqZnUyqRsqAW9TA==
X-Received: by 2002:a17:90b:38ca:: with SMTP id nn10mr83946pjb.3.1627349519307;
        Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g27sm1176647pgl.19.2021.07.26.18.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Message-ID: <60ff620f.1c69fb81.9885b.5787@mx.google.com>
Date:   Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-26-v5.14-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 3 runs,
 1 regressions (renesas-devel-2021-07-26-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 3 runs, 1 regressions (renesas-devel-2021-07-26-v5.14-r=
c3)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-26-v5.14-rc3/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-26-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      42d1095acf6e228a6baeec100d31a57c0c4d7704 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4844c5331415f13a2f26

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60ff4844c5331415f=
13a2f28
        new failure (last pass: renesas-devel-2021-07-19-v5.14-rc2)

    2021-07-26T23:36:36.144042  3: ID 0ea0:2168 Bus 003 Device 002: ID 05e3=
:0608 Bus 003 Device <8>[   16.646227] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dusb-presence RESULT=3Dpass>
    2021-07-26T23:36:36.144287  001: ID 1d6b:0002 \"
    2021-07-26T23:36:36.144474  + lsusb
    2021-07-26T23:36:36.144644  + awk {print $6}
    2021-07-26T23:36:36.144809  + sort
    2021-07-26T23:36:36.144968  + seq 1 3
    2021-07-26T23:36:36.145124  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-07-26T23:36:36.145282  rtcwake: assuming RTC uses UTC ...
    2021-07-26T23:36:36.145435  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Jul 26 23:36:38 2021
    2021-07-26T23:36:36.205317  <6>[   16.696895] PM: suspend entry (s2idle=
) =

    ... (130 line(s) more)  =

 =20
