Return-Path: <linux-renesas-soc+bounces-31078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGGDFvqH12mwPQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:05:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F182E3C97E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86815300BB86
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 11:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7955A3BFE3C;
	Thu,  9 Apr 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="IAgt7xHz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41DE3C061A;
	Thu,  9 Apr 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732725; cv=none; b=eLY/pIK/bR7tEwOqAIemEvObl33mr4o0LeIteYuvytgT1C6qp+M+GiTVvRRhRnHFMNYW4iOqdV/yOwEzczIGYkb7WQ0sCTQAaQrfOWafL/Q0joW2Xys1ciYE6ib8G+xNeWtfhTjyrtj+tXDWxeVDBxG7SiRUgiHOAFW9XsIKCpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732725; c=relaxed/simple;
	bh=xuctQlUh1rJz7bux3rwT0Ez1VJZpMZgCAR97C5j81NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqDalqJs+kX+pWXi6jOlFyoTmsw61QqnCfA3TzwYctQihJgNrL9ZrtHYdmcjCTbx3fCApy/DHJN5ldH7JPsomb7wN80Nab5aXPkgbAmzx1b77UjjlY5/qiSph/VovTQjDiJanpTYRal2D/YflNFespWEltLTntL4vwP4RDT3ReE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=IAgt7xHz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BHnIlM954PbIG8agasHHlF/ONcTjEJKERWp0wyDnQmM=; b=IAgt7xHzUGcLdTg3q8WBwwACt9
	LVSAH5tXNNhnHRWh3HX+L1B0OPDF2mTrgOmAqXIwlyn3AY9bR0Eb7Daxk5wdjKUXT14ryRhfiWEOz
	SRF3SVMGmZ5Qvx9PDDnv7wHLC4voRgyZoDJgg5B8YPV9NEHgMbbyX7zIuhbQkCP3eeA4zV5cun0Oc
	kYmyNzXoeybWX1Wn2IheeWYZ87E/qH8TmEIS0grdUki7dlNCoEw6CskcG58gh2k1DNGYUbVLQ5KUA
	utizc1Hli/srEZhUvXOkpCiWaRINEILZyj/NvcJVrla2PggMnl8NlJ4pNOR2XGn/4Boao+gCEYZi5
	fH9CFUMg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32930)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAnCD-000000003Rb-3tTG;
	Thu, 09 Apr 2026 12:05:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAnCB-000000004Kc-3PnC;
	Thu, 09 Apr 2026 12:05:11 +0100
Date: Thu, 9 Apr 2026 12:05:11 +0100
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
Message-ID: <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-31078-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.872];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: F182E3C97E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 10:52:35AM +0000, Biju Das wrote:
> Hi Russell King,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 09 April 2026 11:30
> > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
> >
> > phy_init_hw() will also call drv->config_intr(), so that doesn't need to be done either.
> > 
> > It will also call drv->config_init(), which will call kszphy_config_reset().
> > 
> > So most of kszphy_resume() becomes unnecessary. I think the only thing that remains would be the call
> > to kszphy_enable_clk() - and is it fine to call that after phy_init_hw() ?
> 
> It just needs kszphy_enable_clk() and phydev->drv->config_intr() to enable PHY interrupts for
> suspend-to-RAM to work on RZ/G3E SMARC EVK.

I think you mean WoL rather than suspend-to-RAM, although I don't see
anything in micrel.c that hints that WoL is supported, so please explain
why and how the PHY interrupt impacts suspend-to-RAM.

Note that a particular interrupt should not wake the system unless
enable_irq_wake() has been called for that specific interrupt.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

