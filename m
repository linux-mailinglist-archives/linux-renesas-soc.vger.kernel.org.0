Return-Path: <linux-renesas-soc+bounces-21387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E438B44741
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20BBA44F1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DC427FB2B;
	Thu,  4 Sep 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OUUuvBEx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492F27F18F;
	Thu,  4 Sep 2025 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017466; cv=none; b=H7AV45w5Sz9/2v49iFOfcXzMf2wZLz15slYDcJnGeMaOcBuMAOMQEG2xG1HaicCV9ZHNpw5csSGw8M48wo1ML/FZibrcHkF61kQJ3Vi81z/dQxEQ1WnUWWNNOODKZMTI4MCQErSXWPycJn9FmB4HbmQDxX6tcQSy5u9PIMsQ1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017466; c=relaxed/simple;
	bh=ixOAiIThvEesXbn13BqRjafXXa+iKY3A/F3J4/qErTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2JKe28tVsiSMjZWmfZxS8YxFLrO+XXiHIHD9SjlzppgVlaRwbGO8l3Ae69VshtBoLv7bkoVZxpCrGAUX85+vqFgcVod1ykTAgXKbZTqjdHXT8UW49eCq0MeUpgq2qSt9WJZQw/qC1osi108glrlGmXbgSxdxc9KI+BTyrdZ+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OUUuvBEx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lWUKJjZJ4aj3MBB1AnWcuAXu7/G0kSLyyAT1+UxRtww=; b=OUUuvBExyHRrVOF4DapYGn7ShO
	uFuPYxPOXRbkKzhsGkxWuUNxigbpLDa8lwn9JNrdwPxecd0Xaisn0o6ATb9EevWR3F/xZeuQLDe0J
	Eop3oZxclUIK265qZEtELnJVUMG9u/Fkef/UhLZboCvRzbFB3ozTz2/wCwI8EnIkABxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuGVB-007Gct-FK; Thu, 04 Sep 2025 22:24:13 +0200
Date: Thu, 4 Sep 2025 22:24:13 +0200
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
Subject: Re: [PATCH net-next v2 5/9] net: pcs: rzn1-miic: move port range
 handling into SoC data
Message-ID: <ff99349e-6f42-470d-94bf-321dc6696e74@lunn.ch>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Sep 04, 2025 at 12:41:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Define per-SoC miic_port_start and miic_port_max fields in struct
> miic_of_data and use them to validate the device-tree "reg" port number
> and to compute the driver's internal zero-based port index as
> (port - miic_port_start). Replace uses of the hard-coded MIIC_MAX_NR_PORTS
> with the SoC-provided miic_port_max when iterating over ports.
> 
> On RZ/N1 the MIIC ports are numbered 1..5, whereas RZ/T2H numbers its MIIC
> ports 0..3. By making the port base and range part of the OF data the
> driver no longer assumes a fixed numbering scheme and can support SoCs that
> enumerate ports from either zero or one and that expose different numbers
> of ports.
> 
> This change is preparatory work for adding RZ/T2H support.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

