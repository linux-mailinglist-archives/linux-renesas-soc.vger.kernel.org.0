Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0904B53FD80
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 13:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242903AbiFGLaq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 07:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242930AbiFGLap (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 07:30:45 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6D7B0A6F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 04:30:44 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id w21so15341656pfc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FRT436IuiNxWCK0ZJGmoBcjPWrlbNwK1ZTkFXxBWs8I=;
        b=iscCp3Vftyf/61HgbZlEwoZidEX1wxeepIQptN6974RKymNZRmnM9M8JkijZjWG/UR
         FyUQqEEeIeZxhHXvcLnMszpfKDOp8YZ3gVGN01Qszupoh3k6SVLvdgmY9elFR9b2ihoU
         8qCikcTfWehJUrt3xKLJWfuXFpWNhk5x7jg90pmbg+OejwMoyeOvqeG3uCjLsbJm82Xv
         z4AYBFAtm4DXnv+WGO52mWjeLBc0uw82OOOnimSQZo/8kX6IITJOoRWOySsFdn6b3XY6
         fbA3L/y3i2ab/vnOgT1vQtL39O0qpE71iCKHH7xlTQVfTIw1TFmXbAfrXKxSm2O1cL5u
         md7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FRT436IuiNxWCK0ZJGmoBcjPWrlbNwK1ZTkFXxBWs8I=;
        b=TOybvL0uOvqb9N8/nrLfzkVK3ICT8tREx7YKjr/DJoi0K+sW1SaBXLVCVReBflq5hc
         UWGpzpzPSS2GHJ09WIR4VwzqWKvsNTlQ+9c52E/9tLbYStNx+tqDbVVg44GP355B2/At
         F7w+nsKeXzssogF5syOqIIS30mAoGBCrnjSdY5vP5V7JrvLrsUwVPqMb7u3Ny5CfJVq5
         6ygsjQ/MDxpUfn5fnyf1clHb82piEszm2R40kJrYL2qx7MVvGVZulg4RwxiCXQ+DwyVH
         508oRwuWxtJNojmKcIh0eirUtUcK5YdzNS/+kYUsUUbp/MDDHFWwufhMQnG4Ai0Gs+Cv
         IdGA==
X-Gm-Message-State: AOAM5311/NCr1XoMxqjzXNMf23zc2JcpJRmFPvwqpYIPL4q/f7XIfbl2
        8XwFF/TQt7zPAb3VcegULZs1DfoBCar1NU/l
X-Google-Smtp-Source: ABdhPJxJB3gW8hVuKehzbyyqy0U3E5+3zaCTnlZ2OtvxhkLldoS4bD+4tkloDVtaj4NtYOCNeKvk8w==
X-Received: by 2002:a63:f156:0:b0:3ab:ada6:b463 with SMTP id o22-20020a63f156000000b003abada6b463mr24783690pgk.462.1654601443817;
        Tue, 07 Jun 2022 04:30:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u7-20020a056a00158700b00519cfca8e30sm6715878pfk.209.2022.06.07.04.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 04:30:43 -0700 (PDT)
Message-ID: <629f36e3.1c69fb81.a7df1.eb92@mx.google.com>
Date:   Tue, 07 Jun 2022 04:30:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-07-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-next-2022-06-07-v5.19-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-ne=
xt-2022-06-07-v5.19-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-07-v5.19-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f4a1ec70aeccaabaae9ae3860561c6f48965c31

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  163144712a46229f3476b04f6c0037c4b7f00299 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/629f268951bbc3100ea39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-07-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2=
-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-07-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2=
-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220603.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/629f268951=
bbc3100ea39be0
        new failure (last pass: renesas-next-2022-05-05-v5.18-rc1) =

 =20
