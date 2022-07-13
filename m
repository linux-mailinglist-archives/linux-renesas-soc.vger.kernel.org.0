Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04325733EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jul 2022 12:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiGMKPC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jul 2022 06:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiGMKPB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jul 2022 06:15:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2234EDE9EE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jul 2022 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=g3ACe96PbRAq6IosEprjAR2XqH4
        BQJGASncF5n5J74U=; b=hFDlK7LKHWN6IpEc1qHVZF6+4fNn34+G87R9o9kQKfI
        9wxjdJEythZFMLK9dqsF/HnrzGXCPj+dFb+mHQPprucaevf0JoZ8AAnnngb1HLm3
        iMNcoUtBsx5BGmRARfGwSTXZ3anvovOLivX/gmWTRImQfhRkHV0DVW4mfpN+uhYE
        =
Received: (qmail 126326 invoked from network); 13 Jul 2022 12:14:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2022 12:14:57 +0200
X-UD-Smtp-Session: l3s3148p1@SlKUDq3jEIMgAwDtxwdRAEXXn+yo/Rze
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] r8a779f0: enable CMT timers
Date:   Wed, 13 Jul 2022 12:14:44 +0200
Message-Id: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
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

Here are the clk and DTS enablement patches for CMT on the r8a779f0.
Patch 3 is only for testing.

Note: Some testing I did is documented here by Niklas [1]. Once in a
while, I get an error that CMCNT could not be cleared. I observe this
behaviour only on Gen4 (V3U, S4) so far. My E3 did not show it.

I suspect the missing WRFLG support in the CMT driver but this needs
more research. I consider this orthogonal to these patches, though, and
think they can go in already.

All the best!

[1] https://elinux.org/R-Car/Tests:timers


Wolfram Sang (3):
  clk: renesas: r8a779f0: Add CMT clocks
  arm64: dts: renesas: r8a779f0: Add CMT support
  TEST: arm64: dts: renesas: spider: Enable CMT

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 16 +++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 70 +++++++++++++++++++
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  4 ++
 3 files changed, 90 insertions(+)

-- 
2.35.1

