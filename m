Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C1B546324
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 12:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344609AbiFJKGF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 06:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347669AbiFJKGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 06:06:01 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34BCB7157
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 03:05:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6907:80d7:a5b:48f8])
        by xavier.telenet-ops.be with bizsmtp
        id hN5x2700R35NJNs01N5xz5; Fri, 10 Jun 2022 12:05:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzbWf-003RLI-5e; Fri, 10 Jun 2022 12:05:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzbWe-00BJkh-Cv; Fri, 10 Jun 2022 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/3] arm64: renesas: defconfig: Miscellaneous updates
Date:   Fri, 10 Jun 2022 12:05:52 +0200
Message-Id: <cover.1654855338.git.geert+renesas@glider.be>
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

Here is a set of updates for the defconfig for Renesas ARM systems.
As usual, this is not intended for upstream merge, but to be applied to
the topic/renesas-defconfig branch of my renesas-devel repository.

Thanks for your comments!

Geert Uytterhoeven (3):
  arm64: renesas: defconfig: Refresh for v5.19-rc1
  arm64: renesas: defconfig: Enable HyperFlash support
  arm64: renesas: defconfig: Enable PSCI CPU idle Driver

 arch/arm64/configs/renesas_defconfig | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
