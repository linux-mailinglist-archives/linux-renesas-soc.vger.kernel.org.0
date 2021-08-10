Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661523E8296
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 20:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbhHJSMa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 14:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235928AbhHJSML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:12:11 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96004C0617A1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:39:30 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id a20so22255773plm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SbqVFFocjyfLHoX8Q0V8Cya2XS0odFdRAeclqTJ3bA8=;
        b=Xr2JTvXC/U+PWemfDxKc2oWsIotGt+3WkZ7QAeTCojLwnF9AkNTfwYe8aGd8oh1vu/
         +YgVAHyABypDb3b8A71htEWqBEm8C8mpXt9HcwoUFvAvFsLYSSmvJVw4uSquaYIvAp6s
         LJS8vlXvbUq5VlDS9QDjqa0qg5rrkQO0+Jpia4a+fuEB4XM9GPEzqTqe6yKmg+xmAw75
         NAh5Tsdu/rdRgGWrSNQCs3PqxfdThBsR1iR0cECPt1KiiFjqwfHAHP9CeS7zv+PomeMM
         Bd6gAXcM1m1WSaBqsnUXZ7ncVLXwq3qq587Z3stifzycUbIDwN70mZruq4jgen12fC5t
         EbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SbqVFFocjyfLHoX8Q0V8Cya2XS0odFdRAeclqTJ3bA8=;
        b=tpWjQr73K9+ZzemAvNDqRcGCYNfCyuqNfrzyPfZTay6RKzIaz4x81guPdrrnsxTDDl
         9NpI/984mAbX5VmrCaU3zUOFViiAOtERvxxGuXr0kih0qFYAqmpk1BYsmj5POKcL7V5v
         3+n+tPAb2zaO2lSJ1k0fX9SEik4+USE7GstWynuCSqK/toWyh4ma+wLnN9o8Wdb7SkFG
         IklX8iIWj3dUvzf2oqapEddFGKT8pkpJTfXTT2gAhi3Gp1X1qXg0Zrfyf4Zagjz+eSEb
         WHpkQNsoGhJ9WdHpWEH8ZiKivGnRtLbyA8XEc1qMFxfHTNPDgGjH1TRKEkdF7BjOyXi1
         veSA==
X-Gm-Message-State: AOAM531ctCCCBk1aNMF6YzruVMnJLxW7fPzufHEYzmW3MyE1/I2xTGNZ
        X+tyfPpqSQ3BOPFB/hnF1nmqCRSr0KfxvUXr
X-Google-Smtp-Source: ABdhPJwkEOUdtm/01d/jlAno3nk0mR/8s82fDsdKJydSnfXbZzRNuJYZwn2kuDmID1qlkxi0XLkihg==
X-Received: by 2002:a17:90b:1886:: with SMTP id mn6mr6016359pjb.58.1628617170031;
        Tue, 10 Aug 2021 10:39:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y64sm28660984pgy.32.2021.08.10.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 10:39:29 -0700 (PDT)
Message-ID: <6112b9d1.1c69fb81.6b5d1.3168@mx.google.com>
Date:   Tue, 10 Aug 2021 10:39:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-10-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 4 regressions (renesas-devel-2021-08-10-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 4 regressions (renesas-=
devel-2021-08-10-v5.14-rc5)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-10-v5.14-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-10-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      998b2a51c195410ed92f4f3a5ad117c2b567819f

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c86aab9cc7f1f001502c70a5e342f7816de3a3d6 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 4          =


  Details:     https://kernelci.org/test/plan/id/6112a1d14a129f191bb13677

  Results:     44 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210730.4/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Streaming-ioctls_Test-input-0.blocking-wait: https:=
//kernelci.org/test/case/id/6112a1d14a129f191bb13680
        new failure (last pass: v5.14-rc5-549-g3b20129c119f)

    2021-08-10T15:56:42.583033  		fail: v4l2-test-buffers.cpp(2597): !threa=
d_streamoff.done
    2021-08-10T15:56:42.594103  		fail: v4l2-test-buffers.cpp(2625): testBl=
ockingDQBuf(node, q)
    2021-08-10T15:56:42.602667  	test blocking wait: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/6112a1d14a129f191bb1368f
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-10T15:56:38.811219  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-10T15:56:42.088086  <3>[   22.606646] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-08-10T15:56:42.107810  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-10T15:56:42.110505  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/6112a1d14a129f191bb13690
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-10T15:56:38.756560  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-10T15:56:38.775104  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-10T15:56:38.778989  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/6112a1d14a129f191bb13691
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-10T15:56:38.703591  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-10T15:56:38.720656  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-10T15:56:38.724167  	test VIDIOC_G_FMT: FAIL   =

 =20
