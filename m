Return-Path: <linux-renesas-soc+bounces-19551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49704B04F72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 05:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA244E357D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 03:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1D92D12E0;
	Tue, 15 Jul 2025 03:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVstyHr0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07172D0C9D;
	Tue, 15 Jul 2025 03:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752551082; cv=none; b=SLGwrwr56HCZyeRWPL2QHSFkY+jVHrRANIeGEj0n0AV6YfyI60DVfgdIAogH202R81qMnyRrT/+f0yxvMLvPNsUWAvTDcg8koFYFI8q4ARo2ur5SIFzYukYHtDSVoVLFiwQEnli0qvRbxuyFFa1oAQz0SuEQN6I6PjcDOWlB4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752551082; c=relaxed/simple;
	bh=SFnlblJV2LTPacCzanOSpqW7BNUpkXOMLqiq6h/Tr+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLyS8eAutcqyPnyFZqn7tvVK0F9B4XDoU834Lx73+K3D7qK99BWWTQyr1zLpx5eDD/ZIB3Z4JASYRVstkBPTA5z7hVpeueO3ZCAmS8a2KsG0k9wOLPc/jgj3E/VtZvnd4Y9ONOH7h/3Com4niV/kUWauyysJpSope7DqyVQrCUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVstyHr0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AF3C4CEE3;
	Tue, 15 Jul 2025 03:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551082;
	bh=SFnlblJV2LTPacCzanOSpqW7BNUpkXOMLqiq6h/Tr+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVstyHr0A/GqQRMJSqyegZGPttVsjfqUJiBDWLK9rvS3UARWL8B+pXBkJLlOLvWlS
	 Bwcf4FlO6VQc9Gp3dVqyIGJqdJ/intvsZEU4lb/icCbzM9Z2zDExBnOhuS0SKUsf/N
	 yPgzniuRGuapfxssvWNOXXgPDRbFBK8Qy+6sMSejNbeLA5G+ymprNJ7rDlfMlvtGal
	 mn1N62Hu3QFdatFBqwjN7EMhZ8xvTuSNWuMExc6zWF+EvYWB2a4YJ0BhpHU/6Yjql3
	 NfKIiTMGKYRemglEGFAU4S9lQeRQu0lfE+Au17ECShs6Bk5GQBkUKCUsNvE+F0RRxB
	 xrJfDZgTqmDaA==
Date: Mon, 14 Jul 2025 22:44:41 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <20250715034441.GA4186417-robh@kernel.org>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714091211.20497-2-wsa+renesas@sang-engineering.com>

On Mon, Jul 14, 2025 at 11:12:08AM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Available in R9A08G045 (RZ/G3S), R9A09G047 (RZ/G3E) SoCs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since RFC:
> * resorted the clks, so G3S can only have the first two while G3E needs
>     needs all three
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 180 ++++++++++++++++++
>  1 file changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..f53a176cad2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,180 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a08g045-i3c # RZ/G3S
> +          - renesas,r9a09g047-i3c # RZ/G3E

You already have to have differences between these 2. So how are they 
the same and compatible with this:

> +      - const: renesas,i3c

Even without a difference, this seems like it will be short lived for 
how many SoC will be compatible with it (though we get to keep it 
forever). 

Rob

