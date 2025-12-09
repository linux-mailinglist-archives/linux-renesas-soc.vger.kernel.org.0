Return-Path: <linux-renesas-soc+bounces-25685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F254CB1075
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Dec 2025 21:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB54E3011593
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Dec 2025 20:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82C72C0293;
	Tue,  9 Dec 2025 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBgwSYua"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BFEB640;
	Tue,  9 Dec 2025 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765312449; cv=none; b=BrXI3xdmqYmTnMGI6Bahnclbzw18cLFhCzbE21UGy7/vno5n9Jo6qp2sotFt47uiTHJcPE2v2eI60RSnpfCFmFopDqRNPBivPZK3igSo5QZ2dsKQUZtk6NnrxE9s/mXayPuHCdedg4jhdIa8MsqHM/m9yjwkJNEu0GUoBOhtY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765312449; c=relaxed/simple;
	bh=g/ceWVSlphhu7x2XPO9alv7BfHTVqJHS//GyWfhEJBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUh569B2tCcQpHdgP8uT6Zo683fCixLM5L6sPy61Cz11/2fGyBGflCPYushN72dCTg0+0RtIM56D0GUkVSEamCEWQLp4ezzP0sBuEzaskRNh4bdjDmqsHSmPYbBLr27TJpDHhch3ptaRx1DFVTN3h73FD2z344pde1HaYVwP6PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBgwSYua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056E8C4CEF5;
	Tue,  9 Dec 2025 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765312449;
	bh=g/ceWVSlphhu7x2XPO9alv7BfHTVqJHS//GyWfhEJBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBgwSYuavdZ4byytmI9+V9xOSnBtyT8/iYsXQiqt7cXX68Fbpuay5fECsanvrhA3/
	 anrrlC8sYEUrP10nSt2Ccc96MZCnq6tE2Mrty4EhXvvvi4M0w6txxTlCmbY8i1rVV7
	 dd7+NLej77j8pjNcUEpHfCAC7bzVPXS5Ch9IM0BUHm2rNBhu5qI/qTmy1Kbzpb81p8
	 3DnzkPWQGmcpzlYejmyi0j9HQG/6Vi0Dmyzm+QiE87j6NwZObbYP76Zs0wPRtOU/6K
	 wxuuuiI5qFQnl2v/YH+5Zh5x9c7vSe9nVpnhybrIFMvbfcpmunxCpBfArb3s+xHeR8
	 EDiVc+X01F7mQ==
Date: Tue, 9 Dec 2025 14:34:06 -0600
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, biju.das.jz@bp.renesas.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] dt-bindings: net: renesas-gbeth: Add
 port-id property
Message-ID: <20251209203406.GA1038446-robh@kernel.org>
References: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
 <20251204164028.7321-3-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204164028.7321-3-john.madieu.xa@bp.renesas.com>

On Thu, Dec 04, 2025 at 05:40:27PM +0100, John Madieu wrote:
> Add optional port-id property to identify ethernet ports on RZ/V2H
> SoCs. The hardware doesn't provide unique identification registers
> for multiple ethernet instances, so this property allows explicit
> port identification from the device tree.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index bd53ab300f500..bb59c6a925d3f 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -117,6 +117,23 @@ properties:
>            - description: AXI power-on system reset
>            - description: AHB reset
>  
> +  renesas,port-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Optional unique port identifier for this ethernet interface.
> +      Used for physical port identification (phys_port_id, phys_port_name).
> +      If not specified, the ethernet alias index is used as fallback.

We already have a common way with aliases, why do we want a vendor 
specific way?

> +    minimum: 0
> +    maximum: 255
> +
> +  renesas,port-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Optional custom name for the physical port. Used by
> +      ndo_get_phys_port_name() for interface naming.
> +      If not specified, "p<N>" format is used where N is the port-id
> +      or ethernet alias index.

Other vendors don't want to name their ports?

Maybe 'label' should be used here (for both parts? Generally, the value 
of label shouldn't be an ABI though. So if for example, software needs 
to find the 'mgmt' port then we should find another way to define that.

Rob


