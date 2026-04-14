Return-Path: <linux-renesas-soc+bounces-31264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKyuLLJH3mn+pwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 15:57:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A885D3FAC9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 15:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EF1130091FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 13:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B215B34750D;
	Tue, 14 Apr 2026 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlIF5a7J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBAC2C11FA;
	Tue, 14 Apr 2026 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175021; cv=none; b=EKAozllcPNShHSQff1VNi/FGou62APUtACfRCpoJtgGqhdYgFVbO3O8D7vIy0jRINgmKgF4/yNmpB1LEVbbi3FBzpfXeU2ulhSX9daO5Ps887ffp0IFJsM2iCg3RFKwwMPASoOzDQWVBb/OzbayCJObwRwjSbgjGd6rWToe5Duo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175021; c=relaxed/simple;
	bh=106I4dgnORZGbqf4CR0yDPjjPH7HEx9+qXGjtaxA798=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1uw4HmJJoGeSbI+3hLBNLO13aSj2Uv6YA5GPIq+bapq9DvUAvcNwhwRcGXAaKapM6CcVtzIpIeS1xC/Gn/XAF5wHKNSXtp/3zOSv0F4e7tbgcppqB5R9/D9Z43uCFODSCIHzPWJap2YmrvCam2+l4O1ikcSX/JIg31qAwOgNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlIF5a7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7A8C19425;
	Tue, 14 Apr 2026 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776175021;
	bh=106I4dgnORZGbqf4CR0yDPjjPH7HEx9+qXGjtaxA798=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlIF5a7JpXtiQzEG+V6lUHHz3oz00phvOB/gmcpVxX5woRmB+9v2n5+PjZFLYazEY
	 8hD8c7dpgAsDANyLx24+1gLrAv767k6G9JcHe7sEE4wpCmNAxVi+8USK+t4huHs5jD
	 nH0gGfWuR5Jvp0wQNXFWYfedTKa3qfwBo49RXotoXy9+g6WuiXxMJc8mIa0NdpWmAT
	 B5RIW8WKNAt9Gih8Db5J/9Q51Pe9cE412g1ykphYc+35XEXnzw1j9lDKc40x0gcXmd
	 nr0zJf8on8OuifjePASFcTAvxgB139CY+KgfUDNMz5UjDN+/HwQq5qrwTvt1bLsyXw
	 xhS4O6b5EuWuQ==
Date: Tue, 14 Apr 2026 14:56:56 +0100
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ravb: Do not check URAM suspension
 when WoL is active
Message-ID: <20260414135656.GG469338@kernel.org>
References: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31264-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ragnatech.se:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: A885D3FAC9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 07:32:13PM +0200, Niklas Söderlund wrote:
> When updating the driver to match latest datasheet to suspend access to
> URAM when suspending DMA transfers a corner-case was missed, URAM access
> will not be suspended if WoL is enabled. This lead to the error message
> (correctly) being triggered as URAM access is not suspended even tho
> it's requested as part of stopping DMA.
> 
> Avoid checking if URAM access is suspended and printing the error
> message if WoL is enabled when we suspend the system, as we know it will
> not be.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdWnjV%3DHGE1o08zLhUfTgOSene5fYx1J5GG10mB%2BToq8qg@mail.gmail.com/
> Fixes: 353d8e7989b6 ("net: ethernet: ravb: Suspend and resume the transmission flow")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

This is a bit awkward.

1. This patch doesn't apply cleanly to net (yet). Because the cited
   commit, which is a dependency, has not propagated there.

2. OTHO, net-next is closed for the merge window.

Regardless of the 2nd point, I'm suspecting that the best option is to
repost this targeting net-next.

...

-- 
pw-bot: changes-requested

