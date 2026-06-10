Return-Path: <linux-renesas-soc+bounces-33811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mp79C2Y9KWpjSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5E6684F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=caWwLwg7;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Y e+Rjsk";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A5E231C2C86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8670F3DB30F;
	Wed, 10 Jun 2026 10:25:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709C3F44C8;
	Wed, 10 Jun 2026 10:25:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087157; cv=none; b=FiKkXVmQWN0ZEzWf7IyoqEUfSVBrIVSPhqoFPqOps7ir+Uh5rmUPkeuCcdvWDFj1YiQWH3LdB4nwDTOgK9J9JjrtV5a3r+N3KBv382xQhao5daYgmnHxzeILhdHalNw3Qizbkx25/pQWXo1kJRH/X0xj/KfdxT7t/f7KHmZPTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087157; c=relaxed/simple;
	bh=8D+Z47Bc+X+0D8CmgC2LtSijtPwPirod9Vjdq2Zs7MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gbqdEW9/H9QCzIlvE7lRyNkA5iqbx8w6uOSk/77FM3oqHEMDh/Pgw9v4cELApkzN3SpqtXOF/IAqZBYGM1+AngXVhNqKwFJTmlPnc+muK5IBoTPUPvJBYiIM00pnqdJkplVT3YwQgSjMyqkTz+iKAxeX5pB2xA5gCUP5tNdiE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=caWwLwg7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ye+RjskR; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 320691D0015E;
	Wed, 10 Jun 2026 06:25:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 10 Jun 2026 06:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087154;
	 x=1781173554; bh=pzqzdCKCWRqnC+pHXhGJ2IfBDXVQ+BkFu9XTH9s8lbg=; b=
	caWwLwg7ghH91oYDjmGemfBe7nEsqFMDFA09NSpGqxSd7JO5GuZueuyO+wpVB1wu
	142TWf97qHhsQv/o2c+NPA5ukC+j1qjSU9/kN4j1EaeKhPDtsbkXZiw8toCybxLS
	EFVLQrJws9haQpkitFf5E94csFGjGelOg0oshGWLkEhlqCougaNnF/l+hm51Bk2O
	vAZZJfSbN0+ik+2RUqI+4RpGBs0SiDkQh1qt4D2cxINhKIECE5lDXJUNYHkX+tUr
	aaf7m1nb8NNx088h/ZVzk+R0YV3tNEZl1L0+9Zdvjh0B1Ck8xIiDr9JORviSrdDs
	I5ZFoc4HmHWvXhzty6VyPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087154; x=
	1781173554; bh=pzqzdCKCWRqnC+pHXhGJ2IfBDXVQ+BkFu9XTH9s8lbg=; b=Y
	e+RjskRBg7PhCeZvO59RmnmqxZsJp4ijTft0VWNPtT3R/bIZdpDV2a2biPRLKRuS
	yMFnu8opzMD/xY1jdq6UuI38K9cjg614ckYxXSmhlxtEgh4kxju//wbfEyvqTvvM
	dKXMRNfoEt/V5iAeqiFJbattZtudEtcr67Mn/jhpXx4aVTqhPh3d3G712Tjs5/Se
	AWFYr87FkKzEKawwU1ZPHzIlhI6httBRHdTPUGk5QFau8GcPAeqbMfPM5yp6dtmF
	AHNjem2KKQOxyNNCxuH9k3hYlYR+bQ0Qwu7tGHMTtQ+2+mZiPq9z4PawRLA5uNW+
	E0f4u8s3gezzmVV4OEW9A==
X-ME-Sender: <xms:sTspatTqjn01HdUQ5btqqKcKG6zA321iCKXtbWvpYY09hVkXA0U5IA>
    <xme:sTspavgPbc191tj685h39R32m-hMwcTYmWZr57JzLP6ZulavcRWYtOtHn0TyT7vpA
    tEWhqNUNZUqZcwhiPFY1csZUb-itrdBK2cORfrpZG_YJp0XGs8KOQ>
