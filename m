Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66263715D42
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjE3Lbm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjE3Lbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:31:41 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF31A100
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:34 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b011cffe7fso27989035ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685446294; x=1688038294;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fiFJlqQBBzXU119yekyGfjwBGhmOxq/iw7Pr3wo5IhA=;
        b=NiUMx1ort3fyVpr+laVDGYEXGIWymWnUPyMIih7cAbgG7gCheOT9yllarCdlyKXLHL
         HaAVeh45gV0qRDP9+bbe163xO+DaQ4CKzL6pN161niHUXTQgWd2TOrHOZrmOJ52ODyYp
         etauwYCiuvddUzFowcH4B8B1xUGx1qPXWmZZ8bJrSr52efcrrRj5PhJjYzCe6vx3AFbT
         KYMoPTThpyt3DWUW8D32CyUvDVLGtE/X/kTMDK8kn+TxoARbXo5pd+AnYEGRN8o9iFg/
         85B7D+vweCO7QbntJDLz8tE0nN+i2qME2r7SPE4C01EtTN3KfeQuzCTVdDGXSkF8Qc+d
         yRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446294; x=1688038294;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiFJlqQBBzXU119yekyGfjwBGhmOxq/iw7Pr3wo5IhA=;
        b=OiTLP7OSAyfRFmKAZbVUzpFro+kpg/jGgEbnkjCT6Wqf8aREUcqY9vVrBROdidvItw
         e432mTIDJC3luIccwb0kMgfjIjB9FKpi02wY1PcCQFfWPBtJYcMLFATDyRwDxpNYJKWt
         r9Y6PGrQ3LNpFxKu5/u7WKv4LKIbLHlTKIw0YTLQQG1t6GkACTky2cV1ZG83cdZ/0fs5
         oZ/L2diK0AoikF3K3c/PXTk7wPbDNwJEIDRVEXtWy+EzpKXMdmNJ2bjkLuPHYf6ym7VY
         S3ACu/WsKJTXyH60e4ydxsBHoiuqzAHhor99t1Nqk7KOC63HxHhIC0+bxVgl4ou+MLhY
         a0PA==
X-Gm-Message-State: AC+VfDxxdtx+uUYJWhqX7m7a34Lh7fVelCYBmI2D30PPz4EaPkdoJT+o
        E/RLFdaOTM6sDAjORkgaZKthwOtwxfFPsCrHhIEDcg==
X-Google-Smtp-Source: ACHHUZ54aOGlBH3DbqIQg3ixveoQaZHvvLyotom5MivLNCApPlEgMfBrvgDW/VllkNEGXa4NJRK4HQ==
X-Received: by 2002:a17:903:41c1:b0:1b0:6541:91c2 with SMTP id u1-20020a17090341c100b001b0654191c2mr1489658ple.63.1685446293913;
        Tue, 30 May 2023 04:31:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001b061dcdb6bsm1268549pll.28.2023.05.30.04.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:31:33 -0700 (PDT)
Message-ID: <6475de95.170a0220.d6703.1f0f@mx.google.com>
Date:   Tue, 30 May 2023 04:31:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 3 runs,
 2 regressions (renesas-devel-2023-05-30-v6.4-rc4)
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
05-30-v6.4-rc4)

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
sas-devel-2023-05-30-v6.4-rc4/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b

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


  Details:     https://kernelci.org/test/plan/id/6475cce26ac0981e1f2e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/6475cce26ac09=
81e1f2e85fa
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ce54fa8ff8dc032e8728

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/6475ce54fa8ff=
8dc032e8729
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
