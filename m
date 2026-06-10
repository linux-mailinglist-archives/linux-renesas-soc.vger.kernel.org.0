Return-Path: <linux-renesas-soc+bounces-33814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EZREHPM9KWqLSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:35:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4C66855A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:35:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=QRQrasGC;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="d JuKZhC";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D6F4332A885
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94283F870E;
	Wed, 10 Jun 2026 10:26:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1CD3F413E;
	Wed, 10 Jun 2026 10:26:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087164; cv=none; b=NjsKafP9RyiqkGCmur7SR2Aa2CYchm5SfEgp8k4F6u4glVyWqxaWFiGSzDA3e1DYmtj2fEBNlQ4feIxI/SZElH4GcA5zdVdGcCh1NzYjKgOyriG1Qkd2xjFz6GCfBeuH1brATkCwJMLvTgTxS6tuyty/eO6MS3YLm2j7tRtJl8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087164; c=relaxed/simple;
	bh=0lzLA0B2tR483ksy8GTs4ZOJpbJyeviETInj7LxPcMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G0JmcwnPHmOB1sAkXcktAYMsL1ukYhWFPs8XM/cFT5Lym8OG45ctIbObN6DHwdt11gd9HEBu74WZixOfOZn6Kg9jr0GzqHm2gsvrtDzj/RqV9PsdVVMXImOMiqdfNSa5jHrXkB0N7m/WUAq5nTGZL3xMFYaenRfO6dsCCIMUhkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QRQrasGC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dJuKZhCm; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 416A51D00162;
	Wed, 10 Jun 2026 06:26:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 10 Jun 2026 06:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087162;
	 x=1781173562; bh=eH+mfSI1IQtVYTQswcuPrYB0c71wpe0MkpDYbFyXkzM=; b=
	QRQrasGCGuOOoRDk55RPB9OY0qq27kCP4TBg0udtiS4eCvQRhnA6flKYMvaoKryI
	87ZtLpcsSr11cF1nAXj98KAIvvvbWDbtkczeNUW1x/i6mU/JNK3GB+FtPZSaFB5D
	mJdG+KofW/GGa3T7QHsvlSDSfmeKW8jAyGHhDn8HetcpAlwnYFElcS24S/42dspp
	gWDXAutUsxpNnmPrihFu2wJODEFQwVA3LMI+o6u8z4Xmo/uUNfpNeARxMMBrIs9j
	i0ZScucxoF2sbP0QPz1+BGZ1Fezx8oo6i7W6I5rQ+jQu3DSpuwuu8cVCkaMtrE3R
	BzvpXDGkOxrw4vfvfpWn4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087162; x=
	1781173562; bh=eH+mfSI1IQtVYTQswcuPrYB0c71wpe0MkpDYbFyXkzM=; b=d
	JuKZhCm3yfwobkUZlVYshhF8lP5VG5o8c9bF74Zil6eDeWpSQ2LW7L55XMHhLedQ
	XkQuulmMS++nWFu2/VUKFe71c1l5BClYKn7RjNROIiTsUIqYkeOpsiFhSSluTB43
	U349bpwy3rbhVARx2Gyt5XWwoJZHI507P0pbOa/CYBaewT+d/naMHz/QNkGn18o1
	OnuasP4sRBos6vujEA75T7MFH5A9JoT4/OvgUUSagUx13tUWSkR8qITcWlF+dlVe
	Iu6Rcb3UpJ2Qv6Zicsnd1WwOzIneftBaMld/Z3lhndOl6f7svAxDSxgFRV0Hrcqa
	ddVEsc6liqrX+JwCEuXKw==
X-ME-Sender: <xms:ujspahj8uFxQxzzImsqr3p93WWRDsJhziQRTn1YBt-jLu1pUznUGig>
    <xme:ujspauyBiYDnBf28QNDPHqwzUHrwdmyfXGCieVrugO-OA4D24PvyG9-ZSKkxioTd7
    bLNOaLhnJcWgwOlOYYa-_V4VzpImg4vyYx75xth5G7nPrpsBfQKnE4>
