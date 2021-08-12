Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716A73EA9E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 20:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237218AbhHLSBb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 14:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhHLSBa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 14:01:30 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0A9C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:01:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c17so2994855plz.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sglfRC3z3gfgJcwg05Pr8uIIIZ1vGR88WZ3a/CEw+2E=;
        b=tj1I6dYqryPlvy1AgEBefn3pDJ3P6z1tHuy01BzBT2cc3NpCZzBWqoYmQrx5kGkakP
         uuM0E1Aj1O4HIsrooSu+4hTPImnYl3lOQTdMdQNXVEenHPBFWdXGVLnNBgm7a+oG+AiD
         cZFF0H6rXH47qosGvcK3KrnLCp8LxmDu5Xv0CUwKHvfP1g+zMdoMLxTWgl7k8p8Ge5Na
         Elnem/25tHRDRdVXsQNOttoOH7baJwPWuT27INzZQU59lQDpQVfHrXzmq1BJyhkl6RLG
         32ow0+yVOgRlAqVZjNEVdFwMLltrxt1uiwUpDGIg20nyAQ790Q1h8RVh98kd+urDM0Ux
         /qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sglfRC3z3gfgJcwg05Pr8uIIIZ1vGR88WZ3a/CEw+2E=;
        b=Jtt5GpbUiES3FyyNwiQnQ7Ps3q4NZKHLRSJclVlMZENQq6HV2udb/soBESsD8M8cJj
         1azYhesAxlKEhzK/EwrSvAQBPYtG2uZEe83vhab3v7T4+voX1g7Mxga7+vq94vVIVH4b
         DTUK7UzAtv66WT3TSZfPYH/8e0Apfhys52wVA1IPkUy7wkQj80uxmA1AkUmRwW63ncSg
         omMCUb7Qp/GgERareht0pYY5GN2EM1CYZbxLVUI2n6wklrn10f3ioiqPzyrbWWOs8/hL
         VqTTlVYZd3dXqZDjw8jektqtCZvLqI+aS1le7KyIFgglyfieYwRG0VRrS9hbEqZfz5Hx
         nWxQ==
X-Gm-Message-State: AOAM531SaVFtJgOhoTu3b4P4k/rYrCbVb3FrQK3gDozlUOwrVh8Pm7Bg
        hadDy7NzH0e6pUOfu1SNrP0QauFMkklq+8aq
X-Google-Smtp-Source: ABdhPJy47iz1D7ncuIL5F2DFv2PmoMYBDtQaPZTiNmJzZolAHVFAHN2rkKGz6FbqyK6d71pr0KjV2w==
X-Received: by 2002:a63:5b24:: with SMTP id p36mr4846655pgb.91.1628791264923;
        Thu, 12 Aug 2021 11:01:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16sm4210545pgu.21.2021.08.12.11.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 11:01:04 -0700 (PDT)
Message-ID: <611561e0.1c69fb81.f1d88.bc5f@mx.google.com>
Date:   Thu, 12 Aug 2021 11:01:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-12-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 3 regressions (renesas-devel-2021-08-12-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 3 regressions (renesas-=
devel-2021-08-12-v5.14-rc5)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-12-v5.14-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-12-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33d79a656f9e005b45af2cdaffe67f9463fc5231

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c86aab9cc7f1f001502c70a5e342f7816de3a3d6 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/61154ba184ac08395ab13684

  Results:     45 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-12-v5.14-rc5/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210730.4/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/61154ba184ac08395ab1369c
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:25:51.615013  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-12T16:25:54.742048  <3>[   22.466735] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-08-12T16:25:54.761653  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-12T16:25:54.761879  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/61154ba184ac08395ab1369d
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:25:51.561002  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-12T16:25:51.580223  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-12T16:25:51.583117  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/61154ba184ac08395ab1369e
        failing since 29 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-12T16:25:51.505447  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-12T16:25:51.525350  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-12T16:25:51.528516  	test VIDIOC_G_FMT: FAIL   =

 =20
