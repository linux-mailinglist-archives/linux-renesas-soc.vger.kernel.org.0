Return-Path: <linux-renesas-soc+bounces-31142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN1FCzoP2Wl+lggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:54:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE83D8D48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54B8F3001874
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06663D7D7B;
	Fri, 10 Apr 2026 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="xPFk2rR+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A61DD877;
	Fri, 10 Apr 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832691; cv=none; b=CfeGmvoViKaxTj99gHpeNrHFCJkXpsbJnWZn+qnYcos1DYCz/8U52c6IoXtewo695CuWSAXg3H0nFmOuWGXE7LEHLK3c1Zqtlz5Su3gem7nE2FYiQOTE+ly1WUFnM109WRCGCzjvLcwNcqceKGsNuSqGkFRCxSDzfnP6ySnj/Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832691; c=relaxed/simple;
	bh=OUjEBiDyuM6xuTXUlBqaQYXQCwqqxNN33mlRxE7U6fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTna73GnAXIwOS/O0YHNTKIeJvtVHmzszBK496TX3KLW+IqvdLAFrOEq+oYE5ggFyL/jiXje9dC5buSim5/ZnfJ2BsoPT39K4JgYh6jLK08rcgFK99joXKNnkKlIJZSsxUROvvmpzfsnjDs9rHeU9eJopAj46lUsFItWKSEViEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=xPFk2rR+; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ICQd3aQfaPmm6DYC7Lm4WYgosf+QyVfwMZUOToEMT/Q=; b=xPFk2rR+Rb5Y4BQa644znmPPF6
	oWffAnLU2MoIqOpS0y2sgS9PBynYwb/vPrtPImBur07OmUryFLHCN2JJE8vJVyIwtPpGr8ryYoMe9
	hbB9Dj4T8mEwOeMFyMNkGk95zj+ktkaCw4ehA6o1gNpXrkWluVRAoR6ra4e+cDam7k5ma+KX9Avrl
	NwEovJxYE+d6OzschXXR8QFC0ja2e2qIB8ACBi2LInh2QSeHVdpZiPHQ8No/Ujpal262stpiPjGWe
	htVTiYvkEawoYxZYRRxaKiMRFl7cZVJG6YLMpGXG15UEnDAfdcUb7q7pKt9YP8ACuKCFI+4a5X/fF
	sQNLKpSg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40814)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBDCb-0000000055P-30uf;
	Fri, 10 Apr 2026 15:51:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBDCY-000000005hV-3EcN;
	Fri, 10 Apr 2026 15:51:18 +0100
Date: Fri, 10 Apr 2026 15:51:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Message-ID: <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31142-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.581];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 77BE83D8D48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 03:29:01PM +0100, Biju wrote:
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> 
> When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped, so
> phy_init_hw(), which performs soft_reset and config_init, is not called
> during resume.
> 
> This is inconsistent with the non-mac_managed_pm path, where
> mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on every
> resume.
> 
> To align both paths, add a phy_init_hw() call at the top of
> __phy_resume(), before invoking the driver's resume callback. This
> guarantees the PHY undergoes soft reset and re-initialization regardless
> of whether PM is managed by the MAC or the MDIO bus.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/net/phy/phy_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 0edff47478c2..8255f4208d66 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -2008,6 +2008,10 @@ int __phy_resume(struct phy_device *phydev)
>  	if (!phydrv || !phydrv->resume)
>  		return 0;
>  
> +	ret = phy_init_hw(phydev);
> +	if (ret)
> +		return ret;

Do we want to do this even when phydrv->resume is NULL?

Apart from that, looks fine to me - it seems some paths call
phy_init_hw() can be called with or without phydev->lock held, and
this one will call it with the lock held which seems to be okay.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