X-ME-Received: <xmr:ujspavx4df3Oo53nd76t5u7469g2KNIgAnq5B8X1JO2JA4sKSv3ThoBVFJpdEJPc_RzO-KtqLHCQmnZmVa6wFyKnJQyNaW5InfRR>
X-ME-Proxy-Cause: dmFkZTFXMgr/JgA4ynBJRX9iN+D9+8ugfpl4lXVo8oUqYw57cz8PIQWhnFd6TDonAKC4N8
    TSR+YZYZtNU/ONmQ88kKkXK1er0iP16La6NkBU4k7Xp/3fGVcUcaR/iscJgSRZkDHKp74L
    CdL/N/h3kFlB5P/9vgYGDiw9UAKZZ35twVH6HslwM7kWAVtzkF1bZa00l0X+Uo/D80HzCr
    X0Lz0oxEE06jjEMTlqsuQo15ymq9DQqrvaR2nEKtXAlU9BWlPWKYW8NpNp2rFVaqvFbCm4
    SvJLY6Cv49ef2tytoazAWNmGWsyofhKzj4uYWGzSE+JduKcTs6TKRxGj3sB0ZujeupROWU
    8JBEwsXKBRyi9v2CV6sA/G/TX69y6zH/kL4ep7XWnOSP0L99MrCLruhUzp0PosqwPd6of6
    Xs0WejSsTcRgc8UhquNu7H2KcpROmV5U1uq9g4jmB//2JdnIeT2Z8Y3W9w+U3kHYGybdg2
    9D0KIuRj04g97RzRS1d6mu3X7mZ68Jaai6bnpN9SV/lRN2nABS23/8jS/U175Y99vSIzQR
    PxuU08gDr4Ki0zC1smpJhVyIXPExDZzaE1e1uxV5qUapD1T2/sNfA4CutqJYqeon2OzlfX
    i5oZjphS/jsNNcoVFPtSJukvpNy1MlRofwI+3fHXZZi+71nXMu15coWNltRg
X-ME-Proxy: <xmx:ujspaoqCIeiGH3l6GrfpxKw9tv1zXE5z1vScJO43JyzphSQR0GW0XQ>
    <xmx:ujspailQe5AJ59OA2sMftFqR9LZCzm9EuxgLInMkRwt04qmAwT5XgA>
    <xmx:ujspahyuSMbqSH1-Kv1I7FMe5hw_OIUTAJq7ccviF5oGlJFF4VbrqQ>
    <xmx:ujspan1T1ZiWb6oMK8yLCjxkZaRZTpeVLQJrDng83q7L2Xu84T4D6Q>
    <xmx:ujspat1J7i98Moujar9qNX0GkO2KSD8kuakg_RflIa19LMPLQ-qNsxAN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:26:01 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 6/9] net: ethernet: ravb: Add callback for gPTP probe
Date: Wed, 10 Jun 2026 12:24:29 +0200
Message-ID: <20260610102432.3538432-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33814-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2C4C66855A

Different generations of the RAVB IP have different needs when it probes
the gPTP timer clock. Add a callback in the PTP information to allow
each generation to probe its own way.

With this the last gPTP specific flag (gptp_ref_clk) can be removed.
However the primary motivation for the change is to prepare for Gen4
support, which compared to other generations with gPTP support does not
have the clock as part of the IP itself.

