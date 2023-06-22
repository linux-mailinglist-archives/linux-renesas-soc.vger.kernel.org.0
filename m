Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09D2739D4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 11:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjFVJdP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 05:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjFVJcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 05:32:00 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448DD44A3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 02:23:20 -0700 (PDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4Qmw063bXfz4x07Q
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 11:23:18 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
        by albert.telenet-ops.be with bizsmtp
        id C9PJ2A0091yfRTD069PJqL; Thu, 22 Jun 2023 11:23:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGX6-000ByV-ED;
        Thu, 22 Jun 2023 11:23:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGX8-003Vzh-0H;
        Thu, 22 Jun 2023 11:23:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7740/armadillo800eva: Add LCD support
Date:   Thu, 22 Jun 2023 11:23:13 +0200
Message-Id: <cover.1687417585.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the two LCD Controllers (LCDC) on the
R-Mobile A1 SoC, and for the 5" WVGA TFT LCD panel on the
Armadillo-800-EVA development board.

For proper operation, this depends on:
  1. Commit 410bb21319f69c2e ("drm/panel: simple: Add Ampire
     AM-800480L1TMQW-T00H") in drm/drm-next,
  2. Patch series "[PATCH 00/39] drm: renesas: shmobile: Atomic
     conversion + DT support"
     https://lore.kernel.org/r/cover.1687423204.git.geert+renesas@glider.be
  3. Enabling CONFIG_DRM_SHMOBILE instead of CONFIG_FB_SH_MOBILE_LCDC.

Thanks for your comment!

Geert Uytterhoeven (2):
  ARM: dts: r8a7740: Add LCDC nodes
  ARM: dts: armadillo800eva: Add LCD panel

 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 28 +++++++-
 arch/arm/boot/dts/r8a7740.dtsi                | 65 +++++++++++++++++++
 2 files changed, 91 insertions(+), 2 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
