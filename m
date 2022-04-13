Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55E75000A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 23:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238988AbiDMVJN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 17:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238955AbiDMVJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 17:09:06 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEB576656
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 14:06:17 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id k14so2938395pga.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=462dFI5XO4ivuLkefkJDxrmxwm/CtoHnmKd0UloBOKg=;
        b=u+Bo7PZaTPWhC1VZ4y5hkjAU/NSJxDmpXqRL5pnqt1Hk+ys8mVOaxvcIm3F+bI1N1G
         juSeiuqBKIIHB82v+9X7sUWMmhSRMhd/hE3fBmfDY2PQkaVrkv0fxchJMQDRORNpmDK2
         Z/16x4k7o6zMp6XaQn22+quniPhWx8iVEsy9lHUsfGuPdwjRwxKGeCbNkfZuS/zal0ug
         KCaOsGh4MUmgIjsMtmhv4y4y2JSeA5VQNgPjxaCDa1GPzPX2wd+iF5JZcrLgNJpG77xX
         hbzSttmb9iw/muDX8evtexKmgDOrPbC2oavadIIjH0XTOgtqNc+0m+/frRF4eQRoWeOa
         cwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=462dFI5XO4ivuLkefkJDxrmxwm/CtoHnmKd0UloBOKg=;
        b=3Kp1zY2vc400dKpFY7UbmRlN6jvYiglg2KQG3LhMZ9cI7AqEKMvaXsnk49bW5y49tS
         Cn7GkW4NS+DRr4E4+4iVVcyi6HZuCai3QZ8yZJQTJvFeK4ittIr2Y+KzpzcXRxqwMsSx
         UhyHKv2d96jATWW/1OjbxyGTRepxdr6wsqF73N+OEnKV1AbYHtvC7mFNuBSiB5SJuIzx
         CKkiGEH27fldyLqAoWN6gnY85EjiONW5dI/6lJsp+Mq3/nAYxVbPP/CZYyGxuUNXErsw
         D2fpTAssEEA+axnGpIJiJBCmD2PbdOobIaONLr26Fh55GPSSqa0KzXcjF7BfC6MBUNCZ
         y30g==
X-Gm-Message-State: AOAM53056KGma+LuP2oQnrkvp5XUmfWiVpdKd/KqiFUw6Tp/w9x+MSaX
        9b3g53Y20uyVTxW/KXJ10OaK5OPe9TtnyOg7
X-Google-Smtp-Source: ABdhPJyb+Dc7mt4E/8qDQ56DwlcBJIkzcQmmKti9H5zvnuUO1V+wjjtgCrA1GscMoAbkbSVn+IhLug==
X-Received: by 2002:a65:5908:0:b0:399:58f3:9acc with SMTP id f8-20020a655908000000b0039958f39accmr37419863pgu.149.1649883976239;
        Wed, 13 Apr 2022 14:06:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 96-20020a17090a09e900b001cb62ee05besm3824301pjo.55.2022.04.13.14.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 14:06:15 -0700 (PDT)
Message-ID: <62573b47.1c69fb81.e8c66.a342@mx.google.com>
Date:   Wed, 13 Apr 2022 14:06:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-13-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 170 runs,
 1 regressions (renesas-next-2022-04-13-v5.18-rc1)
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

renesas/next baseline: 170 runs, 1 regressions (renesas-next-2022-04-13-v5.=
18-rc1)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig     | regre=
ssions
-------------------+-------+-------------+----------+---------------+------=
------
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig+ima | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-13-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-13-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a868de20e8c0b389498edad18108aa42815e79ee =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig     | regre=
ssions
-------------------+-------+-------------+----------+---------------+------=
------
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig+ima | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/625704c57b21700ce9ae0720

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-13-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-13-v5.18-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/625=
704c57b21700ce9ae0733
        new failure (last pass: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-13T17:13:26.634543  /lava-108401/1/../bin/lava-test-case
    2022-04-13T17:13:26.634829  <8>[   14.675624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-13T17:13:26.635002  /lava-108401/1/../bin/lava-test-case
    2022-04-13T17:13:26.635162  <8>[   14.695526] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-04-13T17:13:26.635323  /lava-108401/1/../bin/lava-test-case
    2022-04-13T17:13:26.635475  <8>[   14.716627] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-04-13T17:13:26.635630  /lava-108401/1/../bin/lava-test-case   =

 =20
