Return-Path: <linux-renesas-soc+bounces-21583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE8B49423
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 17:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A4221BC33F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7046311967;
	Mon,  8 Sep 2025 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Oz7MFzpr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DJwzI5MT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1873D311947;
	Mon,  8 Sep 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346301; cv=none; b=P/Voez3NCpYL6440qwcRwSJ7kw7JW7fHRKH7IRYuJa8sD0lVS+UkdXf0F/i1iU3YzgMLyagmma5bOJoiAHXZvrQ5QuuvHjliR+usRAamQCCM3u+86XEYt0tRUGzX2wp9VYMvAI3+JQd3sojvzhin06tbGRjbLXremZrwUCO9vkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346301; c=relaxed/simple;
	bh=l3RTtVjp0nY9tDtNogGgW+myfEU4sX1R8DwUnGQVFB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAf9j4/MlW6iJdC7Pp8lNx+LkYi+509S8K0F/xPRjzoLMBuwuKRKhBMFbrHl4S96QPdW/CqOhlCLvf2aM7PLzo5CuDTf4De6OSLDiVKAaauyEmR6gFD3hTasYHOsNPp3m9/5K2nG3hgCdOTTeIdgQb+YSuVBseT/ZTNmbyDbiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Oz7MFzpr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DJwzI5MT; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F069F7A0170;
	Mon,  8 Sep 2025 11:44:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 08 Sep 2025 11:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757346298;
	 x=1757432698; bh=Bg6zklM2N41/VHeW/tV1iE1EYj/xoKsZdA18LOc8lpA=; b=
	Oz7MFzprm7B6tIXBJCWIFYt8ZkFRuJxXNYuQVyDo3kkuCiaLAtWjz/iSoPIZT9y6
	Opld630XOrW/uVWzLCRPpZUDdaHk2bhzjYooFcP3G3E48rt+kxBhDLYhzhDU+XTx
	yKZ3JJRSSrQH5EmH06D5AtTLn1LZ+amI/kP9mXXiXui68vbV68d2wVUPki3YpT/h
	fP2cdqFvmSYtHt4MPipdTDTYZciUMFikqJwDAdXYYUyvAVedVw26pxuCyVkgTeoQ
	UsuW9TnP8byC5ga51RFrbkfCHIZVJDSMC4D8yTzMrrv1jgewOMoGixB7eglcfdou
	Yz0Vf0jq1ytMfhUgjjui2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757346298; x=
	1757432698; bh=Bg6zklM2N41/VHeW/tV1iE1EYj/xoKsZdA18LOc8lpA=; b=D
	JwzI5MT4ZpgC2VlEVkdQcJnGY8FZ0eluuBdCeFRB6NRTBUDbBparTxBdqk8oj7GN
	FH0Dvtg2ZLHebowcXGIUwIfUX+7Og3hqoc/RmCKsuwzITbPnDYzrKyC4kX+nDqgq
	QLd7HQHJBjRJbMjOf/CGF325LQFba0eL4YATpUy3QF/FRdxdGQeND2kLEhLKSDSH
	PgP6eULc++GWMa6wnQQvcen7vZlyVt/TxStlhuLmaafiv8NGxnNv78W0afnaXcb8
	4dOrfOxAbsr9DT74oBsDHYyr5eJwNOExUFY+4tKjB/Fsc1ch4MDz48vtZikGkeCc
	IfMm/dscTdqW9IG+IEtGg==
X-ME-Sender: <xms:-vm-aC7pwiZJBSzpg36bLQGKASre5t-G9OwGO_u5mqlC5SiRA-5pYg>
    <xme:-vm-aJR0AtW6Lm2BZ7CQMciWpWaiCr7ahEqHpYk9nP1UZkfqrEyYl_n1RjZpuEJOr
    1UqHN2pPOPxXnnlY3M>
X-ME-Received: <xmr:-vm-aIwSO5Cw3sI0iHHmRt54f2ZHBmKSEVA8Ukdx8q5EPAEF6n-FeqaEutSyRbR-KKSThC9KsgwEbHPzGFyq5cV_0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhes
    rhgvnhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluh
    hnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgt
    phhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusg
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgt
    ohhmpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-vm-aJoWoZB-eeuooX8dmMvM337mh65FVHKL0I8SIK1Oi0tgR1IQGg>
    <xmx:-vm-aD0MT3NoGPsVNgz6m9lZqj0hHGVOeqYRkVVGwv2eMvWrjqwn2Q>
    <xmx:-vm-aBzGXdU6ADchleWi8vdZ85Pc1nr-hStKv4XBbMBUpfD8Xu5WxA>
    <xmx:-vm-aPgHM2Vh8BSb2yWHfN4fASTDZ8TpIvnvKDOCYCY5p3ef62Sq7w>
    <xmx:-vm-aPIHmKjGVQ3c25vMv49AcxKYoIAauKai4NVDk5Cw9-IL8ZYgclCx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 11:44:58 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] net: ethernet: renesas: rcar_gen4_ptp: Use lockdep to verify internal usage
Date: Mon,  8 Sep 2025 17:44:26 +0200
Message-ID: <20250908154426.3062861-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of a having a comment that the lock must be held when calling
the internal helper add a lockdep check to enforce it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index cf13eba9b65e..d0979abd36de 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -42,12 +42,13 @@ static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	return 0;
 }
 
-/* Caller must hold the lock */
 static void _rcar_gen4_ptp_gettime(struct ptp_clock_info *ptp,
 				   struct timespec64 *ts)
 {
 	struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
 
+	lockdep_assert_held(&ptp_priv->lock);
+
 	ts->tv_nsec = ioread32(ptp_priv->addr + PTPGPTPTM00_REG);
 	ts->tv_sec = ioread32(ptp_priv->addr + PTPGPTPTM10_REG) |
 		     ((s64)ioread32(ptp_priv->addr + PTPGPTPTM20_REG) << 32);
-- 
2.51.0