Gen4 will not need to compute GTI value as it have no where to write it,
as the gPTP clock is external. For this reason move the computation of
it into the newly gPTP probe specific callbacks for the RAVB IP's that
support it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      |  3 +-
 drivers/net/ethernet/renesas/ravb_main.c | 53 +++++++++++++++---------
 2 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 70bef3b31d38..f063f4ba5714 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1041,6 +1041,7 @@ struct ravb_ptp {
  * with the gPTP clock. This struct provides the callbacks to be called at
  * critical points in the RAVB driver.
  *
+ * @probe:		Probe the gPTP clock
  * @set_config_mode:	Enter config mode
  * @dmac_start:		Called when the DMAC starts
  * @dmac_stop:		Called when the DMAC stops
@@ -1048,6 +1049,7 @@ struct ravb_ptp {
  * @ndev_close:		Called when the ndev is closed
  */
 struct ravb_gptp_info {
+	int (*probe)(struct net_device *ndev);
 	int (*set_config_mode)(struct net_device *ndev);
 	void (*dmac_start)(struct net_device *ndev);
 	void (*dmac_stop)(struct net_device *ndev);
@@ -1084,7 +1086,6 @@ struct ravb_hw_info {
 	unsigned multi_irqs:1;		/* AVB-DMAC and E-MAC has multiple irqs */
 	unsigned irq_en_dis:1;		/* Has separate irq enable and disable regs */
 	unsigned err_mgmt_irqs:1;	/* Line1 (Err) and Line2 (Mgmt) irqs are separate */
-	unsigned gptp_ref_clk:1;	/* gPTP has separate reference clock */
 	unsigned nc_queues:1;		/* AVB-DMAC has RX and TX NC queues */
 	unsigned magic_pkt:1;		/* E-MAC supports magic packet detection */
 	unsigned half_duplex:1;		/* E-MAC supports half duplex mode */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 577cd2245e60..85020c943e10 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1842,21 +1842,14 @@ static int ravb_set_config_mode(struct net_device *ndev)
 	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
 }
 
-static int ravb_compute_gti(struct net_device *ndev)
+static int ravb_compute_gti(struct net_device *ndev, struct clk *clk)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	struct device *dev = ndev->dev.parent;
 	unsigned long rate;
 	u64 inc;
 
-	if (!info->ptp)
-		return 0;
-
-	if (info->gptp_ref_clk)
-		rate = clk_get_rate(priv->gptp_clk);
-	else
-		rate = clk_get_rate(priv->clk);
+	rate = clk_get_rate(clk);
 	if (!rate)
 		return -EINVAL;
 
@@ -2650,6 +2643,13 @@ static int ravb_mdio_release(struct ravb_private *priv)
 	return 0;
 }
 
+static int ravb_gen2_ptp_probe(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+
+	return ravb_compute_gti(ndev, priv->clk);
+}
+
 static int ravb_gen2_ptp_set_config_mode(struct net_device *ndev)
 {
 	int ret;
@@ -2665,6 +2665,7 @@ static int ravb_gen2_ptp_set_config_mode(struct net_device *ndev)
 }
 
 static const struct ravb_gptp_info ravb_gen2_ptp_info = {
+	.probe = ravb_gen2_ptp_probe,
 	.set_config_mode = ravb_gen2_ptp_set_config_mode,
 	.dmac_start = ravb_ptp_init,
 	.dmac_stop = ravb_ptp_stop,
@@ -2701,6 +2702,7 @@ static int ravb_gen3_ptp_set_config_mode(struct net_device *ndev)
 }
 
 static const struct ravb_gptp_info ravb_gen3_ptp_info = {
+	.probe = ravb_gen2_ptp_probe,
 	.set_config_mode = ravb_gen3_ptp_set_config_mode,
 	.ndev_open = ravb_ptp_init,
 	.ndev_close = ravb_ptp_stop,
@@ -2760,6 +2762,24 @@ static const struct ravb_hw_info ravb_gen4_hw_info = {
 	.magic_pkt = 1,
 };
 
+static int ravb_rzv2m_ptp_probe(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+
+	priv->gptp_clk = devm_clk_get(&priv->pdev->dev, "gptp");
+	if (IS_ERR(priv->gptp_clk))
+		return PTR_ERR(priv->gptp_clk);
+
+	return ravb_compute_gti(ndev, priv->gptp_clk);
+}
+
+static const struct ravb_gptp_info ravb_rzv2m_ptp_info = {
+	.probe = ravb_rzv2m_ptp_probe,
+	.set_config_mode = ravb_gen2_ptp_set_config_mode,
+	.dmac_start = ravb_ptp_init,
+	.dmac_stop = ravb_ptp_stop,
+};
+
 static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
@@ -2780,8 +2800,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.dbat_entry_num = 22,
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
-	.ptp = &ravb_gen2_ptp_info,
-	.gptp_ref_clk = 1,
+	.ptp = &ravb_rzv2m_ptp_info,
 	.nc_queues = 1,
 	.magic_pkt = 1,
 };
@@ -2971,12 +2990,10 @@ static int ravb_probe(struct platform_device *pdev)
 		goto out_reset_assert;
 	}
 
-	if (info->gptp_ref_clk) {
-		priv->gptp_clk = devm_clk_get(&pdev->dev, "gptp");
-		if (IS_ERR(priv->gptp_clk)) {
-			error = PTR_ERR(priv->gptp_clk);
+	if (info->ptp && info->ptp->probe) {
+		error = info->ptp->probe(ndev);
+		if (error)
 			goto out_reset_assert;
-		}
 	}
 
 	priv->refclk = devm_clk_get_optional(&pdev->dev, "refclk");
@@ -3029,10 +3046,6 @@ static int ravb_probe(struct platform_device *pdev)
 	ndev->netdev_ops = &ravb_netdev_ops;
 	ndev->ethtool_ops = &ravb_ethtool_ops;
 
-	error = ravb_compute_gti(ndev);
-	if (error)
-		goto out_rpm_put;
-
 	ravb_parse_delay_mode(np, ndev);
 
 	/* Allocate descriptor base address table */
-- 
2.54.0


