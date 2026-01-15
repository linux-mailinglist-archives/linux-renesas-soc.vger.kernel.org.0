Return-Path: <linux-renesas-soc+bounces-26882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8BCD2684C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 18:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA456305F12B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F693AA1A8;
	Thu, 15 Jan 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiXm5fxW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1FA21CC5A;
	Thu, 15 Jan 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497771; cv=none; b=OCNQ+L+6N66eAKoWkBlTmFdVVkwPBW2sLZRNwcFznl5ZmCUvjutVzsIVUol34x8cHVKIoHBtbin/3ZnbVneznZr3BRQ6cSZsfzyAT4DpaEc/esipyk0z92KxBMFgm7JjOke0wt+cQP/f6rnhzq/DIn+lifERHgjxeXWd4+AcdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497771; c=relaxed/simple;
	bh=iZwBmxuFmyj5yd/MrkiJeSxiq8n2lmnresw5RhxA2iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsVPeSnfp9kMn148jLdfnSikcxIEhYT98LXtZrH0g5Szzwv1ATKYOvY0QOVI9qtdwFziY2WgEH9BiHGwy483e0DR5FOw8KvQSG4LRluF2REnhq1u/LrmxVCf/y+PBIL/bJMr5DbyGxLutTw/eV78mlrqPxJcM1ipZUenD7imwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiXm5fxW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC0FC116D0;
	Thu, 15 Jan 2026 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768497771;
	bh=iZwBmxuFmyj5yd/MrkiJeSxiq8n2lmnresw5RhxA2iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiXm5fxWUQPJgn7Cj+1ATSMBKYuXOHIJGsoL3bcW9HQioIxLdk/wlMwP2O6QnN/qs
	 rTE/toiqVL1EHXqK+biWlzyUHt1U+aVbJiCXQsrlIGc5CnyJm4D8qjOQbgjkBpWeHP
	 8h+ezAGL/Tu/mLnDTeEcySyOMlEfqVCReI6JLg4R2RWmyLIHS6RFmsg40CsCJ8ixh6
	 YEe5w2Bd23BuoDzvuUL05lH7Ix00nPvHzcv396yZtXgY8TGY9MnRUzmhMcFrw8DlBs
	 IknuMGYkcFy/2nIZ2sV1xb3vtRSsCdJBdsATB0O+8Y2UKREpoNGgRBWHUz+PE4uzBy
	 v6b9IJw6cneJg==
Date: Thu, 15 Jan 2026 11:22:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: pcs:
 renesas,rzn1-miic: Add renesas,miic-phylink-active-low property
Message-ID: <176849776989.913679.4064770470334805366.robh@kernel.org>
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109142250.3313448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109142250.3313448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 09 Jan 2026 14:22:49 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the renesas,miic-phylink-active-low property to allow configuring the
> active level of PHY link status signals provided by the MIIC block.
> 
> EtherPHY link-up and link-down status is required as a hardware feature
> independent of whether GMAC or ETHSW is used. With GMAC, link status is
> obtained via MDC/MDIO and handled in software. In contrast, ETHSW exposes
> dedicated PHY link pins that provide this information directly in
> hardware.
> 
> These PHY link signals are required not only for host-controlled traffic
> but also for switch-only forwarding paths where frames are exchanged
> between external nodes without CPU involvement. This is particularly
> important for redundancy protocols such as DLR (Device Level Ring),
> which depend on fast detection of link-down events caused by cable or
> port failures. Handling such events purely in software introduces
> latency, which is why ETHSW provides dedicated hardware link pins.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit message to elaborate the necessity of PHY link signals.
> ---
>  .../devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


