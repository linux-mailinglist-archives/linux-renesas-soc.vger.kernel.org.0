Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8E572C52F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 14:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236774AbjFLM4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 08:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236698AbjFLM4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 08:56:23 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F1F2956
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:22 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b3b974fffeso10917105ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686574498; x=1689166498;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E48ewKalMlaQPTAH2oYNZrtlHKivtXDUGQ0Q4R0WPOM=;
        b=Sddqdavu6AMNNziTTz3PXtCTKMTQpyZ8xgwPxwm3FM2N53IrpxdxifBhBFktBl+cez
         g6CqonOpV/gBkqkWtF2tXpZeBORzgA/lTJxLMmBGCU4+aJad1A0dXWMVaUD7XsnCVufD
         TYi6TFm4vk8Guj+F9Jr16NySMjRo1/Y5fMga97jClJbSPFlT2DfeseIRuhT64O1acgEH
         q/KiBRKxHilSsEWh/0I2idR9RJVYoge55FO9VTE02tY+TuRnphq+WqgNVjuhzlyMqmLI
         ObuQokiDRUjTu3Hrlwb2mWbLxqFXYEwXPelEQHA92fDH7wKOONBdjXSUv+C8ViklmdTL
         nSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574498; x=1689166498;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E48ewKalMlaQPTAH2oYNZrtlHKivtXDUGQ0Q4R0WPOM=;
        b=E99oMApU5v6aXfiMpdTd0TXAaPziJeqYLDiGzpEAlOFvNauT8CDPPjlHLHUBEygi3M
         1FP45I6xTxpuW/Qy6cXmeqsaa3vW4zdIyKch8wdDTFbdvR1f0gK9vLVdT32a1AvONkhG
         B2TLDsfWACCR3RXZaC7IorLuKs8iq6WQ4wQRADjm/ZqIjXmn3ZVZYMthW4sY7KKhQSF3
         YHzdx6TuSpNV+uOaQqLVVDjPAYIUccUBigTBJw0cdAWpNHtiSPdHvGYOakrqIzJTE+IY
         xEg2+Nx0PBaqmisHLw02gTyJXAB4tl7UJuHYtZ43z+r8ZX9TujGY7Ms3r0Uk8G4TyDyn
         65gw==
X-Gm-Message-State: AC+VfDxx4OlcoQEM0yNRKOMgYdXfKPGuK9e0ebN3CLBGHf7En8GOxPbg
        W2ugKAei4FgHgiC9RdK3JmgWC807QbSCc1EBcGDQ0w==
X-Google-Smtp-Source: ACHHUZ5iP2lu9PW9DzV3Hcbaunmrq9EGmYrBt7mwxn1JK7TPUaqM5bxcRwmqSMtAgNehN1KSBuqm0g==
X-Received: by 2002:a17:902:e74e:b0:1b3:8865:aaae with SMTP id p14-20020a170902e74e00b001b38865aaaemr7909701plf.53.1686574498082;
        Mon, 12 Jun 2023 05:54:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e80500b001b02162c86bsm3801316plg.80.2023.06.12.05.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Message-ID: <648715a0.170a0220.2fb5.608d@mx.google.com>
Date:   Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-12-v6.4-rc6
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 2 regressions (renesas-devel-2023-06-12-v6.4-rc6)
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

renesas/master v4l2-compliance on uvcvideo: 4 runs, 2 regressions (renesas-=
devel-2023-06-12-v6.4-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-12-v6.4-rc6/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-12-v6.4-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eec974413697190538e69788efc6048763f9b64e

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  52926c1f2f03aebe34d96056e8380ab07c8f512d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6487063c30a5d157b9306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/6487063c30=
a5d157b9306141
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648704bbffe542ddfd30618a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/648704bbff=
e542ddfd30618b
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
