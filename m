Return-Path: <linux-renesas-soc+bounces-34716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OuJVEd1sSWrP1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E87086AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jBQCNuBp;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lGa6+qaB;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C9E301AF58
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2C132FA2C;
	Sat,  4 Jul 2026 20:28:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D622C028F;
	Sat,  4 Jul 2026 20:28:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196890; cv=none; b=G/hSvEs7UUx9DWDSuq1WoIki6XniI78ZM3UNo8mBmL4F+7RsiUq64aMLO8p2iGnHqchM8xubefrTJMs4bbbf/CdpikYAo3BPJv6bkWzKDaY7YGoP9oVUTLpA8OnlsWz9I0S9OIHlhx0yj220NVIGijwQbJSwP9VY48ZMP1WOjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196890; c=relaxed/simple;
	bh=zsDkssVEVJ1mpXgjN1Uy1oEqYNf01QiGkzbDX8HBmzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSPCnJJJMV6fJCef1Q20okMlSQuBiVRhDp6IqV1seYTX3EZtAqWBfpL7UYpKr2K437dbByUtvBIbdKj14xbMoh8Bj6Xqm4Lkudj15ouycrd56l6JTGFyvvvXy+aQl3IDOQGjJR0cnB2nTi95dBJd58PoWG1j3q5+DWsf0whft1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jBQCNuBp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lGa6+qaB; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gt2Hn64Gbz8tyV;
	Sat, 04 Jul 2026 22:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2ZzKWUJziEedBBXDtmeV8CH3y8VGPRfE3EVPWitS64=;
	b=jBQCNuBp9ZLo5SLOztSfkDmERw+OG4zJNqfoBCQzPSO9jaZ7pNTa73f3CLLzJoEGvPo8Hg
	4ZYDpczKqi6Ig9lHpKJd1gZeRSLiRVwXisuVO9Y7960YKR8QPlUG4UwsdKDesLCMrLAfWQ
	MlnyY6xGiJK8V1wT6Wv5j82JsXfi3yf0ya0O1HnOfQiOkBt7Qlc/jsIenqvdp4LgWv9A//
	SQWmZG3gocRg0eNZsB036ICGcuixZl6c+k/9g6S4dAycNwi6ttIGLlJgFYcdW3bN70ylYG
	mS6BWGLQY0igFpBA9iK5yOrajGjNvt6FPzdZ+Gw/YuwfRYc8xfssDWSaDTTBIw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2ZzKWUJziEedBBXDtmeV8CH3y8VGPRfE3EVPWitS64=;
	b=lGa6+qaBiNGyOrqMy53z0N8sKHqIrz/aDeYPrKJfI1oc2E76NWL5NiL31UkxQRq1sNXYlV
	n5zZBv+rXRRnQz7BAE7FTmyaKgP6E3uhaZKqFfuEsxmMMFkOO0VINkzjPhsSgz6eiH0gcd
	0ULvBd3VcwJYCyKsZlaCD65rHTH94AmbEEaPSnUVg4yARUojy/FIczdDheyVXiwkQ97rIx
	rF4Tvmdxd6mdJxgL1qjH6+AOLmA0aG828Y8r3ht4h5MoF/0hD4He+8lmgNgORWl+nL/OZG
	5UvKqjq7KS5Hcb7s0ZphShRycJ3DsQniqsqTY7QZ8ybCfmShoD0DGNtvkfIQEA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] PCI: dwc: rcar-gen4: Return error code from .additional_common_init
Date: Sat,  4 Jul 2026 22:25:01 +0200
Message-ID: <20260704202748.355708-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 52b3a66ca12ee368e24
X-MBO-RS-META: jy91sfaobr38ahhahqqrn73mufum3adc
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34716-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 823E87086AE

Return error code from .additional_common_init callback and check
the error code. This is a preparatory patch for R-Car Gen5 support,
which may return non-zero error code from .additional_common_init.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 5f7211b91ee5b..7625cd338262d 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -87,7 +87,7 @@ MODULE_FIRMWARE(RCAR_GEN4_PCIE_FIRMWARE_NAME);
 
 struct rcar_gen4_pcie;
 struct rcar_gen4_pcie_drvdata {
-	void (*additional_common_init)(struct rcar_gen4_pcie *rcar);
+	int (*additional_common_init)(struct rcar_gen4_pcie *rcar);
 	int (*ltssm_control)(struct rcar_gen4_pcie *rcar, bool enable);
 	enum dw_pcie_device_mode mode;
 };
@@ -241,11 +241,16 @@ static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
 	reset_control_status(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
 	fsleep(1000);
 
-	if (rcar->drvdata->additional_common_init)
-		rcar->drvdata->additional_common_init(rcar);
+	if (rcar->drvdata->additional_common_init) {
+		ret = rcar->drvdata->additional_common_init(rcar);
+		if (ret)
+			goto err_deassert;
+	}
 
 	return 0;
 
+err_deassert:
+	reset_control_assert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
 err_unprepare:
 	clk_bulk_disable_unprepare(DW_PCIE_NUM_CORE_CLKS, dw->core_clks);
 
@@ -681,7 +686,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
 	return 0;
 }
 
-static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
+static int rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie *dw = &rcar->dw;
 	u32 val;
@@ -695,6 +700,8 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
 	val = readl(rcar->base + PCIEPWRMNGCTRL);
 	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
 	writel(val, rcar->base + PCIEPWRMNGCTRL);
+
+	return 0;
 }
 
 static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
-- 
2.53.0


