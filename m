Return-Path: <linux-renesas-soc+bounces-25572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB5CA4A48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C91F5301BEB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD342DE1E6;
	Thu,  4 Dec 2025 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yw0nnzLJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3052D877A;
	Thu,  4 Dec 2025 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764867313; cv=none; b=rPs2HT85gigFkbR0hR80eyRl24+fpwNGhajtPLKs7NfuupadCrXQ6pPpTekgcxIO0g9luENoLLU4EkUmtwtfabB5k/g40rE7yEedI8a+iZyh6ds2o+EgRtxlfQJHaRLKXNn6CwYt4A7WyaP0KD7zoUCkhoPFmDshsNlvdxfVMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764867313; c=relaxed/simple;
	bh=ARF8I9vLizB8ixJWrgPz5K5oYh2X3TseVp6MphOT2NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ig82MiNN6zCCKEvCOviLyvCz9+ukFVhtvoji54WWSiEHhOwCv9R9sSZwhBJ9a9gkX7n3pYLeP+1w5oFDGf25kK713xdrbDENS+rhTCAXIWm+Vq32VIidACbkvnJy/4VtMnkOB9COuHX6aQrrcQHsgse7q2pz1i0QnJuZsslV21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=yw0nnzLJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5YVoOg2H4NpT2HlInsyJpSG66P7UiSUnlAzC2KDSYG4=; b=yw0nnzLJGVGclaeYYM4oeoXVnu
	pOz5w1+95Vj/rWakno/cfUqXGJeRnIolMZ5FQYMa6RAuxHDHBOf00hyBwu9NFIhTAHJbG4cMftNka
	BSBdmd+MF3U9HpXUXH3jyED8K+1Q3L5GZ8BLfYlw9h1VRrNkm7sX3ZFs3p0OIecdFLssJtdBdmAoZ
	MRu8Cpovs+Kp2ydBncs+4rI31oFEeLkpjqhsagGjJ/+whNbbgOxhiewgYMZ0cj26h1buG2crGAkNX
	O3SEos/sIlpgjrhn/gD7u7JbWYFveuKess503zCD0fgkDT9FadAs0WS+ExfaMZjRxvmiU8PbTUrhM
	J3ZHzZ5g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37044)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vRCbW-000000003lg-0w4d;
	Thu, 04 Dec 2025 16:54:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vRCbR-000000001A0-4AcY;
	Thu, 04 Dec 2025 16:54:50 +0000
Date: Thu, 4 Dec 2025 16:54:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com, claudiu.beznea@tuxon.dev,
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: stmmac: add physical port
 identification support
Message-ID: <aTG82SREd9Nllkzs@shell.armlinux.org.uk>
References: <20251204163122.3032995-1-john.madieu.xa@bp.renesas.com>
 <20251204163122.3032995-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204163122.3032995-2-john.madieu.xa@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Dec 04, 2025 at 04:31:20PM +0000, John Madieu wrote:
> +static int stmmac_get_phys_port_name(struct net_device *dev,
> +				     char *name, size_t len)
> +{
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +
> +	/* Allow glue driver to override */
> +	if (priv->plat->get_phys_port_name)
> +		return priv->plat->get_phys_port_name(dev, name, len);
> +
> +	/* Default: use bus_id as port identifier */
> +	return snprintf(name, len, "p%d", priv->plat->bus_id) >= len ? -EINVAL : 0;

priv->plat->bus_id may not be stable - for example, if a SoC describes
two stmmac ethernet, but omits the ethernet aliases, then plat->bus_id
is assigned in order that stmmac_probe_config_dt() is called for each
device.

How important is it that the phys_port_name is stable across boots?
If it should be stable, then I think we should not report it if we end
up falling back to the "assign in order of stmmac_probe_config_dt()".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

