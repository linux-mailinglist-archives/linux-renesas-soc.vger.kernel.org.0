Return-Path: <linux-renesas-soc+bounces-31830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAumL3dR82khzgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:56:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D334A302C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C095305A5FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192014219F9;
	Thu, 30 Apr 2026 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLe1LyWw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF741B37C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553639; cv=none; b=AYcjHsa5bqkwW/fXENyJu0zT/CFLb6TZnOidOIVQt0OaEXuD60xLXDfcAMXrktmR7FrmBr+FfxNBjDKsgJYlGuVltlDVy5bDb2Zujjg4kxUf8Xn0PTUWp2OZ68WyrSavPql8W9xADoQ1poEP89VWZL8WswWX0iderMdPgxx65r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553639; c=relaxed/simple;
	bh=PTIVpmlJFIcPp3v4pUu1nBbwXU45NGASpEXKgSNPleg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmBOr6xU03s2mBYKqKL3dFKzg02P4aJsmlgWiphqGcm2JcJqDWSFeZKN2M+gKDEeRqzCCuGROBjWGOHbDlDs7q8DImd4thiGCHFJltBZgRa7/CHCtMJiDANUFogamVq3jatMK8i5d9aCuf31aQC0/6UF+pFfHkzpo2pK+kOfZeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLe1LyWw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so10102925e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553633; x=1778158433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vty+BF7mDxrTiT/wIB4dOTpZWhoNA6RfbG6nmnoS5fo=;
        b=KLe1LyWw5xnV0AtWUYyZBen2/nblVobddjxdWpml8L6IDckY4npcn1GHq5OA7no46Q
         BE4iHu1OM1nEFxeCm1qATdJjAjxLTKY6oxsJmCBFEiDB+IsjdZVOfm6EM7UDhXgf2pbz
         z2rmqmoat6OI9dvlpyxifWhg34YxRgF8/xfJeOiEs5SFqgdg6G3dwmoj3hNQ7jVKBDDY
         gdY7KIRjwse8M4yzA13zHCw471UPe330ldPb7tI1LMtxH+UFAL2ULOnCCLkv/eDT0bJN
         AR6S4x+USPJ/KjWSWFCS+CjiuC1MEkmyj2AxCaK+KJnNGvOJthtL+LTnHjidn2qQot1u
         XDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553633; x=1778158433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vty+BF7mDxrTiT/wIB4dOTpZWhoNA6RfbG6nmnoS5fo=;
        b=GiB/AQxANBtQbz6hWqTNuLT1E3y1tv7xW5NEHh32hdmczDbCn1/YWPHXKMSMHA9/Pe
         qafpugg1twuiXv6UVhyoAuvlD4yZyOMqLF9odT0eSXPlp+tPogwG8ggwClgrRb4/os0Y
         WcBT+FdfeLvln3drZsTeDWqLLDwqPp4+Kedh6FfsdShgvPDW/5Ek/v0E0UJhyecg2vX8
         4XocUoCuRSn6CgbVnbBH9Tumyyoe4pf0j4FTGS/QHXRsZEZzvuZLxZzoSAMY0o4Npg6E
         sk5GVb/VmZ0nsu7YkTHjz1eWuGu+R81EsCfgh1h4rTcgF7dgWnA6g+eZzJp4flC/TRGy
         dBaA==
X-Forwarded-Encrypted: i=1; AFNElJ+ScVvtnNjmrw6imMgjPUwAnF8Pwbd9gGnrNO0c1Pni8URrYRHbSQGODhBbFC3Ce3xlTTNCIdzGPWjogy1dwZTSCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLJzsD8lVpf+xZGEZgeEx/a7EkGMN+VJqigUN5pDwMlz5zAEI
	MI9lGaoRINOw96EfLLpHj3hirAPEsrdVv7dYAA6pLXhDa+pGq71cEDXI2Inr7A==
X-Gm-Gg: AeBDieuu4Z6rVfCiIrlzqh6jnhjde4xtmmURxdT7xloXmibbHrbz5LLN6AfkEI+Z45G
	ioZeffxy9Ppo4Ca5lrZfKnJiEPMXGSEEBV7pM3uf+Ld1IdxW/qq2YHH/HUHiMruwo/jdOaNGGz2
	iYqBDf30f0qNvRIqNDoF/+oZMJyqAHnzmgaNL9+6EG4PDwINlGo6RgwYGUgc2ODZnHfvPJDYGOA
	UAM01SddodCoP1biDhCQpOo+s0vwUh2Xo/pwk7KtgL0/926Tr9OJ0po68hgyKDF9gsSSa2tim4g
	gYkbMIpn7c+rPwJ39MHQb+8wkxGfByJIvDVbwlxWSKPf1jiQRxoZo1E+GpSUw/Xl7C9M+M8TE2v
	uLxPGz1LGm/w0wf11GOZYkBgp0ASZvsCT/QjZvkzw2dfTfFutYJ/c8LGtKUWXdXCNXHecMIdrMu
	6LzguGGGp1umkjFd/4IBofAl8Ec/3eCYbksp6VfeI=
X-Received: by 2002:a05:600c:4e46:b0:488:d243:8da9 with SMTP id 5b1f17b1804b1-48a844e49e3mr48199045e9.1.1777553633149;
        Thu, 30 Apr 2026 05:53:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:52 -0700 (PDT)
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
Subject: [PATCH v3 6/6] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface
Date: Thu, 30 Apr 2026 13:53:10 +0100
Message-ID: <20260430125342.439755-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 37D334A302C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31830-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,0.0.0.7:email,2.220.108.0:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped ethernet-phy-ieee802.3-c22 from mdio1 device node.
 * Fixed typo txdv-skew-psec -> txen-skew-psec.
 * Added hotplug support.
v1->v2:
 * No change.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index d0516d7db8ba..da6f02287944 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -10,6 +10,7 @@ / {
 
 	aliases {
 		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	memory@48000000 {
@@ -32,6 +33,19 @@ &eth0_rxc_rx_clk {
 	clock-frequency = <125000000>;
 };
 
+&eth1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&eth1_rxc_rx_clk {
+	clock-frequency = <125000000>;
+};
+
 &extal_clk {
 	clock-frequency = <24000000>;
 };
@@ -56,6 +70,26 @@ phy0: ethernet-phy@7 {
 	};
 };
 
+&mdio1 {
+	phy1: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640";
+		reg = <7>;
+		interrupts-extended = <&icu 16 IRQ_TYPE_LEVEL_LOW>;
+		rxc-skew-psec = <1400>;
+		txc-skew-psec = <1400>;
+		rxdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		txc {
@@ -83,4 +117,31 @@ ctrl {
 				 power-source = <1800>;
 		};
 	};
+
+	eth1_pins: eth1 {
+		txc {
+			pinmux = <RZG3L_PORT_PINMUX(E, 1, 1)>;  /* ETH1_TXC_REF_CLK */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		ctrl {
+			pinmux = <RZG3L_PORT_PINMUX(D, 1, 1)>, /* MDC */
+				 <RZG3L_PORT_PINMUX(D, 0, 1)>, /* MDIO */
+				 <RZG3L_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR */
+				 <RZG3L_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
+				 <RZG3L_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
+				 <RZG3L_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
+				 <RZG3L_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
+				 <RZG3L_PORT_PINMUX(E, 0, 1)>, /* RXC */
+				 <RZG3L_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
+				 <RZG3L_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
+				 <RZG3L_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
+				 <RZG3L_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+				 <RZG3L_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
+				 <RZG3L_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
+				 power-source = <1800>;
+		};
+	};
 };
-- 
2.43.0


