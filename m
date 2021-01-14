Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8864B2F65B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 17:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbhANQWq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 11:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbhANQWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 11:22:45 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD91C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 08:22:05 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id j13so3472338pjz.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 08:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GNocrWHoFfHixY+EafEu93EdGU/Tjjt5LlZeA+dIYQ4=;
        b=TDGFWFSj9UfmLSto/g4jEftRkkiX4tsRdvNLNbJXr4JOImMiwLCt8XkXU6Fuc+X2mf
         HE/jZ+i3didzr7dAIzBQP9Z3+qdUXru+nfBWK/ftk13lmBU0IEZC3lYN0TV+jQCs+jNb
         MHJFF+lVlMyloDxop/zWRP4IfUTlJzFQn2hSllIeBekebRzI7zlHheNXuZ06bh1J2G1I
         +ysUbQrMztjgotNhDufvpDuq0odRxVHOnOrlPsBQiWEjjyFqqGDfNEq2t93hu1YP8dvK
         R+dwRS9lgUiTyh5+Q8N/RBBmqDd5cRmfAAGyCMM4t3fTn/vNzVvMGTbL7gOguL0VWbxp
         fkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GNocrWHoFfHixY+EafEu93EdGU/Tjjt5LlZeA+dIYQ4=;
        b=K5D4oh9eX7V1Wk0/4RHcvRbHF3TF1Xcvm3/AHWdlm8MxVF1u5jTsjXF1hCBwdpozPh
         7X5BEZUIx3igQlU1Q2a7uXYQtZMmp5Tq4uoHZwyF8gZgr94PYQEPpY7Uj6SzugBmYqLX
         XZi3ZkQ1XZm+MyAwGVbSJPWM2rUHV8wbYUvNrkBUpEEnOMpEoeXhgbBHuDG+7FNHfU6b
         628cUeq4zqe+qMdeXJl0/uczcUgkH2tfZuo4L+/QFhMYfERh0U7YB5S9+TeLBF6ivEZI
         AGExYX+twmyAyB/SFsULvDnuiW3+WpTiMylmL06Ukfelylvx1sj9x1+NBZ3sFd2Lp9JQ
         sdWg==
X-Gm-Message-State: AOAM531lJjc55jXwfwKGH/o1TE4xV4BbugH98B9hK5QoLtcOB+PNkvmz
        Olue5cUHqCbpf+d97GoROXL8aetLQRFBhg==
X-Google-Smtp-Source: ABdhPJwdtb841LotQA3Wm4lfH4/r66L0PTxB39NSAGk9BR55VYlyhqtRy82dZm/hRww+0wrptIoJsQ==
X-Received: by 2002:a17:902:8c89:b029:dc:1e79:e74b with SMTP id t9-20020a1709028c89b02900dc1e79e74bmr8083254plo.58.1610641324558;
        Thu, 14 Jan 2021 08:22:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q16sm5769339pfg.139.2021.01.14.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:22:03 -0800 (PST)
Message-ID: <60006fab.1c69fb81.637a1.e506@mx.google.com>
Date:   Thu, 14 Jan 2021 08:22:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-01-14-v5.11-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 18 runs,
 1 regressions (renesas-devel-2021-01-14-v5.11-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 18 runs, 1 regressions (renesas-devel-2021-01-=
14-v5.11-rc3)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-14-v5.11-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-14-v5.11-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b41ea2d5be5e4c959415456cd276cc8dc7fdfa95 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/60005bae00cdda4e2dc94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-14-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60005bae00cdda4e2=
dc94cbe
        failing since 44 days (last pass: renesas-devel-2020-11-27-v5.10-rc=
5, first fail: renesas-devel-2020-11-30-v5.10-rc6) =

 =20
