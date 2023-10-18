Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58DA7CD386
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 07:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjJRF1L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 01:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjJRF1J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 01:27:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C4ABA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 22:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=G1q5kjKCly+YP8ujUn6bFejuAy7IU52U7erNsqEL50A=; b=AJt060LlpGen+lRt6knsoShqCI
        O1W/l3v+OgIWq/dNaMJb68oogx+fY6vgqblyV4Y1KRKaOyksT1vqfK5muDYgdHc5Rt+HToKaa46RU
        t938WpSxFTPYLhNAaHW2h2vNOlNXM8BRefy0BJpwFtZ/6G+WXtWM2RhmY5fbLy622gLDJ7Ph9yQTE
        Gnax+zzBMMmlmtocynwK7oZGEL447qHcAs+mnIseEMeDcR9l7Zv2/Yni4fvt6AKzm6sLEP0PoSSAD
        0pzr0tRkfqAeY38dz9SjP3tFzKzLdPYoWtprOPaiZnR2FCRoZXEHI/f923zQ3/ytp/9gXMXW+Y2A6
        xt4V1l9g==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsz5E-00Dp3w-1i;
        Wed, 18 Oct 2023 05:27:04 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 3/3] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
Date:   Wed, 18 Oct 2023 07:26:54 +0200
Message-Id: <20231018052654.50074-4-hch@lst.de>
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

ARCH_R9A07G043 has its own non-standard global pool based DMA coherent
allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
Add a proper dependency.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 335251ff6e8214..624185e09c967b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -341,6 +341,7 @@ config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
 	depends on RISCV_ALTERNATIVE
+	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE
-- 
2.39.2

