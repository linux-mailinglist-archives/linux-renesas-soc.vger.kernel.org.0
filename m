Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908EB720559
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236328AbjFBPHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 11:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236253AbjFBPHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 11:07:06 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE63EE46
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 08:07:04 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-652328c18d5so1004646b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685718424; x=1688310424;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G0nJ9REEU8fT8bpuf+jqNV1Q5h14W470U2OmlsTyw0Y=;
        b=BZCXJbZFlqMF+g/Y0z5jV9ZvNhcHsYJqbuIygBaY0LNyBtc9+cSjd2wuxlH/RZ4Pzr
         pPWfHZn5EI/4B4GhA1IqCitkwfH+u70YCrPb+Xe9HnlTSfVySM9i0qKEymXcN67hbp28
         l2d2BtJ7abeXQ7iL3zQ5ooBUrwzOdiB9lDbz3G6TnQbEbOP/UlK/4DzgL1gbtODPH+Yx
         kMJ9qSml+HJMD9omGyXZVGzAST41r+EvnOkOIG19TR7941ptNqsONedIG5tQToZFLgCz
         01aTsz6ecvR9RW1GxvRTFwEDSAXGaJI5zzQ801m7+3ilPXnrgm7PmDlbc6blemXm1MYd
         0ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685718424; x=1688310424;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0nJ9REEU8fT8bpuf+jqNV1Q5h14W470U2OmlsTyw0Y=;
        b=S7Aeg9ZEBQGzzAjxTDRc+RIQe78jGgaLJBh0wP3CFNAWmC3tnYQoMJh1N0N4cpnEJi
         0yODd3TJcer4+evg+s7wxcjYbX1YuMoVbbUhAoHcEEc9nvQFTBuwAi7IEXXbHUSIgOf8
         tbQ5W4bSMByEkDcOHpnZg/n3/GkGvu6R7oYUd82v5E7dnEiWoZQUJAx8HtaRPITmNF7M
         IK+HrbU0I5wEjDCM8OE5297C3V1CpW58cNJH/+oIli3L8/zzXCPNF6Chm5rorZ89okzD
         hchaYTLVEcoUewHvIuMhEHGjH3K2UI4sDaxPpXghIQmEgMXMpzf+0EXPxgIVB/UM/ukz
         wJcg==
X-Gm-Message-State: AC+VfDwTfVs6yWhehWoO6Kkpu8oA3oGrwDLxEMvpCDzkqtG6CGWhkdII
        FE5P4SUGm2Anhrsu5hdnUyvEEHyvDeJv+8ONcH2koA==
X-Google-Smtp-Source: ACHHUZ4cBTnfQxWAh5iHR9aD27HWysFhQJoKqlGAB87hToHDm66N2QbtJajBDxQ/c22hHW3xmDVQXg==
X-Received: by 2002:a05:6a00:10c3:b0:64f:4706:3122 with SMTP id d3-20020a056a0010c300b0064f47063122mr9242268pfu.30.1685718423456;
        Fri, 02 Jun 2023 08:07:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a26-20020a65641a000000b0052871962579sm1249072pgv.63.2023.06.02.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Message-ID: <647a0596.650a0220.7260d.1eb5@mx.google.com>
Date:   Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-02-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 3 runs,
 2 regressions (renesas-next-2023-06-02-v6.4-rc1)
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

renesas/next igt-gpu-panfrost: 3 runs, 2 regressions (renesas-next-2023-06-=
02-v6.4-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-02-v6.4-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-02-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      256ba57a94d64c7d95e8f620dc8d1299c15fbc35

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  766edf96979bf13a10c9985c007f2baca5c9e308 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f4f6d013ad20cdf5de30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/6479f4f6d013a=
d20cdf5de31
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f372993966df08f5de2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/6479f37299396=
6df08f5de2b
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =20
