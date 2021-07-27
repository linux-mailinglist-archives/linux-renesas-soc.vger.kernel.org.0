Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25E23D6B8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhG0Avd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbhG0Avc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:51:32 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31344C061764
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:32:00 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c11so13829571plg.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7oUgk5HXlTElcD9uk/ry/YujipCFO7vaGzsv9T9nziY=;
        b=T6Eu+YI31+oLagp/WI3VayutMHUBf0m2VrC48JbgMzSjZPcy3uTg+wVTSB6G9CqIW5
         U3WsK4lB3blpvPIxjp9Rpyq+DjeEEaN9S0BJED4yxn0D5Zt6jmV+zpypNsm0yQY1tP0k
         b6iGUIhGmKk0APOiKqYfUVv+sJk5HUsTyUHpz3jqhw1wVDxON54g6Ol4cppzWNIl2tCc
         jhvYGQdYBprLzDH02Wj8m22LZEQ7aURv2tHOLOdBBPXKmCwyQpMxs1uQTgOaLP2IcZdo
         8cJSls8v7Zx4Lm/4VmY+EjfCh5e4nSumVof1Iwg9tZhnlKSG/NT0fUlYQRaJNgScfwch
         Srtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7oUgk5HXlTElcD9uk/ry/YujipCFO7vaGzsv9T9nziY=;
        b=Ob29GwbQIN+/l0wujRkGamfvnOatvF4fuH03I4JaobuLL7KUD39wKfsByhn6DNJua+
         9aUWPokw4d+OGyT2y2psCpwVAPx8Vu2kjjzY5hubWWzbD5vDoim0N7OKAkdHdv+v/43O
         TG0FA32TKiMkFJ5gn2gAyLJgqQAHvPq7vT7DgBL3viIDfsoSO4B24gJ/7cdg/DOWCVhG
         o1yKE28gYZZQ2NPcnN1WSzxvQWUbqrpkQOz55Zb9+3s3oihFPE5idBpwGrofroDeWp3K
         8zqWTr9rbMBWUQ1VfNSfF01Kz2ePAmzicRXWjs5rd8jCJffgFbBiHB1V4oOaOIr8NmUm
         kHmA==
X-Gm-Message-State: AOAM532bJH7BlNlpzF/16yxk2MRoZiOw5sGZhcCMY+lPrevB8hPcW9fz
        7dBcfe4CX3lQvkb9af49BIEEXNV/6rFMnmWz
X-Google-Smtp-Source: ABdhPJxhTxF5TvhWqJ9rFlgiHQheVDUQxFwUbJ3JkBNR+TLe6NNghMC1wnC6fkXeWmVTxlRMj7xMkQ==
X-Received: by 2002:a17:902:6905:b029:12b:8f6a:7c60 with SMTP id j5-20020a1709026905b029012b8f6a7c60mr16473129plk.24.1627349519588;
        Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a22sm1304541pfa.215.2021.07.26.18.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Message-ID: <60ff620f.1c69fb81.9c410.5c26@mx.google.com>
Date:   Mon, 26 Jul 2021 18:31:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-26-v5.14-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 3 regressions (renesas-devel-2021-07-26-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 3 regressions (renesas-=
devel-2021-07-26-v5.14-rc3)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-26-v5.14-rc3/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-26-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      42d1095acf6e228a6baeec100d31a57c0c4d7704

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  a4f2e3a6f306f0bef6664451b44d5a7a18b26803 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/60ff486591b130cfcd3a2f31

  Results:     45 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-26-v5.14-rc3/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210722.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/60ff486591b130cfcd3a2f49
        failing since 13 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-26T23:42:03.974922  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-26T23:42:07.347253  <3>[   23.006776] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-07-26T23:42:07.367023  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-26T23:42:07.370356  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/60ff486591b130cfcd3a2f4a
        failing since 13 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-26T23:42:03.919982  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-26T23:42:03.939408  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-26T23:42:03.943324  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/60ff486591b130cfcd3a2f4b
        failing since 13 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-26T23:42:03.867105  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-07-26T23:42:03.885104  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-07-26T23:42:03.888321  	test VIDIOC_G_FMT: FAIL   =

 =20