X-ME-Received: <xmr:sTspahi8B4dBI94exKvCtbGjJ2vNAcReGdKu4JPWETcLA1xlAm6JkYFn5qtsEbQjD47rMX3z2soS8r8YP2eDeYk_vjh3D1064bWs>
X-ME-Proxy-Cause: dmFkZTFzW/9QC37+C6pwAAlXRd22xN1zZvcc/aAYAEwmptBJoj74pNle0sv90UFUXVEIti
    m/TXBT+b8ycbCA1jm9rERPhV+Sd31MD/WlXbDoX2JxJ6Qv3usROBzpqj+DMyB1kKqVTYhc
    ERrKwWnQn26VjQHRxqzZ5oyvFIdUu/m9ZbtCSBnC0yE5o4SheBShzr78hZy32NuJ02IClx
    2fjEQdCvSSwLCZ+LxOJyqORJx8sf3SzR5RGPDrf5gSBOpzDZG5+nsOhfU7EJdvxDaR7H5h
    t1uEJLRS6QuLEP2ODphkYB/MqLCGLB4Ov2Ubd82pulimvPp1Y+jqrHUs5VrX2+WppgMai7
    0YMCwc4YWtO+5vbK1h6aKiI1wy06l9zB9K06Kx+6BgdQOgiQ7UbsJR11bqdYJDhh9kTpeA
    +bT4U+K8Qb71pvaAjAxhe6hjvr6qWuVtDkmBnHxfU/XCeHnP4RJHsOECho905eJTeVGQq5
    z8q6Clycx+VJlAaMnAhAuOwcEmm7qXlsQIe/SeoAI+Yt+PyRPR8QHvMOLHPJJm715Yz24M
    EDly4xX6SQI75vKmSZqzWLuvNnqaG7q2z4R8prGG4ttgZXDLe82nSgfgvONwqgykkggyfI
    IYY6yxFxtScttA5hk8VBc4z+Iv9IolTfFpPkXvTGAOnRfqBbmSjtMDp4gTOw
X-ME-Proxy: <xmx:sTspanY9gwkoq3aYyTTsoCHcutiMRcNK7NNwWeXG2JdvX69Z99tFOQ>
    <xmx:sTspaqXul47A_RyuU9t6mumu_KvKFZ4cnbfLdSzqMC_BfCf0Yxod6g>
    <xmx:sTspauiQK1HXVr4NQlgOI99AZkZTyYW7fh0O0LBTx-MGLkwrs27CEw>
    <xmx:sTspalksQ4-U1uOFez9wzA2QOAKE9AmFzfBV_WhC-DkjqwtOGOVrNQ>
    <xmx:sjspapVj8fFtSrVjXVsMARGzV-XLU-S4JYYk4QpSrv4ddebl6M1dMGYW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:25:53 -0400 (EDT)
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
Subject: [net-next 3/9] net: ethernet: ravb: Simplify gPTP start and stop
Date: Wed, 10 Jun 2026 12:24:26 +0200
Message-ID: <20260610102432.3538432-4-niklas.soderlund+renesas@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-33811-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79C5E6684F6

For devices that do not support the gPTP clock in config mode the
somewhat oddly named flag gptp is set, compared to devices that do
support the gPTP clock in config and operation mode where the flag
ccc_gac is set instead. The two flags are mutually exclusive.

For the gptp-flag devices (Gen2) the clock is tied to the AVB-DMAC, when
it is stopped so is the gPTP clock. For ccc_gac-flag devices (Gen3) the
gPTP clock is available whenever the ndev is open.

Prepare to add Gen4 support which will add a third way by cleaning the
Gen2 and Gen3 cases up a bit.

Fold the gptp-flag start and stop calls into ravb_dmac_init() and
ravb_stop_dma(), which start and stops the AVB-DMAC. There are no
functional change as all call sites to the construct,

    if (info->gptp)
        ravb_ptp_init(ndev, priv->pdev);

Are always just after a call to into ravb_dmac_init() and all call sites
to the to the construct,

    if (info->gptp)
        ravb_ptp_stop(ndev);

Are always directly followed by a call to ravb_stop_dma().

