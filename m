Return-Path: <linux-renesas-soc+bounces-13969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD0A4E7D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 18:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E37017A4BB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 17:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8F7294F3B;
	Tue,  4 Mar 2025 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GpzD4opl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C24294EC8
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106756; cv=pass; b=G36acrlGc5/QHBcrQMzvdsqcW/G9S6/uEU19+Kb6GHPo2QoeHGzejNU98oC+MKWENjl6GO4uku8xiMW+KgF4UgnU3gYt4mhaoyXo0e1vsNBRYzSS2B1756+kkRMXiAvjPsmBFmYD3CJAisupYjSxJtbZB5MpltHacFlCIs9heoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106756; c=relaxed/simple;
	bh=MuXhWb8I/WgZF55jUWmYmeYlpzilT+5kGD3/bEfg+Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghPyfi4qihjrzCg/i1KUfUqZfTlsP/m5oupUP1of6VgXVucSAyTYaoeEhq9TbrpT5LpMJa3l5aqRdbt7T+7R7CEjISZln2P9EihMJnTTFHV/FdY8binrE83YVYQJ+UgW4t8HfZHuIho9FKkv0BUlRyx4a3yoVzui05WOmggTKiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GpzD4opl reason="signature verification failed"; arc=none smtp.client-ip=78.32.30.218; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 58B3040CEC97
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 19:45:52 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hNS6Wp6zG42V
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 19:44:24 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id E97864272B; Tue,  4 Mar 2025 19:44:21 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GpzD4opl
X-Envelope-From: <linux-kernel+bounces-541467-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GpzD4opl
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id ED87E42EF2
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:04:00 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 7FD6E2DCDE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:04:00 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F5AD3AD5E2
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7961F4181;
	Mon,  3 Mar 2025 10:58:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B211F3B9D;
	Mon,  3 Mar 2025 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999510; cv=none; b=LQ//U+brAMF1U7oEN9/sTDeECfUhQfxIZ+wA7bQQC+ISjZJ8NU6yF+BnfPgx5ogup4kMC8QQQCOC6iAVnvOWi7sd7kms3fkrpUtHeW36M+DPskM+XZy5cM7i5U7WX1S7juo3RTWS3PJLEnBdfUbaj41S2MJlcw4Si6ENXvgAUTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999510; c=relaxed/simple;
	bh=MuXhWb8I/WgZF55jUWmYmeYlpzilT+5kGD3/bEfg+Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJLERoLLDMppbmfYGAqAWVuURV2Uzm3YqFimALW2BPptwzVUdWMjc0jsd523WN9jMix96Hb1EtvCAe70/bK/d9YTYrLgNe4k0VtQ26dGjynVEBdYWP0Bo4Wkvzk3Ah+yceNXxbb3Mz1x7blcsBEF7pEpodJcDGgCYe1kIHrag9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GpzD4opl; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zVOQIBvyGVn9misUYWwRCx37wyzZpBfrC8j7hiAI1TM=; b=GpzD4oplECLJoIzVb4BmodHX/E
	HhO9eVfSr6xJOTEPWMFSpCtOCnbJgBDGPBlsi9s24PYSYbEtYdJbuKeJ90gOHwN72N3VFv2tA4ijP
	ktNFCW8NIj8dOK1PWBiXjElXVkn/I65LiZ3Jril76QkgLTI/Bnvsh9LUnolgPtzxMncnRRS1jbzfk
	Mf68n13ZrtowQkmA9pykzMPrzOELtoU4+W53NiOnhT51uYTt9GTkkQr24A+1gHtF+RJ8i0gFK42hw
	Xnk1ZRi257P5e4QnPZ1N3y3+oTNKfpAvwTCfMxvBckdopN7kMcQyEAO6DPlRfSpb/wcQTrMVUSo53
	RtZSUNuA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56642)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tp3Uz-0000I9-14;
	Mon, 03 Mar 2025 10:58:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tp3Uw-0003jb-2J;
	Mon, 03 Mar 2025 10:58:10 +0000
Date: Mon, 3 Mar 2025 10:58:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Message-ID: <Z8WLQrmsi3ZbiQf1@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <CA+V-a8un7Oy9NtfDUfs0DSwRVAFn52-vWj1Os=u_1dqijJhbMw@mail.gmail.com>
 <Z8V9OC_1llF3leZd@shell.armlinux.org.uk>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8V9OC_1llF3leZd@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6hNS6Wp6zG42V
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741711488.34357@WRhYW7x+JBZhvLiEhqaFFA
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 09:58:16AM +0000, Russell King (Oracle) wrote:
> I think that the way forward would be to introduce yet another flag
> (maybe STMMAC_FLAG_LPI_TX_CLK_PHY_CAP) and:
> 
> 	if (priv->plat->flags & STMMAC_FLAG_LPI_TX_CLK_PHY_CAP)
> 		priv->tx_lpi_clk_stop = tx_clk_stop;
> 	else
> 		priv->tx_lpi_clk_stop = priv->plat->flags &
> 					STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
> 
> and then where STMMAC_FLAG_EN_TX_LPI_CLOCKGATING is checked, that
> becomes:
> 
> 	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
> 				  priv->tx_lpi_clk_stop,
> 				  priv->tx_lpi_timer);

I'm thinking something like the following:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 3a00a988cb36..04197496ee87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -307,6 +307,7 @@ struct stmmac_priv {
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
 	u32 tx_lpi_timer;
+	bool tx_lpi_clk_stop;
 	bool eee_enabled;
 	bool eee_active;
 	bool eee_sw_timer_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7d10e58e009e..7709d431e950 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -461,8 +461,7 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_FORCED,
-			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
-			0);
+				    priv->tx_lpi_clk_stop, 0);
 }
 
 /**
@@ -1110,13 +1109,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	priv->eee_enabled = true;
 
+	/* Update the transmit clock stop according to PHY capability if
+	 * the platform allows
+	 */
+	if (priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP)
+		priv->tx_lpi_clk_stop = tx_clk_stop;
+
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
 
 	/* Try to cnfigure the hardware timer. */
 	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
-				  priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
-				  priv->tx_lpi_timer);
+				  priv->tx_lpi_clk_stop, priv->tx_lpi_timer);
 
 	if (ret) {
 		/* Hardware timer mode not supported, or value out of range.
@@ -1262,6 +1266,10 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
 		priv->phylink_config.eee_rx_clk_stop_enable = true;
 
+	/* Set the default transmit clock stop bit based on the platform glue */
+	priv->tx_lpi_clk_stop = priv->plat->flags &
+				STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
+
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
 		priv->phylink_config.default_an_inband =
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index cd0d1383df87..102de1aeac17 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -183,7 +183,8 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
 #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
 #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
-#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(12)
+#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
+#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 
 struct plat_stmmacenet_data {
 	int bus_id;

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


