Return-Path: <linux-renesas-soc+bounces-21903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B94B5932C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 136CC1898741
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB62303CB7;
	Tue, 16 Sep 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IvXg4a0b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TcfWnx5j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61042302CB8;
	Tue, 16 Sep 2025 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017815; cv=none; b=l/4pFPtXd2RGVTUaJRmleTQqPF4FMhkUbubB2Jh5M0j+anEPVTcso9Pa5PFbI6bF+hP0275qBx5kC1hAPnUZnCeDtgSDHSqY9iWzpHAace3oaxvMpPY5h/04YS/HdzVTpB20u9cCWUQFkvRp1954PmQDw0qB8PHB/1OtO0I1ykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017815; c=relaxed/simple;
	bh=IY8rAtDzFOYy7i2oLUmkjPEy6UOM6QCXGVN4Zx0llI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDuDNub4L216ljeO69NxeTmksk9pWyKrQDnAfgaG9P1gJdaRKnOBy3bd70EYpvkzf8HQQWrDWUsT9Fb4e0NVOcw6MihJv7Fbdt7OVcj0zwU6jn21hFiR4nM/HwFuhmsP103zsT80C7wX6fN/6BHQD2namIcv4061iUPSXRi0lj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IvXg4a0b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TcfWnx5j; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id CFAD81D0024D;
	Tue, 16 Sep 2025 06:16:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 16 Sep 2025 06:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758017811;
	 x=1758104211; bh=v3A3a4BvCfBNf7mNnjhH1sSrHV94UhsUdX5peIVPXZQ=; b=
	IvXg4a0bLqk0Fu/Cfdz30EG4G6DoGRUozZwzxDclGHGfUxs1aMEMgn00NUqePtnj
	AcEmUEjWc7iM4qopq3f6nnKN51TkqOkAQzolJZfOg7U9LIBJCOJqxrO7GcAWxbRv
	ofF6YdkMpaln7b6Aukn1mBtxiuW9zFBcx2bDVUv7mhEwupDGGJJwsNxySY4Z31xw
	v1qDNd+miJ5YlfwDQJybtKpU29VTUd0YDEN30BAqGvNoDdYajWiLdYSIFmBOcdSB
	L/7Wu3c3c9Une8csd3j74M8WWA4FZubRkfjy7hdbA0ko5osJ+CV3MmseMFKaSeTK
	pf1FhsjiReUjryAF0DcwRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758017811; x=
	1758104211; bh=v3A3a4BvCfBNf7mNnjhH1sSrHV94UhsUdX5peIVPXZQ=; b=T
	cfWnx5jp60IxdMotmLQQauUMOp6LcIJRraBYSCKIbN+HlMtWUbU3Hfrafn5mWbDi
	AzvoTtFwNTLkQupjrIiwLXDztyfAgER3KBnC+qe+6PIrCZaz0zhWEy1Q8Y9sHyRT
	wg7h1a120u6m/PupqyrCxPGZomS7NNlNP07HwMO2g9CcTdZnC0/BlIOhJn3fjYwM
	Cr/N2CQ3EgnZgeCTYiKZ+gkC7Ipl420Dpv1pzPJpEAsxt4rxAj5OQ4VK20yq5Hwy
	HMkMjSW9y9TVbliiKyfApoTUVEXEFajzSG03n7xnCP85lOOLHNlQ5UDBD7HT5UjP
	3fjSIqYBHo4jo3J1Ym0kg==
X-ME-Sender: <xms:EznJaLPAuOPToCzqEOdlh-naIzzEl8nrQy9507-QlPyyScJN90FJ_A>
    <xme:EznJaADpuGrTNbVseIj_P47uhhfZHnivsz7dyuiD3G0LiIAjyN0o3cEMEJjL6PD4G
    yt8T9SQ88DShHiI-Ts>
X-ME-Received: <xmr:EznJaPOAu2tuxR70wITkZIUnXt1brPWjivZA3l4VXLNAdWtHdAneb0bTZS3cm4Gx6gxWOKPRqn28bSOnkmXoVfpTcQ>
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
X-ME-Proxy: <xmx:EznJaHccomgkFjwxzsIWPfe3JmabBLcUm-iLCTXkwTM2uwGQNxDDxg>
    <xmx:EznJaA78EkBbV4TX1efbewMgaEIiE-adRMcaxv7jIbr-S8AGS5meIg>
    <xmx:EznJaJIz6Z7se2zmFyd5fxu3CnoQ8dgVs1M0AImZJn8uo6fMGziPcA>
    <xmx:EznJaKVouITj5xgHcs2ZMXk31Axj_iGqD9KRs7HtpMeWO5LqMgRElQ>
    <xmx:EznJaHMZLpGoERAwu4iMIV3P7L_h-PMxVWeEonIZ573OETSROJ6Clil6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:16:50 -0400 (EDT)
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
Subject: [net-next 1/6] net: rswitch: Move definition of S4 gPTP offset
Date: Tue, 16 Sep 2025 12:10:50 +0200
Message-ID: <20250916101055.740518-2-niklas.soderlund+renesas@ragnatech.se>
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

The files rcar_gen4_ptp.{c,h} implements an abstraction of the gPTP
support implemented together with different other IP blocks. The first
device added which supported this was RSWITCH on R-Car S4.

While doing so the RSWITCH R-Car S4 specific offset was added to the
generic Gen4 gPTP header file. Move it to the RSWITCH driver to make it
clear it only applies to this driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 2 --
 drivers/net/ethernet/renesas/rswitch_main.c  | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index f77e79e47357..536badd798cc 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -9,8 +9,6 @@
 
 #include <linux/ptp_clock_kernel.h>
 
-#define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
-
 /* driver's definitions */
 #define RCAR_GEN4_RXTSTAMP_ENABLED		BIT(0)
 #define RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT	BIT(1)
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index ff5f966c98a9..72fa31008144 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -30,6 +30,8 @@
 #include "rswitch.h"
 #include "rswitch_l2.h"
 
+#define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
+
 static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
 {
 	u32 val;
-- 
2.51.0


