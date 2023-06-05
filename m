Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB496722B2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 17:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjFEPf5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 11:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjFEPf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 11:35:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D02F7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 08:35:54 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b04949e5baso42916785ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685979353; x=1688571353;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pRd+AIYZa6CWg3kq1UgSW5b6fnHmFDB/M25grcZqJy4=;
        b=JTJ1X9vfQqx1gajU064S41UQ5pAmKr4hzzlsBdXMakFuETGQu8xvG9nyCQk73lxZsb
         h2Eeessf5DDxntFFQb9jusCi8VVfb8wlSaxq5CK0LjztASJ8E6BhFy6wpey0b6EmliP7
         7M6xfqQtqN6MbCXeyyXYSeYhrSr/lAutE0On8abdkx/hQAnsll/uIn5OhQc2nSmUfbOa
         +3Jmuw2H7vjrbsL5I0hvCcKyxrYy9aY5D7JkyMGknuitIbJfQZJkt9uPUPu92DtsbUkF
         Y+UoniVmTEi5QmRoET2QCR1cV2+7TV1J4rQhMebFkfqgphM7L5kjBt4J9tHVEALm+0eI
         NpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979353; x=1688571353;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRd+AIYZa6CWg3kq1UgSW5b6fnHmFDB/M25grcZqJy4=;
        b=T/R8i4sOAVcLNr8qgWrBo3kpf/Sg+bl3zHBaghU18TXJi/UpOA8MvDk0IV+9xiYh5P
         ibmDx2rFn6t9NtgZTSJmWsP+SejGY4nRByyTp3kMZMqImA6ndTykLRpKyvOaYFbcdLC6
         Cy6qx/AVR4fPrgqQRavGKOLzypOyBq0Io2Eo7rUxaAiNMhYXy396A9b9FI4R8ypClOCj
         9m0+XhQEA0n9TkFYvsMkA8qCUHWJtxnVoozUTuXVZA81IVJ5sTXa2fb5BbUhuR60Sun7
         FOjuk6A45pBq0hutS4dgHQPs8HJEM2t7fCDe35M6zMl3z59MHAlXN/1cF87oZp1MBqrW
         5NZg==
X-Gm-Message-State: AC+VfDwGaFFDfV5HzJa9zyJHZfYirL006azoHRNFw3d/xnhoaKbdRFyh
        l5InMop1ttLGaDBl5oKAtMFbLuSaQ4tgNczXyHllaw==
X-Google-Smtp-Source: ACHHUZ6t4PRCekdlbZgzEEB9rJADNHeP96ao7o08oWdAmrkUv0f9jX5zyAVgszy4z9sZrkvXyl7tAQ==
X-Received: by 2002:a17:902:7613:b0:1b1:b111:dfe8 with SMTP id k19-20020a170902761300b001b1b111dfe8mr7776084pll.66.1685979353535;
        Mon, 05 Jun 2023 08:35:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v24-20020a1709028d9800b001b1920cffd5sm6736146plo.267.2023.06.05.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Message-ID: <647e00d7.170a0220.e1da1.b55c@mx.google.com>
Date:   Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 2 regressions (renesas-devel-2023-06-05-v6.4-rc5)
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
devel-2023-06-05-v6.4-rc5)

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
sas-devel-2023-06-05-v6.4-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e

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


  Details:     https://kernelci.org/test/plan/id/647deffee603042079f5de7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/647deffee6=
03042079f5de7b
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee146afbeb77d4f5e10d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/647dee146a=
fbeb77d4f5e10e
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
