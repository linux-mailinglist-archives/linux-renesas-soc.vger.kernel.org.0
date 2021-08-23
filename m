Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DCE3F5162
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 21:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhHWTlF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 15:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhHWTlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 15:41:04 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5FAC061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 12:40:22 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id q68so513004pga.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 12:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SceGACEgEPQqaB5m3x859k4flEMpehFnCxF3kwspzTQ=;
        b=kB83K0a6g5q88nq0OJ+xngjTQTGnNzvEbhK7zvzh6uPQJOKDZsGzk9jA+Nwcj9T3LA
         Pq6JfJ9+HvXPRbiZH/TyheNxBsMYqa5rjfKjfhuFGG7p7m9MZWUZoat+G0auNeGnnW4B
         oZXUa75MnbZ6wA6YVwH2ol3EOBh4ZZ+UYpkN8QpdNNmksa4aVRsHRi8tMNZKBuzAF/4l
         KMUcOPgA2AyiZ44bcP6b9thvvY1cK0CANg5z6q5W9gijWNOqiJ7p02KsnLsuYToGPP/J
         aURaDE3ja61zOjY52ZnERj8gQ8m8b/J3ENnMMJo13qCG2FPUNuwQfVQXz4UyILbSnsJI
         uz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SceGACEgEPQqaB5m3x859k4flEMpehFnCxF3kwspzTQ=;
        b=X8t9KgAzm/sh+HbEGOguyi283vFc9q0Gr3Cy2ZbQ4cOw/bv276UOzB49itKdcKhUKV
         SoyU5jRUN8hSrpqX0EYQ+1ohcSx1aTtUrUrTnH5dQPSsy974uaDDsKPYJm/8uavc39I9
         rXnm3oeKovGfpih/zXjYjxo/Ev7m/1hS3+hl3XD+YzLhN1K/x6X24zbUYOMZuuLAWiXB
         JIILoArLRuWwgsO64LEMdGclQB9W5/G12Z83Mq9Jw6BRqYo5mRieKINNh4xcOzo16ucZ
         J9TEkKBQJtsPVSfsgYxyeNbPAmMGdvIQYjKMGl9fhONNwWJf3PB0vHO1A1GW7y39xhHh
         kaZQ==
X-Gm-Message-State: AOAM532mYB3iV1Df1arMhx/kR0a4nJ/qksqLwFv3oOGzTZT7Z9ECw0JF
        sLhUxTplQdOkVlJw0XR4NahLCofqYdlCmkpS
X-Google-Smtp-Source: ABdhPJwx1VtVvG3mNia435RCYd73WjR8dE93cRlMkq9QK1MbckvFICF80xpR0ae8kSxM2JxbyM9oNQ==
X-Received: by 2002:a65:4147:: with SMTP id x7mr32828303pgp.23.1629747621524;
        Mon, 23 Aug 2021 12:40:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l10sm52475pjy.47.2021.08.23.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 12:40:21 -0700 (PDT)
Message-ID: <6123f9a5.1c69fb81.bf335.040e@mx.google.com>
Date:   Mon, 23 Aug 2021 12:40:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-08-23-v5.14-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 3 regressions (renesas-devel-2021-08-23-v5.14-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 3 regressions (renesas-=
devel-2021-08-23-v5.14-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-23-v5.14-rc7/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-23-v5.14-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a8378ef28a200358f247cc997a8c3db868b1e917

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c86aab9cc7f1f001502c70a5e342f7816de3a3d6 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/6123e5a681df163f668e2c8f

  Results:     45 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210730.4/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_S_FMT: https://kernelc=
i.org/test/case/id/6123e5a681df163f668e2ca7
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:14:47.357339  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-23T18:14:50.448359  <3>[   22.821410] usb 1-1: Failed to query =
(SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
    2021-08-23T18:14:50.464681  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-23T18:14:50.467043  	test VIDIOC_S_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_TRY_FMT: https://kerne=
lci.org/test/case/id/6123e5a681df163f668e2ca8
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:14:47.302555  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-23T18:14:47.322237  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-23T18:14:47.325045  	test VIDIOC_TRY_FMT: FAIL   =


  * v4l2-compliance-uvc.Format-ioctls-Input-0.VIDIOC_G_FMT: https://kernelc=
i.org/test/case/id/6123e5a681df163f668e2ca9
        failing since 40 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-23T18:14:47.249668  		fail: v4l2-test-formats.cpp(358): !colors=
pace
    2021-08-23T18:14:47.267239  		fail: v4l2-test-formats.cpp(467): testCol=
orspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pi=
x.quantization)
    2021-08-23T18:14:47.270953  	test VIDIOC_G_FMT: FAIL   =

 =20
