Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF58D2F366A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391055AbhALRC1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:27 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:33513 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390860AbhALRC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470775;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=r7VhKvUlM4/oNnfVRubKY5/DW8XlKdVwKpXttH1gKeI=;
        b=MAkn2vqw47Rbem+52rmWuoDpwm72oY5uq6kDlB2A2dSPiuwBTKYBEZWdR2KNtehl3V
        NS4mSgwMfZRpkXOxjxdq84ha86RjecsXmrl0NsNHJxenApdRqnBvx8A0I1cGbP+GzFuW
        XkHoUtWEybEmS9/iPjfHzd1WQ4ia66MKdC1rN2XbV+orqR2o5Y4iYWNQE4zyKgh4Q7jx
        GTcgREIYfloJv6YhJ/+oGL1sQKrusi1WnBWUzNYvgvzZC2nMZFYAdhUZoWAShJgfLLvz
        ShRP/9XoxeSZ+Tix7UXCv2+DdM/odZisP67ITgjf6qaQ3Um2u5tTGV+HhDZ3CjJTdvzx
        LDYQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxTNUK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:29 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 6/6] dt-bindings: pinctrl: sh-pfc: Document r8a779a0 PFC support
Date:   Tue, 12 Jan 2021 17:59:12 +0100
Message-Id: <20210112165912.30876-7-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165912.30876-1-uli+renesas@fpond.eu>
References: <20210112165912.30876-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document PFC support for the V3U (R8A779A0) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 5b5b1b9d2ec7..0adb18d8a9a9 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -43,6 +43,7 @@ properties:
       - renesas,pfc-r8a77980    # R-Car V3H
       - renesas,pfc-r8a77990    # R-Car E3
       - renesas,pfc-r8a77995    # R-Car D3
+      - renesas,pfc-r8a779a0	# R-Car V3U
       - renesas,pfc-sh73a0      # SH-Mobile AG5
 
   reg:
-- 
2.20.1

