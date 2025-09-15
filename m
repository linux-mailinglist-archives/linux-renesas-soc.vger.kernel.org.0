Return-Path: <linux-renesas-soc+bounces-21850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D99CB56D48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 02:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E717C175C8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 00:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE9E194137;
	Mon, 15 Sep 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfISNfCS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE9288D2;
	Mon, 15 Sep 2025 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895902; cv=none; b=FKVa2wZHCQ5h470lxLH4u3BjR18LTy7QebQutiwNHbd3uwwhYKVcwySURLLPkxR19XnLYh25iJLMTd4tQli+ECo8hF0NFWFoI/IgPEVmT4LBiujy1OipUE3jAodPjkZDQkRLyMtNKUCiScL1BGa5dLd9RKlEn3o9I/7kx9bHM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895902; c=relaxed/simple;
	bh=fGG2ZwndHPkyRbDPK16urfdX2lHeajzJP0z7F8/XDOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n50trjx0bZFGws/yg9HTo1q0RnNdlwJWMyHl3Shak5wgkye5wjeWbwdfNoDlUayZ8O5o55rIM5QcgjFPuFkh6WomE/gJASbXc0fmoM8UdqjGPb4cGqxk+r+chpPHmxoX+d0a/JLhRMBQggx0dBeqAhgfJTOKxKfmqUP5Pk2Df08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfISNfCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62244C4CEF0;
	Mon, 15 Sep 2025 00:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757895901;
	bh=fGG2ZwndHPkyRbDPK16urfdX2lHeajzJP0z7F8/XDOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfISNfCSeJ94+JyEyQBOAt6tVZQIy/8dcXZQ2ht6VwHhX6wJ8cYEfrHGq89UPf2/4
	 5JWUceXy7H85P/nVo1k1bARA+NIFw7ZG8uvPIm0J2HD0pY3yx8OepEZNTk9Pijvfy2
	 TYSqjLC6/MZaqWKrVP8tloiUwjRe0RbsQfYx3iLp7CzToF4k1w+AY18MGmra2DBLfW
	 OK1B/P2JsD8dxE6Nlv6s6UDrhS6fQvQg5jBJeHZthlM/bBVyxtZIF6JaOckaxHMnDf
	 Xjrm3icD9YV/76uwXSw7Nf3hicnwjHi/qIjLTB7sHJ0a0Rz41J0GAKl7pFw2Q+D+ut
	 j/kGlAGkl7DFg==
Date: Sun, 14 Sep 2025 19:25:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH net-next v3 1/9] dt-bindings: net: pcs:
 renesas,rzn1-miic: Add RZ/T2H and RZ/N2H support
Message-ID: <175789589955.2309369.4610960260845760288.robh@kernel.org>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250910204132.319975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910204132.319975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 10 Sep 2025 21:41:22 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for RZ/T2H and RZ/N2H SoCs to the
> existing RZ/N1 MIIC converter binding. These SoCs share similar MIIC
> functionality but have architectural differences that require schema
> updates.
> 
> Add new compatible strings "renesas,r9a09g077-miic" for RZ/T2H and
> "renesas,r9a09g087-miic" for RZ/N2H, with the latter falling back to
> the RZ/T2H variant. The new SoCs require reset support with two reset
> lines for converter register reset and converter reset, which are not
> present on RZ/N1.
> 
> Update port configurations to accommodate the different architectures.
> RZ/N1 supports 5 ports numbered 1-5 with complex input mappings
> covering indices 0-13, while RZ/T2H and RZ/N2H support 4 ports
> numbered 0-3 with simplified input mappings covering indices 0-8.
> Extend the switch port configuration property to support value 0 for
> the new SoCs.
> 
> Add a new dt-bindings header file with media interface connection
> matrix constants that map GMAC, ESC, and ETHSW ports to numeric
> identifiers for use with RZ/T2H and RZ/N2H device trees.
> 
> Update DT schema validation to ensure proper port numbering and input
> mappings per SoC variant.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v2->v3:
> - Added Tested-by tag.
> 
> v1->v2:
> - Dropped regx in title and description.
> - As done for other IPs used T2H compatible as a fallback for N2H.
> - Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
> - Added matrix table in the new header file.
> - Corrected the resets check for RZ/N1.
> - Updated the commit message.
> ---
>  .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 177 +++++++++++++-----
>  .../net/renesas,r9a09g077-pcs-miic.h          |  36 ++++
>  2 files changed, 165 insertions(+), 48 deletions(-)
>  create mode 100644 include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


