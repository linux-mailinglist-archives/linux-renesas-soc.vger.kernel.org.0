Return-Path: <linux-renesas-soc+bounces-31215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H3iGnHX22nAHQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 19:33:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C43E51C8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 19:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B86C8300AEEE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 17:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFF2351C1C;
	Sun, 12 Apr 2026 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OEumEEvg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uT7ARMcQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996A2236F0;
	Sun, 12 Apr 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015197; cv=none; b=c8t64r+TZ9CuFfcNQziPWnkF4Z10TMTRZsdNKuZNoiyY311R9KFUeB7wU6yEm/kabI+2FRPIFqYx53UWpLoGNukWMGHjul+lKMTM1/708CVDND3fg3+3A8w/tNGjIFPzLfkKfpOQgnQugFIupM5vuNQdLS7VLTitK0sZwo2UQDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015197; c=relaxed/simple;
	bh=V9g6OBu0qLH0nReguZFQzRQGSIDj5DPEDtLzn3ITa6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UvcyQHNHbSmWLo193aVmL8Gza5/htRs8Dw5BIRcO33v3ZOZI788PKxhO/29ttqDO7ROCQgKBqyEqSoY9Xln5c3cqBMvBXHsW75a0xN5ruy/UZjhGvXvofGbvME0w2Lp6cfrThXUA1qSjGV7MB9gRvZg+PUxa1BUlqKaOEHJeU1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OEumEEvg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uT7ARMcQ; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6DD53140004E;
	Sun, 12 Apr 2026 13:33:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 12 Apr 2026 13:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1776015194; x=1776101594; bh=0E
	hFMvCtGQZleGr+Fzi7/rhnRq5XhGgIsg+ff3G75pc=; b=OEumEEvgBKrpHtucFW
	EFLa43zEI08k7xu5eZa00geyw29q2Jo5ouk7K5pZSgwSwGupbkN+oH8ajIddOijt
	bJdwPWnqRwCKON72MV2w1VFue2b0xClBnE0+paLebaqrw74i/uNfJpQSeVvgGOiy
	qhq0jDED4R02eavy3KZQYd0gg9F8eXM9ZXL5C+7dLuTHDYCIHm4KKL83GDD1d0Xi
	u6HQ1Z/Lmw9yil9HX610lzzXUsTju3ql6UE5s2go9gyKFb0jP7Z861O5IZSxRI27
	bA1N7c01zI3qa7uRzQngjqpbxN58E4t5H6+Rbi/hzxaMXRD6e1S4UsYqQkCNmniC
	JZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776015194; x=1776101594; bh=0EhFMvCtGQZleGr+Fzi7/rhnRq5X
	hGgIsg+ff3G75pc=; b=uT7ARMcQfCXnbL84SAcXtI+ihNTCpedJT4qZkZl3PAOB
	zMH5+uF5VjEaFHnULLfyx0kZnjQ6vbBFu4gkhKDRjdJh9QuTOzJvNob0qdiBZZlD
	mnK9Vxu+FAcQvqJnSRiACzmEguYlbJNgx234oKBtsPySyQLsWuDfsUPJJsx7KWIs
	U1k7K/TAZOeSrBHhz83N4VF56eObkS4iK16mY2n/nkyi7tt+Bocwqq0IiUtx9WC3
	6ABCjqo+RTh18QFItKdmpcERP1jl+Xka52gsbiDpyNvBfJRyE9BtE0lWCyOMr28U
	RVPBBC0I8Q91aosV/+8dj84Afx5j4ehKv9rA1wliOg==
X-ME-Sender: <xms:WtfbaVcCagMRizILaLi5jW_BIYzp5cHw9ibE72famlplaz1LodqAwQ>
    <xme:WtfbaRev6a7fJkTuiZHWcF5dYn6oE2kAKY3cpZLeZ3zBp2KwdgyCGujU5yxQvT_If
    22PuKQlbMt7HGds9DefAwPInOF0D1y0ujvkquz8ss-8YDabxwycEQ>
X-ME-Received: <xmr:WtfbaX16UL8SaFJuYzFIZS-8KrktwhFYjKcqeAHsAQCdfc2iqY_A5vgronfswHx4fDCRvqJ-tgAMeU5Id7-gWNFPCBbuFs06zPe3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefheelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhephfeghfevgefhteduheff
    hfejieelheekvdevffdutdelgedugeejueeffeevffdtnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsg
    gprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhl
    sehpsggrrhhkvghrrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslh
    hunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuh
    gsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdr
    tghomhdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgvnh
    gvshgrshdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhr
    ghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WtfbaR9IcQvLSiDKA0fDgB4KEqJZPWm8Wm7FDITK3CnKC94TVFTskw>
    <xmx:WtfbaU6qZtQowaBkhNADLmiESrvOgcB6IqoqzZ9YmmmKm4d0GWgDVQ>
    <xmx:WtfbaRsC0g1_2PcWtdXMYi2lemHk62yppdYlftk2V7A71VJ8Nvr2zg>
    <xmx:Wtfbae1ghLNC72K_llBmxOm2ULoRkb0W2pv15XAFQgHt6nxZAjGYww>
    <xmx:WtfbabrIte8Au1dfEfKEDMTXVbVMW0256H_teNaPmrCdLPUQ86FPgvmu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Apr 2026 13:33:13 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net] net: ethernet: ravb: Do not check URAM suspension when WoL is active
Date: Sun, 12 Apr 2026 19:32:13 +0200
Message-ID: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-31215-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D87C43E51C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When updating the driver to match latest datasheet to suspend access to
URAM when suspending DMA transfers a corner-case was missed, URAM access
will not be suspended if WoL is enabled. This lead to the error message
(correctly) being triggered as URAM access is not suspended even tho
it's requested as part of stopping DMA.

Avoid checking if URAM access is suspended and printing the error
message if WoL is enabled when we suspend the system, as we know it will
not be.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWnjV%3DHGE1o08zLhUfTgOSene5fYx1J5GG10mB%2BToq8qg@mail.gmail.com/
Fixes: 353d8e7989b6 ("net: ethernet: ravb: Suspend and resume the transmission flow")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 1dbfadb2a881..5f88733094d0 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1108,9 +1108,12 @@ static int ravb_stop_dma(struct net_device *ndev)
 
 	/* Request for transmission suspension */
 	ravb_modify(ndev, CCC, CCC_DTSR, CCC_DTSR);
-	error = ravb_wait(ndev, CSR, CSR_DTS, CSR_DTS);
-	if (error)
-		netdev_err(ndev, "failed to stop AXI BUS\n");
+	/* Access to URAM will not be suspended if WoL is enabled. */
+	if (!priv->wol_enabled) {
+		error = ravb_wait(ndev, CSR, CSR_DTS, CSR_DTS);
+		if (error)
+			netdev_err(ndev, "failed to stop AXI BUS\n");
+	}
 
 	/* Stop AVB-DMAC process */
 	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
-- 
2.53.0


