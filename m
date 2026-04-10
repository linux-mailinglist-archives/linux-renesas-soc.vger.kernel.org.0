Return-Path: <linux-renesas-soc+bounces-31145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNYWOasb2Wk1mQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 17:47:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 992433D9ADF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 17:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8A713053A98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4D43DB65D;
	Fri, 10 Apr 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="srqFcTqt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126F3DA7CF;
	Fri, 10 Apr 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834554; cv=none; b=Ll61gvqz+nGu5lHEbWd21t2mStTNCI6GdoX3IhlGuZmDCsOs1U2CblurF0/RhqoJ/jBD5Zf8zlBtdGuVEvFst5aoJjo2ClaDQZQLUTNmJwgkZwS0qDbbI2ehq/D0Fem7OZTaUwS9uhGKLJUivm/xpibd9ifqRR+497hTskpcj6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834554; c=relaxed/simple;
	bh=vs9wPTjCYz5Q/Xxx4ae9f6hg9EqjWJDqgXe50C2TWw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3+e9YuVSgV5px6OHyye2yxoIJDSbtbCZe4hFkci6VbpLAW9Keq5voRorTOX+OJSfzluueCfqNMxYsGgK/8aLF6f1slKzcvhrp5HwR6FTPgUGjUO8IcG3MSCKWiBntECf9w9eHTu0ZZE8SV4grBs3QvjvDHbUiduAOpNuKqbrw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=srqFcTqt; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cXle5+7G19JrZkRXvCxXfOz8zwJG/tmHPZORwqwmnek=; b=srqFcTqtAhlqTa0L+bixIfG2v+
	QVKytAi6GlP5MJVANKMaP0YJknUccsVyrg/uf0wOEz0bXusOH66DZPjf8MX/OdJN2MStcnA3ntAk6
	vtHtcFzIKz9V0LyHqiJTEPd/NSYF1J48Nu7z4AI5fVU8FmkZWhJTFq9oF0kDfGqrJ1GpJDdizzVLq
	HeaLPJ2dcXkU5n43aQUynvPyj5dHSg4EeHatLpIQoub3EcdAe7gbHAuuog655eaSwCM2AWZtB8vUd
	/dlBapUY8pNKcqx16RYOCXI0iZyswCsSQ5C8uETYbetZbbFWJWWIQJkv0oKS+eSWF2kD2ixK+riPM
	jk4UymtQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBDgf-0000000057Z-39tn;
	Fri, 10 Apr 2026 16:22:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBDgd-000000005it-2YlO;
	Fri, 10 Apr 2026 16:22:23 +0100
Date: Fri, 10 Apr 2026 16:22:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Biju <biju.das.au@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <adkVr0mMzDsXile1@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31145-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 992433D9ADF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:15:21PM +0200, Andrew Lunn wrote:
> > Apart from that, looks fine to me - it seems some paths call
> > phy_init_hw() can be called with or without phydev->lock held, and
> > this one will call it with the lock held which seems to be okay.
> 
> Haven't we had deadlocks in this area before?

If we have a problem calling phy_init_hw() with phydev->lock held, then:

phy_state_machine():
        mutex_lock(&phydev->lock);
        state_work = _phy_state_machine(phydev);

_phy_state_machine():
	switch (phydev->state) {
...
        case PHY_CABLETEST:
                err = phydev->drv->cable_test_get_status(phydev, &finished);
                if (err) {
                        phy_abort_cable_test(phydev);

phy_abort_cable_test():
        err = phy_init_hw(phydev);

that path has a problem and needs fixing.


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

