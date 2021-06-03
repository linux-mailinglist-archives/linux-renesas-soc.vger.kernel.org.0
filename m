Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE6139ADA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 00:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhFCWUM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 18:20:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8051 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230265AbhFCWUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 18:20:11 -0400
X-IronPort-AV: E=Sophos;i="5.83,246,1616425200"; 
   d="scan'208";a="83343539"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2021 07:18:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5B5FE410B534;
        Fri,  4 Jun 2021 07:18:22 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 04/12] soc: renesas: Add ARCH_R9A07G044 for the new RZ/G2L SoC's
Date:   Thu,  3 Jun 2021 23:17:50 +0100
Message-Id: <20210603221758.10305-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add ARCH_R9A07G044 as a configuration symbol for the new Renesas
RZ/G2L SoC variants.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index b70bbc38efc6..71b44c31b012 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -279,6 +279,11 @@ config ARCH_R8A774B1
 	help
 	  This enables support for the Renesas RZ/G2N SoC.
 
+config ARCH_R9A07G044
+	bool "ARM64 Platform support for RZ/G2L"
+	help
+	  This enables support for the Renesas RZ/G2L SoC variants.
+
 endif # ARM64
 
 config RST_RCAR
-- 
2.17.1

