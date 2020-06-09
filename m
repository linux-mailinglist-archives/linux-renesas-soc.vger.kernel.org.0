Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2741F3ADD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgFIMqX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgFIMqV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5272C05BD1E;
        Tue,  9 Jun 2020 05:46:20 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A22231F;
        Tue,  9 Jun 2020 14:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706776;
        bh=a7uVQzE49137RdV07bw9OGdl1LVEpyOGkBAVLWh288A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=taZU2srR0rq3tgq0s/XYJ2NbHuZs6zcUWj6cz+aBT1b1hB61FHXbyOHh9JXUzTZ12
         LVQwPXpUuMpxeZ/R4EJSZbNfQblSD22m3FzzTFP0XOvUygWwbDAMGb3vTHEEd6Wxpt
         tF41LyJbmXKQ7v6f5wO7MMyx34q6QqND8H+03DB8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Jiri Kosina <trivial@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/17] arch: arm: mach-davinci: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:45:54 +0100
Message-Id: <20200609124610.3445662-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm/mach-davinci/board-da830-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index a273ab25c668..1076886938b6 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -266,7 +266,7 @@ static struct mtd_partition da830_evm_nand_partitions[] = {
 	}
 };
 
-/* flash bbt decriptors */
+/* flash bbt descriptors */
 static uint8_t da830_evm_nand_bbt_pattern[] = { 'B', 'b', 't', '0' };
 static uint8_t da830_evm_nand_mirror_pattern[] = { '1', 't', 'b', 'B' };
 
-- 
2.25.1

