Return-Path: <linux-renesas-soc+bounces-25891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB45CCC7B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFC74302989F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7D7355051;
	Thu, 18 Dec 2025 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="X0hFvBAZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay71-hz1.antispameurope.com (mx-relay71-hz1.antispameurope.com [94.100.132.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393735502C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071326; cv=pass; b=hAQ5OJLQyKMgI1SjUrwl56iHALQrmrp5ED/Alrcn8QT5XiWvGKG2I5+nEbiV41+CSFddKgndXe01A6gsQ0iHxQSmd4bY4K4F4GlRg/sGeqAyPau1MEUHuJKwdVVsCTAFpravaaSTIbDoSjEliy0cXWgWGNfZf9L3xvFOlM2FsJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071326; c=relaxed/simple;
	bh=0QtQfNoo5zcJjIoBusJcUUqMqAgbQeNJiAM30UXwxcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuizQ2boxI7JReklTm07cRU68BRPAcbe3/pmOpfUkPKjar19XCic00OInxCl/77j8PkefSep7Vd5wunlRlwsRelmltqUOgxvm4Rswei3tufSL/WD4zHSMtcn2H9IEl5Vi+4I4M04mcm6gycZA8KDIgjrak+x4OkQOnoPE0rnoHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=X0hFvBAZ; arc=pass smtp.client-ip=94.100.132.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate71-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071293;
 b=asxbn6dmF9s8eMaasW5UfcFZESZI3zjeeg3zhnyQyFChyyuK+WJ9Lanjgcfs/tl+zAdeF+DV
 o6KMKyS9+ytlBNDqBHn/PAS8LcM1o2js6JZZTZsShTWepvYQHAygr0zRMM6W2BtOgTihDD7kZJo
 ZVCW5ZAU5FSU/suGl4NkpcgsaW2bhPzEx20D3ps5H7pHljEPt+ywOo4dWVZ345WAbGNMDKXsXz0
 RSZufci2q1vSFUR3F44//g4vSC08d31DcfOAJge0amm2XgS8ztoTR+wLhdM0ypTRC3zQTHEDTvY
 q5OZj8AA2c7vysvmWBa+JWnaXxuFLhIrqId1pDKHcG9NQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071293;
 b=CtnTno0IA8JDROM8QvFcuZBvy9lzjqgKBrTkEBnaS/4KJWnBHCfvKOI/w1sNILUXRWwYygZK
 skr+Hc5BmE9rZOEfdsHNl3KAjMSS1zCoeDVSGEcqCv7YHdhLxT4JVu3MRPvIQMq9DvDHrgNPo2G
 W2vbBXIdtr2FssCnqbN1G1wjhZ47cV/ksib/HNOfMA6cwCpSrd7LtkDet+Jly69sfhPClTXhjsB
 lNi9aLNTEWas4tIAkYhQ8pjLY2Qz7ZTyer68YgNfhaxCND9zo4xymt3W1SnB8P3suWP0cmv1j4x
 lH7Q2SWRRvhPfOFIH30nAzwLNlrob+Xg4K+rhl+DCVrcA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay71-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:33 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6B138CC0D7B;
	Thu, 18 Dec 2025 16:21:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 18 Dec 2025 16:20:51 +0100
Message-ID: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay71-hz1.antispameurope.com with 4dXDs34QP3z3fwGG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:66d9300a35196336384c9a16144f2bee
X-cloud-security:scantime:2.419
DKIM-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071292; v=1;
 b=X0hFvBAZwprs/umABmHrxCuU+o4zex1/EW2iTssTbeTS8SGZxgE35NhsdNPYI8ZRahf2XiVw
 qpkAB6LUA7HIg3QjNwmE9sVfkt9jED9uh9TkqyY+aIOsthURm9WbfyQ5qn9sJIplz8+EQcUM/6E
 WbBVHTW317+zR8M2Y42qg88hmzVNU2VEmP+OYYP6Nggy0k6ZOciCVGuld7l5xRIvRuhSjD+ecdz
 gCtqebtZZ9t6U49QwYa2RtzewfXQHh0w9eP+pzKZdIV1HXKRj6iawC49V38qT9yVx60TVxGX2Z4
 yr+j2zLhwkDcV1ynzbmRcSxJQDyUJYCjRA+JOiYkLlkog==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index dfe9fa5c4dbc4..6384b36b6f385 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1401,6 +1401,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


