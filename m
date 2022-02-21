Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7D94BE743
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 19:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379511AbiBUPtW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 10:49:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379480AbiBUPtW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 10:49:22 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3314E240A4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 07:48:58 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by andre.telenet-ops.be with bizsmtp
        id xrow2600X3YJRAw01row3q; Mon, 21 Feb 2022 16:48:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAvo-001TX9-9Y; Mon, 21 Feb 2022 16:48:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAvn-006Eqr-PD; Mon, 21 Feb 2022 16:48:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: renesas: Add R-Car S4-8 Pin control support
Date:   Mon, 21 Feb 2022 16:48:52 +0100
Message-Id: <cover.1645458249.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds pin control support for the Renesas R-Car S4-8
Soc on the Spider board, and enables pin control for the serial console.

Changes compared to v1[1]:
  - Drop register banks 4-7, as they can only be accessed from the
    Control Domain.

Serial console and I2C[2] have been tested on the Renesas Spider
development board.

Thanks for your comments!

[1] "[PATCH/RFC 00/15] arm64: renesas: Add-R-Car S4-8 Pin control support"
    https://lore.kernel.org/r/cover.1642599415.git.geert+renesas@glider.be
[2] "[PATCH 0/3] arm64: dts: renesas: spider: Add I2C and EEPROM support"
    https://lore.kernel.org/r/cover.1643898884.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a779f0: Add pinctrl device node
  arm64: dts: renesas: spider: Complete SCIF3 description

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 23 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |  6 +++++
 2 files changed, 29 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
