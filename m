Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD66C1BD8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 17:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbjCTQgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 12:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjCTQgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 12:36:17 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E6CDBF3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:30:14 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id agWC290071C8whw01gWCVs; Mon, 20 Mar 2023 17:30:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIO3-00E2uu-7f;
        Mon, 20 Mar 2023 17:30:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIOi-007SSo-1k;
        Mon, 20 Mar 2023 17:30:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] dt-bindings: clock: r8a7779: Add PWM module clock
Date:   Mon, 20 Mar 2023 17:30:05 +0100
Message-Id: <1397b517fccbe716a71cfae770512ed577730a25.1679329211.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679329211.git.geert+renesas@glider.be>
References: <cover.1679329211.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the module clock used by the PWM Timers on the Renesas R-Car H1
(R8A7779) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r8a7779-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/r8a7779-clock.h b/include/dt-bindings/clock/r8a7779-clock.h
index f0549234b7d87e4c..342a60b11934b4b1 100644
--- a/include/dt-bindings/clock/r8a7779-clock.h
+++ b/include/dt-bindings/clock/r8a7779-clock.h
@@ -19,6 +19,7 @@
 #define R8A7779_CLK_OUT		7
 
 /* MSTP 0 */
+#define R8A7779_CLK_PWM		5
 #define R8A7779_CLK_HSPI	7
 #define R8A7779_CLK_TMU2	14
 #define R8A7779_CLK_TMU1	15
-- 
2.34.1

