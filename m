Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1997D7F98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Oct 2023 11:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjJZJcL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Oct 2023 05:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZJcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Oct 2023 05:32:10 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6780418F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 02:32:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:32d3:3cb9:edce:43ae])
        by xavier.telenet-ops.be with bizsmtp
        id 2ZY22B00H2XL1Wb01ZY2ML; Thu, 26 Oct 2023 11:32:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qvwiY-007YWQ-69;
        Thu, 26 Oct 2023 11:32:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qvwig-00GTfi-3b;
        Thu, 26 Oct 2023 11:32:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Christoph Hellwig <hch@lst.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor@kernel.org>,
        linux-riscv@lists.infradead.org
Subject: [GIT PULL] Renesas fixes for v6.6 (take three)
Date:   Thu, 26 Oct 2023 11:31:57 +0200
Message-Id: <cover.1698312384.git.geert+renesas@glider.be>
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

The following changes since commit 1531309aa2092a96c092fa662863ffa53da3ba93:

  soc: renesas: Make ARCH_R9A07G043 depend on required options (2023-10-12 19:46:49 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.6-tag3

for you to fetch changes up to 9eab43facdadb7d00456c2657001ae2e5353c814:

  soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM (2023-10-26 09:42:38 +0200)

----------------------------------------------------------------
Renesas fixes for v6.6 (take three)

  - Sort out a few Kconfig dependency issues for the rich set of RISC-V
    non-coherent DMA support.

Thanks for pulling!

----------------------------------------------------------------
Christoph Hellwig (3):
      riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
      riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
      soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM

 arch/riscv/Kconfig          | 3 +--
 arch/riscv/Kconfig.errata   | 1 +
 drivers/cache/Kconfig       | 2 +-
 drivers/soc/renesas/Kconfig | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
