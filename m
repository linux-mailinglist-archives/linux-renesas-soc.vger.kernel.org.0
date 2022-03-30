Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8742D4EC888
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 17:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344900AbiC3PnX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 11:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239041AbiC3PnW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 11:43:22 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A53C033E3E;
        Wed, 30 Mar 2022 08:41:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,223,1643641200"; 
   d="scan'208";a="116202013"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2022 00:41:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B92FC400A6BA;
        Thu, 31 Mar 2022 00:41:34 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Al Cooper <alcooperx@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 05/13] serial: 8250: Make SERIAL_8250_EM available for arm64 systems
Date:   Wed, 30 Mar 2022 16:40:16 +0100
Message-Id: <20220330154024.112270-6-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330154024.112270-1-phil.edworthy@renesas.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is needed for the Renesas RZ/V2M (r9a09g011) SoC.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index cd93ea6eed65..fdb6c4188695 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -380,7 +380,7 @@ config SERIAL_8250_DW
 config SERIAL_8250_EM
 	tristate "Support for Emma Mobile integrated serial port"
 	depends on SERIAL_8250 && HAVE_CLK
-	depends on (ARM && ARCH_RENESAS) || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	help
 	  Selecting this option will add support for the integrated serial
 	  port hardware found on the Emma Mobile line of processors.
-- 
2.32.0

