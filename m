Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44CF47A893
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 12:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhLTL0E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 06:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbhLTL0E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 06:26:04 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3355DC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 03:26:04 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id d11so9122969pgl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 03:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iQ1eB0lQj8SkXNyB5srr6shYN2kDPzMa8lkKri7+csI=;
        b=UkLzQlO91juFwJ5L5fixSEC3OJH+DbzT2JQMRfQ8+70Wmi9LvatOBeCCCuqLvUG7fj
         3aGMQBoJIOJXcDo/Xi4FZOiiZXSs+jO2MvpaeI4q0wXqGSC1aIYBMUFnAvQtYXFsrhFi
         5HpVpAasykHj61QuANGqQpWHYqh+SVlDO2oSVwrX0Om0E03htlBWChEX93orGEODzkNm
         Xzt5VqA13wfyTgK0RiVgLqW4EJi0eeczuCQu5TO9RqPtLHhj7qv6nLNBZ+c5Ryj9NoOr
         Rw8AQs76t4k3SVV/93mdiUsP+8xf7Rez9BLL+/HlHsD5zoHSiIyGCcDgdiDXMoyUX/xc
         WzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iQ1eB0lQj8SkXNyB5srr6shYN2kDPzMa8lkKri7+csI=;
        b=13Ma+8Ees9TpkNt625fuategGONRhHPf4pgWIV5/gk8F5j9JLD90AmuWS5gL1HsjIJ
         IvxfPMKlkO5Wb8cAN7a5PWdc4XOG2sKlFDEBFwfplZfsNq3XTJ3J9Oi6pxeVWyes+cLc
         JYCtWUGy4a3ebqN+MtRA6FXV/mUy+yhuH+GUrDanD3dMHrA7GPhcgtFIQ2fihFj/Pk79
         P2EkDUFXu3rLs86y89O0D1/d2JxKubIXY3sPJToEsT8Lg7GA7wKO/bxTR7BCeQP4RKzA
         /y6Cc00PnjJnmasoAP4HsSKKLK89syncrQDnmu1KzdKEVVSm1+41HWECvI1hNIlmmVA3
         ay6w==
X-Gm-Message-State: AOAM533Q8LdQS1+PZQfH5SbYw1ms5m5HZUoQmzXZ6Sv7WB33gGOzr6ws
        I00aPe7ghbBX9zINl8L5GOVLFWnd7ml/QAJT
X-Google-Smtp-Source: ABdhPJyx1OQ875EX5g8oh9aiFftjoGww4sJP3Qy88+ob+VT/22o6T71/C9gusn6PuIRP5RyynmLAwQ==
X-Received: by 2002:a63:4564:: with SMTP id u36mr14328625pgk.27.1639999563455;
        Mon, 20 Dec 2021 03:26:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g17sm16518341pgh.46.2021.12.20.03.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:26:03 -0800 (PST)
Message-ID: <61c0684b.1c69fb81.d3f12.d658@mx.google.com>
Date:   Mon, 20 Dec 2021 03:26:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-20-v5.16-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-12-20-v5.16-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-12-20-v5.16-r=
c6)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-20-v5.16-rc6/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-20-v5.16-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8398a361cd075d8ec3e1d68b246a67148a1486d1 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/61c059eee19e3037be39712d

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/61c059eee19e3037b=
e39712f
        new failure (last pass: renesas-devel-2021-12-17-v5.16-rc5)

    2021-12-20T10:19:35.132338   001 Device 001: ID 1d6b:0002 Linux 5.16.0-=
rc6 dwc2_hsotg DWC OT<8>[   14.220598] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dusb-presence RESULT=3Dpass>
    2021-12-20T10:19:35.132854  G Controller Bus 003 Device 003: ID 0ea0:21=
68 USB Flash Disk Bus 003 Device 002: ID 05e3:0608 USB2.0 Hub Bus 003 Devic=
e 001: ID 1d6b:0002 Linux 5.16.0-rc6 ehci_hcd EHCI Host Controller\"
    2021-12-20T10:19:35.133272  + lsusb
    2021-12-20T10:19:35.133699  + awk {print $6}
    2021-12-20T10:19:35.134108  + sort
    2021-12-20T10:19:35.134486  + seq 1 3
    2021-12-20T10:19:35.134859  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-12-20T10:19:35.135216  rtcwake: assuming RTC uses UTC ...
    2021-12-20T10:19:35.135565  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Dec 20 10:19:37 2021
    2021-12-20T10:19:35.182804  <6>[   14.268694] PM: suspend entry (s2idle=
) =

    ... (95 line(s) more)  =

 =20
