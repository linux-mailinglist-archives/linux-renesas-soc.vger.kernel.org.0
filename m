Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49592413F26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 03:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhIVCBM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 22:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhIVCBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 22:01:12 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64259C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:43 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id w8so1012843pgf.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BohDwKtigRXm4qNCMQoiHkdbjD1UEwjg5/UXs4WU3+Y=;
        b=8LR2lIT0euxNQqE/wc7yOWhgpo5bcA5R3JiAfxeU//WfVzz4EgtAyDknNRPKX5EG9c
         sKrbYTJ0dEuIhlo6yQEnVpETL8JhCp8ajWvyNVGBDNUoRuok/JQ7LuJuk3ASzJNkybBe
         I3aeus6mTuwFh5qqhHbYoimNndMildTC30gv4Vqrii7MJLwG8ev5RMdZHpeHmdi0FEF9
         Kqq1lMzcLNYhHw3RhLmno4rAtpePutXFf7+h5ZrskMIwk3wtQ3jO3fDQWLAswTOfCSug
         8PmW0SegzdhUAdygqORd9ait682rIGQmkej747AIF+4aAwKIhAZ/6SIc5/VoIIbfjI1B
         FsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BohDwKtigRXm4qNCMQoiHkdbjD1UEwjg5/UXs4WU3+Y=;
        b=hQEA8vzisdnNeo1/hX8Ar5Zww/4+ODGLypC+Id0aS7WmctN2o/5hhL9vFaV9ZQnJOx
         7Ik2koZrJiZISMINX1GcEtBA9vjcis//GMnX3VeK1DAkJf7UvOCt0VlwJ330iegLDnT8
         krdn+EgA5oMBb26EqyXNKDF+0Or23cHcHA4BM/W+MmeKkYUPLIdDighq8J4O2Tm4smer
         eB8nD5XW5K7MmTSKpyYetjGo6J+8Adw3Vc2UNscTQRDvrzmUoQ0hw7pDhcdMnjnNoh3l
         vcgEgG7a0abf+C6z9HcPLZ4Cqm6tA+6fxkiBH8Oz3Z5fqXx+5pl5NW6IT0aN6DbqqcS+
         JTVw==
X-Gm-Message-State: AOAM533LXnQ7ex/TZDHWbXG9kjizNNqWGFsJuSeomruiR+xMfWg/pIXX
        hsw9+iT28Q2oBuea3zyJHGNLERIQZX5zYz0C
X-Google-Smtp-Source: ABdhPJynKcmrOIu3mk9obpBNuACUa9cW5zzi2eTb637F7qvOqBHIhjJD5bybC8N/oWVhFV2jvIQGAA==
X-Received: by 2002:aa7:96c6:0:b0:43f:6ead:5eda with SMTP id h6-20020aa796c6000000b0043f6ead5edamr33215723pfq.40.1632275982792;
        Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6sm427328pgq.0.2021.09.21.18.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Message-ID: <614a8e0e.1c69fb81.eb5ad.29e9@mx.google.com>
Date:   Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-20-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-next-2021-09-20-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-ne=
xt-2021-09-20-v5.15-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-20-v5.15-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-20-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      41c50f42a51cc8630c6a28e9b26f92d920e91780

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  05a468e033af0e4c775aaa10fe4d02c45de698ae =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/614a75d4cac778522599a317

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt=
8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt=
8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210913.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
614a75d4cac778522599a319
        failing since 8 days (last pass: renesas-next-2021-08-12-v5.14-rc1,=
 first fail: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-09-22T00:15:59.553223  / # =

    2021-09-22T00:15:59.556134  =

    2021-09-22T00:15:59.658775  / ##
    2021-09-22T00:15:59.661405   #
    2021-09-22T00:15:59.764296  / # export SHELL=3D/bin/sh
    2021-09-22T00:15:59.766314  export SHELL=3D/bin/sh
    2021-09-22T00:15:59.867999  / # . /lava-4555937/environment
    2021-09-22T00:15:59.870138  . /lava-4555937/environment
    2021-09-22T00:15:59.972452  / # /lava-4555937/bin/lava-test-runner /lav=
a-4555937/0
    2021-09-22T00:15:59.975888  /lava-4555937/bin/lava-test-runner /lava-45=
55937/0 =

    ... (7 line(s) more)  =

 =20
