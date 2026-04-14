Return-Path: <linux-renesas-soc+bounces-31269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBbhCFtl3mmxDgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 18:03:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236763FC4BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 18:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5490D3002F62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 16:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CED3ECBFE;
	Tue, 14 Apr 2026 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zwcEDXy8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C213ECBCC;
	Tue, 14 Apr 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182594; cv=none; b=BcTLbCk83yvtLjw04jarhXFFHUsV66emzLaQq8zVFlMm+ue5MN4wXXCbmaqt5GuytmBxw3K+bfCew8LYIxLqcVS7Aq0ROIgjuyg/y3cfurAb+AyDmeH0Z13jibfB/kPnu4nWzuixaHyi6y86R216h+oV3utmGkf/jbZodl7uLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182594; c=relaxed/simple;
	bh=SFw9iz2oVl8hr1by6jpcXPTI7WCzs4roRgk+szgPTu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tF9niDuvl6qHvZ8+bowLNOlmS0N/AuG/WU9VhCh8IsiquykUU8I7ojNluitQWiglIGSh1j/G7V2MbA58ciAgRjO0g8T5RjdrVZxKhdFO4nhqgIuK205bNvVfM6dmHdxNridwYCCVprASFvcfUFAzi8BbZAlWh3yf4IfifLy2k/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zwcEDXy8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xQ58gtdAusbDMk8ed8MhQu1u9QhNqZSU4++degY58I8=; b=zwcEDXy8BaTZVIUp26BkIGtuvi
	MNsGHFutBTNIv2d9CXvQBKxx1rYDVIfeEpsCVacqfrOC4IRH9wxcvw5LTqUXBBsxF8zY8be7JDAaD
	K0giz+F83w6sJDssOxQlr9zaZfkLiMYSj7T0GYKzmYmVsdGype/PKEgS8Irpbipc/x0o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wCgE9-00G4ZV-3S; Tue, 14 Apr 2026 18:03:01 +0200
Date: Tue, 14 Apr 2026 18:03:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Biju <biju.das.au@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from
 phy_resume() to __phy_resume()
Message-ID: <b3521be0-c5da-45ef-b6bd-64e4a7b97966@lunn.ch>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
 <20260412140032.122841-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412140032.122841-6-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31269-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,armlinux.org.uk,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 236763FC4BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 03:00:27PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Now that redundant locking has been removed from PHY driver callbacks,
> phy_init_hw() can be called with phydev->lock held.
> 
> Many MAC drivers and the phylink framework resume the PHY via
> phy_start(), which invokes __phy_resume() directly without going
> through phy_resume(). Keeping phy_init_hw() in phy_resume() means it
> is not called in this path.
> 
> Move phy_init_hw() into __phy_resume() so that PHY soft reset and
> re-initialisation happen unconditionally on every resume, regardless
> of which code path triggers it.

I would change the order of these patches. First remove the redundant
locks. You can then put phy_init_hw() into __phy_resume(), rather than
first moving it into phy_resume() and then __phy_resume().

      Andrew

