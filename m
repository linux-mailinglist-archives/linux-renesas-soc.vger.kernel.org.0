Return-Path: <linux-renesas-soc+bounces-26883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3040D26E93
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 18:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA12431B2B63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72A63BF301;
	Thu, 15 Jan 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6QHl9dh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE72D9ECB;
	Thu, 15 Jan 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498593; cv=none; b=LYtUOLcb0jXVMujgyBHq5ohlSbXp8VWgKTdMG70N6c7tRxceokj/W3pwxV9bBk23T7RtROES8osQ8ttICKaJ4HXSOVtTWIrTdJLUM/GRCkjg6Ra2rW+JNWtVYi7D/hc+96+rUX16y5I9TaNBrwmomuZ3dmrPw0M/c4J1RVfFk1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498593; c=relaxed/simple;
	bh=VxVOkwPjSB73QjCmCUVQz2P5mMxY6iL0Y/MKyV9xB3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqHQevRkhbhScdC8CJfOgxqOSsAOM3qz6c4aUscP1M5fK0coKEFPKdlb6+t9FbRGB6L8VRTChXBQyp4eN7d7kL3rEsUr7VjXmmPk3OspjWgvnhS7/YAVAyscSvVmoHfg4qtv70nhRH7MfxRzgokvUxkALCZximvH30T3okrQ+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6QHl9dh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35273C116D0;
	Thu, 15 Jan 2026 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498593;
	bh=VxVOkwPjSB73QjCmCUVQz2P5mMxY6iL0Y/MKyV9xB3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6QHl9dhbvozxSAa4XnJxX/KfWwRlN6KV9+7VSye2Skj9AOF4ynxvG0isA6PYGb1R
	 GGJK46jVMtXpOyzZzKpxV78XddsOrOAUjSUoKHc2DvdCzqlk+s5gq32zrY9jgAHYiH
	 8z4iqldFJuCnhMjdF2G5/mQTAifGS8l+FHVcjwt/qJWUCkicTRXSe5dI/y9/pduon9
	 hG2EISrSD0EDvrkwrvrFR5SupmQWd8oK7KAI5/aPNz6Lja8K0LlJVlR2N3A+WK2vDR
	 2TrJmklDl/xfr2yNhTbIGYlBeKv3finQGaKrLF+O0kzY9OGEd3luSxGXGQ632gon3j
	 tasxnaMPSCuUg==
Date: Thu, 15 Jan 2026 11:36:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: pcs:
 renesas,rzn1-miic: Add phy_link property
Message-ID: <176849859188.929140.12375075368934726420.robh@kernel.org>
References: <20260112173555.1166714-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260112173555.1166714-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112173555.1166714-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 12 Jan 2026 17:35:54 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the renesas,miic-phy-link-active-low property to allow configuring
> the active level of phy_link status signals provided by the MIIC block.
> 
> EtherPHY link-up and link-down status is required as a hardware IP
> feature independent of whether GMAC or ETHSW is used. With GMAC, link
> state is retrieved via MDC/MDIO and handled in software. In contrast,
> ETHSW exposes dedicated PHY_LINK pins that provide this information
> directly in hardware.
> 
> These PHY_LINK signals are required not only for host-controlled traffic
> but also for switch-only forwarding paths where frames are exchanged
> between external nodes without CPU involvement. This is particularly
> important for redundancy protocols such as DLR (Device Level Ring),
> which depend on fast detection of link-down events caused by cable or
> port failures. Handling such events purely in software introduces
> latency, which is why ETHSW provides dedicated hardware PHY_LINK pins.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Updated commit message
> - Renamed DT property from renesas,miic-phylink-active-low to
>   renesas,miic-phy-link-active-low.
> 
> v1->v2:
> - Updated commit message to elaborate the necessity of PHY link signals.
> ---
>  .../devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


