Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87B57CC55E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 15:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343894AbjJQN7n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 09:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343571AbjJQN7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 09:59:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCBAF5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=x5ptCfsg9O1HYYf76yB/HYRE+aWyZspmFlULsvzlzxs=; b=2w5gpe5BO9cLN6B8p3isGaNWF/
        R9bi7dmVKwtjaCOkdm2kFbBfgkO/mAl8paLWvRody1aWp5G8nKrHzFcCvfijPNpuKfhxYpmI87r6c
        2NBwP/8+GbjWIiOjZHzmfz8V5fKPhivc8pDK8OFrtLpgIvn2WWOvjRgyljBnr4h7H8s4GHMwcvh8m
        gZSGOT1pAOW6tfoVql0EQH0skqi7MXpqpNmr+AK7UFuEOjO1rNLzlRc0xoCz2beeKfm+T4W8okYe+
        XbIttyUisvxvUUvhqk3vHMdqGIqapkdF9BoWbAheZu7nj1tIVHV4crbWCt5/sBIOoOZGGQM0G91zU
        QNklU71w==;
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qskbg-00CTWU-08;
        Tue, 17 Oct 2023 13:59:36 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/3] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
Date:   Tue, 17 Oct 2023 15:59:24 +0200
Message-Id: <20231017135926.1240101-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017135926.1240101-1-hch@lst.de>
References: <20231017135926.1240101-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
helpers, which are built into the kernel unconditionally.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig    | 1 -
 drivers/cache/Kconfig | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6daf..0ac0b538379718 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -277,7 +277,6 @@ config RISCV_DMA_NONCOHERENT
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
-	depends on RISCV_DMA_NONCOHERENT
 	help
 	  This enables function pointer support for non-standard noncoherent
 	  systems to handle cache management.
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index a57677f908f3ba..d6e5e3abaad8af 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -3,7 +3,7 @@ menu "Cache Drivers"
 
 config AX45MP_L2_CACHE
 	bool "Andes Technology AX45MP L2 Cache controller"
-	depends on RISCV_DMA_NONCOHERENT
+	depends on RISCV
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
-- 
2.39.2

