Return-Path: <linux-renesas-soc+bounces-33182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLD+CGQFFmoRhAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A55DC683
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D2E2303FF9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 20:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB303C13E2;
	Tue, 26 May 2026 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVUxJ/oC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462025A2B5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828058; cv=none; b=OLQJ8mDz0AC3YKCtbsSbQkcSYgUZIW+Po2nuyE5h95hfWk2DPHLr9li07I47kIlSH3hMWRmVzqKW/iAS3XFjpmHp0kV+GJ4EXayPWMwYVITvDvPFUBPdpI7105Ey2qBsLp2UEhcn7lgZXHoURdkB4+7OkSR9R4hi94VNuO2yrqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828058; c=relaxed/simple;
	bh=6apCiPC9mcMFU0hi5ukxwZXH3fULndcRn8LEFUpXutc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6DJdmkq4thvD/6KK7CeyA3jP4lfeJ0MA/IgrDEJO5QFjp6+mO5PGEpOaeCuDDJ9nOZWnq8pdEozez+DGNlT8H41TzWLfmKu4kwW1TD2tlwMHHIg9w33G5X10TdNvqw0soBmV7VS6Yz/QlA45tk+oSSbZ7VemmSK9XII60Ctj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVUxJ/oC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d77f6092eso6302582f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828052; x=1780432852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yED8FeUX8lEhP/zAzWDGf7qGvopI0BwZ8sUjQrJnpxM=;
        b=sVUxJ/oCxwAUtakjnEpCcobWEYmSVLeVctZzJtCntnGPPYkczTB1gT8Hb+F8QelroF
         gMZ98cYd3LEYrzRUrEhP9DJYAuEr+u4lGNXA4qMLWh+Eky9yIInrLiEWbZpY9AWLpUrj
         SsPxr1rANm0GI6KgC+ZeBhL1M23N8PeFG849Fsfl8CY3mPTmZFWg0XbgwUB0Zmnq50KS
         I5glsbbqfvoUFIpbvZYTTay3la8ROfqzsLtjwSa/DdrNgqh7WRm62wGMFLoyZ+tFJO5O
         jUjc4s7PZLE6iwKRPiF7f2UnLlLL1+eNQoPFtZu5myKm47Zf80AT8QLX/Nf6A7KEzKsq
         mOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828052; x=1780432852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yED8FeUX8lEhP/zAzWDGf7qGvopI0BwZ8sUjQrJnpxM=;
        b=ErbsA7qgGGNQ6pa0Jkk+QoQiCDULxVtEJIbhwwJPjR4et5nzErJhy9cppFu7f1R1yR
         1WFBOMztNxj3R3OFz7UHk4ePEsWlpqlQjBYpPzhcTVZ66Ujn381qow7wDHHeYApESUHP
         XLnciaxAxC7m4rZ9p8iMoO0MbKyndnBJ3kKczah+4osJXcaM4b8kWBHZzujVwFTUj12D
         NmbUohvzxuF8dMGqvLGQF0lbCZK3WE//M+ZHaX2avHMaVefo7B9/FS6mdr64K9I7ojnN
         JInSKXXk03yL65ydrlE9kEiEihlM8ZGORd7QUAmAlqIKLcptsjWSXAVydADYxwsRgfOg
         mm/g==
X-Gm-Message-State: AOJu0Yx0NGE6G9zkm6omxg4nDtA3gXI8fzrs1/3iH8Q4YlM2Uua4UXud
	vjCNgv3xCxPKUDX6k2aK6eRtSZ83gxSR7WI8R/ua3vXq+Skhy3z7M9LM
X-Gm-Gg: Acq92OHDTOX7FHXh5VGmqZVu5JZa/bM/cFXBXbT8lnlvqVYBcgMC/HvxoF2fFkpl85S
	P6X5gpnHUG8cNHfvZ3dUiYCcIRsPQWGHKxIB89uRq5HcZKlIO6ZvZpdK1intVZYwpqytOTt4b2H
	H1Qv4UH25FylXMd988gfcTuGSMEsgQel+DbOGOXQwQI4XqaMgTOd1dAIVsaJUdLFO++AW6FFIZX
	IUstKTyCFGvJbMyO4rGC8eEblZ5MVQAeAos3vZDEILj9L82OGgbLBuF1owWkVr935A76wvFs3ks
	rxCx5em72XZ3Q50Uo7z0IYwbEP008DhSd1cCFZTyrJoax3nyP9TmXjI3Fdp4Flbo+4cC86Q3DmI
	ANLteFRBs5T4QzPRX8xcXScIVEK6giwosibAJnYTW+by9qZdWXmU1+3LQ4sW5uKiamMS10wb/7Y
	WA5d4X183jjhxYuvmzEDADN0PpyCjZjO/gLVySCG8Jgcwyrye52/q+iryFEzQToyTrrjlufr77h
	zXFcDw4KIXJqJ8GWzgUnUlg7+nfHiofDUt1Jnwfaj8RsgJf
X-Received: by 2002:a5d:64e1:0:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-45eb38af927mr34847916f8f.32.1779828052494;
        Tue, 26 May 2026 13:40:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
Date: Tue, 26 May 2026 21:40:43 +0100
Message-ID: <20260526204045.3481604-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33182-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[4.200.249.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,801c1000:email,renesas.com:email]
X-Rspamd-Queue-Id: B04A55DC683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree nodes for the two xSPI (Expanded SPI) controllers
integrated into the RZ/T2H (R9A09G077) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index fe5d206d4def..1b194361fef8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
 			};
 		};
 
+		xspi0: spi@801c0000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c0000 0 0x1000>,
+			      <0 0x40000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 4>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
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
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c1000 0 0x1000>,
+			      <0 0x50000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 5>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
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
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x10000>,
-- 
2.54.0


