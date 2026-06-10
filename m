Return-Path: <linux-renesas-soc+bounces-33815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oYkmI/09KWqMSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:35:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F566855D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:35:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=Mp6G+qan;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Z Beg+YZ";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30B8A31F8039
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589993F9288;
	Wed, 10 Jun 2026 10:26:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AB3F8EC6;
	Wed, 10 Jun 2026 10:26:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087167; cv=none; b=abxdzcYuC1KRYwRt5l7I+mprKjE21Rw1IZrE++mbJfY5ryLg8+xexdJwyRbcIuW1jTxPocLnJRZTcLdti9Mdim2oThBll+33uJUsH8eh3/dyImwRRnV0DFO10VKZAQqmw5l7ctEQD9lsTLrxTwMAyNjZCZ2Bt6PqUCbTEseOAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087167; c=relaxed/simple;
	bh=TmJispLpFILebpHYf3KSzA2Vp9XFe2kRr7qheN+drYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKxdwIOh2d99dM18QEmOTGC6H6mX06gLtfDM1fjGzCk4yw7yW5dIrBWb+yLHFvdwCnmQVQQSQd9QIsk6SIu9o8RfJNhrQp72Dck13y3t1EhnJwfDBF0RGBW09nTNj7GPwl8BPdTsqeajAthjHqCijEVUxLkV4sMZF4zzDdQ9iKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Mp6G+qan; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZBeg+YZo; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id D9F2F1D00163;
	Wed, 10 Jun 2026 06:26:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 06:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087164;
	 x=1781173564; bh=iEB5NgV1+NPxln0Ntolnkaxq0nwddl1Mv6mgRGnebUI=; b=
	Mp6G+qan/YUKR/p2L0MygghFN3mNh2U4LWi+oaKOw6F+BBK6amdrHziS+XF4RgNM
	6VeSmZqxHWPWrfPQVlzTKXmGSWRDTioqHn/fIbuWcq0A9G3LfWoHY/2QWEFWzVqw
	jqty5TZy+KtHTbW6AEiW4AU/KtyiAlugGzgceLjGB3CfPdp1Ju+QIfGMYopU4Aom
	t0lZnmx34T8lH0QUU01DTFzqATpUUECp9Bs7JHvjt/vxh5/+PWIekA6aDbHUpwR8
	qVx7xfRxLtdzer4+MIX/wRTSdnqvjTpOVLHx8NypanhZ4VMCKkhDB9Bes1viUs4Y
	Va0yjrrdbxdkOSYF2aJbUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087164; x=
	1781173564; bh=iEB5NgV1+NPxln0Ntolnkaxq0nwddl1Mv6mgRGnebUI=; b=Z
	Beg+YZo5yzloNgNtBfi1sOYoghZNy+hVLPoGozY+2NlyYvZqhwmK4TRby1SorHEh
	nyB9eGN1GC0L6yPCObyntU3XNQzHtnX8R6yCJ3ncglAxaaMV6QUGCJV6Ky0G4NSo
	tAqwRTufqIscuAkDmsw+5vrBGlWKtIJhCBkccsFiKZpG9gWaAUZir1N+5scc+BUk
	qonDWQSVPFvONiV3QlFQY+qMPuGYeSXm9LG3R6xgJbD3niSrRUVXGIqRb9Dqubmg
	7OcMlPG+mhuWNSHPF88bbpV5g/ShamTCy08iqieC7dLY6fp/98PchIKbEeB0R62J
	j2QyMMC7yz8NA/wnsPrsQ==
X-ME-Sender: <xms:vDspao_7PeBYV64jdIvjxLgcUjl74XQXydptvPzatOy8uQA3Vu66xQ>
    <xme:vDspapcxY7Gwi75V6WE-X2RFkVamhE3dgZvF3w_CpriUJzT1vFg_6K5ELycfrhmES
    BclFpuAV_8MAzlGXckzrAqrj2V7TRmcUPAuVbJjtfKVWyEPF2TAYcQ>
X-ME-Received: <xmr:vDspasvmnJn2VXp-KmXb5PWJSPH1YFMBR7NivGiEJOtBQm4RvsbTq-KTB1Y3EDotYuIsd-VHtWrafz9SEeu2HQGpHqanQH8nEVaD>
X-ME-Proxy-Cause: dmFkZTFrEm8+EfGduI4cjpI/phslmGepvi+lq4n3IoA8TmIL8SMvs+0W722ha6inr/DXRL
    mXJ3w6niM/zeh39lYq9zcctfZbnKM3iZaXrS7wLBKvu4oAjuGpSIswm6UL+AdnZuXtvTKn
    hdJBRm24IKK50ozESzq6hg4+mrrro5BgU2P6cD7ixQYzaxQknzHNlghLdAnCA3vZVQkeHF
    0OTy/x3tXqVXf4TMwj4KBTpIR7U4fjQLgSWenBhPs+Ag9PT7fn3IDY0NR5KM/aR5k31bXR
    d/cyalp+FtNjN561P6VOlHjBg8oX1baAJlAgLySA3a1a8o5d1x52TiCv4JwfAJcPsl7Gn5
    0DWty1l+JOPZ2fbPrdNgFHF5wPrySZDia/lFp+uzBupXVg7i63o2KRDOkRKgnyeWi9CqtQ
    nEec6cfLDKl7UDZ75oYzK/Sk1NkiRwYX/hq1y2gluQBw+5rBmiYyVzVAXOvPfW7Xbg4hKj
    J0hKd+9qbdUvGeL6uOUmfOAyQ5bWIMXRKkdcIFBff4keCmo3WKvHIdiEtXxIFLS8cGTVsJ
    UM7cjKUxXvb/rAnhiw7AQObVPflSvE+SWxBm7K+Svuwxtdy05biV8X+j9wPbNU9BTT7UEn
    5SdO2vOL9X/ebKlPNM5ZGlNC/j3m+gplgqPfUUggpJTIm95JtQ2CgQ9RBjNg