There are two special cases where the calling construct covers both the
gptp-flag and info->ccc_gac devices, one for start and one for stop. The
condition that it is preceded by a call to ravb_dmac_init(), or followed
by a call to ravb_stop_dma() are however true for them too. Reworked the
two special cases to drop the check of info->gptp.

The end result is that the gPTP clock will be started or stopped for the
gptp-flag devices in tandem with the AVB-DMAC, while the info->ccc_gac
devices will be controlled, as before, when the ndev is opened or
closed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 37 ++++++++++--------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index dc2fbbeff895..dff66a347baf 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -707,7 +707,15 @@ static int ravb_dmac_init(struct net_device *ndev)
 		return error;
 
 	/* Setting the control will start the AVB-DMAC process. */
-	return ravb_set_opmode(ndev, CCC_OPC_OPERATION);
+	error = ravb_set_opmode(ndev, CCC_OPC_OPERATION);
+	if (error)
+		return error;
+
+	/* Initialise PTP Clock driver */
+	if (info->gptp)
+		ravb_ptp_init(ndev, priv->pdev);
+
+	return 0;
 }
 
 static void ravb_get_tx_tstamp(struct net_device *ndev)
@@ -1115,6 +1123,10 @@ static int ravb_stop_dma(struct net_device *ndev)
 			netdev_err(ndev, "failed to stop AXI BUS\n");
 	}
 
+	/* Stop PTP Clock driver */
+	if (info->gptp)
+		ravb_ptp_stop(ndev);
+
 	/* Stop AVB-DMAC process */
 	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
 }
@@ -1719,9 +1731,7 @@ static int ravb_set_ringparam(struct net_device *ndev,
 
 	if (netif_running(ndev)) {
 		netif_device_detach(ndev);
-		/* Stop PTP Clock driver */
-		if (info->gptp)
-			ravb_ptp_stop(ndev);
+
 		/* Wait for DMA stopping */
 		error = ravb_stop_dma(ndev);
 		if (error) {
@@ -1752,10 +1762,6 @@ static int ravb_set_ringparam(struct net_device *ndev,
 
 		ravb_emac_init(ndev);
 
-		/* Initialise PTP Clock driver */
-		if (info->gptp)
-			ravb_ptp_init(ndev, priv->pdev);
-
 		netif_device_attach(ndev);
 	}
 
@@ -1961,7 +1967,7 @@ static int ravb_open(struct net_device *ndev)
 	ravb_emac_init(ndev);
 
 	/* Initialise PTP Clock driver */
-	if (info->gptp || info->ccc_gac)
+	if (info->ccc_gac)
 		ravb_ptp_init(ndev, priv->pdev);
 
 	/* PHY control start */
@@ -1974,9 +1980,6 @@ static int ravb_open(struct net_device *ndev)
 	return 0;
 
 out_ptp_stop:
-	/* Stop PTP Clock driver */
-	if (info->gptp || info->ccc_gac)
-		ravb_ptp_stop(ndev);
 	ravb_stop_dma(ndev);
 out_set_reset:
 	ravb_set_opmode(ndev, CCC_OPC_RESET);
@@ -2020,10 +2023,6 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 
 	netif_tx_stop_all_queues(ndev);
 
-	/* Stop PTP Clock driver */
-	if (info->gptp)
-		ravb_ptp_stop(ndev);
-
 	/* Wait for DMA stopping */
 	if (ravb_stop_dma(ndev)) {
 		/* If ravb_stop_dma() fails, the hardware is still operating
@@ -2056,10 +2055,6 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 	ravb_emac_init(ndev);
 
 out:
-	/* Initialise PTP Clock driver */
-	if (info->gptp)
-		ravb_ptp_init(ndev, priv->pdev);
-
 	netif_tx_start_all_queues(ndev);
 
 out_unlock:
@@ -2374,7 +2369,7 @@ static int ravb_close(struct net_device *ndev)
 	}
 
 	/* Stop PTP Clock driver */
-	if (info->gptp || info->ccc_gac)
+	if (info->ccc_gac)
 		ravb_ptp_stop(ndev);
 
 	/* Set the config mode to stop the AVB-DMAC's processes */
-- 
2.54.0


