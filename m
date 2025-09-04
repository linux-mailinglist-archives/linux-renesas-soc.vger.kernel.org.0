Return-Path: <linux-renesas-soc+bounces-21381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65ABB44713
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70B04A079F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2A527875C;
	Thu,  4 Sep 2025 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bFJ6flGK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB3A264A8E;
	Thu,  4 Sep 2025 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016987; cv=none; b=nPGmrnNDL3wfu6yR1/9iEtGBsjbmer1hRFUGMNWLRJcCizarz2nFLSdmdtGk+HF2gMBnTRy9y8O2HtZ6EzojfhPjbpPAIS9WgpK8jfq4qAAn8KNiinAuAW5fWGAR7MUiAFeve+NaRwK7ZH6Vg0hpKOJu6oSLbDmhkoEh9W3Pc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016987; c=relaxed/simple;
	bh=MHaY1C40/+Jq2DQvFH80kcW82U4tjH4j2jV3lW9ww54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMEWlCdP0OThZibkv7igscWfbe4t6OYnQSuO6fQS9JyijbLMu0exk88CVsMwv6u5A+t34kM/oTy7/1ecuLnnZQze2HAfiNWB3JzpZrmBfJrSism3LLpvEwAQJQeYM4N0IUNgzQy+NkgPjRg9zzV8a7/hxdhjWllLdvfwzP3Pc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bFJ6flGK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JhLuBPzuzJgNoY9RYve6SyCzVJfZ5HtsC3TCT1JPgHo=; b=bFJ6flGK6d8xUZniycfDLdV5ji
	sUG6MnVvy94Ax3yTwdQBELJpNaErj05PNye0NZ1e3mBLEtVxJ7O2JbZAMlQBMgx9Qamede9C1+6Hy
	bSygcKoJ8armozZWbEhbihTQEDzUdP0ke6g8+t756ZqAL0OU2XlGovvrxjaBEbKXkzLc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuGNL-007GYK-2l; Thu, 04 Sep 2025 22:16:07 +0200
Date: Thu, 4 Sep 2025 22:16:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 2/9] net: pcs: rzn1-miic: Drop trailing comma
 from of_device_id table
Message-ID: <8f96f8d7-e2eb-47ee-abf8-4f9c96c74a3d@lunn.ch>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Sep 04, 2025 at 12:41:56PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Remove the trailing comma after the sentinel entry in the
> of_device_id match table.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

