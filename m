Return-Path: <linux-renesas-soc+bounces-32077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hJr9LIbn+WmdFAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:50:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C064CDEB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A683A30ACCD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5956E43CEE4;
	Tue,  5 May 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcOpWS0W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1943900B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984636; cv=none; b=BUQIDdn1YOKrLm0JsRn6RGp1CHMyfMG1Fritdnpv52M7jyCM9HL3JhJwopB9G6o99tYlrS88+iM/WQ0Tq4Qx9girjL1WRHcPhXjQcSFL0P5/8CEpVr9E6SpnhS8rskm3jnKQFKPCGWRYIa1kEAEoLN4NYYNciS877lJDjCxKFyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984636; c=relaxed/simple;
	bh=l+YxGbh0vYESNoONWJAuffS4F0yLNJmoeqbW59wLkjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejhbk3TIrAVH3shgWd+rjxwWvn2dKfOZSlXBRL/Qva+WMvnFNSArSJrmaZYKKKvj7+DOBby33uk37mnHqm4zykNYY/ZfO002aQOmHhEgTqL0OIJL4kRzvRGsa+7h+NkOJsoKskuqf05zztn3pOS+7lR859cfFacxZEOX4jahO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcOpWS0W; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2336539f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984633; x=1778589433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jYwAveFBg+VqPkY5Yc+/WN3dPnzXPR6td9wQJZBOYI=;
        b=jcOpWS0WFZZwH8yYdtM3ZCHgdt3IodEZs+VY6cW5CjHzxN5jmpTp4ydfh/p8TTl6RY
         WdpACG2KAUbJWpKx3FhDUMcSQ7qVIm8ArxuUaTLanmyk3ook7w6kLOUD+zmUVNI4H5gh
         d+iDH15gp4TI8xS4R51LUaG4dpcVpV58KTY5lliUIIqORWf1xBwgh+OoUxleY+sLQSO9
         7TOIlx3FvMgXHaMrHL+A8GQYixOXJSW6VifSIaXO2X6JzNaZCLEDK6kjhiUIuQdPjEWk
         IE8X7WfRhWiuSpu1jXksac5zy0OZTGiu1qvwsHdxTIREEyykCYPMlb/tjjWYqLrB8W+U
         LSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984633; x=1778589433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jYwAveFBg+VqPkY5Yc+/WN3dPnzXPR6td9wQJZBOYI=;
        b=C3FIOaMa5rXAuHJVkxUM6VjmymsQqQB5vAg8ZaSAxNEcCJN8L8d7FFJwrj+0BFPX19
         4f8UGNCFqTv+Q+d26w+gQW2CMME0FzNgMdckJp0IBKSDlJsGQw0pMFvIhtw5StE9TTWn
         fRNwlBjO3SsbDeeBL/ALOlkjfeUPa8fjso0mLvBa66tyyyMfdAYW0jCxXnE3OdOkL02j
         iqY4m9BBPfPMFeQf1ZvAtUCophCL6UUNljg/PvUkbtmqjVKxjrU1arRZUXMZSiUUlHsp
         20heVnFsp8yYOq+2LPdLqMaZ0rAeePwc79L61O1ibOC3zqlg1gM0qoONoqrLIdCJQeRZ
         OGKw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZgFvNiAQEb3cM77k8n5ndJspvvcxsjJctnuliu4ydxY5uNKY6np7gksarEXm0+MIyc5Oeo8yiCQlWnXoyGgGtRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqA0Z9Gp3cnbLEjEd8sijbHBpJhjN8LjkkSt6O/C0Y0eA/tYl4
	Iy6wtBGtJx/MEwuip8fWkhoTfMvkZXbQdGp6lhZVNY4s9PsvYN7O/Mp/
X-Gm-Gg: AeBDieuNjvzcOLab+knlk3ywUDhnhJfEateihR8Fbv+KOXYdL8aGJzzXIIz/n4OA6fc
	V+QiGsGGgSGqfEdPiHtQogDFzG2qzArBlRzwW0OULUg+7KgqW+yUzptuNByOFnro08gEOib2Ax1
	NEGPrSf8S9Gqj+yCYDb6U71aWC//TXWPDfz9DwRel8Ahv5l+FBaUtTP8tbn+ekx0VGuBqRt2Pn1
	FC1rTvRlvqRP3uyZZKCdv22IfppgbFHHoVx4Z2pTWZ5fiAxdIXlJKU7JiY6vg/4BOjg0FieZ/aP
	8GY1QqPTAttsA8uzgh56jRjEYhouAhA5BzF/ORKda4rKJoON3AUE1BVGBiTGOP9bqGE5ft3oT9K
	pRRv9ZdMF5MXuqjRinizynLYRvvRq3574hCjY7eUg/ywjNstlZ89PF7iLLUOWCYnyYLOeXE4YVS
	hdrdsMfBtlzeSFsxcoc3F8rpsZP7v8PhNwvNrJtGEECdvxklSBQ2XZ8ePybSXXxowWjZmRcA==
X-Received: by 2002:a05:6000:2283:b0:44f:db87:8919 with SMTP id ffacd0b85a97d-44fdb87893fmr6505204f8f.4.1777984632440;
        Tue, 05 May 2026 05:37:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/5] arm64: dts: renesas: r9a08g046: Add DMAC node
Date: Tue,  5 May 2026 13:36:59 +0100
Message-ID: <20260505123708.134069-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B1C064CDEB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32077-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[11c10000:email,renesas.com:email,0.168.156.16:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.180.91.224:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the DMA controller device tree node for the RZ/G3L (r9a08g046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 8abf4ec28df1..fa15e2ebc87c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -482,6 +482,43 @@ icu: interrupt-controller@11050000 {
 			resets = <&cpg R9A08G046_IA55_RESETN>;
 		};
 
+		dmac: dma-controller@11820000 {
+			compatible = "renesas,r9a08g046-dmac", "renesas,rz-dmac";
+			reg = <0 0x11820000 0 0x10000>,
+			      <0 0x11830000 0 0x10000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 160 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 161 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 165 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD R9A08G046_DMAC_ACLK>,
+				 <&cpg CPG_MOD R9A08G046_DMAC_PCLK>;
+			clock-names = "main", "register";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_DMAC_ARESETN>,
+				 <&cpg R9A08G046_DMAC_RST_ASYNC>;
+			reset-names = "arst", "rst_async";
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		sdhi1: mmc@11c10000 {
 			reg = <0x0 0x11c10000 0 0x10000>;
 			/* placeholder */
-- 
2.43.0


