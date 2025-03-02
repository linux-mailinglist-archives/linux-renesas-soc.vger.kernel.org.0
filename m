Return-Path: <linux-renesas-soc+bounces-13866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EDDA4B44D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 20:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1473B0E0D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468751EBA09;
	Sun,  2 Mar 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B6urSYUr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108531C5F3B;
	Sun,  2 Mar 2025 19:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740942645; cv=none; b=Q38uxAkHFo/AMrNFt2gQxNVPgON6PNxb1hJdrdnF65QZcgL5OZ3EZS7c7SjRXYceYwgMt1WkmV708LVsq10uaVHq1KkeNMagfLDXomKGD2i+ph5+VxuYIsGSJrbEVFfr7CCTujB9A3UuY2vmwbV54kgYnlzhUEEIPnl9M5Cuyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740942645; c=relaxed/simple;
	bh=JcZ+vMl+zjXx8xup6J9H0ZAOoYMsQu0rU+fdJTwpaBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRn6TBdmJ1AyFYPEFSMbyiPPk8Hg40SHAl2lbFXkAdo5ncb8nJACQRGIjF45T0t8GVawhtLj90/65m/DC9jM4BtjRCkp0v6Y0ZVVyN8wsKbCaRJ1EVkGQ2wt5cSiY7djUR52w0Dd4dfcKE00piSXertDT+ByNc/LRh8wt6nLtWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=B6urSYUr; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IXF/lf9RkTF+j5lpFGM8UfHTw5xM20aqNxmAtRUwCzw=; b=B6urSYUrW1kGOkKWa8yrFzgQFz
	i7bW8dVlm4httBvPnSc8962fMMtl2HE2UYGVNLiWBhDfaV0vCeHJ575n9ruOggIFzCTj/+Uc7VMn3
	20WbnWJ5smlSyqLEBuAAxCaXeY4Vuiv7BpTYcTjq0brUw5V/BMFxAgGgfjBd0YDJkCcY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1toohm-001aK9-IT; Sun, 02 Mar 2025 20:10:26 +0100
Date: Sun, 2 Mar 2025 20:10:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for
 Renesas RZ/V2H(P) SoC
Message-ID: <a1dbb3e8-4a52-4cc2-8e7b-cf240f726d5e@lunn.ch>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

> +  interrupts:
> +    items:
> +      - description: Subsystem interrupt
> +      - description: The interrupt to manage the remote wake-up packet detection
> +      - description: The interrupt that occurs when Tx/Rx enters/exits the LPI state
> +      - description: Per-channel transmission-0 completion interrupt
> +      - description: Per-channel transmission-1 completion interrupt
> +      - description: Per-channel transmission-2 completion interrupt
> +      - description: Per-channel transmission-3 completion interrupt
> +      - description: Per-channel receive-0 completion interrupt
> +      - description: Per-channel receive-1 completion interrupt
> +      - description: Per-channel receive-2 completion interrupt
> +      - description: Per-channel receive-3 completion interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +      - const: eth_lpi
> +      - const: tx0
> +      - const: tx1
> +      - const: tx2
> +      - const: tx3
> +      - const: rx0
> +      - const: rx1
> +      - const: rx2
> +      - const: rx3

There has already been a discussion about trying to make the clock
names more uniform. But what about interrupts? Which of these are in
the IP databook? What names does the databook use for these
interrupts?

	Andrew

