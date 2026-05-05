Return-Path: <linux-renesas-soc+bounces-32069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMLZLm/d+WkwEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:07:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABD4CD365
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 826FF30744BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22E0421EFB;
	Tue,  5 May 2026 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLRyMvUU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F5421EE1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982540; cv=none; b=P2FvtFwHyi/JI3Ds4rYM/YuRp13mfx6KKihcX2yMrHWsk1G1+AIiMcUidlioEnXMamemAReNz9h+MOgomRBVofpgCi+LPyNVdCWcbIZ+IZH2xp0YX6H2nUao66XgFh8UQp4CyVVYSV3Cj2hM1GQS5J0ZcmYFoMJsoX4mHRpdvNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982540; c=relaxed/simple;
	bh=iA6K6/j/vhji99S0WfixUH7St/tRWB+5S6SSkf5NosM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inogf01b8/kW9GO2bH6Px+Ty8X1HpOHQzSAo4FVySQfsWOA1eqprz5uWXFksxdJ1Y2Vh8SbgKUEiDzXZ4P1fDcZ0scacF20eabp6HPF5OP0rovElGolgksF0jBXqk2yLdoJ2olKv8QPBPflgk4xdwiMNm4C01X27g1V7vXtR0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLRyMvUU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9382e59c0eso812087366b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982536; x=1778587336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvd0fOUYUeCs5HvTaiBocwxMP81wSePkt2CoPUPKDFk=;
        b=DLRyMvUUgyGr9ZIRE8r0lg4wDpRQfBcDFFQqtWiTBqK3kdws8zLdmTntqNKhe8lvF6
         0TbjYB41Hn/oK2TQ1/Pdq4/TlZRrm+tlLsr2q1qRxHRiPCHEhKZbBo8C3klVNBylkn5m
         WIlo3hPQr7Y8fedbST1flvAnZHks2BMl+9BPH14098wfflO+rOFXWyVmNSlZm5wPjRWn
         nGp9D1LEdYCLDRsEAQnKaNP0AiW95Yv13gcpX8EmMd20eluZoMgoInxQFfNpACjot6FR
         Lcn7vlr/6mwfZdceDs0mr+UAFiHuvfHWWf49vSoY4nGDn+Kfs9f8O3K6Oncttx9D25V1
         OsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982536; x=1778587336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yvd0fOUYUeCs5HvTaiBocwxMP81wSePkt2CoPUPKDFk=;
        b=aJziF3f2ova7tf9CBKt+wU5AKQBoUggj9n0JjqSqhhAVBwIIp8w5PaGOdRfPmiE4Jz
         ydeLKpju+bRkEj9TntAFnMz5WrecroFQ4Yf+XIkmYgcRDjWvOHNjVH8uRt69NUW27Tvf
         hDpmkOGcUbEaUkKO3wN4/0OemJ+43ETr0ptv+PCugll6xd99alvAqrcMb+k3uCBgs+wm
         VxMifYrSi0eeJ8G8oCddtazxdj132SSgbkSX+lhw1XKgXK2F+S8UFEn5uPf7LtkZ6C26
         UYXXzyibsmkZvyyYWqpPcu6XMPWLdBXEWhMSBbwiI33o+x7mcLlybzRu7qZxZKC3lr7n
         6NaQ==
X-Gm-Message-State: AOJu0YzCBT95wgGGBDJxHLfGQqG2kbk9qIb/mN1Hk19f2FMem1e65UJd
	hwrqjJKRmxGO225XjY1kJjBw20ml5T8ltxOyrxxMB5n15JVz0eATis4aXlJ5eYE+zko=
X-Gm-Gg: AeBDiesJhliMkzpG1EFW85ubrhvTysszxoJipcO2APxdpbAo08EXFRcJGkU5FLddygv
	NG7wCoTCxy3BhH4u0eWEyBh8eqoBKXiYXyx8aNb3KHP4bAvm/OB+RUTZhv0eadg5C9I1DS/Ehl4
	63McAY8rtPfXbZoJaKOeUXzB9j9RkGJNbHW3TCNFhwZIo7R3e12lODwBRi6yx9u4nWEYt9WP3yb
	r2JfxoB52+43gFxKjAQF+O5aQfhClS/xCTTnoY77ZkK5RFUFZeaNEPZm4NRgXo+juLytsUo8/xA
	Yb4dCZ56JsjAVaDSCwbAcGsofJjulTxbBkoVGsxAHTDV306kUmrxzlmw0M7yjKroBOs4njt1QXW
	Gpo7UA5OoicKvB6iB+O4+swdnR7Jft0jIR1zYvNHBWkR7QD8LoPFzRCQn4+PTweNt86WUJiExYf
	M33Z53kh4jEO5fBhQ3ot6XxayM5+5LJQbB5w3+ZkLR2uv6x650/YC+ub1UOMzkBD4IA9AQLJcDr
	18/AsJcakNSjFaoAaGVQgYs1RBcRiPnQvCrGzctPpGWEsuuEADXb+dDZA==
X-Received: by 2002:a17:907:70d:b0:bc3:bccd:8dd8 with SMTP id a640c23a62f3a-bc411d280abmr147433666b.37.1777982535560;
        Tue, 05 May 2026 05:02:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add xSPI nodes
Date: Tue,  5 May 2026 13:01:52 +0100
Message-ID: <20260505120153.680979-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BEABD4CD365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32069-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[801c0000:email,renesas.com:email,801c1000:email,0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,4.200.249.192:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add xSPI (Expanded SPI) device nodes to the RZ/N2H (R9A09G087) SoC DTSI.
The RZ/N2H integrates two xSPI interfaces.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index f697e9698ed3..e63a6b74d90b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1009,6 +1009,44 @@ mii_conv3: mii-conv@3 {
 			};
 		};
 
+		xspi0: spi@801c0000 {
+			compatible = "renesas,r9a09g087-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c0000 0 0x1000>,
+			      <0 0x40000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 4>,
+				 <&cpg CPG_CORE R9A09G087_XSPI_CLK0>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 0x4>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		xspi1: spi@801c1000 {
+			compatible = "renesas,r9a09g087-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c1000 0 0x1000>,
+			      <0 0x50000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 5>,
+				 <&cpg CPG_CORE R9A09G087_XSPI_CLK1>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 5>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
 			reg = <0 0x80280000 0 0x10000>,
-- 
2.54.0


