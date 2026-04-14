Return-Path: <linux-renesas-soc+bounces-31273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFZzD9x93mm/EwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 19:48:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD83FD3F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 19:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E950301E03C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 17:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492BB30EF68;
	Tue, 14 Apr 2026 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0Rlud1TX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AF3090D9;
	Tue, 14 Apr 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188889; cv=none; b=pKcwISLhBPiwn/iqJA2uBCdlFqqZ9f5bF7q0Q5R4VWvE7heMUzcKgiv7TltklcHcDUC1reZgcIe1QnHCO+P6bf8pwP6e+zFfZgADBprlckPrFDSzF+8GoybRGyNIJ4hxfH/9FZn2Lai4EfbBj74EtdiOFRYW9KPQ5tuf+b6rzr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188889; c=relaxed/simple;
	bh=vwkmPQ4vECj24CaAKCQNvFAt03oFvGc25MGVu236yj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1FC/GqeCQqj5xKkecy76LuGn6q/YqrO4SmMznH08Ia22Y1mjFjR8KbVBMXeKMmRv5VpWlAlU0P/inUlN0ABG4S2V7wE2Hqq1X63RpvX0tH7yxpr9h0bxQBRNQ/2eeQy2T+rtmuagwozfEzj3b9XTPgArlG+7/A719c0t5WlCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0Rlud1TX; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZASKAzVGF+jSQfIpJWuXt8y+ZdMesuU0Htwl33sN3Xo=; b=0Rlud1TXYs8L4yxoNl/rmtSg7e
	14qdUaHeHu7JGF8qL/4u3D1kwz8Gx83xhcLUsqJPzkXVNJjnEX5DBiX+7jkSCnrrkuVj6VJ+9augH
	vg/Fv1+DPlT5LSydyc0ffJjg6Urx3S0MkWTAG17qY/iI9M6q07hBr2K82fo6vAP/974si/vaRkwQ8
	kdKwJhE2v/qbQje4SmTTo/6FJ+HdAHsv4Tqq65mNbRDrV6YLZ+FgE42ZWLVRJ+JJFpdTcyY9641A7
	H/G8jRU3BdaPo65//+mgwBb5Y7Ho6YKasnTAXiJv1J77TRBSCwZyKYdKYsI8SNwMxAKH/TjbnGgqG
	p/JRrc2g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54232)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wChri-000000001Ge-1GvT;
	Tue, 14 Apr 2026 18:47:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wChrg-000000001Oy-0Lgf;
	Tue, 14 Apr 2026 18:47:56 +0100
Date: Tue, 14 Apr 2026 18:47:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/5] net: phy: mscc: Drop unnecessary
 phydev->lock
Message-ID: <ad59y5ZfJDKFo3eU@shell.armlinux.org.uk>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
 <20260412140032.122841-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412140032.122841-4-biju.das.jz@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31273-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,microchip.com,nxp.com,vger.kernel.org,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	NEURAL_SPAM(0.00)[0.125];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,armlinux.org.uk:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAFD83FD3F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 03:00:25PM +0100, Biju wrote:
> @@ -486,15 +486,9 @@ static int vsc85xx_dt_led_modes_get(struct phy_device *phydev,
>  
>  static int vsc85xx_edge_rate_cntl_set(struct phy_device *phydev, u8 edge_rate)
>  {
> -	int rc;
> -
> -	mutex_lock(&phydev->lock);
> -	rc = phy_modify_paged(phydev, MSCC_PHY_PAGE_EXTENDED_2,
> -			      MSCC_PHY_WOL_MAC_CONTROL, EDGE_RATE_CNTL_MASK,
> -			      edge_rate << EDGE_RATE_CNTL_POS);
> -	mutex_unlock(&phydev->lock);
> -
> -	return rc;
> +	return phy_modify_paged(phydev, MSCC_PHY_PAGE_EXTENDED_2,
> +				MSCC_PHY_WOL_MAC_CONTROL, EDGE_RATE_CNTL_MASK,
> +				edge_rate << EDGE_RATE_CNTL_POS);

This one is fine.

> @@ -503,7 +497,6 @@ static int vsc85xx_mac_if_set(struct phy_device *phydev,
>  	int rc;
>  	u16 reg_val;
>  
> -	mutex_lock(&phydev->lock);
>  	reg_val = phy_read(phydev, MSCC_PHY_EXT_PHY_CNTL_1);
>  	reg_val &= ~(MAC_IF_SELECTION_MASK);
>  	switch (interface) {
> @@ -522,17 +515,15 @@ static int vsc85xx_mac_if_set(struct phy_device *phydev,
>  		break;
>  	default:
>  		rc = -EINVAL;
> -		goto out_unlock;
> +		goto err;
>  	}
>  	rc = phy_write(phydev, MSCC_PHY_EXT_PHY_CNTL_1, reg_val);

I would much rather this was converted to use phy_modify() as well so
that we ensure that the update is atomic.

	rc = phy_modify(phydev, MSCC_PHY_EXT_PHY_CNTL_1,
			MAC_IF_SELECTION_MASK, reg_val);

where reg_val is assigned the field value in the switch above.

> @@ -668,19 +659,15 @@ static int vsc8531_pre_init_seq_set(struct phy_device *phydev)
>  	if (rc < 0)
>  		return rc;
>  
> -	mutex_lock(&phydev->lock);
>  	oldpage = phy_select_page(phydev, MSCC_PHY_PAGE_TR);
>  	if (oldpage < 0)
> -		goto out_unlock;
> +		goto restore_oldpage;
>  
>  	for (i = 0; i < ARRAY_SIZE(init_seq); i++)
>  		vsc85xx_tr_write(phydev, init_seq[i].reg, init_seq[i].val);
>  
> -out_unlock:
> -	oldpage = phy_restore_page(phydev, oldpage, oldpage);
> -	mutex_unlock(&phydev->lock);
> -
> -	return oldpage;
> +restore_oldpage:
> +	return phy_restore_page(phydev, oldpage, oldpage);

This is fine.

> @@ -708,19 +695,15 @@ static int vsc85xx_eee_init_seq_set(struct phy_device *phydev)
>  	unsigned int i;
>  	int oldpage;
>  
> -	mutex_lock(&phydev->lock);
>  	oldpage = phy_select_page(phydev, MSCC_PHY_PAGE_TR);
>  	if (oldpage < 0)
> -		goto out_unlock;
> +		goto restore_oldpage;
>  
>  	for (i = 0; i < ARRAY_SIZE(init_eee); i++)
>  		vsc85xx_tr_write(phydev, init_eee[i].reg, init_eee[i].val);
>  
> -out_unlock:
> -	oldpage = phy_restore_page(phydev, oldpage, oldpage);
> -	mutex_unlock(&phydev->lock);
> -
> -	return oldpage;
> +restore_oldpage:
> +	return phy_restore_page(phydev, oldpage, oldpage);

Also fine.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

