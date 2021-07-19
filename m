Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267C33CF090
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 02:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244911AbhGSX3P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 19:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442038AbhGSWdh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 18:33:37 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA492C05BD0F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 15:32:50 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id gx2so1489688pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 15:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dPJscrAYNJZM3bRf+YBDTD82uaoZ1bUS5BCY4eu1/mA=;
        b=SapEM+Yi7MjnWq68IGeV8FN5j0Mt4Wv0g9bu8rL+yLow6TCkytga+UwenkUc+uuxud
         4iFQVoN19NwxX7USQAlZhY0RW95xopDr+iDYIbLicmIDy9UX+wm8OvJVb493woDbKEbN
         F7ND0Ec/iBR0s2FgikevxLC+WHREGyvtsEPtzHtOoC1Ewv5QZamGO7mme1Eh7PRseb5h
         aC0Whyiwcg14G76JUQ6LrulmO68RbXGNA/BaODI+f0sXyVMBdN2SGMSOjGNUsWVaLP/e
         e3PhDYqrwiNqyq1j1EzfFKcrHmPE+CrWKisEzVUg6T7L64WYbXdDw4pUKJ/F+GClW18E
         Lbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dPJscrAYNJZM3bRf+YBDTD82uaoZ1bUS5BCY4eu1/mA=;
        b=YMxbM1wLgyUkTKSrn+/8eV9DcDaQz+dKRnxETqMUkwmgJk/kAicDTEFX6HcPnaeLqX
         JUU37omjQHpxv5qRT0kpGBT+jxZjbL9d9zN6T7YvMD9AN2Mnj2ykIEshegHoRV0/synM
         dIL5RAkZynfx5w6fFWpZlXQu/116pu1PMYnyUtpX3pAHU7puXVW+ia5oR5e+/33RUYZX
         /GLnpSE/OoOFR5AIxylajpNPJ89vCnxFG/oAYsfcB//DBaABzZ8pK0NKcNI7Z2BGziOs
         8/I+SFeqPCJ0YZaSsIqGdL58BCT5h3bRV3HL5zw0eoo3wCKGMqvuv7NHsC3wOfrlReuQ
         A+xw==
X-Gm-Message-State: AOAM530lNX0T6KhE9Nn5xdQOEgj7mEOyeJOeVlxeeSbpopX8ROTw1lt8
        gnTynHHqHtBCGOcV/yCKJn02GtUL70Zidsyc
X-Google-Smtp-Source: ABdhPJxxVhLAALBU8yMXHO90nTmwZz+1aT90KRqX5vdKMithI9qbGd5ZYcApJvU9W4LxDGUB0qizCw==
X-Received: by 2002:a17:902:a9c1:b029:12b:8ae3:e077 with SMTP id b1-20020a170902a9c1b029012b8ae3e077mr6437709plr.75.1626733970381;
        Mon, 19 Jul 2021 15:32:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l6sm21291893pff.74.2021.07.19.15.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 15:32:50 -0700 (PDT)
Message-ID: <60f5fd92.1c69fb81.22357.f096@mx.google.com>
Date:   Mon, 19 Jul 2021 15:32:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-07-19-v5.14-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 3 regressions (renesas-devel-2021-07-19-v5.14-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 3 regressions (renesas-=
devel-2021-07-19-v5.14-rc2)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-19-v5.14-rc2/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-19-v5.14-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2f3bebb9dc31fbb1e815f63cf3f61763f7d1d8f9

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  6ffc5248dede6285d76c5ec5680c316f68ff98ca =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/60f5e3e423d4d000c3116112

  Results:     45 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210709.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/60f5e3e423d4d000c311612a
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-19T20:42:58.471724  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-19T20:43:02.094024  <3>[   23.614793] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-07-19T20:43:02.109938  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-19T20:43:02.113200  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/60f5e3e423d4d000c311612b
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-19T20:42:58.416960  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-19T20:42:58.435406  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-19T20:42:58.439023  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/60f5e3e423d4d000c311612c
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-19T20:42:58.363754  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-19T20:42:58.381816  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-19T20:42:58.384080  	test VIDIOC_G_FMT: FAIL   =

 =20
