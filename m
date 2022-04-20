Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195C5509185
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 22:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243002AbiDTUqC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 16:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbiDTUqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 16:46:00 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7087F340F6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Apr 2022 13:43:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,276,1643641200"; 
   d="scan'208";a="118604783"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Apr 2022 05:43:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.29])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F04AE400F4E5;
        Thu, 21 Apr 2022 05:43:10 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/13] soc: renesas: Add RZ/V2M (R9A09G011) config option
Date:   Wed, 20 Apr 2022 21:43:07 +0100
Message-Id: <20220420204307.87343-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330154024.112270-1-phil.edworthy@renesas.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a configuration option for the RZ/V2M SoC.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/soc/renesas/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdc99a05a7e0..9440d4e510c0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -308,6 +308,13 @@ config ARCH_R9A07G054
 	help
 	  This enables support for the Renesas RZ/V2L SoC variants.
 
+config ARCH_R9A09G011
+	bool "ARM64 Platform support for RZ/V2M"
+	select PM
+	select PM_GENERIC_DOMAINS
+	help
+	  This enables support for the Renesas RZ/V2M SoC.
+
 endif # ARM64
 
 config RST_RCAR
-- 
2.32.0

