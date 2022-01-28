Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CFA49FBEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 15:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244984AbiA1OoX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 09:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349106AbiA1OoV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 09:44:21 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE4BC06173B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 06:44:21 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 192so6322480pfz.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 06:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=anjVdlq4wBrEF3AnbLQM8c45SWV+13J5Z0T9y6Fartw=;
        b=6bQFtrctG36FGxOhWu2Mc28noVDR3HEIfaR1f4l+5bZcdQWwnOX/SB6m5GQ+qgTTcf
         T3BFCTiDSMmD/ef0gtcMlP76ztu8S3u5bLnLySVCwESEOigN//WG1AbhvbB+1hY+875r
         pN5CwKvKxFcaZV0S87Ov/np/LmDrvvTte5xKN3D/I3dhgfo/1wDWARoR3vmQIHiv3C6Z
         PriORHYod1w8gFMnwLqZy/DkUJ92LQa1BoNDHaM9MUqqcDzgpfhSWtdrMd5NG8s0lte+
         DvXKFlTVxy6CCovHaxhExxS/etl4sHe3mQ6iM9xc2pe4paI4lyNvkx4r81IZyPSCcjL6
         PsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=anjVdlq4wBrEF3AnbLQM8c45SWV+13J5Z0T9y6Fartw=;
        b=pH8JBb76L+TQFmnFNlwbp+JXnJ4xDPMZ4p0aGtTkOlHdECoygbpjVgjsI8g2FjIQiY
         +CSk2Z8aMRuSEoSdF+8a80RTIkN8aWac+8jcYQO7552CrTAf9dFgNWGj4AukiyjgusF/
         G5avutE+y61VIv4uHn3vlGt7WI65W8LOFmzdmIMsJrmKRUC/c50UWcLn7L4oZFLtKE0c
         uCx9Gt9xzz/93Z21EOTMCqUGjxEV/WxCyD/d3yh5gYNEFFnFzhpE2tNMnteV7xh4MYu3
         whMldeWd6bxQwMs5flvWtf3jAEXSTcfefNrPxaddJl+qV3RfRvFmr1m9HAYpB0RecS8B
         33lQ==
X-Gm-Message-State: AOAM5317a4gbGK/ckhkTdd8vGg/zKwVoG8EjT8JCccO6gv5xqX1m8L/z
        mSXoefL733Spp6lKGmSYuWg6EqFLFaBKIWpj
X-Google-Smtp-Source: ABdhPJyvjFOyiMVzwKkWzagiAXIjqf1auLdMD90M7xEiVMoaqL2OBZDT33RgAYB5Iy5QJyDatcdeZQ==
X-Received: by 2002:a63:112:: with SMTP id 18mr6669739pgb.482.1643381060519;
        Fri, 28 Jan 2022 06:44:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j18sm10163732pfj.13.2022.01.28.06.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 06:44:20 -0800 (PST)
Message-ID: <61f40144.1c69fb81.c2369.b547@mx.google.com>
Date:   Fri, 28 Jan 2022 06:44:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 4 runs,
 1 regressions (renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 4 runs, 1 regressions (renesas-devel-2022-01-25-v5.17-r=
c1-11-gba94d205dc711)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ba94d205dc71120401744a925da52c4098644e40 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61f3ffd58c222d6f7aabbd61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig/gcc-10/lab-col=
labora/usb-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig/gcc-10/lab-col=
labora/usb-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/61f3ffd58c222d6f7aabbd62
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0) =

 =20
