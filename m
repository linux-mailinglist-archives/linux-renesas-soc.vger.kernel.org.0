Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6617654AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 15:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjG0NNQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 09:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjG0NNP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 09:13:15 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B802122
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 06:13:14 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by xavier.telenet-ops.be with bizsmtp
        id SDDC2A00U4qLm8F01DDCda; Thu, 27 Jul 2023 15:13:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qP0nb-002d2H-FG;
        Thu, 27 Jul 2023 15:13:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qP0no-00AYDT-IV;
        Thu, 27 Jul 2023 15:13:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.5
Date:   Thu, 27 Jul 2023 15:13:09 +0200
Message-Id: <cover.1690463347.git.geert+renesas@glider.be>
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

	Hi soc folks,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-fixes-for-v6.5-tag1

for you to fetch changes up to 4c188fa183ebb45238ef16504c4c7606955cf9d4:

  arm64: dts: renesas: rzg2l: Update overfow/underflow IRQ names for MTU3 channels (2023-07-25 11:40:34 +0200)

----------------------------------------------------------------
Renesas fixes for v6.5

  - Fix interrupt names for MTU3 channels on RZ/G2L and RZ/V2L.

The devices nodes with the incorrect names were added in v6.5-rc1.
Fix them now, so they won't end up in a released version.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: rzg2l: Update overfow/underflow IRQ names for MTU3 channels

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
