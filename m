Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F047763974
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 16:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbjGZOpE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 10:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbjGZOpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 10:45:03 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2750219A0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 07:44:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by baptiste.telenet-ops.be with bizsmtp
        id Rqkv2A00U4qLm8F01qkvNW; Wed, 26 Jul 2023 16:44:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfko-002Ym1-FD;
        Wed, 26 Jul 2023 16:44:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfl1-00A8Hg-Ix;
        Wed, 26 Jul 2023 16:44:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: renesas: r8a779f0: Add INTC-EX support
Date:   Wed, 26 Jul 2023 16:44:40 +0200
Message-Id: <cover.1690382328.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

This patch series attempts to support for the Interrupt Controller for
External Devices (INTC-EX) on the Renesas R-Car S4-8 (R8A779F0) SoC.

As I do not have physical access to a Spider development board,
I am sending this out to a limited audience, and hope someone can test
it, using patch 3/3.

Thanks for testing, and for your comments!

Geert Uytterhoeven (3):
  dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
  arm64: dts: renesas: r8a779f0: Add INTC-EX node
  [RFT] arm64: dts: renesas: spider: Add keyboard to test IRQ[0145]

 .../interrupt-controller/renesas,irqc.yaml    |  1 +
 .../boot/dts/renesas/r8a779f0-spider.dts      | 52 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 15 ++++++
 3 files changed, 68 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
