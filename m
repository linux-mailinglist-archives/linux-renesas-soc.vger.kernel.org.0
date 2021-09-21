Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23CB413D6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 00:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbhIUWS3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 18:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbhIUWS3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 18:18:29 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C09C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 15:17:00 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id p12-20020a17090adf8c00b0019c959bc795so733015pjv.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 15:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+VYAI8Lvfyt4HYRN8FpNP5WjJn46frcD3LvHI5xwZAM=;
        b=LgNtZZI0VP2soPddSfWQ1ObJMgVXPJig9PFWt2bY44kaaNCy8pd6A9xT43bk4R4slf
         WWOPGEVaL5RJBP2NgEUlWP34IdJmCiP6bF1MWs8Tp4SisuYA1+CzRpE1o5UXgyUC1eT5
         MrTHwXxR7uwG9jKnAwasyaqBe4abmIsLaWVxDik7UKgXwoCATTNkKre7FYQxLQABRWKG
         AQ5kAen596VbCvVKx4/jXADGaIe7z5a8P/x5j4EJBThwkRB3MbYp2k17ePFM6Q3dbTKF
         Fmfx5tuHZr3wRdrjI0VxRV/VnZxJ3e0XAFsej8x5bA9MP1Qw9oTWtNEuQHmk4ELVtiRE
         op0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+VYAI8Lvfyt4HYRN8FpNP5WjJn46frcD3LvHI5xwZAM=;
        b=H5MPcVjDBLaUigdTwAdXcaScPtNcke2BbK6wknTkoXeTSiZ9et3Wu8LAOJaWNuetqy
         oH2n1pVGnJABunkJBtr19EASfGqEPH/02zI2JykMkaAU3iiFLlWtOkjJ66Nluoe9obHP
         0U0DHfT6o+tnE+IJDum/SEbri3IxKjv6aZ7jmoZl638W5a0jNbKBwah3xV+noW0LI4rR
         28QU+RhDeyIR1ISVazfw/1O3SmMZzUxvNULEzQcoHiwAXnxH6g7qKJ6xMVhu5aIS10Y9
         Pp8FThDf6n4Dzei4FQcp/Ll00QER+AdMPUI9r/b9I42Ex03AGQ9ibNWQBbK3khl0XBjW
         Gs1Q==
X-Gm-Message-State: AOAM532yXaRkdGfWvZXZ/+eibVF1cDJpqaqKfY1WMTJSxisZwePNkcAG
        iFsdYJiynX+f2GEt+D8qJnOp4uNcgTdFMeMW
X-Google-Smtp-Source: ABdhPJxiJTveKdB2oUF7F+OvH64uRQXlXAxG7jGWLp4vg85CZPXp+5qfpuel77fNNj7HPjZnkDecwg==
X-Received: by 2002:a17:902:6b49:b0:136:3f21:7a9 with SMTP id g9-20020a1709026b4900b001363f2107a9mr29487296plt.81.1632262619530;
        Tue, 21 Sep 2021 15:16:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x21sm162651pgu.54.2021.09.21.15.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 15:16:59 -0700 (PDT)
Message-ID: <614a59db.1c69fb81.335b1.105c@mx.google.com>
Date:   Tue, 21 Sep 2021 15:16:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-20-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 6 runs,
 2 regressions (renesas-devel-2021-09-20-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 6 runs, 2 regressions (renesas-devel-2021-09-20-v5.=
15-rc2)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-20-v5.15-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-20-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a7c76d8d5a91d210d64552d5e29fd02a115fce7

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  37fa90294a830ccc2860b5c7378b821a686b6ca0 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/614a46bd1b5ef7c81599a30e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/614a46bd1b5ef7c81599a3=
0f
        failing since 8 days (last pass: renesas-devel-2021-08-23-v5.14-rc7=
, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a49057e89cbb35899a32f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-20-v5.15-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/614a49057e89cbb35899a3=
30
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =20
