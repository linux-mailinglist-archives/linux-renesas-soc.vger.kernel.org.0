Return-Path: <linux-renesas-soc+bounces-31075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BXMHLB/12kLPAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:30:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A723C9294
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EF3A3008C92
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 10:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1297C3ACF0B;
	Thu,  9 Apr 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NbrfauJk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D4E369990;
	Thu,  9 Apr 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775730602; cv=none; b=mS5+FlPF1HGObvvcH1gYMnNnLuPeU+HjMRo6ZHFz2Wahahc6+OPvCt9edYpklWE+0lsoD7pO/NyUiDhRU8FeGKerQ30HTDaKVqCv9oN7W4EciwaKGX/SC73eOvbmnEm159vxcIuF7kDCplUAkS+Jy0X/FUvpX/ILyTn61IQFMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775730602; c=relaxed/simple;
	bh=XQMr0ep1TiA8hRGkP0LCpMOeww5KjSBVcBwbP5/s68g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tslyJJdgJOEJBtPrjIYkt6aDLKBQhNyDTwDRhyBfblRbgFCryIqsHOM4E6nFP35KDFhDnFfRJCjzKaIbjhCg/zEaA7zx6OUPh9b5BHvD6pwyYne0SxAL50gL5lmDL/iommeuka8e9wwS5GoBmOeil66ldEToVhkw9KSDXp3+WJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=NbrfauJk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ETzbm7sIzfzQBICo7m9TJCdf/K+1A84nGjCe7ZX0O1E=; b=NbrfauJkCdeUnOIrpcJAhD0c3K
	NgXe/bjgyQjZYF68VGdkri1xNoXbe11riODHnBNG3B5YS9UHZ6dTDog9WbFSkg2+YomAFLXj7iF5X
	Bgy62u9/Ma7FAWE4gmNcgUg2ym77Oxe5QhdtWVYRIiPL1ENW52bkuutavBtIYm99NMdelNXf0XWFh
	i3F50tjeSrlsXuuklVX6mwCQRVw4fh6Ltdz/ntoT+Kg9M3WtJER78d2b8w/irtrcZncdz2csLH2s8
	PzeykvlRaX/xAcD7Ks0caX/FOosVKqREW3q3/AkEnIwTzmnTETvqFuAfLv3IOVfXbDnxzSHBUvK1c
	kQoGQHBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46088)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAmdq-000000003PP-16y2;
	Thu, 09 Apr 2026 11:29:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAmdn-000000004Ij-0Yco;
	Thu, 09 Apr 2026 11:29:39 +0100
Date: Thu, 9 Apr 2026 11:29:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Message-ID: <add_krK3MC1-SSsV@shell.armlinux.org.uk>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31075-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.864];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 72A723C9294
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 10:13:10AM +0000, Biju Das wrote:
> Hi Ovidu,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > Sent: 09 April 2026 10:57
> > Subject: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
> > 
> > ksz9131_resume() was added to restore RGMII delays on resume for platforms where the PHY loses power
> > during suspend to RAM. However, for s2idle, the PHY stays in Software Power-Down (SPD) during resume.
> > In that case,
> > ksz9131_config_rgmii_delay() accesses MMD registers before kszphy_resume() clears BMCR_PDOWN. The
> > KSZ9131 datasheet states that during SPD, access to the MMD registers is restricted:
> > 
> >   - Only access to the standard registers (0 through 31) is supported.
> >   - Access to MMD address spaces other than MMD address space 1 is
> >     possible if the spd_clock_gate_override bit is set.
> >   - Access to MMD address space 1 is not possible.
> > 
> > Additionally, only RGMII delays were restored, while other settings from ksz9131_config_init() were
> > not.
> > 
> > Now that the preceding commit ("net: phylink: call phy_init_hw() in phylink resume path") performs a
> > phy_init_hw() during phylink resume,
> > ksz9131_resume() is no longer needed.
> > 
> > Remove it and use kszphy_resume() directly.
> 
> How to avoid code duplication in this case?
> 
> For eg: phy_init_hw() makes the phy out of SPD state
> 
> and kszphy_resume() unconditionally makes the phy out of SPD state again.
>       ¬ kszphy_generic_resume
>          ¬ genphy_resume

My question would be... if we mandate that phy_init_hw() must be called
before phy_resume() by MAC drivers, then how much of kszphy_resume()
becomes redundant?

Given that populating drv->soft_reset() with genphy_soft_reset() means
the PDOWN bit will be cleared, genphy_resume() becomes redundant.

phy_init_hw() will also call drv->config_intr(), so that doesn't need
to be done either.

It will also call drv->config_init(), which will call
kszphy_config_reset().

So most of kszphy_resume() becomes unnecessary. I think the only thing
that remains would be the call to kszphy_enable_clk() - and is it fine
to call that after phy_init_hw() ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

