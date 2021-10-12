Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581A642A3E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbhJLMJi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbhJLMJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:33 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563B8C061762
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:31 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so1702084pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ne+BiRGK9c8zvYasbo57BcNsN4XN2CZ23M1Ag45J0VU=;
        b=ERra/DKUifyn1eoSF2kJ++iUwcczsmDFDqmua9CltU7MD/4T94tEJaeeH+GwjtOdjh
         HO4Hy+3CnDXZW7nNHqXqsV/7D8iMBMIWOWZf59mf4rkvFkWw50BP8CMxV13Fq+HzWH4Z
         Gw5IXa1CXaazTUSyJyqBaQ5yWmBFNmx/dQXjNPyZRsrvWBE0xUQNQvj6Ch1z6ZIvsU6t
         1f60x6r0xryGoFQ03B0bik+hvBaZk7eeFCL7v5y+X0/XLsyDGj6s34prBYvSe5lZ2+45
         WHPh8YFLrgnjpuSU+8ihx1vJkXo0X6Lau7EdVDS9FeE7Ub7ABQ+cWMuA/ce54IVa3ae+
         OIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ne+BiRGK9c8zvYasbo57BcNsN4XN2CZ23M1Ag45J0VU=;
        b=GSDmZiX0czwRwCCrvhzei8glOnCk2zjAR36Rd0jgpiwE7LeMjDa9B/B8LD48qcia5x
         MBHcoJbMiE8oBQ2gFpVJ98eRTWp/S5eekviyBBrggZw5YD7h3INqzceEAXb2PW/+PR0Y
         SzjgjbsJ4NQrlctlDAoyvQLL+3VleF9gcVrTlzN1jipMLWrvZEGM5V/JTDnu+iLldhUl
         yLQk8UipIj1cYqE1uAY9zR7Qzv7H76CUGbfJvkKAUZ5fMipHjTpIlqg+biTmSQ8GsFeN
         FZyLCj+NPkGTKdKzt+KA/bFWvjocX7h56UVDewwnE6e9XUZQfGUwprcaGsxw5NPBqDTY
         gBpg==
X-Gm-Message-State: AOAM533QRs3mSCUQZIWuYa+nEpcrEC9Pe9o/0TuCI4PrReRElXGq2M+9
        Hc39kD9MwxkYiya8BDTlPXCO4hwGnHDS989S
X-Google-Smtp-Source: ABdhPJySo/Xoq8xvvkkNQaPxmTC2dKL90YHp5PlgBqQbgBrULd5dOtmJlay0FWz0e/hVsL7opAR39g==
X-Received: by 2002:a17:90a:9291:: with SMTP id n17mr5551683pjo.243.1634040450750;
        Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c24sm12415004pgj.63.2021.10.12.05.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Message-ID: <61657a82.1c69fb81.ccdf7.2448@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-ne=
xt-2021-10-11-v5.15-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  fb4f059c875c9f9859cc5bce36c8170fc24f375d =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/61656576f1109f752a08faab

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt=
8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt=
8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20211008.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
61656576f1109f752a08faad
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-10-12T10:37:36.952610  / # =

    2021-10-12T10:37:36.956360  =

    2021-10-12T10:37:37.064716  / # #
    2021-10-12T10:37:37.068714  #
    2021-10-12T10:37:37.172062  / # export SHELL=3D/bin/sh
    2021-10-12T10:37:37.175769  export SHELL=3D/bin/sh
    2021-10-12T10:37:37.278698  / # . /lava-4701120/environment
    2021-10-12T10:37:37.283022  . /lava-4701120/environment
    2021-10-12T10:37:37.385826  / # /lava-4701120/bin/lava-test-runner /lav=
a-4701120/0
    2021-10-12T10:37:37.389162  /lava-4701120/bin/lava-test-runner /lava-47=
01120/0 =

    ... (7 line(s) more)  =

 =20
