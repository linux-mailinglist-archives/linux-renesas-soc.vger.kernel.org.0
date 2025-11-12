Return-Path: <linux-renesas-soc+bounces-24522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A6C5488D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 22:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FFBF4E02B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 21:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A805529B22F;
	Wed, 12 Nov 2025 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5+xIqgv9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0BA274FE3;
	Wed, 12 Nov 2025 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762981264; cv=none; b=j256s2HrWpwXH+CyfCkxiZyMUzHUQt9hR40un9rvKkRr5vKhGKYoTqT3XKeD7MKJljdKfh7VmuCYaNYduXZOiq3OLjstqixWQPIjjt2GnNEbp6h4e5iAVaPz2iXm31SOteBrjxKwR65QpBwj1IwJTMjYVdzX8aVhJAsSFkhWR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762981264; c=relaxed/simple;
	bh=EsOwvL4Thqhjhc0+Ra5s4vQ2wmDA8xgL4cIEKhwJBqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiEkK5xniLazhWvUIMJ8kgGV6ClKaw6bjJUquzNn/Q38OWIf9Dg/Ca/lMTFGj04O06Nro82UXQxxUom/kkLX91qaDBOp2xnQ+GQ5PBwfId/hh+zfgHPgYULVYCf6Jn8Qp+nJSk9MV6FHaaX3dIJrJxed4b1sM4OGEmNV44ETBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5+xIqgv9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=98pe/V5DMvJsxOpsKIQ5YwqunEzOsM5MU9xGKZX2zjM=; b=5+xIqgv9wPuJGa6U7WSrqf6gWr
	r8OuKDUIdsAQKh3PEVOFiUGHx+9P3I7C02S4OKd6BmE1D4avUGzXa1kwFztegzbLRdIfItXmYRyoL
	z+GMu30esK3PThRvrk0S3oKFCyysoGX53Wrlvi56Li9Dzc3ndGPe8iHXr1DRTc+MF5vw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJHxS-00DmvF-Ss; Wed, 12 Nov 2025 22:00:50 +0100
Date: Wed, 12 Nov 2025 22:00:50 +0100
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 2/2] net: pcs: rzn1-miic: Add support for PHY
 link active-level configuration
Message-ID: <686d84c6-c2ea-4055-897a-6377eec1fca0@lunn.ch>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112201937.1336854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Nov 12, 2025 at 08:19:37PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support to configure the PHY link signal active level per converter
> using the DT property "renesas,miic-phylink-active-low".
> 
> Introduce the MIIC_PHYLINK register definition and extend the MIIC driver
> with a new `phylink`

You probably want to avoid the name phylink. It is well know that is
all about PHYs , SPFs, PCS, etc.

	Andrew

