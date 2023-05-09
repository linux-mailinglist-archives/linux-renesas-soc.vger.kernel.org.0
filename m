Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784CB6FC8E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 16:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbjEIO0Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 10:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235914AbjEIO0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:26:20 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740E84EEE
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:26:02 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so3988015b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683642359; x=1686234359;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B1CIfkyB4gC6uNEKLCwzlXbjXKRd77RGon+DiDuYX2w=;
        b=BPKCqkrYPizrcIKrGCdSNFja/gWmfwxEVfijNyKf6KRPpaozm+AQK5GhShjtVqGVGs
         NWbWnHAtfRHsJgJpggJLBNjMvfkiGh+djUDS6qK/4R54WYimXAhKd65Td0DbXM64g5TF
         6/2ktoSapCPgUhrEafQu7uGish4k12x8MQUndroj8HmieMpQJWQ9ZjNGXGm7Sk4WkQNw
         YJ0mZalbrDu3+n7H5rllxXrqDcGekDaeAHB0J1Zx0Uqi2BRR8w3kLMfX0sS3ZdlofcTf
         qCKKVO2ClnTlQmIib1lg4+tnWUf9mr5Ka8N+aCP56+cJ3xiNfoKOon6xCgSRUZ4l+shJ
         wm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642359; x=1686234359;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1CIfkyB4gC6uNEKLCwzlXbjXKRd77RGon+DiDuYX2w=;
        b=c55A1xyaIt5PUVtLeMnueuAFMNIZnyHNgQJXerUnE6FYT/dW1SthLZhq4p1/cwIpqq
         kky8o5tSg9c2rTPS2BwPnpLemhPlUPFIJFIvY8lIlAB8+b7Vkj30Ex+6SqV3SATua+DH
         yx++XU6OiWkugNaZ4OlvDw8AiLdR6Mxb12fpA9UeV82qIUaXh0olK5X8XIr8BpB9Akwe
         72/O9NY+jsB8Xc2N+Lrepj2sTw2EqraKK95Rg0RfjA/gZalFc7NQDQvVcnoUkePuOXKN
         S5GXk2+44dUgaIXE3YoN56d1K621/9YhqmjXoQ8gidRiNO7MZu2I2dxtktK0JVdRQrWG
         OjAQ==
X-Gm-Message-State: AC+VfDyHuLsn1cPm42gj4JrBdHlmKQm4fo9bJDDJL1Gvv0GAYVEWiXlE
        45ouNTVB3PzFmyGPnatla7Gie5hi1tisnbmRfgxAXw==
X-Google-Smtp-Source: ACHHUZ5AebNbfmW/Jj3KvqupthxTPLmiIAfUDdZok3UGaDhD/MSIjXbeAK7/PRwjYn/9AMd84w0Xjw==
X-Received: by 2002:a05:6a20:7352:b0:f0:b6e3:90c9 with SMTP id v18-20020a056a20735200b000f0b6e390c9mr16466121pzc.4.1683642358938;
        Tue, 09 May 2023 07:25:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g25-20020a62e319000000b006414289ab69sm1837836pfh.52.2023.05.09.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:25:58 -0700 (PDT)
Message-ID: <645a57f6.620a0220.268f7.45c6@mx.google.com>
Date:   Tue, 09 May 2023 07:25:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 3 runs,
 2 regressions (renesas-devel-2023-05-09-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 3 runs, 2 regressions (renesas-devel-2023-=
05-09-v6.4-rc1)

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
sas-devel-2023-05-09-v6.4-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  28d9a3c4fb4c99aafc31b288b3f735e19e728d64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2f0a07378e58e5c7d7b589b39ace7e3a2317f6b2 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4a193322381c122e863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230421.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/645a4a1933223=
81c122e863f
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4a674c1e1cb8522e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230421.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/645a4a674c1e1=
cb8522e85ec
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =20
