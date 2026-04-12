Return-Path: <linux-renesas-soc+bounces-31206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD1MNYWW22njDgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:56:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5203E3E15
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D1053019BB0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 12:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9242837BE8B;
	Sun, 12 Apr 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="BFafhgai"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDD9378D7F;
	Sun, 12 Apr 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998541; cv=none; b=g2b69tvsQIjEm6Hg75ne8Ekmp+6dUFRHSDC9RLXzsGBwZ10GieiU2fqE3NjNqY95cBvJi01f8bni6IreAE7KXUySwBb9wN9wHZcWztRfmR9G+n3dFjaos1jw3CPPLPzPXAizvttap0lrvEGbhrNfeCpkXITJcdDtv/bpbFXxQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998541; c=relaxed/simple;
	bh=8aqoUgkgMnL/rfQaOiW/yvifnWm8LCEzfPAsmS6+7fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCf7BuKDv4dB9a8WwRLJfhoFhvmUuu1rENoo5SzL3fpSRZTgYD6wtc2xQIyN8gLe46xiFz2rPhu/ZqHmxCJHRetDUyOyExltMw0GR9wT01aHxKIOYQ5ew8yJ9eJ67aM/2SHywsZJuP1gJgJ2FXBdMAxqraSdedG+wDZBKvI5kpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=BFafhgai; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lIrD1D+dKpaZQCC7K3254VfBImGAiwEwjpTLSfZY37o=; b=BFafhgaiXC9tlQQYgRhCn6kJI+
	9BkDR7pOjjFyNZAYUJUbHXaWr5marxJZ952sgzPmrRgxbINsysMusVosweR+Mp83gR8uORbpBwAD/
	tgtyxKYxrma9CTxIOQ1qgV/IcI8JQ3e13gm4rZaBJEegywty6LF1xYNA2vjmf6tdQVk3h61ql6Yg+
	31Nv06q4U44W2011n6v1KOmDGQPNImlZWZkwrg6oOnWu6qDkSE6Alsl9Cn5gE5hZNIQO7ZmXweBUh
	5WcCrgJ21RqCmwNVNw5HqPGqR71pmxlAwEsbwQ6ehL5jigQUUTcJTF9kosrz2OXdtDII6JpvQx8Nr
	IHdAcPsg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33926)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBuLZ-000000007Ci-2ijC;
	Sun, 12 Apr 2026 13:55:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBuLW-000000007ex-2G2M;
	Sun, 12 Apr 2026 13:55:26 +0100
Date: Sun, 12 Apr 2026 13:55:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "biju.das.au" <biju.das.au@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Message-ID: <aduWPn0cMWjeIyt-@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <admMethCSjOQhu8g@shell.armlinux.org.uk>
 <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
 <adp6-wElGOOijZRG@shell.armlinux.org.uk>
 <TY3PR01MB11346F78B929EA7F377BB5B4A86272@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346F78B929EA7F377BB5B4A86272@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-31206-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 3B5203E3E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 12:05:06PM +0000, Biju Das wrote:
> Hi Russell King,
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 11 April 2026 17:47
> > Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
> > 
> > On Sat, Apr 11, 2026 at 03:50:13PM +0200, Andrew Lunn wrote:
> > > > So, I question whether any of the functions in this driver actually
> > > > have a valid reason to take phydev->lock - looks to me like a not
> > > > very well written driver.
> > > >
> > > > In cases like this, I don't think we should make things more
> > > > difficult in the core just because we have a lockdep splat when that
> > > > can be avoided by killing off unnecessary locking.
> > >
> > > Agreed. This patchset should cleanup these locks.
> > >
> > > We also need to look at lan937x_dsp_workaround(). I also don't see
> > > what that mutex lock/unlock is protecting. Accessing bank registers
> > > need to be protected, so doing one additional access within that
> > > should not need additional protection.
> > 
> > Looking at access_ereg(), shouldn't it be taking the MDIO bus lock and using the __phy_* accessors
> > anyway because it's writing various registers which determine what is being read via the
> > LAN87XX_EXT_REG_RD_DATA register or the value written via the LAN87XX_EXT_REG_WR_DATA register.
> > 
> > Also, as it has access_ereg_modify_changed(), that entire sequence needs to take the MDIO bus lock to
> > safely do the read-modify-write.
> > 
> > Then there's lan87xx_config_rgmii_delay() which is a large open coded read-modify-write for the
> > PHYACC_ATTR_BANK_MISC, LAN87XX_CTRL_1 register.
> > 
> > To me, this looks like a racy driver, and it also looks like it's using the wrong lock to try and
> > protect hardware accesses.
> 
> OK, will replace it with MDIO bus lock.

Remember that the phy_* accessors will take the MDIO bus lock, so will
need to be changed to their __phy_* counterparts.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

