Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5B02A0017
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgJ3IdP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:33:15 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56416 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgJ3IdO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:33:14 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 9F43A3C057F;
        Fri, 30 Oct 2020 09:33:11 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bMSDwdgJbKdM; Fri, 30 Oct 2020 09:33:06 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 45E2C3C058B;
        Fri, 30 Oct 2020 09:31:52 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.94.31) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 09:31:51 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v2 3/3] dt-bindings: arm: renesas: Add R-Car M3-W+ ULCB with Kingfisher
Date:   Fri, 30 Oct 2020 09:30:51 +0100
Message-ID: <20201030083051.18752-4-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201030083051.18752-1-erosca@de.adit-jv.com>
References: <20201030083051.18752-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.94.31]
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the use of the Kingfisher expansion board with the R-Car
Starter Kit Pro equipped with an R-Car M3-W+ (aka M3-ES3.0) SoC.

Inspired from v5.5 commit 24169f0a453754 ("dt-bindings: arm: renesas:
Add R-Car M3-N ULCB with Kingfisher").

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---

v2: Newly added
v1: NA
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index ff94c45eefb0..fe11be65039a 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -245,6 +245,7 @@ properties:
           - enum:
               - renesas,r8a7795
               - renesas,r8a7796
+              - renesas,r8a77961
               - renesas,r8a77965
 
       - description: R-Car M3-N (R8A77965)
-- 
2.29.0

