Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459CE463684
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 15:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhK3OYJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 09:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237388AbhK3OYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 09:24:03 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5796DC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 06:20:44 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k4so15027849plx.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 06:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JqqeeaJ9lI/TS7K1rUCJYKOH4PZ3WsBkPm3K3wknuwE=;
        b=3++MHGCQDRRuIg7qME2TSpX398yRzHcwsdNQvsm6gx8KVd8q4maaH88NCxLBLwsZxB
         FXQslcW6COs2cKKXJMyMt8WOuwCucwEHRtpDil3XoqXbBY/erFqOErywqzqWLUGzxXiH
         ch7sJP+9QFLj0g6qPwkK9paecWKbnhDdwYS8+umBqUK7EUEFXet9KAF4GebVq63jem6o
         vqGWatwk1DHDM60ifxwcX+WS6pCe9TWNBu9z8HRxfxyZv99bf6dCG4CqESqZVw3MHwzJ
         EQkYhmWIRiTwtHlClvmf96sU4mcEWmTkR/mxDrmwc1VZLtxShn8RmXCbnKxO27B0Cz3j
         Xo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JqqeeaJ9lI/TS7K1rUCJYKOH4PZ3WsBkPm3K3wknuwE=;
        b=06mzHNIaWXpHhtHSH+nkXLixD1CxaPwUwcXuXgzcUliTgF0tRfDt8DS670/JkAA3sE
         xd9skuka46t7yWcLQsfUxdj0rwrISTMU06Qxsn5jNFk/Bu/ztfvmRVihEleMeFcMbX9H
         FL3AS8AxpJt06i3B5JYY/1dZXZz2doqy8iWjjhZyp5vZGcTZS9v7Gwm38S1DdIFV+vET
         x8zDQZYmAT9Zb/AzWjAMxHjX6fuGt88FsS+yD7arpeyVB/JK9/C4bc4OQWlSm2wRvEB+
         XSX771/l3BOvGq4AAoxmSAo2ZpHzP5y2f19L25YlHa4+QTvwlfVxrsaUda5OS/VUelSm
         1XfA==
X-Gm-Message-State: AOAM532nbCNglvXOS7TLErL1V9G5mZOtg2+1KnXe0qIKrRCIynukHGbT
        4iqaqr5ji3BpPXV4PiehbLbksl/PZK2LGl6U
X-Google-Smtp-Source: ABdhPJyg47KxKfCzGnp+h56oS0gpsv75g+SSa5mWPZEYaGcwMuVgGnTBYJt47Jx9/wvD8pl9uVrx0A==
X-Received: by 2002:a17:90a:df96:: with SMTP id p22mr6396612pjv.129.1638282043774;
        Tue, 30 Nov 2021 06:20:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z22sm23352967pfe.93.2021.11.30.06.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 06:20:43 -0800 (PST)
Message-ID: <61a6333b.1c69fb81.bdf74.d096@mx.google.com>
Date:   Tue, 30 Nov 2021 06:20:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-30-v5.16-rc3
Subject: renesas/master baseline: 262 runs,
 2 regressions (renesas-devel-2021-11-30-v5.16-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 262 runs, 2 regressions (renesas-devel-2021-11-30-=
v5.16-rc3)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
bcm2836-rpi-2-b | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_KE=
RNEL=3Dy | 1          =

meson-gxbb-p200 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-30-v5.16-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-30-v5.16-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a8e6127a65a43320486091f9448d869aedb1dc8 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
bcm2836-rpi-2-b | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_KE=
RNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a5fee75c41bacb0f18f706

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a5fee75c41bacb0f18f=
707
        failing since 14 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
meson-gxbb-p200 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a5fc12406e60532c18f6ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a5fc12406e60532c18f=
6ee
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3) =

 =20
