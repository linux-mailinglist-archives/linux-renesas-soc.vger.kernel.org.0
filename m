Return-Path: <linux-renesas-soc+bounces-31076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDHLMcCC12knPAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:43:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB63C9404
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B93553007B0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 10:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF94F3BA226;
	Thu,  9 Apr 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0qUYsqrO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085803B6379;
	Thu,  9 Apr 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775731386; cv=none; b=lyigSP7Zm5vL8tIfFAnwlenBDp70sUU7E7/yqC9Ke9YGAL64sRItcMbi/VS1sFplc8nARQAKgSEQnLh49mx6jljgcbSwg2bpW8809KeraA7OrhbNtEWrxi2/d2TBnUDGILRmqK5MnLiPVeDbFZezUE1wYR7zNH2k+E1ZNzHL1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775731386; c=relaxed/simple;
	bh=VZPyNjsPHkfvXkTrFGRyWHslccPlQvVyBCHMlj+YG4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR1z2+Oemte2/ovYgo+dxrEddTOQiNVNU4IjdJuTFLB7Vg7Ev1hup5aXU5IDmVW9dD/gUya2F3MUVGfEDIKkJoIl0v0H27dNsYBXVt+fV9IXNLP71pBety+MA1bgT0L2UnO7UQZ8ps/9OlNPgBacy5SpWGb5+QEHguF4ICq91vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0qUYsqrO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TLN9vggo80g7NSDym4IU8WuBR7pk3Ud+NWcSTee47r0=; b=0qUYsqrOpu7kzCjmePUmbGaqsx
	J2pUKHjH73kC3dyIWW09mkHBxCFDnJYoiSTcuG5VVjCW3/iP17VErmbp6lj5yYWyD0ktdky9ztODQ
	gykwt3NIWIrlMrt0mdCL6KQ7CX6BDfviVedyXHjPHig0X8Ai8WOqnjH7p9VOX7AyGpUeAqXaqq336
	voBcfam0kIbmymEPnsIjAUqfpd0OKU3a24PERp37Da2iB1Pq+PNhJwetcX1GvfdyfiZ6CIRohtGN6
	OUWmGWqixNIZmPgpo/lmTtR1BZMZLFKS2A2TRli6GzRoVu7Iu2o8ggTIJCZ5sA/nYhbZDOEN4iO7+
	QF1UKgtw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51782)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAmqf-000000003QE-3MSk;
	Thu, 09 Apr 2026 11:42:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAmqe-000000004K4-01nn;
	Thu, 09 Apr 2026 11:42:56 +0100
Date: Thu, 9 Apr 2026 11:42:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	biju.das.jz@bp.renesas.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: phylink: call phy_init_hw() in phylink
 resume path
Message-ID: <adeCry1EptL2gJH0@shell.armlinux.org.uk>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-2-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409095633.70973-2-ovidiu.panait.rb@renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31076-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.854];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: D1EB63C9404
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 09:56:32AM +0000, Ovidiu Panait wrote:
> When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped,
> so phy_init_hw(), which performs soft_reset and config_init, is not
> called during resume.
> 
> This is inconsistent with the non-mac_managed_pm path, where
> mdio_bus_phy_resume() calls phy_init_hw() before phy_resume()
> on every resume.
> 
> Add phy_init_hw() calls in both phylink_prepare_resume() and
> phylink_resume(), to ensure that the PHY state is the same as
> when the PHY is resumed via the MDIO bus.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  drivers/net/phy/phylink.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 087ac63f9193..c302126009f6 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -2669,8 +2669,10 @@ void phylink_prepare_resume(struct phylink *pl)
>  	 * then resume the PHY. Note that 802.3 allows PHYs 500ms before
>  	 * the clock meets requirements. We do not implement this delay.
>  	 */
> -	if (pl->config->mac_requires_rxc && phydev && phydev->suspended)
> +	if (pl->config->mac_requires_rxc && phydev && phydev->suspended) {
> +		phy_init_hw(phydev);
>  		phy_resume(phydev);

I'm going to make an alternative suggestion - should we combine
phy_init_hw() and phy_resume() to ensure that all MAC drivers that
call phy_resume() correctly initialise the PHY first?

Looking at the callers of phy_resume():

- drivers/net/ethernet/nxp/lpc_eth.c - calls phy_resume() from
  lpc_eth_open() but no call to phy_init_hw(). Not used in
  suspend/resume paths, so presumably uses the built-in phylib
  handling that does call phy_init_hw() before phy_resume().

- drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c - suspends
  and then immediately resumes the PHY before enabling loopback. Seems
  like a PHY workaround that should've been handled in the PHY driver.
  Suspends the PHY when loopback is disabled (which looks buggy.)

- drivers/net/ethernet/hisilicon/hns/hns_ethtool.c - resumes the PHY
  when enabling loopback and suspends the PHY when loopback is
  disabled. (what if the netdev is already up? Also looks buggy to me.)

- drivers/net/ethernet/broadcom/genet/bcmgenet.c - bcmgenet_resume()
  calls phy_init_hw() before a conditional call to phy_resume(). I
  don't see a matching call to phy_suspend(). If the bcmgenet device
  may wakeup the system, then wouldn't the PHY configuration be
  preserved over suspend/resume making the call to phy_init_hw() also
  unnecessary if device_may_wakeup(d) returns true?

- drivers/net/ethernet/broadcom/bcmsysport.c - no call to phy_init_hw()
  before phy_resume().

- drivers/net/ethernet/realtek/r8169_main.c - calls phy_init_hw()
  immediately before phy_resume().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

