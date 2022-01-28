Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAE549FEBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 18:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350490AbiA1ROY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 12:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239932AbiA1ROV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 12:14:21 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F81C061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:14:21 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u11so6541300plh.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dR2nTDnafoRz2Aee/jZq+T033eoyCleqXTwf7Tv+UVg=;
        b=Q5VB4XY8jeqrIJP9qdhFaNsFd6DodIAOMaxTmQjiOVTmvWInS+LKGL036sHhzTGQMv
         qK1c16slpXmcsbPNDgRWbLzCLkFeeO4ajPo5M+g1KzRYRF8DdePEn900/OroNpt980KA
         V01b/3V772lZ4ofUxErnOfON5mWwbV6IqQZMVLKmyA4k5w81+XHxxXEjHQdeo4b7S1Rw
         qqBtBt0oRB8hwb1EcLiy8A13gzWfGITLpcccdRdd7USs+HLDWUyV/UApSCKH6WLno/cb
         nf8abHOQOvgVTWSbPj+loNvvNhqdNzAhaGieFdNOsQkXp7Ijg/eBkbtLsUC99SuI2gcw
         yq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dR2nTDnafoRz2Aee/jZq+T033eoyCleqXTwf7Tv+UVg=;
        b=qP3+2dYwAYYslF/PxicZWYPFhwl7RAesGrDLsU1SYZGkzJ4U0aFJVC03ooWhvQMnrK
         i9rrQ/8idr/0UEONvN1DJ4eaDHTe/9g4eAsucJFqtwkp9vzl62ZizR3oUNQ+c/i9KdvK
         2YHoMQT2dTI0jJO8OQpDo/tb1fG8K/V76iL/69V/nJRPrlVKVG5a105CtunF1tNFL3T5
         dLNfQgu9s18EeplKzBCQ55pDeklbNSkU8dRI3XCvINMG9vjSWxShAn23OjfCf+bxtkaw
         Ce163XElNFgbRa+d1g03wom0to5PuoQrbyVjyQTZc3nmkVvmwZP3tYtUOVRT0xZ+1gY+
         bLXw==
X-Gm-Message-State: AOAM532XuwcX4tU3F1xYORlhEkNcSoreSzY/aIvBLQYjrRYpryhgL41H
        xkgGv0NY3XaYf1PZe18GMx8S1YcZQBY5ttEA
X-Google-Smtp-Source: ABdhPJyp46x/76epyvOmLS1TqJh3yCwe9c/EkW87driEOEA5A2CirXGp2bVSaIsZOeFWod9GnoLcow==
X-Received: by 2002:a17:902:da86:: with SMTP id j6mr9116688plx.100.1643390059188;
        Fri, 28 Jan 2022 09:14:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oj7sm3196077pjb.43.2022.01.28.09.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 09:14:18 -0800 (PST)
Message-ID: <61f4246a.1c69fb81.3691e.824f@mx.google.com>
Date:   Fri, 28 Jan 2022 09:14:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 48 runs,
 2 regressions (renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 48 runs, 2 regressions (renesas-devel-2022-01-=
25-v5.17-rc1-11-gba94d205dc711)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
    | regressions
-----------------------------+-------+--------------+----------+-----------=
----+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ba94d205dc71120401744a925da52c4098644e40 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
    | regressions
-----------------------------+-------+--------------+----------+-----------=
----+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3ea803483ca6c2dabbd3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+ima/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+ima/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61f3ea803483ca6c2=
dabbd3e
        new failure (last pass: v5.17-rc1-611-g4ccda2778be0) =

 =



platform                     | arch  | lab          | compiler | defconfig =
    | regressions
-----------------------------+-------+--------------+----------+-----------=
----+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3eb9106d38877f6abbd5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+ima/gcc-10/lab-baylib=
re/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+ima/gcc-10/lab-baylib=
re/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61f3eb9106d38877f=
6abbd60
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1) =

 =20
