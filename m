Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF6833B138
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 12:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhCOLeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 07:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhCOLdh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 07:33:37 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532D5C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:33:37 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id s7so15153839plg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SK2CyJ0akmMFYaADpqyBVqjDyUPRabmr4aHnim1uGXg=;
        b=MzGXl2DJgUsJFa4rO3hkuzW81/t/cYy7MkoDCDWoH0MvTXdqqdbINeerfkxRgqhrA/
         fZjuxp1CG/QAzHtSjZzzdN+JYfFTN6D2Re0cb9RdqFAv86BYuCM2okwWJFOEBub/c9EC
         xkUSaMyr9XU6puahj4FPeRUTb2+azpQipq8Iy484Q71l4yTYdodUKtZepUuHtFUAyARK
         c70Vm2GE+1tsnzhKyZ7+NxvoH2iSvOYEClTidX9GVTwh3pjOeq+e9jEGyF7sdmUcy6jL
         fd/+nKcCpzFZayBAThZjQ3Wm5W6kKMWCp9W6FxrhKtirqYP1sn9Oy89zBZZkfnIYCgrQ
         Uz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SK2CyJ0akmMFYaADpqyBVqjDyUPRabmr4aHnim1uGXg=;
        b=ZwWFODpMbfeTFpDDCnsurGvkxttxHBwlq3G1MBu/99qzMa2mCNyRzSNe2GY7fR0dpY
         7A6Je7vkEttsIeB6brTauaxL0is/SFdsZNLaqfkiisvjvioFV+jfFqFot7sKkBsfxqPJ
         WCGIddKA2FfswAbP0/3eYj2q4XMAin31TYOoAPxY+ZsC91VFQZkPix655Vk4TfZklhAp
         +FPtzQWwTpPQH0JTJU4WDGOlwbcIRim15EGSdKDxk0Cr8631nm+XaXcWOqYfq4iEfU0i
         uo9pVoxBMhGpLTE+TpXYB1SCP1tHhNc6JbN1+KeIrcvJ1ko4BPrdvvnALK31msZKM7qZ
         KK0Q==
X-Gm-Message-State: AOAM532XDUqgcN3k25ePft4k6clRUwbPYZbH96Dy8iFE/KzshuDLY8DT
        WgNweHSKCRuHFn8kxa9BwCg1yqXZtAmrVA==
X-Google-Smtp-Source: ABdhPJzuAEAWbAHLxwg2MWmw1Gf73d/+r9Lb8Uyd1YulK57k1rs/hPCHqCFxgdVPzPshywNCKfPmYA==
X-Received: by 2002:a17:902:dac2:b029:e6:30a6:4c06 with SMTP id q2-20020a170902dac2b02900e630a64c06mr11240244plx.65.1615808016661;
        Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id co20sm11063906pjb.32.2021.03.15.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
Message-ID: <604f4610.1c69fb81.a5e0c.9d3c@mx.google.com>
Date:   Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-15-v5.12-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-03-15-v5.12-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-03-15-v5.12-r=
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
sas-devel-2021-03-15-v5.12-rc3/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-15-v5.12-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7bd4543a30a76f48903e745f7b9decce1f019ece =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/604f3c0501b87d4260addccd

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/604f3c0501b87d426=
0addcd0
        new failure (last pass: renesas-devel-2021-03-12-v5.12-rc2)

    2021-03-15 10:45:40.304000+00:00  + lsusb
    2021-03-15 10:45:40.304000+00:00  + awk {print $6}
    2021-03-15 10:45:40.304000+00:00  + sort
    2021-03-15 10:45:40.304000+00:00  + seq 1 3
    2021-03-15 10:45:40.304000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-03-15 10:45:40.305000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-03-15 10:45:40.305000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon Mar 15 10:45:42 2021
    2021-03-15 10:45:40.362000+00:00  <6>[   18.692289] PM: suspend entry (=
s2idle)
    2021-03-15 10:45:40.363000+00:00  <6>[   18.696867] Filesystems sync: 0=
.000 seconds
    2021-03-15 10:45:40.363000+00:00  <6>[   18.703272] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (149 line(s) more)  =

 =20
