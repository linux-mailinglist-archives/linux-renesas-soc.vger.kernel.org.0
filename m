Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEC1723FA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbjFFKf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236879AbjFFKes (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:34:48 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4119FE7A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:34:43 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53f70f7c2d2so3172457a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686047682; x=1688639682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3bZ3xs7l1btUHsx+/AhOdTg4O12YjGgzjiSzkd3h83w=;
        b=EE8vwht7HjW9P2qcDw1cTZAwvL2YFONDIWUj/c9S/siXeKVfvLUnD9E4K5IdFvfyP2
         HIpKylCIWt9tnF9svOKWjyxcyt57AFovlIdWlbcetwnJCpKD7+OnwpCECDvexKfgxKL6
         Ir5pCMu6p3E7F2o/OEhHFuGO0UOM/xBl+tJcinupNYINbgwyfUbSumXUB/HTB8a0qcy9
         /hZSjLqf4ilZM/w1CwbwVjKiCMs88oJVm+uZoRgDTbKW9C+N+vGGzWMgFVluPyiqis0H
         PZQgpy+RG0itd+3oolauodbJmrvXezVJ0C68owcA+iDZaNCLyQ+mOspNtSDAqulCtyKn
         80Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047682; x=1688639682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bZ3xs7l1btUHsx+/AhOdTg4O12YjGgzjiSzkd3h83w=;
        b=AvFPDKFIPbLediF1rKxnC1uv2iFrotgqaHbkbQqBkQmaZ4fUjmUBmCXRfvjTe16OyL
         2X6pAHzS71Bjo7vbGnLsxef/Epd1xLT7ZcTY0xxgfxr7xk8wsoh+zwP7x22xxNvaEZnQ
         s7M8RqniYVTeAYPRrLnjM1fBa6dQJVaOG6KGE9i5BQ7FwBSI+LAhME5Qnbo+Y1hE86Jx
         ydv6786uVlBcUlsqeeo4cHmSd9xbghBDNQpHHtyo8/jCZ3BtsK5Pyho61gqA20hAGan1
         akKKzhwVGmEJWFaEkXTqbwYIuOSjlwFj70fdw9WsbnXG709gmy/1xnahJT435xpSkXs6
         QR6w==
X-Gm-Message-State: AC+VfDzWeiNGftVpseP4z7dIBUkPBH4IYl3o7HTBNHlAyq65jTZCWlfr
        +5gycK5erpVK+TV8kFC21/HqlQ4an/HuleF1HbrG1g==
X-Google-Smtp-Source: ACHHUZ6LtD2TkcbUGOIypAiM/5zrpooUftmOhrk1N5kCSWgKMPq//oAmo4NnzeI7etEEu12nyCf3Gg==
X-Received: by 2002:a05:6a20:2455:b0:10d:1fba:7371 with SMTP id t21-20020a056a20245500b0010d1fba7371mr696006pzc.5.1686047682043;
        Tue, 06 Jun 2023 03:34:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jh10-20020a170903328a00b001b00e0ab7b3sm8207538plb.50.2023.06.06.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:34:41 -0700 (PDT)
Message-ID: <647f0bc1.170a0220.79f04.eec5@mx.google.com>
Date:   Tue, 06 Jun 2023 03:34:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 5 runs,
 2 regressions (renesas-next-2023-06-06-v6.4-rc1)
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

renesas/next cros-ec: 5 runs, 2 regressions (renesas-next-2023-06-06-v6.4-r=
c1)

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
s-next-2023-06-06-v6.4-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef8ac8ea60bab71f5de57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/647ef8ac8ea60bab71f5de=
58
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5af976a4d70f8f5de2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/647ef5af976a4d70f8f5de=
2e
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1) =

 =20
