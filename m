Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C0B52016D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 17:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238578AbiEIPuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 11:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238580AbiEIPuO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 11:50:14 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379A91D7341;
        Mon,  9 May 2022 08:46:12 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 13879200003;
        Mon,  9 May 2022 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652111171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AeURFA21azT2WZg6+haUTuGeT1PTBOnmz+vdgDPsEgY=;
        b=Jcc+lLWGNptb7ngZ58iDE317h9qxwhywG54JBrhfCbApP4Zu1pOkYFK3s5hkWiXxRKeTwq
        FYVgSEMOAP9H/4gQZVe/zNMpgHlk9DcGmzG8A72VWVixtsdXgIQtZe44S4tDUsvvX9PdGK
        bykHTnwCiNe3vsjh5JgMxv39biP4vLlEkIxWv78LjeiedPV1mvdi/1X1UADQa0Xzmpx5PV
        LhP4NG8lKJBkwzeVeyBsb0zRFePmjJxDRbykJ9T5pIk0WJ5EUpGD5lmoduAumrOqjh9ZPi
        URmc8nk7UoFJGhZOsFKNRNFI+eaJrVgG0J19/DMiVfYiWHi5QOkW43VpiBiI+g==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v4 5/5] MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver
Date:   Mon,  9 May 2022 17:45:59 +0200
Message-Id: <20220509154559.24851-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509154559.24851-1-miquel.raynal@bootlin.com>
References: <20220509154559.24851-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After contributing it, I'll volunteer to maintain it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cf74e4eacce..cc4a3cca022e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16847,6 +16847,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
 F:	drivers/iio/adc/rzg2l_adc.c
 
+RENESAS RZ/N1 RTC CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-rtc@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+F:	drivers/rtc/rtc-rzn1.c
+
 RENESAS R-CAR GEN3 & RZ/N1 NAND CONTROLLER DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.27.0

