Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C1C409E0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 22:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243329AbhIMUS2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 16:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242637AbhIMUS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 16:18:27 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD606C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 13:17:11 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f129so10517140pgc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iJhGkvqoA4kPAj2gniXMasIFwkJopsbVMOP9GRfL6eM=;
        b=gZZoFFIRZ88+Z1CPVvqjexsG4jR2I8Z9wkZgmrfpMTiq3btFR9sDE7LFn7y9eAPms4
         BnDCf2A9nF3n4NvEN+qbf9Z5e2sHVU2FSrXNH23CF7v/ZQ1Rsrm5rpWIQbanxTDaF3Df
         gTAE+KBWyFme1ALmVtUx1U7w0hQOgzI/n0ldCqxzQNJZDI0Fwvd8W7+DxyCo4V5k1/15
         Y98ibof+oRZt9InUl9ODGzYUBK7aoCSiFisRLZCPlYLY2ySVFZ5DA9mzjqpNf5dea2vN
         3U2lZweEQ0B83Uyl3T+dxKxvMKo5LwgIrDJ+/MaXOcjh676qkmyLOLrMjoxOj4LtwDeW
         8TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iJhGkvqoA4kPAj2gniXMasIFwkJopsbVMOP9GRfL6eM=;
        b=CkzljEVlDMkDfuvIgLOXCfrcXXrChVeppS1lMNlUACrE5JubmipKEUsugreSY4TIlI
         lTYI5MdfKToNCCAV1XxI+VAx+AeHJGdIy4OvNsSNFhdBtaa5dDZvIUXHB2LfD4oL+dUu
         adQ6IsjWZfyzHdrb7bNzEVM52Hjg++6d0UIg6FCcusjQs1ZznPg1sPdmZD6SkYcCu74Y
         VL++9rRohnBDl+H0nxjW6vVJZGQi1RKorMlayT7KFMQ82qMOvR+195ese11nBafIP7FA
         xqhhG63h/iMvwIZk+TCmVDCXdnSfP9Lo8DNj7VsgI+bzGfudX8yFNTVryo6K+Wd6b14m
         Baqw==
X-Gm-Message-State: AOAM531MoMdfDN+NXQwkRXb99E9mVBuHukD/eb/UuyjyN3YK4+beP792
        S53di+FAFDba6TjZjFnDa3ttESFHygJEic2G
X-Google-Smtp-Source: ABdhPJwJ2eMs9qyU03xm5t6ovSaoethzppS8nOLP8adguXX6jdfq0wmDQ80S+JaTyorns9N76afUcg==
X-Received: by 2002:a63:f154:: with SMTP id o20mr12508859pgk.298.1631564231262;
        Mon, 13 Sep 2021 13:17:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s5sm9521906pgp.81.2021.09.13.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 13:17:11 -0700 (PDT)
Message-ID: <613fb1c7.1c69fb81.3adab.c3ad@mx.google.com>
Date:   Mon, 13 Sep 2021 13:17:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-564-ge23d26d2dc9a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 2 regressions (v5.15-rc1-564-ge23d26d2dc9a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 2 regressions (v5.15-rc=
1-564-ge23d26d2dc9a)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
5-rc1-564-ge23d26d2dc9a/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: v5.15-rc1-564-ge23d26d2dc9a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e23d26d2dc9ad4831b447fc9ef348b1621fac32d

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  22466798f9a9044fa20ae3bb367d9fc29d37e054 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/613f9fa4d948417a9a99a2eb

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210827.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
613f9fa4d948417a9a99a2ed
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7)

    2021-09-13T18:59:29.329973  / # =

    2021-09-13T18:59:29.332914  =

    2021-09-13T18:59:29.436201  / # #
    2021-09-13T18:59:29.438998  #
    2021-09-13T18:59:29.541134  / # export SHELL=3D/bin/sh
    2021-09-13T18:59:29.543997  export SHELL=3D/bin/sh
    2021-09-13T18:59:29.646388  / # . /lava-4513008/environment
    2021-09-13T18:59:29.649381  . /lava-4513008/environment
    2021-09-13T18:59:29.752037  / #/lava-4513008/bin/lava-test-runner /lava=
-4513008/0
    2021-09-13T18:59:29.755856   /lava-4513008/bin/lava-test-runner /lava-4=
513008/0 =

    ... (7 line(s) more)  =

 =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/613fa61ed5b3af4ce799a2da

  Results:     47 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210827.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Streaming-ioctls_Test-input-0.USERPTR-no-poll: http=
s://kernelci.org/test/case/id/613fa61fd5b3af4ce799a2e3
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =20
