Return-Path: <linux-renesas-soc+bounces-32084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG7OGfHr+WkLFQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 15:09:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 617EF4CE2EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 15:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F19EC3026984
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C122436371;
	Tue,  5 May 2026 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSwjKVLp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E5353EF3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985969; cv=none; b=gpXThOUFO+dHQuPbqgSsGtUev+h1DDeN6WNQWoSJ7O36ko3xjWsxi0QL9p9svP8jJfVQl5HECPQ/utmeGiB+kraJELDYz9vnkl9nfG+NBMQuvQuPoL5gUQ9aWL04N1QsgUasTRF7Fa5N7TlcVuyZw2lAAyACcPrUReBFDMeDmc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985969; c=relaxed/simple;
	bh=xLLJmmx50oSlGKdUkZVPjs7CGWjZQyika3p/VZELo88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=av3r+MzFCt8s5+MKnU0la51gFm3dLQMdAe/y/6Q8N8vow+iZGq6vnfisVVARBu2fF1wSf5K58uRks6aSvJk0SUjXD4nD6gxWXuIwsqORpxdy/a3jbc64nan13ywbkhH60dR2QYVbWY84/GkY7+2hroDgRFUWjJf8BYVl8i1Vxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSwjKVLp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba840146so45858225e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985966; x=1778590766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS7Uy+MARv0IhyXez5pJGX7FKzDu8eOlfgH3HpZCrpg=;
        b=GSwjKVLpUVa6Zz578R+Yx7agyJnL/OBSkcvkAGjZTLSXdGKOCnw/ofzBPxWyv2jd7U
         M2D1ONVSmTPynxl/YYKYPZYkHyLx2ksKpC1ulxyocwjQvBFNffOQqq8TOn5OeUYzNfDj
         TJHM3x+PaJMWfP8fGLtvfoRwFOztN9C1069rc3Y9Ca7TAvl+SOecs7G7TQrFiJiEUwvV
         ktC5YhDBhYsizIlRVk9+oQoWUn38As2zr0RBpHP1EjPkQSvzi1Y1mQSIsJwJmjYQx/AG
         CGhh9wX1PPCVQ9h1tRCG4UPvdSGfoTsq/vE1rI0lZUAk+AyhcnoE2EVS8i4cwPoqz5xg
         PcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985966; x=1778590766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kS7Uy+MARv0IhyXez5pJGX7FKzDu8eOlfgH3HpZCrpg=;
        b=Bcyn3rThsrMwIGC8qlsPXeFdQkkKjGfGCTPGBpq/RwDvn+iG+XxNTzgRU7aVXIbVFh
         /tsZ/lbX9Ocb5y8W/2y5gnCsxlCV7GCuWwoUsUopIuC0CB85ZAhB84BfG2M4z/p/PBcx
         1x9gV5H+BLG3Ziv6iFI+fvjb3e3uLUjtBNi+Duth6vmnQBpejuJgU1teKS1ZmMlRjXx7
         ipCakMjl3OO1KGijqakMsB1uFaY0uEzv3iuTlFZDo4ENr1ncQOBNIUVhC3o7rmv4wD9f
         Xg09sNcArOumfb0GJCSgLoun0wwb7b/qbSAK7nz4pq9PzUzSpqrkTADG5h4MYrfe4i7y
         nUYw==
X-Forwarded-Encrypted: i=1; AFNElJ+4jZZaS9gK4HyDnEaV67AIlY3K9TKF9spAQpkVBzEyl8CeudXNTFhYbJRl+yDrDtPbOlnb30uID8cIyCdM5AA7Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxju10D2ChUPxlHYUD6g3bZB3aAxgOYcpJUCpItgKVZyfjWq+tj
	rtPXJeY5SJZ3PRMBpQrq+5f5efcun9t3vXl7g03KlDa85aBzfaw1Ow/W
X-Gm-Gg: AeBDievGuxCg+ds/n0WBimhQdkE7Yxq2O04VbjuDQdIOixTTPiVQxTn8HF1Wj2UiRcc
	f+IIxf6RJFn2TaUOMMpicVJWopGMUSI+yYrWX6zwjgqUfqZHh4J7R7B9tUV1m+fz9G9cHV9afLk
	UUtqeEFSW85EUaXHu6ltyokAFG+qN+JKArwI4x76nOCzXR2cWEGcLCg0zkSABchb9AXnTcqQ1YR
	4GsF55BajQyxHnqIuXBXJk40+43ME42xOrfItKGs2glOnzlLwQZs9rw5gHfqRaafjUKpxjN1x8+
	LDHLSFrund+HxB5erse7Wenezei/uND4u1kGiI9nmo5eoUTjK3AtWFfM+zbPK6uIpdfoBxSaWD8
	v/n0Ds7fobg6NZbQKTD2mSExOndcRysbW7wwQxjdIQNIbeGWY6ZeDwLODlJZvLtkAX9Lrq4PkPR
	Jn/iSMz/P7nM0J4MSPmL1e6cA6O4j/f7eBpQwso/KuOeeJsRybYHVP1fkMEl0=
X-Received: by 2002:a05:600c:198a:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-48d18be8185mr48151255e9.22.1777985965879;
        Tue, 05 May 2026 05:59:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm625634745e9.9.2026.05.05.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:59:25 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add wdt device node
Date: Tue,  5 May 2026 13:59:16 +0100
Message-ID: <20260505125921.149682-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 617EF4CE2EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32084-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.195.83.32:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,0.189.53.128:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SOC has 3 watchdog timer channels:
 wdt channel0(wdt0) for Cortex-A55-CPU Non-Secure
 wdt channel1(wdt1) for Cortex-A55 CPU Secure
 wdt channel2(wdt2) for Cortex-M33 CPU

Add wdt0 node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 55cbae6ca8d4..930873ae7786 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -875,6 +875,20 @@ gic: interrupt-controller@12400000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		wdt0: watchdog@12800800 {
+			compatible = "renesas,r9a08g046-wdt", "renesas,rzg2l-wdt";
+			reg = <0 0x12800800 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A08G046_WDT0_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_WDT0_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A08G046_WDT0_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0


