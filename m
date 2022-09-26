Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BDD5EAC2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 18:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbiIZQOF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 12:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbiIZQNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 12:13:21 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D973D63F00
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 08:01:53 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
        by michel.telenet-ops.be with bizsmtp
        id Qf1r280073Qogd106f1ru7; Mon, 26 Sep 2022 17:01:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocpcE-006Jcl-N0; Mon, 26 Sep 2022 17:01:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocpcE-00DO39-3d; Mon, 26 Sep 2022 17:01:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: r8a779g0: Add SYS-DMAC and MSIOF clocks
Date:   Mon, 26 Sep 2022 17:01:47 +0200
Message-Id: <cover.1664204336.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

This patch series adds more clocks for the R-Car V4H SoC, to make use of
DMA and SPI.
I plan to queue these in renesas-clk-for-v6.2.

Thanks!

Geert Uytterhoeven (2):
  clk: renesas: r8a779g0: Add SYS-DMAC clocks
  clk: renesas: r8a779g0: Add MSIOF clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
