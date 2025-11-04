Return-Path: <linux-renesas-soc+bounces-24110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C713C3336C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AEFB18C3E7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF2A31329D;
	Tue,  4 Nov 2025 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UUaskcPo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="klCtFeBk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64453313E38;
	Tue,  4 Nov 2025 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295100; cv=none; b=Q03h8EOLHd5EmQpwASh/CRuZFLWPoyZuxctrIvIY6H/e57TSX83Kuyyu0+7fhWd8nvJ9FFOITDy4I4PntLDfca+fW3OiSr6Wr3rCVkfRzyf9vrfEbLJ2KIezIO8o8/+tI98NLiv8s1ZGtwk/WrCx0bRHJAUUUKO86ml4CufqnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295100; c=relaxed/simple;
	bh=EWL+svGyNNbHEnozimVuy02a9C8pDtN99DYILGkoKpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DB9Sa/Cqq0+AQh/IlQnJsEgqPJhkiUzdc4kAH9cLidmyZwY/XfUv8UG3pDE284Kp/0V/O65GOVmG5DmNqIm4aphfRj/JXebUzVlyF2QbQf9hFBKrKAEFMpbmKGQ8EjdqU7DROJsxVSmNIW5zBKV8XEHl4i7rUGxVpx9I4PBxgEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UUaskcPo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=klCtFeBk; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 9427CEC049B;
	Tue,  4 Nov 2025 17:24:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 04 Nov 2025 17:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295097;
	 x=1762381497; bh=snWPwdS72x1tInJekLw4KaQMaCfoXNyFHsQ34A5Av/M=; b=
	UUaskcPoYpJ+RyigdAmoG10FSxIity7oJDHpOHmm6O3FuGHaSsbSNWH60O/bXefH
	30/RVKXDrragT2cNkDEi7x8rn5R/DEV53P+DYgcaYMwIYdVQM8f3hIyirqy9HYwh
	s60tLuNX0kcSmFZ4msLdAPl1NmGsWIj/jqsXjdizCHwowqKLzZ4TTJTKbA5yW8u6
	DZaGEcGuWzXAt8agtRgA0HM3Xq0KTmvBQrpiW48MPzJyas8Z1wVust3fzzG67HCK
	rh/wJGNnOUvbr9jDKhsCmj4ENiG8Y/OGIGUQQUcm/HiDBWHRgnr0JOyBZhE81xli
	63WME2SoY18/++wfYkio3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295097; x=
	1762381497; bh=snWPwdS72x1tInJekLw4KaQMaCfoXNyFHsQ34A5Av/M=; b=k
	lCtFeBkpAz76MsAypwzb8va7/g9CmuM2v/bDjEqfltpwWe/ELS7Qec3rp9yH5ly6
	5v45O3o4OZ+DPq5ASrXguGltb/hrYVV8fI2ooF1y9wwE+JjZaU0SRdqBewZX2+D7
	catCyFD3Z6qkkk9UmA43divM7EvpYV2BjWIFSXScxWgU3hCk4sa2DiDJYguhSIRg
	kO2qwCnQjEAZ1MuTmE9hT0dp3NcbePSzNJbiTdMDjeScMDWc1qIS7x9mOQ7Abcm1
	7erYBdEHzv8BmACK7kEtD3nh7VzL7O7pWiUzSSichlLB6fTWSEOSO87G4womqbKP
	ooCxw8zGNNI14aCD2SgEA==
X-ME-Sender: <xms:OX0Kaefs1-3D57_u31U0zGqDdxL_2x5oVgjkvSEf3Y1J2HMx8L8hEw>
    <xme:OX0KaSRzpZO8PJXEOrItmfQqYxLmlP3Zu6pD20ZNooptFWGJ3D5f-p1hMFMG_eldd
    BTEhTJqJ-khXb3Z-EwjRH8qvmi3lxTZSd3pBMsJjG06Ykz7fQXKkoA>
