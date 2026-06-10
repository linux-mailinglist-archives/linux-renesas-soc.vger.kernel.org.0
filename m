Return-Path: <linux-renesas-soc+bounces-33817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aF13OXM9KWpmSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CB668500
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b="i1h3ilk/";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="N J5VKD4";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 757893184F6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410713FB075;
	Wed, 10 Jun 2026 10:26:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3783FB043;
	Wed, 10 Jun 2026 10:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087173; cv=none; b=nmDhTyZcqP0Zt5tZbWxSnQxwgm4MpGHo80JaID10a1HxCUOQnmjfzx6qB/c/aKk20yMINMLKT8fdKBdjoXR5qsxq15Va1NFVxJhwM3wkfwKl040+F+5Y9pZiXpOa+0JBknMbVIwzsetOt66CDCrtwdSJIFlNyaPPs5/l/EUqwNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087173; c=relaxed/simple;
	bh=OgahX+7YQf85Qe4ZYIlVNVTPoySmTmrc1KnxDVSe2uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEdXRSKCnJDyTFuWXUNYegA3iJ14ImNLoEChLN2Qv/dfBK2l1c/7JTpKkYEVWKU19ZXu9LRkz4CgPNiCtLivoTTbf+Lki4+1kF1/IeaggqiTgNgPgShxaQqBEZ42zKgLOvcvY8fAg3+pzhxntEkpHv5fF1otZHsUhHUinbBph0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=i1h3ilk/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NJ5VKD47; arc=none smtp.client-ip=202.12.124.152
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B5EEB7A0140;
	Wed, 10 Jun 2026 06:26:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 10 Jun 2026 06:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087170;
	 x=1781173570; bh=MwtKRUQ7qdsV8XHZpJ+jLjWEXvJUP0kybJpn6BpJy54=; b=
	i1h3ilk/DEpB3/lYJHN8O7cNbCUbHmOQd4kisF5fW12G5fp8DoLvZV+3tQTklvWH
	F9AThEP+r8RfMaHczoCObFEZbRtxyvGXVV2EtUSo1ytECHtf9wXfAfm5+jhumW8v
	4j43z0LQdXti6rXg7tUuv5/TBaJjAgAr5Y66zWaIdCGFNr4Bogcl37fVxs3sEhcR
	RlKMxO0PaejrzDapJh12B3QdN3Jr67oytlbgnge2iHIjDWMTdtr/jmf4BXm/rFnZ
	4PexwYom/0Z7+1bNsCqtieL5YxDe8ThcGTEbe7AUy3pvEUPdrjfpLIHxWWT2Y+Jl
	WhPxsSKSoD1cTgcRxat+mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087170; x=
	1781173570; bh=MwtKRUQ7qdsV8XHZpJ+jLjWEXvJUP0kybJpn6BpJy54=; b=N
	J5VKD47GqdTuZEss6XBRT8AQ+dS0FQYoaDUnK+QCVOkT2d3xE2OYO9dWBNF9hHtU
	OU0T7t/nbbxr0ameecceH5KUD4Zp7VLtoOrxVx7+6jKBdKZl0pYeytVjXC2Av8D0
	YfezzbfXceYS8plo6ne+JK3PhJ2oATqxYuiDWXxsi5Oaertkdycbnl7fLjUPJOB5
	6b2jLvXEn+UmG7ZkTqfWfjy0H3m+AZhUI0M82IyX2D1cUQv53EzvX4fvlR4fxMpN
	Pkb3Oia2fpc1QoahRAQBoOyjivS9YgSYuWmgxzKvZWl9VzRYEhiDNu+k6/Ld2/+P
	yt6iHeIWPlTpzHYpR6rlQ==
X-ME-Sender: <xms:wjspainzCPua9Aksi1N3xbgdmwZ5nE8J1n9180epMFZU_Q6Pw2nu-w>
    <xme:wjspain6OkKwTGBO2DS0WBN5jRnxTAFO_kBX2De5D-ROWUC1zSNEHk-DeLBHrHHqX
    JicHR4azFQ6R5snU_e1IkqTK3X341WkJOIUcooF_IqTPRtn0worwlE>
X-ME-Received: <xmr:wjspavV4SKY4wO3a8DIRB97q3BkFLLm2m4teyZa9Y1HCwooFhfwoEx7VVngLRfxUbCLIzHNurlUp2Hwvg0n7vRmrVp2Lv9qOvI3U>
X-ME-Proxy-Cause: dmFkZTFouP8mx/3m1LoYRi/YJF1vDxoEpaw9FPXvV3pzOZG51jUj8Q8zt3vQAQAauQOCAP
    rniaAc1Y4+fivdpO+5npUIl8fZbPIWyv8SUHXINswMuMmEA1ura4CgEJh9+uJoLsy8q7Pk
    GfpxBZ8wExnOdnZzpTh8c06piIhjpzd+vyw5M6SJos/sOEfPIoOrZ5FcRdFJRYL2GGAvmJ
    fGkFFiiOjYzVRYUqzK4twmnjM4gLLXMhf8hbzacO7641k9pIridEgKh90g04ktpjqR4784
    M9CNdla9OCxjj/4r8IYss0MNMRcx8jqCDejKNYx4ETNCLwOoUpo69OLc/ppmJR0cI6HpGs
    QSC0Y7yhu7k49uje4ZUdy62yO+/3dRHdH3dkaPON5pMxueojUe/DrcYVByhlef/U4RDSSE
    U/3srhBJkHREOuwrySK8VUggcL2VZIPOnE/f6nvLivnFph2VtxtNWHP2lv9uP9gZS2fI4G
    p1xpznMM6mXjha+gOjn739VvkReWx7vQITQy78Y8VUB123asmVUZsmO8o2KFZzTWR1fdFy
    A2yGsWcJGfhxxIFtENIInxFwMlbTlAV0H6I8xjZzvM+j0xykMWunJ9ecvFcA5N/ywo11O+
    jKXmyA1K4ZeVKJCh/QZ+eOOUtuhPEZuq9B577CdPDPDwU8FHJ7p9XahqD6Uw
