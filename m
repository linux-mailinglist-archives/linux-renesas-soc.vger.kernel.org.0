Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9D45BBEA2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Sep 2022 17:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiIRPWT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 11:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiIRPWS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 11:22:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5592C186D0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 08:22:16 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so4510634pja.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=UMH68WHOnjRjeea1UOaWjmn4Yh+g0tMsZ8Zq9ghjGRo=;
        b=Fl2WcBWtgr81ELbg1m+22kFrrHoH1lZEZU+2FKLr80ojhllsqqWLZl6y0+966JiufG
         j58i9TvULEzxPm0azUbHGCDA6cjsTRTRFxuznMxW7o3AFni1nNngxNoxTmq/egbnDY+5
         BYFQRxMZKM9WMjekqvSTXa3sNUHH4KpZh+zIHypIw4zU/3tnCzjoVc77vve2qDEWl+8C
         s1c994pnlJXH/Wxz5P2dCzUNq1xT4E+hbcB/wwE6s8EqjosH0leIRmCe2f7ictSV7WNr
         ztom0s8as7AZAp8BcVU3JFQTaj9RVwJgsEtIsTXzLgiXNa/yyTUgNAyA4CB57icj3dGR
         iFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=UMH68WHOnjRjeea1UOaWjmn4Yh+g0tMsZ8Zq9ghjGRo=;
        b=Jh/VuAnlpwE9ZUMPXow4f4EBFP0MaSlJcZ18EWBYbjEhpf4fuau9pr8qOJN0O6Idbl
         15TG/KHR4c5EM3zNFTMliBnfZfKVpwCqXe8NdrCYuPFHhvFbA5JNL6MWJpEmloxfKdFn
         GCu1sVOHWK/m95TpNsH/LYONC4gp5I1S12T7RCzZDo7ih13BTdNU3QNwK0wfXL2JqdAQ
         MAz93g0JVhbaa5/P2OZIO3FmzBrknZziwHm4LsrTOxYvTKJxQSeNvLogimCBeZvET+HG
         jBGU4CP4YhUQrjh+UCgYmT/djHZuOuf1qaLb07GN4rjWYaNwUz5qbo8JAae47nCT0a5d
         d84Q==
X-Gm-Message-State: ACrzQf2zDII2EYDsjkVdT1JgHstUlTLLm22gvPOXcMZdHG2UR9gI2/13
        ZqMGxkSsXhal2J9ul3g2+svJ7+9VEmhKF9ad9p8=
X-Google-Smtp-Source: AMsMyM4M4Wm9fxQ8EsFuTSb/gQqF0p0zqSpuzyj0mmzlHtNG2JCdprxaTZbooAWzSUUkDG9ll3H6BA==
X-Received: by 2002:a17:90b:4b49:b0:202:e09c:6662 with SMTP id mi9-20020a17090b4b4900b00202e09c6662mr14993323pjb.138.1663514535605;
        Sun, 18 Sep 2022 08:22:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e16-20020a630f10000000b004340d105fd4sm16716293pgl.21.2022.09.18.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 08:22:14 -0700 (PDT)
Message-ID: <632737a6.630a0220.fafa5.ba58@mx.google.com>
Date:   Sun, 18 Sep 2022 08:22:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-09-18-v6.0-rc1
Subject: renesas/next ltp-ipc: 22 runs,
 1 regressions (renesas-next-2022-09-18-v6.0-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 22 runs, 1 regressions (renesas-next-2022-09-18-v6.0-=
rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
   | regressions
-----------------------------+-------+-------------+----------+------------=
---+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig+i=
ma | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-09-18-v6.0-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-09-18-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2918d1d088b5c12f5449318fd4a0230455fa5752

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  48cfd7a9977e6268b4aa2600608cebad7e0e42b8 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
   | regressions
-----------------------------+-------+-------------+----------+------------=
---+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig+i=
ma | 1          =


  Details:     https://kernelci.org/test/plan/id/63272d70985e8a0ad13556a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/ltp-ipc-meson-gxl-s9=
05x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/ltp-ipc-meson-gxl-s9=
05x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/63272d70985e8a0ad13556=
a6
        new failure (last pass: renesas-next-2022-08-15-v6.0-rc1) =

 =20
