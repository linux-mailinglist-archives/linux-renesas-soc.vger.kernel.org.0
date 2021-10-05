Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C95421B16
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 02:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhJEA12 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 20:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJEA11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 20:27:27 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB89C061745
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 17:25:38 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id b22so1078412pls.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 17:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZnGMzEOMuCbZz+2/9TA9u3DTAWULlnJit/IVcPyvD2E=;
        b=py9ETwraK3uZ3arwf4D/cejGt75HSCxbxE+eNvu5flFwtqDLceDoH9ZD0crkJfDHTJ
         3EvrbBdc4R/CL/XEYN2PzMJahF4P1qQ5/t1LHFdWe0t33kv/Aik58PM2ivl6vrrIMEnZ
         Jj/GMWVD9c/wJjC7PhhBm7InHQjvz9PEovX4WafVplCLpso9Xt9QkqjVCPnTgbze3n7f
         Lq/BtBrAVWAC+jLiFpTkgvte2w4WYmKyuEN7hnywmv6EZKmPhv4SP8MePpqxGfit/Uzi
         bRz1bCc0m+8gSO/G8Z+3ulsNyKXEOkQr2t72dib5RKl8MhTOkCeFcJ7WvY4LCBDyP/Dh
         sa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZnGMzEOMuCbZz+2/9TA9u3DTAWULlnJit/IVcPyvD2E=;
        b=Atf/5zmMJap35cqz+MzNIdFpY3+BIrRk+qC5b4Yj5q6VaaRswsTFySKOEZ9/YAsRIT
         qm9EAnIz3S3DJdYM9034MhhH2kcmMyFCOBO5NxMh5HYnX0UM39IKA9o4px8rCISFVctw
         xlxnH+i2Mv+zHMtr8/p5PkFxEHAKBt7Iw0oDtQgQjmqqEpA3agK/xUWxlYDHk0X71nMX
         CjFrm923KmVjePr8XiuQ6n1ik1+xdXewmcRC1q13jhN4VlGdMNzhIvOCuVnPsV4TPQSZ
         df7BwISTDMBzkKzrA6O2KCS12BKcxyC5AGcV19nIhIrumT86jb+Qi69RckJO1IGa+vFr
         BmIQ==
X-Gm-Message-State: AOAM5318T3j11O5+QLAzxAWaeizzSHS6bOKgXavD61WxGCHXpX34/e33
        lbFupOsX9YWACmHXjNJFZFzqS2bIek2mNGj4
X-Google-Smtp-Source: ABdhPJxV+HHvHFt/eCKtUC9ZHvFqyM1hqAQT5wEPuC5sCtLeUgrq4wNMQbywv3OT1LwxWkC2WEORBQ==
X-Received: by 2002:a17:90a:7e90:: with SMTP id j16mr108859pjl.139.1633393537500;
        Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19sm12403546pfg.40.2021.10.04.17.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
Message-ID: <615b9b81.1c69fb81.469b.594e@mx.google.com>
Date:   Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-04-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-10-04-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-10-04-v5.15-r=
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
sas-devel-2021-10-04-v5.15-rc4/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-04-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      022b9ed809ab70e8e1cac03f6a50d8cb91cf4098 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/615b90592d68bc8d8399a30d

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/615b90592d68bc8d8=
399a30f
        new failure (last pass: renesas-devel-2021-09-24-v5.15-rc2)

    2021-10-04T23:32:54.969638  3: ID 0ea0:2168 Bus 003 Device 002: ID 05e3=
:0608 Bus 003 Device <8>[   14.292973] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dusb-presence RESULT=3Dpass>
    2021-10-04T23:32:54.969935  001: ID 1d6b:0002 \"
    2021-10-04T23:32:54.970171  + lsusb
    2021-10-04T23:32:54.970383  + awk {print $6}
    2021-10-04T23:32:54.970587  + sort
    2021-10-04T23:32:54.970787  + seq 1 3
    2021-10-04T23:32:54.970983  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-10-04T23:32:54.971176  rtcwake: assuming RTC uses UTC ...
    2021-10-04T23:32:54.971365  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Oct  4 23:32:57 2021
    2021-10-04T23:32:55.029089  <6>[   14.340943] PM: suspend entry (s2idle=
) =

    ... (138 line(s) more)  =

 =20
