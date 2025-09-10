Return-Path: <linux-renesas-soc+bounces-21680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F7EB50A3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 03:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8A917643D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 01:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660FA1F0E34;
	Wed, 10 Sep 2025 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/p4zt+9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADEB1C84DC;
	Wed, 10 Sep 2025 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757467639; cv=none; b=OVcVYZjcYLEJcQpZsXcF5g8w+FKMlv53Tm+TarT4TbQtMqxneOAApfTUcwIx0z/QV+HhrK8G0+o4faZn7H8HxzBs9DKqpZ8KIAPmdbQYLa/KmTWp019Ry6XN0F0AO5+8gxAcdnmuOuSpK4Hm/zIPkCOJhzhpkIeVfpBDhJJjkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757467639; c=relaxed/simple;
	bh=NRt740wDewvEnDlLdECaG6cLn7kaZWZqxGlfu2JNWsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJFtSuVBKl8zn1c3DiUOmElRnOiP3rzmeWVUXfg00NVHMqhj4NWn0JHInq6S3oYpbVwRVcHIUkhKluSXagEdlNJr+Kv4/pj6YgATr7A8/L+aQiiMwbMJ2fwP+CbLG9JEzD/zkd3xLZtRncGskebQQqm8crL8nxm7kq+0H7hQ9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/p4zt+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECF7C4CEF4;
	Wed, 10 Sep 2025 01:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757467636;
	bh=NRt740wDewvEnDlLdECaG6cLn7kaZWZqxGlfu2JNWsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/p4zt+9Uw2DL4OMJy1/XVbuSqelY/71VrvHceoS/1wEaVqHHCD+ZmSjt49rc8Ogc
	 Kewg8NznvyUjJPrJ6xvSwqS50JKJAqofD0DX6cUVFycs1vLwQ8NFV/2dBDFYHkhcrM
	 x07qultJGHaugcJLAOgBZOhbFLImWe95uUEG9FSBHJ0vxsDm5YrmunclJtWPvWpMM3
	 1CBUgAQjH+0vXspTD2O6d2hSAS+tXxnYd5I2Mbe/MrAfwzphOwQSmFAPD+IjLW1LSs
	 +fXZ6J8Rr4bwJUR4Zd8HHRhh68Ga1Zeo99S9wM9FXCIkeLg5wU00hhJ76sPGfgL9In
	 Jh5O7DU3QdnHA==
Date: Tue, 9 Sep 2025 20:27:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <175746763548.3566130.10675698517636127630.robh@kernel.org>
References: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 08 Sep 2025 10:39:30 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
> "renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Update the title to be more generic as it now covers multiple SoC
> families beyond just RZ/G3S and RZ/G3E.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
> - Updated title to be more generic.
> - Updated commit message to reflect changes.
> - Added Reviewed-by tag.
> ---
>  .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


