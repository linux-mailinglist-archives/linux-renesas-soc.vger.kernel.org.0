Return-Path: <linux-renesas-soc+bounces-24521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1FEC54871
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 21:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D8A44E0548
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 20:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C58F2D8383;
	Wed, 12 Nov 2025 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="q4kdPvyJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7702D5924;
	Wed, 12 Nov 2025 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762981086; cv=none; b=OrCBj3dvCa2xHcN+DatJpxmOzH9wVNlRWiXybXuOzAiGAxtyHdeDymCEYY4A1FOQq6aUdmI1x65Dc9eJn1NGyrsj6w/RNWzr0A8rfxxOtlQuVYTLyG/ZNGv9YfCWH6ed11SjvAIMUH5jVJxxXDvtzRlDEQ3oa3Im5TfnavL8S/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762981086; c=relaxed/simple;
	bh=hsuooyegSfA8eauTztWjZKsKulTseNL2r2cuAbtf4aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9iL7R4hBS7rPPZBl4rxUJwHBPJd1auVwSUfIcLsWgkQKKYevVsgrOn6u+ju7c+IiDNvsS41v0OLjBj7KWJL7Vhe76MMQEfiaHInKE4EEAtHjsOGXwWFHKom20HHpIkVVGTTtwuCdSjpHa872G0BCwN/SaxRL5nOB/hKVohpB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=q4kdPvyJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W0g0sQvLZJ6bd54PV3ZTssgbnJn3VgkVlCFUCktk/3g=; b=q4kdPvyJgl57A+azXnnozBTYFx
	RNce8GwXHy0ldhuhBRyF87iLq2TmojyChLxHqxFMACPykZEOE8WMFxKEziQ7UGjPV+WTVQ0Gvxp6L
	pv3pdzra3PtVDDmtRvBYwW8sweleKTElTehW9X/CCcpVi8nn9pGnlOQDScmlKa+tY128=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJHua-00Dmtl-Kh; Wed, 12 Nov 2025 21:57:52 +0100
Date: Wed, 12 Nov 2025 21:57:52 +0100
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
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
Message-ID: <de098757-2088-4b34-8a9a-407f9487991c@lunn.ch>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Nov 12, 2025 at 08:19:36PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the boolean DT property `renesas,miic-phylink-active-low` to the RZN1
> MIIC binding schema. This property allows configuring the active level
> of the PHY-link signals used by the Switch, EtherCAT, and SERCOS III
> interfaces.
> 
> The signal polarity is controlled by fields in the MIIC_PHYLINK register:
>   - SWLNK[3:0]: configures the Switch interface link signal level
>       0 - Active High
>       1 - Active Low
>   - CATLNK[6:4]: configures the EtherCAT interface link signal level
>       0 - Active Low
>       1 - Active High
>   - S3LNK[9:8]: configures the SERCOS III interface link signal level
>       0 - Active Low
>       1 - Active High
> 
> When the `renesas,miic-phylink-active-low` property is present, the
> PHY-link signal is configured as active-low. When omitted, the signal
> defaults to active-high.

Sorry, but i asked in a previous version, what is phy-link? You still
don't explain what this signal is. phylib/phylink tells you about the
link state, if there is a link partner, what link speed has been
negotiated, duplex, pause etc. What does this signal indicate?

	Andrew


