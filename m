Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6829D41B810
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 22:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242638AbhI1UKE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 16:10:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:60854 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242643AbhI1UKD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 16:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=UGvGeAAprZ3MW+
        UV1/y4GsGrKriFpX7VMGJ4v/EgCGo=; b=zkeIViSYKTf+LFMrFRS3iF0OvPi47Z
        8dr5BeIateCA4nvs6sd5trfksQmcFz8huJqVuTOE47Dc4L2ha2bWPN9DH6bLfWNH
        cYShEZ5RaKrMR0rzmuPMQ7brWgEMWJriiOeYqkMIts4et+vpl3nkSsRE+lCYqEQk
        GMjyusJauSeaI=
Received: (qmail 1377374 invoked from network); 28 Sep 2021 22:08:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 22:08:20 +0200
X-UD-Smtp-Session: l3s3148p1@/URjxhPNfNIgAwDPXxnDADNsFyRXxb9N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 6/9] dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
Date:   Tue, 28 Sep 2021 22:08:01 +0200
Message-Id: <20210928200804.50922-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 9f1e7092cf44..762a424ca76e 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -132,12 +132,13 @@ allOf:
       properties:
         clocks:
           minItems: 1
-          maxItems: 2
+          maxItems: 3
         clock-names:
           minItems: 1
           items:
             - const: core
             - const: cd
+            - const: clkh
 
   - if:
       properties:
-- 
2.30.2

