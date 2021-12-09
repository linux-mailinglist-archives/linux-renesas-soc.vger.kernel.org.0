Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7158446E2ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 08:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhLIHL6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 02:11:58 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:50207 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233517AbhLIHL5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 02:11:57 -0500
X-IronPort-AV: E=Sophos;i="5.88,191,1635174000"; 
   d="scan'208";a="103324142"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Dec 2021 16:08:23 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B2B441F8153;
        Thu,  9 Dec 2021 16:08:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     geert+renesas@glider.be, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] tty: serial: sh-sci: Add support for R-Car Gen4
Date:   Thu,  9 Dec 2021 16:08:17 +0900
Message-Id: <20211209070817.1223888-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209070817.1223888-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211209070817.1223888-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add serial support for R-Car Gen4 SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 88005d2fc2a0..86731b816e3f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3181,6 +3181,9 @@ static const struct of_device_id of_sci_match[] = {
 	}, {
 		.compatible = "renesas,rcar-gen3-scif",
 		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_BRG_REGTYPE),
+	}, {
+		.compatible = "renesas,rcar-gen4-scif",
+		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_BRG_REGTYPE),
 	},
 	/* Generic types */
 	{
-- 
2.25.1