X-ME-Received: <xmr:OX0KaUeqvu1cmljD3qFNnYaUlfCPL7GyvVqJ-yMOda8lYWt8uTIKbfX2_DxC6Q7xdvFOx5jXh-WkU5GZy278JqI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhi
    hhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:OX0KaTstjIxQrUEGRexfTpGLo1-EeZFmSHBxOkyCzd5fq0Guucszcw>
    <xmx:OX0KaYI3fEKi5OqhDjyIunE8QOFkexquMZUHgFIQeeCICW35dYJ-Aw>
    <xmx:OX0Kafa7EZiLLPfNq8zsDlqxA-IpVrSI1ylDT4aHUnpC03VBKFoNUg>
    <xmx:OX0KaTlTtHl763wVjooMHzrk0sep4-I7hQCFELP40h4IgQG8CMW8CA>
    <xmx:OX0Kabe48b79tiEFhBk5X-CJj4MuQLQuHdAFbuN9pKWLkl0wTMRidLtR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:56 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2 6/7] net: ravb: Break out Rx hardware timestamping
Date: Tue,  4 Nov 2025 23:24:19 +0100
Message-ID: <20251104222420.882731-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for moving away from device specific bit-fields to track how to
do hardware Rx timestamping to using net common enums by breaking out
the timestamping to a helper function. This is done to create cleaner
code and prepare for easier changes improving the hardware timestapming.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- This is a new patch in v2, suggested by Andrew Lunn to make the final
  patch in the series easier to review. I agree with Andrew the end
  result is much nicer, thanks!
---
 drivers/net/ethernet/renesas/ravb_main.c | 38 +++++++++++++++---------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index cc619dbebf9d..5477bb5c69ae 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -946,6 +946,29 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 	return rx_packets;
 }
 
+static void ravb_rx_rcar_hwstamp(struct ravb_private *priv, int q,
+				 struct ravb_ex_rx_desc *desc,
+				 struct sk_buff *skb)
+{
+	u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
+	struct skb_shared_hwtstamps *shhwtstamps;
+	struct timespec64 ts;
+
+	get_ts &= (q == RAVB_NC) ?
+		RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
+		~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
+
+	if (!get_ts)
+		return;
+
+	shhwtstamps = skb_hwtstamps(skb);
+	memset(shhwtstamps, 0, sizeof(*shhwtstamps));
+	ts.tv_sec = ((u64)le16_to_cpu(desc->ts_sh) << 32)
+		| le32_to_cpu(desc->ts_sl);
+	ts.tv_nsec = le32_to_cpu(desc->ts_n);
+	shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
+}
+
 /* Packet receive function for Ethernet AVB */
 static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 {
@@ -955,7 +978,6 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 	struct ravb_ex_rx_desc *desc;
 	unsigned int limit, i;
 	struct sk_buff *skb;
-	struct timespec64 ts;
 	int rx_packets = 0;
 	u8  desc_status;
 	u16 pkt_len;
@@ -992,7 +1014,6 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 			if (desc_status & MSC_CEEF)
 				stats->rx_missed_errors++;
 		} else {
-			u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
 			struct ravb_rx_buffer *rx_buff;
 			void *rx_addr;
 
@@ -1010,19 +1031,8 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 				break;
 			}
 			skb_mark_for_recycle(skb);
-			get_ts &= (q == RAVB_NC) ?
-					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
-					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
-			if (get_ts) {
-				struct skb_shared_hwtstamps *shhwtstamps;
 
-				shhwtstamps = skb_hwtstamps(skb);
-				memset(shhwtstamps, 0, sizeof(*shhwtstamps));
-				ts.tv_sec = ((u64) le16_to_cpu(desc->ts_sh) <<
-					     32) | le32_to_cpu(desc->ts_sl);
-				ts.tv_nsec = le32_to_cpu(desc->ts_n);
-				shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
-			}
+			ravb_rx_rcar_hwstamp(priv, q, desc, skb);
 
 			skb_put(skb, pkt_len);
 			skb->protocol = eth_type_trans(skb, ndev);
-- 
2.51.1


