Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AE37CD384
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 07:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjJRF1H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 01:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjJRF1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 01:27:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D04EA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 22:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=x5ptCfsg9O1HYYf76yB/HYRE+aWyZspmFlULsvzlzxs=; b=EEX7yVzL2jqdUpXDrzbCf/ASzr
        6uImQH4dWtc0YcIMuMTIGdhfLX6dIrl/y+IU1YA2Vq+TgzAKAT5W+N2lnhG7ZjTrXqe1b95oCe+I+
        WTcvCauoAy/K41m3FQX5Im67b2Rr2p0BqXMDnUcDrZHFJ6Q6FUyiu/zrFoLXF1vhuQM4C0Eo3opJ7
        IgiJIEj2SCAOkWujk/o+uihy7IOq2A4IrI2obzEJwLgAQe94ThSMkD0bo+xXrjC7ROVhP9T1BzJzv
        m7q2hntGnQrS51qiopoevjsYakimCsFKmWbBDZYGWhMzWvGdwkLRldFSLBAxTambg0gC5x04yrJYG
        KPTue/uw==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsz59-00Dp3K-2I;
        Wed, 18 Oct 2023 05:27:00 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/3] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
Date:   Wed, 18 Oct 2023 07:26:52 +0200
Message-Id: <20231018052654.50074-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
References: <20231018052654.50074-1-hch@lst.de>
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