X-ME-Proxy: <xmx:wjspao81fkN1JVhNzh-qnF0imPUeIK_ewcvJsr6TQv1fXB9K9_mogg>
    <xmx:wjspakoHZh5U6xW65sCD9PrVt862gL7UP8ZeSl3ozCfN_HiasXKxVw>
    <xmx:wjspailNLIRcRswULZ-8xEQ1NTRJsF9fgmo2tWhLvPQ72GAx8BgHiQ>
    <xmx:wjspaga6odn_43s6HSiGg1a1vurX2XJZtmfg0SVK1mXD2MAt1bFPSg>
    <xmx:wjspasI1jxDAUXpcFr0HaOHI7U7ubExpL4r0vVSpG-O_oDpx9MDzyU0X>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:26:09 -0400 (EDT)
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
Subject: [net-next 9/9] net: ethernet: ravb: Add gPTP support for Gen4
Date: Wed, 10 Jun 2026 12:24:32 +0200
Message-ID: <20260610102432.3538432-10-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33817-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 655CB668500

While driver advertise gPTP support on Gen4 platforms it is in fact
completely broken. On R-Car Gen4 devices the RAVB module have no
internal gPTP clock as generations before it. Instead it utilizes a
system wide gPTP clock.

This change utilizes the refactoring of the RAVB gPTP code to add
support for a system wide clock and stops the Gen4 devices trying to use
the non-existing internal gPTP clock.

To remain backward compatible the device tree property needed
(renesas,gptp) to get hold of the system gPTP clock is optional. If the
property is not present, or not enabled, the RAVB driver will no longer
advertise gPTP support to user-space.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      |  3 ++
 drivers/net/ethernet/renesas/ravb_main.c | 55 +++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index caad95a9c3c5..acdfb56bb135 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -249,6 +249,8 @@ enum APSR_BIT {
 	APSR_RDM	= 0x00002000,
 	APSR_TDM	= 0x00004000,
 	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
+	APSR_GPTPTIMER_SOURCE = BIT(25), /* Gen4 */
+	APSR_GPTPCLOCK	= BIT(29),	/* Gen4 */
 };
 
 /* RCR */
@@ -1132,6 +1134,7 @@ struct ravb_private {
 	struct list_head ts_skb_list;
 	u32 ts_skb_tag;
 	struct ravb_ptp ptp;
+	struct device_node *of_gptp;	/* Reference to external gPTP clock, if any. */
 	spinlock_t lock;		/* Register access lock */
 	u32 cur_rx[NUM_RX_QUEUE];	/* Consumer ring indices */
 	u32 dirty_rx[NUM_RX_QUEUE];	/* Producer ring indices */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4b0d06fb5f4c..985b2cb93617 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2749,6 +2749,58 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.magic_pkt = 1,
 };
 
+static int ravb_gen4_ptp_probe(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+
+	priv->of_gptp = of_parse_phandle(priv->pdev->dev.of_node, "renesas,gptp", 0);
+	if (!priv->of_gptp)
+		return 0;
+
+	if (!of_device_is_available(priv->of_gptp)) {
+		of_node_put(priv->of_gptp);
+		priv->of_gptp = NULL;
+		return 0;
+	}
+
+	return 0;
+}
+
+static int ravb_gen4_ptp_clock_index(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+
+	/* If no clock, mimic ptp_clock_index_by_of_node() fail and return -1 */
+	if (!priv->of_gptp)
+		return -1;
+
+	return ptp_clock_index_by_of_node(priv->of_gptp);
+}
+
+static int ravb_gen4_ptp_set_config_mode(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	int ret;
+
+	/* Enable gPTP Clock and Select High-speed peripheral bus clock. */
+	ret = ravb_set_opmode(ndev, CCC_OPC_CONFIG | CCC_GAC | CCC_CSEL_HPB);
+	if (ret)
+		return ret;
+
+	/* Set PTP source to GPTP module, only option on Gen4. */
+	if (priv->of_gptp)
+		ravb_modify(ndev, APSR, APSR_GPTPTIMER_SOURCE | APSR_GPTPCLOCK,
+			    APSR_GPTPTIMER_SOURCE | APSR_GPTPCLOCK);
+
+	return 0;
+}
+
+static const struct ravb_gptp_info ravb_gen4_ptp_info = {
+	.probe = ravb_gen4_ptp_probe,
+	.clock_index = ravb_gen4_ptp_clock_index,
+	.set_config_mode = ravb_gen4_ptp_set_config_mode,
+};
+
 static const struct ravb_hw_info ravb_gen4_hw_info = {
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
@@ -2771,7 +2823,7 @@ static const struct ravb_hw_info ravb_gen4_hw_info = {
 	.tx_counters = 1,
 	.multi_irqs = 1,
 	.irq_en_dis = 1,
-	.ptp = &ravb_gen3_ptp_info,
+	.ptp = &ravb_gen4_ptp_info,
 	.nc_queues = 1,
 	.magic_pkt = 1,
 };
@@ -3183,6 +3235,7 @@ static void ravb_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	clk_unprepare(priv->refclk);
+	of_node_put(priv->of_gptp);
 	reset_control_assert(priv->rstc);
 	free_netdev(ndev);
 	platform_set_drvdata(pdev, NULL);
-- 
2.54.0


