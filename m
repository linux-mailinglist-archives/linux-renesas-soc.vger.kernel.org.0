Return-Path: <linux-renesas-soc+bounces-34718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sLlVJd9sSWrX1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1927086C2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=la0gsi7p;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=p+kqXQl4;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BA493009CDA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6C337702B;
	Sat,  4 Jul 2026 20:28:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A8301471;
	Sat,  4 Jul 2026 20:28:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196892; cv=none; b=g9hvoEaW7jUDxIdOfDoBzATktvcjptAI6AAESbImdFVW/52ulOd7RCrnCCDlf85IZkf4qGHcb1bionUpaYwh70wlqZe25f5NMiOG9Smz0Q/cF7HFG9rak2hjKRFRbSs0/HkcdJzRS2cY4ClFqt3vVpT6mfxh1RVdTzTc0jnN/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196892; c=relaxed/simple;
	bh=h4rt3SXmL2I73225/0+wSSs1gZMx8Bc7yVSNzTdYcE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Udgk2xH+3fs5MPQO9vTWHjs+fWBu6YE9quA7XnDAhZGT9c1VaQn1Gl10sKxz/CHZ+bWxBEWqN8PpF55XlVBevlfit5wIvQRLCr2ABuXehGEGcWPF8AqXjrm+2kMObJh+TXLcPjX99zsFcdk1HQqT/Cnf1nwJnmIbpnaTeYfXCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=la0gsi7p; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p+kqXQl4; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gt2Hr5sL1z9srB;
	Sat,  4 Jul 2026 22:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BD+urEh+i89E79SYBLg3JalHMdIKd3ppGJa3pnquYE=;
	b=la0gsi7prBrQuVmzyh9W3mJ8GJ1u9ePltr16NDg/4iImyKEl37Qja8bhF0LcdArHwf4Kw1
	1F1jIhj6REVsYv1jQoP+pc8GvMaBtCdUv5GPZ/NTxva+P+wrokAn9mnwU/Vc6VdHthIgXM
	dUFvGGawHL2r0fV75P7t64WdzQSc5vdtB4GZsxrP8JR5konfeyjiylVlh/sTRlLt8bp8x1
	TXfR2L10bgdrTrNoGjed7EA1b5N2amRryDbVflboUZSeN0GiYcCftU02T8pqUXoSYjKTeY
	4wrFCJgtib9t/sr/LTgsquavXidL3wUn7tpQvhitgUKbYsUW97/i6+1yHlxFsQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BD+urEh+i89E79SYBLg3JalHMdIKd3ppGJa3pnquYE=;
	b=p+kqXQl42XPSwn5XGQbOLReHSKfaQD1KR6y3kPjeEYico7HqdzT5IOmJHBVMm1wst9Vyb0
	Zpy3DzO/kwncn2CAfd+4ob/EWikVkHUa4GwroqJE/Ka+1WvG2YjvWkv57IP6n8cSEWQnU8
	Af/R1di3hYNchW5ef8kZlgPwgBvV1L3fRRagmXnkmhcqsaTPoOaa4pvtTbth9Kjim6WlPY
	Tng6L5UWZcc/QUua4ykHQQ2X/YPN/KzpZj3P0ykGCPsw3MOukTXegSdyHowrUR7+XF9n6u
	+DY3kg1aHpBbiRaRSHlx3eaOisoULNg1BwZI8VadKtQ09ppBlD8Zym+iJbFOAw==
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
Subject: [PATCH 3/5] PCI: dwc: rcar-gen4: Split .start_link into ltssm_control and speed_control
Date: Sat,  4 Jul 2026 22:25:02 +0200
Message-ID: <20260704202748.355708-4-marek.vasut+renesas@mailbox.org>
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
X-MBO-RS-ID: 01c802cadcec5a7d852
X-MBO-RS-META: h7o1ui9t1iugnonriiatfrtxr3zdmpqe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34718-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,renesas.com:email,vger.kernel.org:from_smtp,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B1927086C2

Introduce new .speed_control callback and implement it on R-Car Gen4.
The callback implements the second half of what is currently present
in rcar_gen4_pcie_start_link(), and rcar_gen4_pcie_start_link() does
call the .speed_control callback. This is a preparatory patch for
R-Car Gen5 support, where the .speed_control implementation is
different.

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
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 39 ++++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 7625cd338262d..05c22cc648135 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -89,6 +89,7 @@ struct rcar_gen4_pcie;
 struct rcar_gen4_pcie_drvdata {
 	int (*additional_common_init)(struct rcar_gen4_pcie *rcar);
 	int (*ltssm_control)(struct rcar_gen4_pcie *rcar, bool enable);
+	int (*speed_control)(struct rcar_gen4_pcie *rcar);
 	enum dw_pcie_device_mode mode;
 };
 
@@ -140,20 +141,10 @@ static int rcar_gen4_pcie_speed_change(struct dw_pcie *dw)
 	return -ETIMEDOUT;
 }
 
-/*
- * Enable LTSSM of this controller and manually initiate the speed change.
- * Always return 0.
- */
-static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
+static int rcar_gen4_pcie_speed_control(struct rcar_gen4_pcie *rcar)
 {
-	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
-	int i, changes, ret;
-
-	if (rcar->drvdata->ltssm_control) {
-		ret = rcar->drvdata->ltssm_control(rcar, true);
-		if (ret)
-			return ret;
-	}
+	struct dw_pcie *dw = &rcar->dw;
+	int i, changes;
 
 	/*
 	 * Require direct speed change with retrying here if the max_link_speed
@@ -177,6 +168,24 @@ static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
 	return 0;
 }
 
+/*
+ * Enable LTSSM of this controller and manually initiate the speed change.
+ * Always return 0.
+ */
+static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
+{
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+	int ret;
+
+	if (rcar->drvdata->ltssm_control) {
+		ret = rcar->drvdata->ltssm_control(rcar, true);
+		if (ret)
+			return ret;
+	}
+
+	return rcar->drvdata->speed_control(rcar);
+}
+
 static void rcar_gen4_pcie_stop_link(struct dw_pcie *dw)
 {
 	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
@@ -856,23 +865,27 @@ static int rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable
 
 static struct rcar_gen4_pcie_drvdata drvdata_r8a779f0_pcie = {
 	.ltssm_control = r8a779f0_pcie_ltssm_control,
+	.speed_control = rcar_gen4_pcie_speed_control,
 	.mode = DW_PCIE_RC_TYPE,
 };
 
 static struct rcar_gen4_pcie_drvdata drvdata_r8a779f0_pcie_ep = {
 	.ltssm_control = r8a779f0_pcie_ltssm_control,
+	.speed_control = rcar_gen4_pcie_speed_control,
 	.mode = DW_PCIE_EP_TYPE,
 };
 
 static struct rcar_gen4_pcie_drvdata drvdata_rcar_gen4_pcie = {
 	.additional_common_init = rcar_gen4_pcie_additional_common_init,
 	.ltssm_control = rcar_gen4_pcie_ltssm_control,
+	.speed_control = rcar_gen4_pcie_speed_control,
 	.mode = DW_PCIE_RC_TYPE,
 };
 
 static struct rcar_gen4_pcie_drvdata drvdata_rcar_gen4_pcie_ep = {
 	.additional_common_init = rcar_gen4_pcie_additional_common_init,
 	.ltssm_control = rcar_gen4_pcie_ltssm_control,
+	.speed_control = rcar_gen4_pcie_speed_control,
 	.mode = DW_PCIE_EP_TYPE,
 };
 
-- 
2.53.0


