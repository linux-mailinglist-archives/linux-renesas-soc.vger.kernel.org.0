Return-Path: <linux-renesas-soc+bounces-31190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EGQCbhR2mmz0AgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 15:50:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50E3E029F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 15:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5F3300DDE4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78AE259CBD;
	Sat, 11 Apr 2026 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="52gkSsRI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE01E0E14;
	Sat, 11 Apr 2026 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775915431; cv=none; b=BhaVw7RfCV/dPkir2UL0giaOyIxo9TOJbJ0Sx4/5FnaHdgPsjjHcrzFF9svT+mu7YQ0fJ1PpKPJsXs0d3sv54kldUHNhyqChp7im4bra3l8y/XHfQUvgKDUkFfwMaymXg6rsWOCDvvlZ3fR2shik/W6Z58CquEwjFgH9w7m4ajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775915431; c=relaxed/simple;
	bh=W3jQIar+AhxoAWen4NY/XnQtG4GBLjxDWno7mEt+jkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTa4SgCS/5mCo2sExBibdrg1YsenEFll9t94jkaKfazz32IavuyDKQc6+iP6qCGWvhlm1/6PJFsp810cOys3qEz4U48N9kJlXvjCMXDNBMhCs+a/TCwHS86oiAhKtSzKUS6kXjcQe70nu8mFN+6x/7PcrprMa+Xq0MSNdEUxsk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=52gkSsRI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9cCZ4knKX76uGMj3KpprZCDSnM5/hp0NS9ms9XR6z3U=; b=52gkSsRIOy/d3gckZXp45Trjg4
	U6odTuzSRFGPmcWVgrTlrB34SHfDYz+ZOUMMgA518R9f6ikXY7dikBX6oFBhlRlGeZ+xxBBbhYtD8
	B6abNxPQV/e1k9rs7X40UY6IgG0qRiUlI2Ffq3t878tziuF+QdGxw2MFioxLEvpPKOj4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wBYiz-00FiUC-5n; Sat, 11 Apr 2026 15:50:13 +0200
Date: Sat, 11 Apr 2026 15:50:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
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
Message-ID: <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <admMethCSjOQhu8g@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <admMethCSjOQhu8g@shell.armlinux.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31190-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid]
X-Rspamd-Queue-Id: DC50E3E029F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> So, I question whether any of the functions in this driver actually
> have a valid reason to take phydev->lock - looks to me like a not
> very well written driver.
> 
> In cases like this, I don't think we should make things more
> difficult in the core just because we have a lockdep splat when that
> can be avoided by killing off unnecessary locking.

Agreed. This patchset should cleanup these locks.

We also need to look at lan937x_dsp_workaround(). I also don't see
what that mutex lock/unlock is protecting. Accessing bank registers
need to be protected, so doing one additional access within that
should not need additional protection.

     Andrew

