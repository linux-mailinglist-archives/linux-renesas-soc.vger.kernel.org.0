Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D11E3E508F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 03:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbhHJBNj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 21:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbhHJBNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 21:13:38 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC94DC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 18:13:17 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id k2so18667214plk.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 18:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qaMkAELb3yxL284POphO6oYN8dlBZ1b/KjfFliKgvDk=;
        b=A4B5xYzT33ZhlUplocSJN2gyK0jxuh1ISeZWL3W/ZNv7E1/XvQ3Ka2ioWzs3CCShRN
         n9IIihtmJAj+SYmbiWNvEOjH+YbNyznvB0+7LLUmapP+SKTyICGybYvMhWaPj63yoXBg
         vvayBmksZYzE/GWkWCCHcYioc6gdUl5PcHSQYrQDO/R+RYHMBYXa1rqfUhiUgE22axQM
         P7sh2Nk9Z4pacE85FV1mA546HpVHAv0AOChLiRuMSDOjYuhufTslO4NE6L93zhIHPpjH
         G4N0oVAK+x/T7WTiY149ckT+xqXTpHaMPtlTwK055T5XI2zqGWP3XvAa2yS/3MDrAJok
         rN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qaMkAELb3yxL284POphO6oYN8dlBZ1b/KjfFliKgvDk=;
        b=Y/wq7exg6uOtgiJ5HlhIxEY0bHRVJS6wMGrWXOK3dUQDnPNqmNPqIkx8ctTFo3JLsN
         RLxCnyrftRGhngykKxWXtQI/HF3NHgUp9Y1kd4Sy/GslrohbBff2YjyusRZv92Q5NxXb
         VrI5FSAl6TtKo2DsvaCGW9t8IrOklMlViy/xtIqbGs8TppceQHhTBcKHDElW6NXN+GNJ
         WK0tte+Ke2hY9AOBqGopLvwxG4QZeE0F4tkfwj6z/YXqZX3FbktSibrWRhyUXI5ZRWcM
         yPhiw9ldf6wOcS6uJFyCqndyT3HCaSR/Xn1EEqbQLt0GgcTFugyv6HaiUS0Rau2T7uGL
         4ctA==
X-Gm-Message-State: AOAM530yVwf8tAs+Jk8uBycqXRtkTGMSvfvkfg5BFkN1SwN5OAjXOFSE
        STHGMUGi2vobqQVsyyWRnnSEWA2b8iW8JyjC
X-Google-Smtp-Source: ABdhPJyhZLrZ+gk2vzMgaJc6GEj5JkDs0t2b+aZPlnQLslefOyPLvWFaaCx2xSZLz1UBaomL6epjzQ==
X-Received: by 2002:a17:902:c950:b029:12d:2ada:9ef7 with SMTP id i16-20020a170902c950b029012d2ada9ef7mr4098582pla.61.1628557997070;
        Mon, 09 Aug 2021 18:13:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h24sm21962890pfn.180.2021.08.09.18.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 18:13:16 -0700 (PDT)
Message-ID: <6111d2ac.1c69fb81.8431d.08bf@mx.google.com>
Date:   Mon, 09 Aug 2021 18:13:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: v5.14-rc5-549-g3b20129c119f
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 3 regressions (v5.14-rc5-549-g3b20129c119f)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 3 regressions (v5.14-rc=
5-549-g3b20129c119f)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
4-rc5-549-g3b20129c119f/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: v5.14-rc5-549-g3b20129c119f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b20129c119f50f3534a0e1a5c353bb502ffe2c6

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c86aab9cc7f1f001502c70a5e342f7816de3a3d6 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/6111bfbcc3ff4007cfb13661

  Results:     45 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210730.4/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/6111bfbcc3ff4007cfb13679
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-09T23:52:06.007602  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-09T23:52:09.178363  <3>[   22.554815] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-08-09T23:52:09.194482  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-09T23:52:09.196930  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/6111bfbcc3ff4007cfb1367a
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-09T23:52:05.953269  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-09T23:52:05.972661  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-09T23:52:05.975380  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/6111bfbcc3ff4007cfb1367b
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-09T23:52:05.899000  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-09T23:52:05.917699  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-09T23:52:05.920601  	test VIDIOC_G_FMT: FAIL   =

 =20
