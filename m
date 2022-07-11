Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8955F57049E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jul 2022 15:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiGKNrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jul 2022 09:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiGKNrO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jul 2022 09:47:14 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CAF52E57
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=xb41jybwjBnJauRVq5I8OgLZLLq
        buEDKD7OFgVDEmys=; b=beaVxZ0uw8ps1WkdtwzKn55dUjZvKCmw/KGul9z9WG4
        Z4bN6fqGqqArdi8orfqeXJ9NoY5zK3PxqEjLYmXKkgFtAVEt0m6fV9qcoqibzv/v
        k9LVF6ka+h1Xow2pfMXZDS7WoxzqNbZJkLQFpI/Hk6NNKwbOR1YV2AowK404yUyg
        =
Received: (qmail 3559110 invoked from network); 11 Jul 2022 15:47:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2022 15:47:08 +0200
X-UD-Smtp-Session: l3s3148p1@9028yYfjep8gAwDtxwdRAEXXn+yo/Rze
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] r8a779f0: add SDHI support
Date:   Mon, 11 Jul 2022 15:46:53 +0200
Message-Id: <20220711134656.277730-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These are the remaining patches to enable basic eMMC support on the
Renesas Spider board with a R-Car S4-8 SoC. The patches are based on
mmc/next.

Some comments:

- For reasons, I have not understood yet, the performance is a bit lower
  than our BSP when checksumming a 250MB file (BSP: 2.7s, this: 3.4s).
  I was investigating clock handling differences between BSP and upstream
  for a while because the values of the clock trees differed quite a
  lot. The patch "clk: renesas: rcar-gen4: implement SDSRC properly" was
  rejected which is fine with me. I meanwhile found out that the BSP had
  PLL4 entries missing which made the values all bogus. The newest
  version of the BSP fixed that. So, it doesn't seem to be the clocks.
  Back to the drawing board, let's handle this incrementally.

- I made prototypes to support the microSD slot despite it is hardly
  accessible because the Ethernet subboard is blocking the way. After
  further discussions with Shimoda-san, we agreed to not support it
  upstream because the voltage switching in hardware or CPLD is only
  for specific testing. I added a comment to describe that.

Other than that, eMMC works fine so far.

All the best,

   Wolfram


Wolfram Sang (3):
  clk: renesas: r8a779f0: Add sdh0 clock
  arm64: dts: renesas: r8a779f0: Add SDHI0 support
  arm64: dts: renesas: spider-cpu: enable eMMC0

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 45 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 13 ++++++
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  3 +-
 3 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.35.1