X-ME-Proxy: <xmx:vDspaq09Z44kTTzkgg-BbhvGtt9qePIVUK-ao9mbV3hDCAYF7pAejA>
    <xmx:vDspahBwkeCQUJideVk17MfI2UXd-uPU_K7_KLrMI3L148xzl87qLA>
    <xmx:vDspanfNUXvFVaUS7atk8rqxN2ElSQLTMSwDWZ_lc1UtEeDLws38Gw>
    <xmx:vDspajxvx7GKxhiH8lCJq5CPBxVTlTaHd4FkyKmq4PV6V-jWW7etLA>
    <xmx:vDspavgJMJMYwX5hX5Ag4zGbVvUAyDHMcqs9MvcvYDfSikhZ3AQtAeiS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:26:04 -0400 (EDT)
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
Subject: [net-next 7/9] net: ethernet: ravb: Add callback for gPTP clock index
Date: Wed, 10 Jun 2026 12:24:30 +0200
Message-ID: <20260610102432.3538432-8-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33815-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: E81F566855D

Prepare for adding Gen4 support which have an optional external gPTP
clock. Add a callback to get the clock index and use it to determine if
the device shall report gPTP support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      |  2 ++
 drivers/net/ethernet/renesas/ravb_main.c | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index f063f4ba5714..caad95a9c3c5 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1042,6 +1042,7 @@ struct ravb_ptp {
  * critical points in the RAVB driver.
  *
  * @probe:		Probe the gPTP clock
+ * @clock_index:	Get the PTP clock index, if any
  * @set_config_mode:	Enter config mode
  * @dmac_start:		Called when the DMAC starts
  * @dmac_stop:		Called when the DMAC stops
@@ -1050,6 +1051,7 @@ struct ravb_ptp {
  */
 struct ravb_gptp_info {
 	int (*probe)(struct net_device *ndev);
+	int (*clock_index)(struct net_device *ndev);
 	int (*set_config_mode)(struct net_device *ndev);
 	void (*dmac_start)(struct net_device *ndev);
 	void (*dmac_stop)(struct net_device *ndev);
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 85020c943e10..4b0d06fb5f4c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1773,8 +1773,13 @@ static int ravb_get_ts_info(struct net_device *ndev,
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *hw_info = priv->info;
+	int index = -1;
 
-	if (hw_info->ptp) {
+	if (hw_info->ptp && hw_info->ptp->clock_index)
+		index = hw_info->ptp->clock_index(ndev);
+
+	/* Only advertise ptp clock if present. */
+	if (index >= 0) {
 		info->so_timestamping =
 			SOF_TIMESTAMPING_TX_SOFTWARE |
 			SOF_TIMESTAMPING_TX_HARDWARE |
@@ -1785,7 +1790,7 @@ static int ravb_get_ts_info(struct net_device *ndev,
 			(1 << HWTSTAMP_FILTER_NONE) |
 			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
 			(1 << HWTSTAMP_FILTER_ALL);
-		info->phc_index = ptp_clock_index(priv->ptp.clock);
+		info->phc_index = index;
 	}
 
 	return 0;
@@ -2650,6 +2655,13 @@ static int ravb_gen2_ptp_probe(struct net_device *ndev)
 	return ravb_compute_gti(ndev, priv->clk);
 }
 
+static int ravb_gen2_ptp_clock_index(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+
+	return ptp_clock_index(priv->ptp.clock);
+}
+
 static int ravb_gen2_ptp_set_config_mode(struct net_device *ndev)
 {
 	int ret;
@@ -2666,6 +2678,7 @@ static int ravb_gen2_ptp_set_config_mode(struct net_device *ndev)
 
 static const struct ravb_gptp_info ravb_gen2_ptp_info = {
 	.probe = ravb_gen2_ptp_probe,
+	.clock_index = ravb_gen2_ptp_clock_index,
 	.set_config_mode = ravb_gen2_ptp_set_config_mode,
 	.dmac_start = ravb_ptp_init,
 	.dmac_stop = ravb_ptp_stop,
@@ -2703,6 +2716,7 @@ static int ravb_gen3_ptp_set_config_mode(struct net_device *ndev)
 
 static const struct ravb_gptp_info ravb_gen3_ptp_info = {
 	.probe = ravb_gen2_ptp_probe,
+	.clock_index = ravb_gen2_ptp_clock_index,
 	.set_config_mode = ravb_gen3_ptp_set_config_mode,
 	.ndev_open = ravb_ptp_init,
 	.ndev_close = ravb_ptp_stop,
@@ -2775,6 +2789,7 @@ static int ravb_rzv2m_ptp_probe(struct net_device *ndev)
 
 static const struct ravb_gptp_info ravb_rzv2m_ptp_info = {
 	.probe = ravb_rzv2m_ptp_probe,
+	.clock_index = ravb_gen2_ptp_clock_index,
 	.set_config_mode = ravb_gen2_ptp_set_config_mode,
 	.dmac_start = ravb_ptp_init,
 	.dmac_stop = ravb_ptp_stop,
-- 
2.54.0


