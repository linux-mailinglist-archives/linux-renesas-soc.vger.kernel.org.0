Return-Path: <linux-renesas-soc+bounces-21905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C54B59331
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE523B3F47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD29A3019BB;
	Tue, 16 Sep 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="U0AKXwL5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aDe2HWud"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E81304972;
	Tue, 16 Sep 2025 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017819; cv=none; b=Ovf+QpZNSJ8QTC5Hi9z0Oe3zc6bKGGJrwc3c8/4ObMx6u0ArwESImPlDPDgsW596JLY8/wk5K7rSB2BOGeEhuPc97beEpa4VW+ohY1SJt+I7abieFA8N1YMOpsK2Qs7xSop/uiXH+yHWLnI9/wrPFoc7X/oko89kxkfchYunrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017819; c=relaxed/simple;
	bh=naK+nE/UxiyifbO4s8Po1OQXbkmQmvHYNroW29BzLoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9PJkpAtXquDiQh9dEzvkL60fYf/X3//FdGLHDZ6FkChp/FKFS5UsULfaF4nwurv4jHgCT2fIjWSy7RHh8VSFr3XDNX+CUajuFvQ3ONYGvhcLHGqRsrPGm6u5hzHCJuGwBXhFvTgCM+zGOthLO8sDY0soQ3iKA5Uj5TNuosKU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=U0AKXwL5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aDe2HWud; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id CBCA51D0018D;
	Tue, 16 Sep 2025 06:16:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 16 Sep 2025 06:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758017816;
	 x=1758104216; bh=LTTiH1jIcHoLFRZAjkA6KETDUVpSgKrblbSfA2Ej+so=; b=
	U0AKXwL5uSJrpXgKKZfzHxmqKGPs9ZLMeE47PRD7k1plr9iVm8oPvL9TOuO0KuKr
	M+05o/z9bGPzUvgV0u87RzfKOUyibdED+3v4Rt0poClXkJo8PjoSl0EFF3endqSw
	aYqE4dnp3YXuigGW1VsMkH7BM2sndiRB4xnZNBjpXpH62NQC9uRBaKfNH7s2vuS2
	6OeDbFQPv9ORAOWM0LErjS5hGudOQcRStCsxVIWHKUzk355+7rca5jphpYkrMr7B
	AfBk3Q0QCXlnluc1PMi/IPjJMCsZnUhbJx1X37DOMpeH4rala6unuOwx3OUi9wYq
	CG6ZJePW6bRu7b6275Y2aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758017816; x=
	1758104216; bh=LTTiH1jIcHoLFRZAjkA6KETDUVpSgKrblbSfA2Ej+so=; b=a
	De2HWudEK0DYwHQtVd0rlMCWpCZ4hjytQR+MseQjrZkRA6oDUE0qdxz9CFNZ+PLd
	t7Rdnaqyg3DfsQU+Wj4nyNX+NzSb9NsbZ9wGWOUjRaCqtQy/0BaGBxfJ6/IhB1Kf
	LqR2Cci5bLxxcqvHbVoUnRSCcekHqkPqem0QPxfJZfQPlwxHnCl9MpVMOSDZdcKw
	hq3XMp35jJW1NnRr/d+BAn+VQiLLfPOef99ZwjQjbFBU8iYgIqYN0pZ9cMtOn+2j
	O042i5dG2WIQrOu7HQUUrJ4ZFDWb/GQEbiNLCdBzkButUvcoLFVUKkpmBtuz5+Hg
	QbiM94T1HA4UpMoRI8LWQ==
X-ME-Sender: <xms:GDnJaOFkouimnnIgz_SsXloiWbtvfHJSL6j3FN1h-krR8N1WPpzoKA>
    <xme:GDnJaJYkHapHPqh8UlqHifjle_oANChchN6yxEHP6hcl_j64Zl8R2-tMPeq5kQX0D
    vlAG6yr7zglRZ-us88>
