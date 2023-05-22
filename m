Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6681770BE75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 14:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjEVMhk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 08:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbjEVMhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 08:37:36 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D7EC5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:18 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso3525650b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684759030; x=1687351030;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZExp+1X9Lixu8MBwt4oOqdP7YFia07BzpNYKK1MpEEc=;
        b=3BRVPk1kAqIzVL3q0fj9k8AAVRfa0WOfDjO7iRtBBJuUqfIe+VysqnxzuR0buEQdg/
         tB4EGxnD2JMOx2d3N32tckllwfMbAK5hasC6dcuYM8p9HAi3FPeLZawCg6RQweixGAop
         mlddSjoXrBDlNXkPXLJHxE02vqq+joKZHSh6+adZKJv8Yt1aygu/8Hg+oJHspD/YCnV1
         MOGYwgahRIa3uepBu8LMFMYk5VLsOaTFYGLv0y0xg7zoUvTiKMDMy3xtG5DkX2ZdIyOI
         /HJ+rkR3u0gcqwTnZYNvjq30iF8+87cExYLZbn8qa0CN6p+3V5KXx+InXZvKA+2N5nFS
         3cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759030; x=1687351030;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZExp+1X9Lixu8MBwt4oOqdP7YFia07BzpNYKK1MpEEc=;
        b=Q0zKrzzLdnSYUC3zV6v+f92cGMwTi7/+2naxs4hqPdZWa8Ad35LJPBe2VGaR2Od/U3
         ZHksxzTbYIzGDlC6XIf2vIEz8uBn7iNtqKpPpZAdV6puFb8BVTD2/KC7/4fQCUyalpzZ
         KbvRKt+DpU31WXzcRayIKHACyt+aRsmNIQxykGQGrS2VGH/Un66fVATt/ktb3fX9mVtU
         FZpQz9DQqtMdtz8ebY0OFW8y/tnaTHHJvR8IY1rD/vr+pkyBQloUGC4mzVDlZTFnmReV
         ztR2dTRBiz55oHfPJUXW7b+n6lgkjES4HZfcMckfbyqyx6rEZFUEYciRtAQdes+9CbmU
         MFXw==
X-Gm-Message-State: AC+VfDxorB1uqtjAIWuRPKHZcrdMcRrIugfPp2R+yciwlHrQNyuMX0Qu
        JZUDGNScEfcyptQXGT/A5x49FFG8T9TH8bLBgXco3w==
X-Google-Smtp-Source: ACHHUZ4Xyeiz52GuT2p5MOipteO4HG4wzNYTjBbNH/QIzW1rNmk8C4ohQhbyTJIcOyxJVaHss9WJxg==
X-Received: by 2002:a05:6a00:2e06:b0:643:aa2:4dcd with SMTP id fc6-20020a056a002e0600b006430aa24dcdmr15823480pfb.16.1684759030407;
        Mon, 22 May 2023 05:37:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z19-20020aa785d3000000b0064ca1fa8442sm4235826pfn.178.2023.05.22.05.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:37:09 -0700 (PDT)
Message-ID: <646b61f5.a70a0220.4a3dc.669d@mx.google.com>
Date:   Mon, 22 May 2023 05:37:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 8 runs,
 2 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master sleep: 8 runs, 2 regressions (renesas-devel-2023-05-22-v6.4-=
rc3)

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
sas-devel-2023-05-22-v6.4-rc3/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b57062a3f726ce12e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/646b57062a3f726ce12e85e8
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b565d803b1f44d82e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/646b565d803b1f44d82e85e7
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
