Return-Path: <linux-renesas-soc+bounces-32324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BtDF1teAGoGHgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 12:30:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2027503A11
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 12:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4DFD30045AA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1222EE262;
	Sun, 10 May 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I0h4ExgF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YskLV+lx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80804175A84;
	Sun, 10 May 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778409048; cv=none; b=SZDFq2BoD02+hu0SacJJkbH0ywUMbP/o1ZUmRtiQfk9MIIfN9wYazZMRQfezPhERDyE52JrkVQ0bKiwI6iphY4xm+iyMF0VozcMUQA/6cIZVLu+qkpSCCjg99GJYSdeZrSw32V85T43ugV1OoC5KdnpNEDTpcCsqWvn9kkdsS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778409048; c=relaxed/simple;
	bh=OJnBXpHy0TCpQ0bHlfRGGQ5W9rEzuI/g/UlwGVFxAf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PGMi1D7ptrPkcY6HF57OCM4mk2nqzR+aFhwAOiqTjH7YHXe0CJPfXHCLbRsPCVNI3p+UmZ9f1xm6rku0BfXb6gYLMnlgTT+hoIO3BK9rNHFnBDf1m5iswyuCti0uWWdcA4icHEeXE+2TK0BFhCrFMIdwD30xDgpqputDEWr10SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I0h4ExgF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YskLV+lx; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 377341D000B8;
	Sun, 10 May 2026 06:30:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 10 May 2026 06:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1778409044; x=1778495444; bh=aJ
	91xONVsconoGapjJtB3qYAf0KS5nMi+X1jF2T7ZUE=; b=I0h4ExgFvtxOYP9WEe
	xA9HtpHWHz9OmJxjZ9PSRBaMA1b53QfNatkeQjroOhWKYZuyDVtKjuS5ZoEWCCkZ
	WGJ+VNVfNkrVSysvsU8Zi2VG0z0zz7HmL5foQyzHFsjjp4z+kRyaig8M4QA9/tRA
	CNH8YNXjgPWx21iBIQNKTfHEJeBELy2ZBSyfWSRurlt/MxEvAn8U0FVWCScgVDqM
	bopwpRL6hyLhg2URtCNbptcko+DdhAbdx6md1ycnxRB+4tof5h/Rj3UPt/4aWYS8
	NJt0tvFxc8EbxU6LgB14cTp7phBp4U3g/C/X7peyH5x+TaoW6vbyA3UDuk+qaXD9
	u8XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778409044; x=1778495444; bh=aJ91xONVsconoGapjJtB3qYAf0KS
	5nMi+X1jF2T7ZUE=; b=YskLV+lxS4dJnkLMzW5yaZyjBxpZ80x8//lB5F7J/KAQ
	Ia6nkqH4q6ugNockIpPZwhGYK2wbeTuuHQEuH/mGY3C+2WFydO9O3NXj9HEbcUzQ
	MBIkK33JsvL85CRKSsrdlOgRSvkoBHSD5uqmq6jw/0K8wUyDx2oHKzufFiRugtO4
	EZDS2F5Vx4XzAjk0ljchBXZNK8d1ort8OBiNb9iug50yivsZNHmxnhb+XtlXz8a3
	6WU9XT0ywIbu/zB608fgjtqPXvq9C3tgiAPyVXv8nKiIVAVAChL89AMklvJvWsaQ
	wpPi2tOikpa2JOhXn46kXtj4RJOHZ2FhsKAUrIA0xA==
X-ME-Sender: <xms:VF4Aajmj4LQy5SHVc6trQFMnqgqsMEswq0qqQGnThV0YodC7Hir-Mg>
    <xme:VF4AatVURCITFUCfsGZbKCbom7J0nwssk0i02k_OMm0nnuMppCFNCqtY-OKwud90x
    jpZE06tnJXUBveQ7UonssLHwoK3eYT7b2SALA8sWH4pqzNrVBZdQo0>
X-ME-Received: <xmr:VF4AanqHlX4RoS8pv5tgotyNemC5SmethwpWznC3PsTGlqo5oesy98mw71KcBzx4B5jGhVdPqbtDtYnF8i1IeE2Ept6HTrqb8NZN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudehkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefhgefhveeghfetudeh
    fffhjeeileehkedvveffuddtleegudegjeeufeefvefftdenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnh
    gspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghu
    lhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvse
    hluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdp
    rhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkh
    husggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrght
    rdgtohhmpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehrvg
    hnvghsrghsrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdho
    rhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VF4AauWWhPt-kxuHJPd6QaoUIPfvhoWAXqY-mu7ej72nsgJkY_fKzA>
    <xmx:VF4AaoHgD2LFkCLK3VUwK6-dVhig5OPG3zYImKgWA37bBxhNxpyaDg>
    <xmx:VF4AalBwKHemkIDsY00vcPx48vRfFRZquoptsVOplq5M6JqOr3OS5A>
    <xmx:VF4Aaqz_VsKq32xG452hgq3EWDbHDBBoIiMbeOsXCty2L9MaCsAM4A>
    <xmx:VF4AagVr3zgvlxRiGG6P_eub8PgRvfDZQI5T6MgKOvJqYAFqfViUg5Zl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 06:30:43 -0400 (EDT)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sai Krishna <saikrishnag@marvell.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [next-next,v2] net: ethernet: ravb: Do not check URAM suspension when WoL is active
Date: Sun, 10 May 2026 12:30:17 +0200
Message-ID: <20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A2027503A11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32324-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,marvell.com:email,glider.be:email]
X-Rspamd-Action: no action

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
Reviewed-by: Sai Krishna <saikrishnag@marvell.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
2.54.0


