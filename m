Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCCA7C9F2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 07:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjJPFsp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 01:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjJPFsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 01:48:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2301AE4;
        Sun, 15 Oct 2023 22:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=lk2hjH1J0z+vDraZqP1FiMVLedAUOQE0Xu6QSSkdeMA=; b=IkODTfco0inGQHF15O+RlwwVUO
        uyzV4qCSEoVwBecQK2ZtYgWfG55JGXH4i4m0yYkdWNozPWmlrpmGxjo3844SQlwA1agw0Qud1EH3g
        wPcOkezghCHw/1fMp1HrZiMKLQyNBJENnYgGrg+qjnTFpNpr6oqEGLfB6c6UEqVLIA0BU0nZ1XI6L
        O3Mcsr5dvr9V5U/JeSZ6eVdISZ5eokTIVUc5KoPdAGaDZpaoSof5Op3RgnSq6+uv5sBY7PFyXchn7
        ZcfqYW9ivyW/BLXe4HSi0ynWkJoZLdYX5UHlOzRuvJzes54o/zmL13LaW7d8PxPBNeeu3wFXkxGq+
        OMDVkeww==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsGSq-008R1r-2l;
        Mon, 16 Oct 2023 05:48:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: [PATCH 12/12] m68k: remove unused includes from dma.c
Date:   Mon, 16 Oct 2023 07:47:54 +0200
Message-Id: <20231016054755.915155-13-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
References: <20231016054755.915155-1-hch@lst.de>
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

dma.c doesn't need most of the headers it includes.  Also there is
no point in undefining the DEBUG symbol given that it isn't used
anywhere in this small file.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/kernel/dma.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index eef63d032abb53..16063783aa80c6 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -4,17 +4,8 @@
  * for more details.
  */
 
-#undef DEBUG
-
 #include <linux/dma-map-ops.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/scatterlist.h>
-#include <linux/slab.h>
-#include <linux/vmalloc.h>
-#include <linux/export.h>
-
 #include <asm/cacheflush.h>
 
 #ifndef CONFIG_COLDFIRE
-- 
2.39.2

