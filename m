Return-Path: <linux-renesas-soc+bounces-7641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2B941A0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 18:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F9E7B2AACE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862141898ED;
	Tue, 30 Jul 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsLfLhOU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573781898E1;
	Tue, 30 Jul 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722356677; cv=none; b=F4KLdlEF1hrqlOqBdOcFMyH9o9uemdMyYPK9CGwmACi+hUmlSpUugXgNcRbwiFBc1CiaIxRbpr+go67m//GtGU3GY2NtdFuTFGmzYoDE96uad5e0UsT/cIN0+1Gl+Qza0ILr9KXe6josq+aBnLqvrMurEhzwx3Jq8AQgWJIjl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722356677; c=relaxed/simple;
	bh=uT6R5uY0ZH4GFNGa0yn0GoapUoLl0in7iX4GIpT4gNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJgddg5PfUC61N9cRcrhzSMnaHL91GLwArAnmFD+jHtOAqlxVPv4Bzg0o+x70vQBTtj8GN0CUKcEOEWvUPr2PVBC1Q+4YdJY4rD5/t4d7NdzoISwmLZxCZZY4kgPnqpxMqODVmnAf4SamARlxTAeq1/R3xpvXx5cvEs5vDShE3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsLfLhOU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D96C4AF0E;
	Tue, 30 Jul 2024 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722356677;
	bh=uT6R5uY0ZH4GFNGa0yn0GoapUoLl0in7iX4GIpT4gNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsLfLhOU4GVqNpgcMqEVGQ/dOEm0ZWndU5EsN514S9YhDhoQ32T29dGTNexxOlAWg
	 Lg0V5ctO85b821SACFkSY//w/SkH8fRskzv+QHm9Dp3K+U58bDJRYs2twr/xVoSV8V
	 DAIjGSM6o1LBG3a9oxfuweI+c+vXYOlyszmCQvkbZ1t7gjAeD4dVobqmr8W0U1MTjk
	 6wWBXNO7W9tJwzdmy6Kv8p//+E0ZfDS9mz1yvVgPYU+dvHa6apLZYVfBH5fMfcZF3q
	 25X+Um3EUJPlRG5yGZbwGcytTBHNHePopxnH5Mm59hiuU25sJq01UHMxAwvxXS+RS5
	 axOYC5yP2W7+Q==
Date: Tue, 30 Jul 2024 10:24:35 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
Message-ID: <20240730162435.GA1480758-robh@kernel.org>
References: <cover.1721999833.git.geert+renesas@glider.be>
 <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>

On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> The R-Car E-FUSE blocks can be modelled better using the nvmem
> framework.
> 
> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
> the definition of nvmem cells.  While at it, drop unneeded labels from
> the examples, and fix indentation.
> 
> Add an entry to the MAINTAINERS file.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> 
> I would expect that the calib@144 node needs:
> 
>     #nvmem-cell-cells = <0>;
> 
> but after adding that, "make dt_binding_check" starts complaining:
> 
>     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb: fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must be fixed:
> 	    '#address-cells', '#size-cells', 'calib@144' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	    Unevaluated properties are not allowed ('nvmem-cell-cells' was unexpected)

Did you want 'nvmem-cell-cells' or '#nvmem-cell-cells'?

> 	    'kontron,sl28-vpd' was expected
> 	    'onie,tlv-layout' was expected
> 	    from schema $id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
>     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb: fuse@e6078800: nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'calib@144' were unexpected)
> 	    from schema $id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
>     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb: fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#

