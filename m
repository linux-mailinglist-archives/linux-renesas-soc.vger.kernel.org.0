Return-Path: <linux-renesas-soc+bounces-21907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F2B59338
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CAE47B3FAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7E030505F;
	Tue, 16 Sep 2025 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GdR/JdfE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d+IbFp/M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F778304BC8;
	Tue, 16 Sep 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017824; cv=none; b=Prg2ZsIZJYl/kdLBaJGrXnx9gpoffakAwlacdaMQHnJQCY50ILEi9mImZIX/KBtzlpAFF/VWEr9ZgGnMhmoc1RiB7PE5g4L7roKnQM/cwl3FX4fpePh83SlS5vXo26Zq9Oil9k5IL64XYd7quVFbV2YT4e7VBlIFYIe+U9CHZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017824; c=relaxed/simple;
	bh=ASTnWHhf/+PP82KOhWKhvwScJTW4EWx9If+vKnZLWyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JicFlHkefJ9eh7Kkv7bG9dHXkaE3C5D4oKZVHlbsUHQcJsSawr5CG0Gv0TfPCs0i2ZTpTmRCF+ibMibfOmB9OoEbmk3uYE7dIxVkFHoEkID2WBS71EHhL5OyfmWyrkY55YkrJaH0B8rFJscg38QPZJAdCQ4ROerL734ovOvN410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GdR/JdfE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d+IbFp/M; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id F0AD61D000DC;
	Tue, 16 Sep 2025 06:17:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Tue, 16 Sep 2025 06:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758017821;
	 x=1758104221; bh=iF29y874N7dyUy76KWB+jZALKkxOsNKx8/MY2Efy548=; b=
	GdR/JdfEbhnb30g9qEwqsULg8kJxafGacRLktmXUiJqhAbVl1TjCJ8W2127o4B2w
	Mb9jqaivTHLgCJDmXBEFK8GfKDZvOdw+wIMPIEhTLwms0GsgrvSERLQZzUgS9+i4
	0Y20WSES9HH8bBElyTRDOcZZo7ALatFlQBZNSWXhwDALFxkmJaaFHD0GcOMGpSUt
	BSLWd7HrRnFIyEd4eRxacwU0kxVgBGEASaImSGGbIpUMyNmM5kq7/USoKjnWwtjO
	ONHFdoMzImmnsfyUfQZT7KJ6zF1BLTfDwdfhg57ubNtMpbxiQIjWePi7A2W8DFRQ
	wUPjGcOryoLOppdWPDI8BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758017821; x=
	1758104221; bh=iF29y874N7dyUy76KWB+jZALKkxOsNKx8/MY2Efy548=; b=d
	+IbFp/MqqliDCHwUsnmmI1dr2KIFu4nEw5p37w9tmoiZVnCHeTPZ1g6+SPMkcnXo
	z9hL5ujRWH57RB8Rm8tmOErIR6jgarKKfHxOCURCEQjPYlHoM/Ml+rRXssQa/xQ/
	lkOacMPT2b4Y6IwOE8g2BQRsz2BvioJJr2uUni8h2jvuzyZuyjdaU1TURspniSl8
	wkYdZ+3T1kViNqriy67kRuEOHF1lI4IVPiSDJT8QEXL+bABoE61HajTTayJQXHXs
	plGu/NvTmvIjX9Br5mQCEIEJfjjruCd8SQu0chEcdahfYi8wCMAA3Kk1lcs8TXOa
	aJRRwtLz2rLWubWuJBCGg==
X-ME-Sender: <xms:HTnJaLQ9P-jCq1O7IbHaaya2BBrDI0EINfXQ4c-IYDyzSnY4IZz0oA>
    <xme:HTnJaG0IN0cv0g6mUXDEN4f2vBIM39Jnu00ygUL2a_5LyL2R9ayylN9x209Vpzx_M
    SVeDQCSoqQn85lZSD8>
X-ME-Received: <xmr:HTnJaFzQJhz3YJs98bYutpKIzNqRVtNWuaH1atmBmx1MG5gkpcG2SKLZOHYk7v05e1sMRFBpr56ZPHV-uOUnVL47OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudefpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphht
    thhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvh
    gvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephihoshhhihhh
    ihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepgh
    gvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhu
    shdruggrmhhmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:HTnJaCxCdzLYIdS0QaVmxErOhU-7_gkxur8UYYi4PVzOIkW1W84vvg>
    <xmx:HTnJaB-okGiukzNL_YmN1rCYCxVZvS6YAqWuN0q55_k78pAmD8xqEQ>
    <xmx:HTnJaM-8riIrnM47RHiUqekifBEID0WYZHCAEkaVmrzjCWguomfCqw>
    <xmx:HTnJaJ6lXIPAW84EDyQ2INOIe9f1bwtTmFEE81QbC2HZohzQbq1tYw>
    <xmx:HTnJaEhpXcdWAih54Iy14KPX9A9cgeNpMvnVAp9Kldx9gQE_5EPf7OFL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:17:01 -0400 (EDT)
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
Subject: [net-next 5/6] net: rcar_gen4_ptp: Remove unused defines
Date: Tue, 16 Sep 2025 12:10:54 +0200
Message-ID: <20250916101055.740518-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver specific flags to control packet time stamps have all been
replaced by values from enum hwtstamp_tx_types and enum
hwtstamp_rx_filters. Remove the driver specific flags as there are no
more users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 1a1e43add129..9a9c232c854e 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -9,15 +9,6 @@
 
 #include <linux/ptp_clock_kernel.h>
 
-/* driver's definitions */
-#define RCAR_GEN4_RXTSTAMP_ENABLED		BIT(0)
-#define RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT	BIT(1)
-#define RCAR_GEN4_RXTSTAMP_TYPE_ALL		(RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT | BIT(2))
-#define RCAR_GEN4_RXTSTAMP_TYPE			RCAR_GEN4_RXTSTAMP_TYPE_ALL
-
-#define RCAR_GEN4_TXTSTAMP_ENABLED		BIT(0)
-
-
 struct rcar_gen4_ptp_private {
 	void __iomem *addr;
 	struct ptp_clock *clock;
-- 
2.51.0


