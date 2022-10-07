Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5875F7A79
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiJGPZE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 11:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiJGPZD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 11:25:03 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79BB41D07
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 08:25:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by laurent.telenet-ops.be with bizsmtp
        id V3R02800D5Lh0ZK013R0P2; Fri, 07 Oct 2022 17:25:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogpDf-000ufD-Ut; Fri, 07 Oct 2022 17:24:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogpDf-00CQIL-FE; Fri, 07 Oct 2022 17:24:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a779g0: Add remaining (H)SCIF nodes
Date:   Fri,  7 Oct 2022 17:24:56 +0200
Message-Id: <cover.1665156023.git.geert+renesas@glider.be>
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

	Hi all,

This patch series adds devices nodes for the remaining Serial and High
Speed Serial Communication Interfaces with FIFO ((H)SCIF) on the Renesas
R-Car V4H (R8A779G0) SoC.

Changes compared to v1[1]:
  - Replace S0D3_PER by SASYNCPERD1, as per R-Car V4H Hardware User's
    Manual rev. 0.54.

SCIF[134] and HSCIF[13] can be accessed on expansion connectors on the
White Hawk BreatOut Board using DT overlays available from [2].  They
have been tested with a logic analyzer (to verify clocking) and with
external loopback.

I plan to queues this series in renesas-devel for v6.2.
Thanks for your comments!

[1] https://lore.kernel.org/r/cover.1665065132.git.geert+renesas@glider.be
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
