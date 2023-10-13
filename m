Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E3D7C85C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbjJMM0z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjJMM0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:26:55 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65678BD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 05:26:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by michel.telenet-ops.be with bizsmtp
        id xQSm2A00g56FAx306QSmrh; Fri, 13 Oct 2023 14:26:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHFb-006Gfe-5a;
        Fri, 13 Oct 2023 14:26:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHFe-002JL0-Hn;
        Fri, 13 Oct 2023 14:26:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.6 (take two)
Date:   Fri, 13 Oct 2023 14:26:44 +0200
Message-Id: <cover.1697199963.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

The following changes since commit c1ec4b450ab729e30d043e927fdfcc9f764f61b7:

  soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE (2023-10-05 15:07:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.6-tag2

for you to fetch changes up to 1531309aa2092a96c092fa662863ffa53da3ba93:

  soc: renesas: Make ARCH_R9A07G043 depend on required options (2023-10-12 19:46:49 +0200)

----------------------------------------------------------------
Renesas fixes for v6.6 (take two)

  - Fix build failures due to missing RZ/Five dependencies.

Note that this conflicts with renesas-drivers-for-v6.7-tag1, which I
have sent a PR for two weeks ago, but which you haven't merged yet.
The proper solution is to take the ARCH_R9A07G043 section from
renesas-fixes-for-v6.6-tag2.

Thanks for pulling!
----------------------------------------------------------------
Conor Dooley (1):
      soc: renesas: Make ARCH_R9A07G043 depend on required options

 drivers/soc/renesas/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
