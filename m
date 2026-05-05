Return-Path: <linux-renesas-soc+bounces-32075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL3lLTzl+Wn2EwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:40:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A714CDB90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA5D3301FF0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF93441049;
	Tue,  5 May 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HmamxsEv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CBB42EEA0;
	Tue,  5 May 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984537; cv=none; b=WMlFlYjzP0lneO00EgXuCKbttbTkz9kC4+wPxypK++apDZ/3DWB3zGHfmgxdFjgqKWl7SB+JsTFJCXTlUZAjhsn2TYJl+FDltUl4e3Tt66BQ4wJ5kk9a/DL/NcsfKN5H6GXiw4xy+7Gcn7ZqyxN5R+8wlX75A7l3YEF8o8hqFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984537; c=relaxed/simple;
	bh=ewAipKl9czmlOyqZkct/sLi9ASWai8T9gsDFcP7L+Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6Mxi9rduNGXy45s5wvHaFHVcEKVfK0O4HixJCIQgRYacIDLpAWOTay4+ie+XJMSKVX2sXsAHGaj9Y9wWh4IeRqHwVBWfDC8EKqJZusGSknqB18yxfwP8EvbBLtI5PmGjartsVCZoG125urPgalCPt8f2BQH8KGLfIf5OOfAJHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HmamxsEv; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9U5AzifTMcaLV7XnmUa5PNSNmCETirlJ7ajoajXH6nY=; b=HmamxsEvU/oHCE40EPW/Fo9w+X
	DT3av6mtcXI4fpGwXLuFWiZxH6u2ZcoiqXgSUyyUgjS73aWS/1MTzZWH55VEHeLSfz70UUNAooUVA
	g2pnP8EAANxm+9vewFAeDL++RBa2rFCLSOA4wG8AJoCFb1tzXPpjUbDHoJQlPqIxmlVI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKEzn-001SQV-J7; Tue, 05 May 2026 14:35:27 +0200
Date: Tue, 5 May 2026 14:35:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH net v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
Message-ID: <94576888-2906-4dfa-8d45-a7f0e9ef712b@lunn.ch>
References: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Rspamd-Queue-Id: 56A714CDB90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32075-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cambiumnetworks.com:email,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lunn.ch:email,lunn.ch:dkim,lunn.ch:mid]

On Tue, May 05, 2026 at 06:02:36PM +0530, Shitalkumar Gandhi wrote:
> of_get_child_by_name() takes a reference. The rtsn_reset() and
> rtsn_change_mode() failure paths jump to out_free_bus and leak
> mdio_node.
> 
> Add out_put_node to drop it before falling through.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

