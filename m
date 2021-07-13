Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430243C79EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhGMXFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236668AbhGMXFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:05:19 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0E5C0613F0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:27 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id j9so145778pfc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=y8ziXODuf+PP+hfUVlObnMBrrkTZDrIJ/dvqgTQsoR4=;
        b=exHqWXLJi2YY5kWuXxGuxQ7EVoqgsjSk1bBWBONXo8vjNhWpBxvgEsm6wUaRHuYmJV
         PV81/SOXZhCMq9wYNeyBKUl3mnQ+fRls23PzJ+o5K0DNBkvZSlHi1KXKniN+WL9avhuN
         ZFzrHJjurIa328+X7Yvb0wskuU3wxsuCSYO31tNd5YDfIDml7tJM9mtQeFRoW6PetEJN
         tHCjNq7AgVZ+898ofUGdIGrW0ogfykX1xoWLLVDouiUJFsW0FUpoE7TVqZ8ggRTZqnIB
         XaeMPe9DNGnPflj7IM57UFPIafjlueG1wr7+F6diPNT+dWzBuarZ0dsvDEgZgMbDxApv
         vcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=y8ziXODuf+PP+hfUVlObnMBrrkTZDrIJ/dvqgTQsoR4=;
        b=YIe/0P4bflmWmtN+eXQvaqF/Lzkb1eozeGF+l+oNZt7UiUDo8PfdrkuDuCDUczI50b
         lq8fWE+Ca/sJ+U8PYuYThQ8nD/Jo5NyHpCgCc/oITKZT6LeAUSI2y0ebmw8uliM+NSqe
         xIT6vqHLgCsqL1gB8tMsVknsg+5IpXSjK88t4u76500XaXWlSBEBohCchMh87/BMwpCo
         G7BMn0JkmRTMsU9s3h3O+lmRICRNxEb+/4sHTjWOZfufeso5p1Q9XcdNZbHp6rYnHs7f
         yC0FMP9Eloca6/XYIuC0zaSq0NY8UMTFStrvyUb0IfmRZBKjc3bP8jB4EtxXdIzYJJBk
         4Crw==
X-Gm-Message-State: AOAM5301Iz/LBxTjUcdva9l1+jLd7dtPRT1amEhWEi4NssPD7+KrowA5
        dkxyMfD83E7WsSoiWeZj875+LrqxnLPenjao
X-Google-Smtp-Source: ABdhPJzVR7HUJ/n6itoYHne/IQY4fLdbzIAzLjlOfwUsTiaO708GeWrwHBtLOfMPWL6PA53VfzmuzQ==
X-Received: by 2002:a63:5a08:: with SMTP id o8mr6372061pgb.120.1626217347018;
        Tue, 13 Jul 2021 16:02:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t22sm4030336pjo.3.2021.07.13.16.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Message-ID: <60ee1b82.1c69fb81.ec50f.e97a@mx.google.com>
Date:   Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 3 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 3 regressions (renesas-=
devel-2021-07-13-v5.14-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  6ffc5248dede6285d76c5ec5680c316f68ff98ca =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/60ee085c9bca3cc1d48a93c2

  Results:     45 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210709.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/60ee085c9bca3cc1d48a93da
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T21:40:31.407570  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-13T21:40:34.597406  <3>[   22.590809] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-07-13T21:40:34.616640  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-13T21:40:34.620689  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/60ee085c9bca3cc1d48a93db
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T21:40:31.353683  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-13T21:40:31.371495  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-13T21:40:31.374838  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/60ee085c9bca3cc1d48a93dc
        new failure (last pass: renesas-devel-2021-06-22-v5.13-rc7)

    2021-07-13T21:40:31.298719  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-13T21:40:31.317369  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-13T21:40:31.321175  	test VIDIOC_G_FMT: FAIL   =

 =20
