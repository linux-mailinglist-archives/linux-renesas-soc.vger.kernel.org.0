Return-Path: <linux-renesas-soc+bounces-31197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAjZJv2y2mkP5ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 22:45:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8673E1AC0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 22:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1728D3007E3D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 20:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DF43BE638;
	Sat, 11 Apr 2026 20:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="D3fmrKQe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D63016EE;
	Sat, 11 Apr 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775940313; cv=none; b=Bv7qKsN8zSvgRXAwc7b3/ymVWWWQbfleml9x3ZRJBPwjxLniItMdJgqtg+FdM9VCbKXm0mi8j7szQCu2hJHeuvXusz7hSIOd1Y7h+an3bwj8EaJV9Y0tudSQYyJFe+gxb14mR0DNsjL3KifqbYhOUGikD6XyP9VDorGfLaRq8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775940313; c=relaxed/simple;
	bh=+LsfJlNasLl8d0Ak1GfEEqicCWjYysGcaQZ9MUAHTDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qesC5J4Db8p99eqMuFvetmVO6uH6T562O3fHMfkcySsLa+Rgix8FJ8Cdiv/WX/i0QdijF89lWZH+HBLQUv+HqEP1yhGl7KmyIgpDe6x/14GyY3S4UOkPxkmxHwETTcGsiGOZYLfdjrRK/73eEFVK8iMqMomAsRWX3X378ySgENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=D3fmrKQe; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=MJNX2DydW7zVIKME7nriByPLwqFe9UTO0LBUClroXkE=; b=D3
	fmrKQevsp2B4g+sNfTpek7m6XQLGW1X2aeo2yneECy/jANt8cGEgY/5lC2rMRZfqo2sbb/tpZJyCH
	0HgZlAZGUawrzdwkKrte0iM3Q0gg+aiUbaxhAIuSOSOaHp5eJz6xJYV07U4x8vEMQejzuymdFmMnx
	bn6bbAxuliyhjFA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wBfCL-00FkNg-Cw; Sat, 11 Apr 2026 22:44:57 +0200
Date: Sat, 11 Apr 2026 22:44:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Biju <biju.das.au@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH next-next] net: phy: mscc: Drop redundant phydev->lock
Message-ID: <bcacb8ae-f35d-49fc-91a8-995387dc07ca@lunn.ch>
References: <20260411154959.200091-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260411154959.200091-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31197-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,armlinux.org.uk,microchip.com,nxp.com,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid,renesas.com:email]
X-Rspamd-Queue-Id: DB8673E1AC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 04:49:56PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Remove manual mutex_lock/unlock(&phydev->lock) calls from several
> functions in the MSCC PHY driver, as the PHY core already holds this lock
> when invoking these callbacks.
> 
> The affected functions are:
> 
> vsc85xx_edge_rate_cntl_set() — lock/unlock around phy_modify_paged()
> vsc85xx_mac_if_set() — lock/unlock with a goto out_unlock error path
> vsc8531_pre_init_seq_set() — lock/unlock around phy_select/restore_page()
> vsc85xx_eee_init_seq_set() — lock/unlock around phy_select/restore_page()
> 
> Along with dropping the locks, error-path labels are renamed from
> out_unlock to err or restore_oldpage to better reflect their purpose now
> that no unlocking is performed. In vsc8531_pre_init_seq_set() and
> vsc85xx_eee_init_seq_set(), the redundant intermediate assignment of
> oldpage before returning is also eliminated.
> 
> No functional change intended.

This patch needs to be sent as part of the patchset with your other
change. The order they get merged matters, otherwise a git bisect
could land on a deadlock.

    Andrew

---
pw-bot: cr

