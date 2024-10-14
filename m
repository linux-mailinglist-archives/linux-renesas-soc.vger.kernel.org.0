Return-Path: <linux-renesas-soc+bounces-9724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFB99CA78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 14:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E00E283ECE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 12:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AECE1A7268;
	Mon, 14 Oct 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VxyaRFCj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HHUEX/vp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B91A76CE;
	Mon, 14 Oct 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728909851; cv=none; b=FIIzqHkqtn9PkoiQHhjgANCyIM0r0ZsjnJQlOSRRAGaq1HH5c2spEFL1bphRaxdJGg9aVWTZc6SUd71FeN02Z3k5sONZkt79ElaRA3CW8c2TGGYst1znU9vlU68MfFVjlnKCWLo0uBouiehr2/dJVKnivgHMT6x+dEmGBNfhh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728909851; c=relaxed/simple;
	bh=XxZxGnn82mxIvEbUeBzMWAPVGZurpXTncZODheaqPz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AdJM6G/fUPXiQqr5AhrH7Nt5zhJitVEsgaWy8KEiKK6SoJm/EmW7l0e2U41PRMfsCK14a7h0T4Nvh2krIVmYATP8LsKXNtxR9TvuAiJENvmJGmanEiOQQOGvnBjm5tH7pxiesBuqK3pMnB1hiGMzyV8F0G39JBv6LumV3x48O9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VxyaRFCj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HHUEX/vp; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 76AD31380238;
	Mon, 14 Oct 2024 08:44:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 14 Oct 2024 08:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1728909845; x=1728996245; bh=Wg
	GNG557jItPuCdILvkW7mh7kR6bwMiXVlvUp8h0QJk=; b=VxyaRFCjgH8Q/pP8xS
	S+KgxYNnMCaQ0GcPnCeRW7oc/L3Q2IPZ2TUwKsZLHbQh7koeLAJl7P2YyIfpCj3c
	b5bo/P6Jf2FibVops0eDpSdzzYnViiiRcYEoZ+zAMzw2Qa5WQqLbKXxRvMoDKOJH
	q7MkAJPQqswYjQJSo6moL27lUnfa2SQOahuj9Men+RyXPC5shyksjcjexknwZ2XO
	CX/fGcaVkBudYfNcU/UMDpxGIYVd69Q/17kxZ1gQBM/0RDEdkZsFH3QDn00276JT
	ghsTsjIxf6T45nvuHrEvmniTSGdRgOoSh8K3iyeAdWrrUgKvQfHrzErl0ujVZkDF
	CO5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728909845; x=1728996245; bh=WgGNG557jItPu
	CdILvkW7mh7kR6bwMiXVlvUp8h0QJk=; b=HHUEX/vpWP6o/9MngjE+fB14Xvp8C
	VE40CBdDy+dFQUarKH1dGglxx14cBBcRcbJAgFFrSCu1uavdpyHCs+Nnn39GfuJO
	uM5ZMg5zaBWSwlX2Tdy+cMwVEIyREn+WTFSYO7hsYRjF6YXZwyE7I0SrtgrCLpJa
	P9iQ3i9ISBvC0WlcZ/PY9cmU2AOp2G8USxfu5qe5WDEStmfES1hB3GUnwc5g1A25
	cNbIqfLtBZbRueGRywuqkyRMet2WS+lYrF7/aDB31d53fE+p4eOA1k+zpRAwW9OZ
	7eFgVpzbHWJ6u8WJNUpr9cAdBsZdRA7Qwch/sXiFo15+wy4psZaO836DQ==
X-ME-Sender: <xms:FBINZ8cFdyolrf6nFtonRbl2vRlH9KvaRiBdy0t-dsjNK3k6tOQ8yg>
    <xme:FBINZ-NbSDH1GqrOzmZ4xbEAXVUHSRyK3zNC98NqvYCCsQMbJmwGFeZZLUR5FRTl_
    EiICG0CKLULsZ3vRCs>
X-ME-Received: <xmr:FBINZ9hpAYW52WmJs65Cnl7c5lKKt-4mpBerEH6TEkxW81BQBACYkTAEWoxM4QxRTUKrCGYIoG1dNpOTRExPpybElg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshdrshhhthihlhihohhv
    sehomhhprdhruhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpd
    hrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehk
    uhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrth
    drtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgdruhhjsegsphdrrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprd
    hrvghnvghsrghsrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvh
    dqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomh
X-ME-Proxy: <xmx:FBINZx-NtQ7o8LVIN5qnhEtlrDAGrEk_HEmTrbiM2wPQyE2yj_skXQ>
    <xmx:FBINZ4u07paDBkT5gC4QAap7gxsuiY9uQongHJW3kpZ_lchZz8dv9A>
    <xmx:FBINZ4Fd4jSpalHm5d9yQ_xQBaJ9f6ddH12df3uQFk5NTXYTtrAhhw>
    <xmx:FBINZ3NH7WeVsA8-fbai4nRA8uFqwJbG37QlTwhPiduLqmw2Tq0wuA>
    <xmx:FRINZ5EKlmTlGTbDtBpBUO6Pt4zEehMmzB8FIxK_YQiYdOCZyfh5zLVw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Oct 2024 08:44:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2] net: ravb: Only advertise Rx/Tx timestamps if hardware supports it
Date: Mon, 14 Oct 2024 14:43:43 +0200
Message-ID: <20241014124343.3875285-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent work moving the reporting of Rx software timestamps to the core
[1] highlighted an issue where hardware time stamping was advertised
for the platforms where it is not supported.

Fix this by covering advertising support for hardware timestamps only if
the hardware supports it. Due to the Tx implementation in RAVB software
Tx timestamping is also only considered if the hardware supports
hardware timestamps. This should be addressed in future, but this fix
only reflects what the driver currently implements.

1. Commit 277901ee3a26 ("ravb: Remove setting of RX software timestamp")

Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Tested-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
* Changes since v1
- Improve spelling in commit message.
---
 drivers/net/ethernet/renesas/ravb_main.c | 25 ++++++++++++------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 41f88f8836f8..83c6b885f1c2 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1750,20 +1750,19 @@ static int ravb_get_ts_info(struct net_device *ndev,
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *hw_info = priv->info;
 
-	info->so_timestamping =
-		SOF_TIMESTAMPING_TX_SOFTWARE |
-		SOF_TIMESTAMPING_TX_HARDWARE |
-		SOF_TIMESTAMPING_RX_HARDWARE |
-		SOF_TIMESTAMPING_RAW_HARDWARE;
-	info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
-	info->rx_filters =
-		(1 << HWTSTAMP_FILTER_NONE) |
-		(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
-		(1 << HWTSTAMP_FILTER_ALL);
-	if (hw_info->gptp || hw_info->ccc_gac)
+	if (hw_info->gptp || hw_info->ccc_gac) {
+		info->so_timestamping =
+			SOF_TIMESTAMPING_TX_SOFTWARE |
+			SOF_TIMESTAMPING_TX_HARDWARE |
+			SOF_TIMESTAMPING_RX_HARDWARE |
+			SOF_TIMESTAMPING_RAW_HARDWARE;
+		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
+		info->rx_filters =
+			(1 << HWTSTAMP_FILTER_NONE) |
+			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
+			(1 << HWTSTAMP_FILTER_ALL);
 		info->phc_index = ptp_clock_index(priv->ptp.clock);
-	else
-		info->phc_index = 0;
+	}
 
 	return 0;
 }
-- 
2.46.2


