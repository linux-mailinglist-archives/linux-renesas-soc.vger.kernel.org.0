Return-Path: <linux-renesas-soc+bounces-24290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D4AC3E1A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 02:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A26EA34D63B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 01:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4C72E88AE;
	Fri,  7 Nov 2025 01:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HVTN6yAR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E03D6F;
	Fri,  7 Nov 2025 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762478194; cv=none; b=pLXeUMMsA6jZuP7CYMfKxGN1+n0DpePWbgcGjOo2/XzBtKh2gqVL0GmObbRYZ2x3953KOQMbf0LKTUqTkdugkTkCVp6nR4NBmhle1kiBohu3ylTBglNbbrhNpoOmfxzuUaz87BNRRebIf9iFp7AaEggJvwFFApBBnNJX3fVsVa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762478194; c=relaxed/simple;
	bh=oRGd3RtIX3gjEjwMa7vHSaMXXF8+AcujGJswpuabMIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImDOHrHYTn+4rIC/ku1WkyatDpbh+rr0SZ5gxB6Dka36gBxYbV1kLDykkiaGXiadApYZSgDmrS6HmZlPF5db1m3j9H5FiQevyzIRkskEgfh193Co+yHladi7YsvdFWpGkgKXym1D6CijjdLw1KOODk/MWRrGKPwWW80S6s1U2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HVTN6yAR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xSn6sQyEp8F+TSgDXArYJ+Bzx7HU8Abi3PsklIJKrZU=; b=HVTN6yARUqOvNDNIamnQo9XtuJ
	CZ7YBhqW5xGq1vLjJIhwNwmXifyvkmM2f+LfalgjL2tSp8TPOxs0FXWTAy1Ik9RI1qrgmEfjFavle
	uVfp+RVy8BJ1P5pzbZlLcevpo6Molc0REMC2yCP6KuW9O8ZFMwG5pYxitdkatmTaeH0c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHB5N-00DAie-4v; Fri, 07 Nov 2025 02:16:17 +0100
Date: Fri, 7 Nov 2025 02:16:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next 02/10] net: renesas: rswitch: enable Phy link
 status pin
Message-ID: <eda96e9b-2a35-42e8-b1dd-ffde39644fbf@lunn.ch>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-2-dcbb8368ca54@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-add_l3_routing-v1-2-dcbb8368ca54@renesas.com>

On Thu, Nov 06, 2025 at 01:55:26PM +0100, Michael Dege wrote:
> Enable Phy link status pin for boards which support this feature.

Probably repeating what others have said. Please zoom out and give us
an idea what a link-status pin is? I don't remember seeing this term
used before.

	Andrew

