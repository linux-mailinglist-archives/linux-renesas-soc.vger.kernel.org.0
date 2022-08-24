Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB0559F7E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 12:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbiHXKfZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 06:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbiHXKfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 06:35:24 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6613E79ECB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=//6j7PKRDzOH0wqJp2CGJMdr1dD
        hFZAm6icmNRK51Ug=; b=25Pje+amQfLF7i49CjUgdiKoC1Hpw386AzYmJrI2hvi
        sFcwMCxT5rEWcBHeMUeIjltpZbSScynTp/ZDNchRKyzQa9wvMlNdxIwAmCLPG7Rf
        YDiFEW4Wr4ONsOy0pxJBCEKclYMacsblPC5I/ij2SRlqjOuaD9Ue6nZNHPS76PuE
        =
Received: (qmail 2180805 invoked from network); 24 Aug 2022 12:35:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2022 12:35:21 +0200
X-UD-Smtp-Session: l3s3148p1@BeXhPPrmcLMgAwDPXxw3AFlguiwjsjwa
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/4] r8a779f0: enable MSIOF
Date:   Wed, 24 Aug 2022 12:35:11 +0200
Message-Id: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are the clk and DTS patches to enable MSIOF on R-Car S4-8 and the
Spider board.

I could only test MSIOF0 and 2 which worked fine. MSIOF1 and 3 are in
parallel with the FTDIs for the debug consoles. So, likely because of
that, reading data always results in zeroes.

There are questions left in patch 1+2.

Looking forward to comments,

   Wolfram

Duc Nguyen (1):
  arm64: dts: renesas: r8a779f0: Add MSIOF nodes

Wolfram Sang (3):
  clk: renesas: r8a779f0: Add MSIOF clocks
  arm64: dts: renesas: spider-cpu: Add MSIOF node
  TEST: arm64: dts: renesas: spider: Add MSIOF node

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 12 ++++
 .../boot/dts/renesas/r8a779f0-spider.dts      |  8 +++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 72 +++++++++++++++++++
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  4 ++
 4 files changed, 96 insertions(+)

-- 
2.35.1