X-ME-Received: <xmr:GDnJaNGjOXkNNGYwaF3ag1UUhSnKeiXlaJZGzHUCmuIyISr5RfyTepqS9iwsqSjcWcAYu-wtt3vrf5cX3UEMNztshQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdeftdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:GDnJaP1oUiNyyt-TA0v7QVLGcQRi_AuTnx-UcnaBbzywL_VGrDd4VA>
    <xmx:GDnJaBz1a-FytH9TyrBX7xP7qLfJsCLtsXmDC7XjfOGiD31xR9K2Cg>
    <xmx:GDnJaIjSdf5_8RaXH5GRm0RDGqvIJtllxu5Z-TF7qjmnH9c_Fh8BqA>
    <xmx:GDnJaGMbMWn4ol2KcoglUtkoN6aopWhC5ladb_HG6mvGj4ZINTBjOA>
    <xmx:GDnJaLm3w5qxKuW9JREb8lyUSrjvGRn3cWd_6vJiAZnsfXXra-yZXejb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:16:55 -0400 (EDT)
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
Subject: [net-next 3/6] net: rswitch: Use common defines for time stamping control
Date: Tue, 16 Sep 2025 12:10:52 +0200
Message-ID: <20250916101055.740518-4-niklas.soderlund+renesas@ragnatech.se>
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

Instead of translating to/from driver specific flags for packet time
stamp control use the common flags directly. This simplifies the driver
as the translating code can be removed while at the same time making it
clear the flags are not flags written to hardware registers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rswitch.h      |  4 +--
 drivers/net/ethernet/renesas/rswitch_main.c | 31 ++++++---------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 3b348ebf6742..aa605304fed0 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1064,8 +1064,8 @@ struct rswitch_private {
 	bool gwca_halt;
 	struct net_device *offload_brdev;
 
-	u32 tstamp_tx_ctrl;
-	u32 tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
 };
 
 bool is_rdev(const struct net_device *ndev);
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index b541202b8f3e..c31e26002253 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -845,7 +845,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 		if (!skb)
 			goto out;
 
-		get_ts = rdev->priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		get_ts = rdev->priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
 		if (get_ts) {
 			struct skb_shared_hwtstamps *shhwtstamps;
 			struct timespec64 ts;
@@ -1804,19 +1804,8 @@ static int rswitch_hwstamp_get(struct net_device *ndev, struct ifreq *req)
 	struct hwtstamp_config config;
 
 	config.flags = 0;
-	config.tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
-		HWTSTAMP_TX_OFF;
-	switch (priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
-	case RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT:
-		config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
-		break;
-	case RCAR_GEN4_RXTSTAMP_TYPE_ALL:
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
-		break;
-	default:
-		config.rx_filter = HWTSTAMP_FILTER_NONE;
-		break;
-	}
+	config.tx_type = priv->tstamp_tx_ctrl;
+	config.rx_filter = priv->tstamp_rx_ctrl;
 
 	return copy_to_user(req->ifr_data, &config, sizeof(config)) ? -EFAULT : 0;
 }
@@ -1824,9 +1813,9 @@ static int rswitch_hwstamp_get(struct net_device *ndev, struct ifreq *req)
 static int rswitch_hwstamp_set(struct net_device *ndev, struct ifreq *req)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
-	u32 tstamp_rx_ctrl = RCAR_GEN4_RXTSTAMP_ENABLED;
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
 	struct hwtstamp_config config;
-	u32 tstamp_tx_ctrl;
 
 	if (copy_from_user(&config, req->ifr_data, sizeof(config)))
 		return -EFAULT;
@@ -1836,10 +1825,8 @@ static int rswitch_hwstamp_set(struct net_device *ndev, struct ifreq *req)
 
 	switch (config.tx_type) {
 	case HWTSTAMP_TX_OFF:
-		tstamp_tx_ctrl = 0;
-		break;
 	case HWTSTAMP_TX_ON:
-		tstamp_tx_ctrl = RCAR_GEN4_TXTSTAMP_ENABLED;
+		tstamp_tx_ctrl = config.tx_type;
 		break;
 	default:
 		return -ERANGE;
@@ -1847,14 +1834,12 @@ static int rswitch_hwstamp_set(struct net_device *ndev, struct ifreq *req)
 
 	switch (config.rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
-		tstamp_rx_ctrl = 0;
-		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		tstamp_rx_ctrl |= RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		tstamp_rx_ctrl = config.rx_filter;
 		break;
 	default:
 		config.rx_filter = HWTSTAMP_FILTER_ALL;
-		tstamp_rx_ctrl |= RCAR_GEN4_RXTSTAMP_TYPE_ALL;
+		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
 		break;
 	}
 
-- 
2.51.0


