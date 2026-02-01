Return-Path: <linux-renesas-soc+bounces-27758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPVOFL2df2lXugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 819FCC6F6F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 958CD3001188
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D748A280335;
	Sun,  1 Feb 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lk4UEmXd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RF+mh5IC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CFE239E9A;
	Sun,  1 Feb 2026 18:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971127; cv=none; b=tfzCe0hrSrZ2VoQBp4Z+E7kYFC77NFIt185cZnu8MEu8Uyej2wqW+jpVdzrefBMQauGBTwSrWwwExSkRk766QPKxo4DpbQcHRXp6ov9F8kpQO8p6XsAIxyJVpfeF87O8zpxX/3Vyi9OicbpNJS6PrGrR5R377twY2Fplu5cV0yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971127; c=relaxed/simple;
	bh=dDp9YcTTWcnQMYdFjtLfInaF0OeVenh7U6XOxPGqHUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvSXzk42SI+Skt0miq5LfVAywiBCCQccDTLdcqqBSi4XcNyyQX6Wn5zBBwWBcvYgzMoOP8iE5LZTNT+e7iDM8oVerjV/IWrUUMWd0Gy5OLqgIk7lwSOk2bfD/4cWZXswkqkkf7uc5jKtQdPeblu97+gMAFBnZO7Z4t29cgmhoZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lk4UEmXd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RF+mh5IC; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 04C427A010F;
	Sun,  1 Feb 2026 13:38:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 01 Feb 2026 13:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769971124;
	 x=1770057524; bh=G/ysENulD+AUnR/QbVtkkulvUdGNB7Kn//2lwru+h0Q=; b=
	lk4UEmXdAT+0ihWWS+NHQ15Zv2I3p5Uzqg+LxybGcaEz/21NgcipAX8RUoxtcxwu
	r4gNNE89sjfROjc2HaxuMGyzX6orVdBmDKHGJC7whe50ig+xWCwafreBJ6HyNGdA
	R8hN5QaTqdbf1EKIOEWXnu2S4x4wynD/x8486lopAtJc3hijlgbLhdGHgVBIWzUs
	Ga8J5iI1vQhJ87KiR1VovUn3c1howGFGY7IzDp/ju5ll7TKoZunKfaPjzMmzwZrU
	WKVZtXYipdgfnqsAFFswJh+16s+FLn04wpwmdVwXtDBMvY1FnTX8Fm9QpnqRQOFv
	M1liloqkzgrG9Uz8TUVpjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769971124; x=
	1770057524; bh=G/ysENulD+AUnR/QbVtkkulvUdGNB7Kn//2lwru+h0Q=; b=R
	F+mh5ICaafXfMdAwjTKbwG0KJansjqRC6E+TelsIECZ2/lnXESi/eX/spUdGlA77
	tGujcqN6TF3xc4Pk4Ntyq74FNNrw7M66xIfvmddaUWgboP9hEhckAmm3Q23vBsd+
	Z6iZpDF4yIiZr3K2H7srpe/+aSbzeQYU5UWL98ZVz8SXHbBwT1bxYdLafq0DcyPa
	uif2/OGSnZXf1iXja52d5ka4zvfLrZSPjZP27XpeuprxbH6yegG3vfwBDkRW/tQ0
	smorQtvzuPDdwbHzw2ovycaXXi5TGY46e9d4KthmT9c84SuMczHf42nilrTxSCCS
	znkkDwonBqfSL8m7qjFOw==
X-ME-Sender: <xms:tJ1_aZpw6dgbeg8a0u-RTXa2WfX92r8dMCNc9y1FS_DfwZNm4iU-Hw>
    <xme:tJ1_adOKNaMpdTWBh-XaLo5dW9Opj-ecFz04raSBdyCOAsyS5j9AJFJqarNz-8hEM
    zMqoyqUCWMU45SIzJwE7ojozKSUaNq0kK8MQrakuV1N3SH2TwEv4Q>
X-ME-Received: <xmr:tJ1_aVdElNMZ7S6iCenNaIPhm3JgTzn2MY0Oy31ICpnqrwp25LD-fvuwlxwumzywCe0ugR205v1YwXDxJJdIBMWW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeehheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhh
    sehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslh
    hunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuh
    gsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdr
    tghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpd
    hrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthho
    pehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:tJ1_abUUuuiQ5bOD3ve85blbV5L9YlTzaVkHMpN3kznIhG1aCHob9Q>
    <xmx:tJ1_aeB8ShxyGdQG-V8UWbvphvZXoMi5o5yeabmnLYk0RtRS8LlwMQ>
    <xmx:tJ1_ae7p0qhFCRk22bJ0RGbOkS_T5fZx5bEgCLAU5L_amFHUiDhkwg>
    <xmx:tJ1_ad2PUeiep_LftQ5xnQjIxGgHFJFUwxonuhr6gWKBcnfGgCZTYw>
    <xmx:tJ1_aQcQgKI1ZYMut2lefzG1JrLYb-oRi6aI2wR9BzHBgyNo4HatapfI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Feb 2026 13:38:43 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 4/4] net: ethernet: renesas: rcar_gen4_ptp: Hide private data from users
Date: Sun,  1 Feb 2026 19:37:45 +0100
Message-ID: <20260201183745.1075399-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27758-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 819FCC6F6F
X-Rspamd-Action: no action

The Gen4 PTP helper module is already used by RTSN and RSWITCH to
support PTP clocks and will be used by RAVB too. Hide the Gen4 PTP
private data structure to make sure none of the users poke at it.

This will be more important for RAVB use-cases as more then one RAVB
device will need to cooperate using one PTP clock source.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 10 ++++++++++
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 11 +----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index a14a16cf5fe6..27a6f0492097 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/slab.h>
 
 #include "rcar_gen4_ptp.h"
@@ -23,6 +24,15 @@
 #define PTPGPTPTM10_REG		0x0054
 #define PTPGPTPTM20_REG		0x0058
 
+struct rcar_gen4_ptp_private {
+	void __iomem *addr;
+	struct ptp_clock *clock;
+	struct ptp_clock_info info;
+	spinlock_t lock;	/* For multiple registers access */
+	s64 default_addend;
+	bool initialized;
+};
+
 #define ptp_to_priv(ptp)	container_of(ptp, struct rcar_gen4_ptp_private, info)
 
 static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index fffccda401f5..6abaa7cc6b77 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -7,16 +7,7 @@
 #ifndef __RCAR_GEN4_PTP_H__
 #define __RCAR_GEN4_PTP_H__
 
-#include <linux/ptp_clock_kernel.h>
-
-struct rcar_gen4_ptp_private {
-	void __iomem *addr;
-	struct ptp_clock *clock;
-	struct ptp_clock_info info;
-	spinlock_t lock;	/* For multiple registers access */
-	s64 default_addend;
-	bool initialized;
-};
+struct rcar_gen4_ptp_private;
 
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv, u32 rate);
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv);
-- 
2.52.0


