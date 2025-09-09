Return-Path: <linux-renesas-soc+bounces-21604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5A4B4A421
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78CED1882018
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 07:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA7523C4EA;
	Tue,  9 Sep 2025 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN0v0QGJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0323BF9C;
	Tue,  9 Sep 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404059; cv=none; b=QIt/59+3XRUjlslMMGQ7B+2vFqt1ICH5Hwd55fQKS2L3hWLsBXFjzeaXfZuanDKkvyNu6tUAFGIvwDI2+IUul8OIKu0hucL8bF/BKX2Kh5Wv8m8cKhOqcdKCwK70L+QHRt6zZ02Hj0ejIhQFum+r9FzXpHVLk97D2JkQ6sA/7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404059; c=relaxed/simple;
	bh=lm5Mb+9ExBf6Ff0RfcHksAFLaL1Od4sCsmAYxDgGc4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkYjXm91VMr7lKco+LxJ1GkjIE+NL9QSFnOvLpYBLJa5Nd5t1jQp+OR1dcohVyBNRUMdzFZH3yOC9Ip52oTglkdCWpetiQJFsqkZ6SDvu2QpqmPUpjC2hyUyFIx3blf85ikfl+XXzQlw+u4n2BXJO90fLxK067sXT6yZ8iED2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN0v0QGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169D9C4CEF5;
	Tue,  9 Sep 2025 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757404058;
	bh=lm5Mb+9ExBf6Ff0RfcHksAFLaL1Od4sCsmAYxDgGc4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bN0v0QGJaMSsyFuK6qUA3eOiwpzPl8lb7MPiDWmDpZjk9n6Jhl15qvkWgq/DsBsgp
	 tliSBeecNMU3nNSLF8p9BYKbj58UHbcxyZQdNfz2+8wDBHgrylikO/TNZg8K+FuJWI
	 xyd3AQrmtaHthlGsHFzmmhFYLhkhPDTM6QAKPWnzIpI4AmXG5g9fklUOlFGTS4e4p3
	 jYmCNxOO7nEhq51mGmAqfgut5nxxpkrUkcvNHUOU1jzMjvQ6uadlv/pTb73oi7wJlc
	 NQkXC59eeV/tkr0NRolsYrl1M5Ux3nMX5M4VCRpzPq/g91guGc2u0fU1D+Qk4bPpcj
	 1G/LcGAfx/L7w==
Date: Tue, 9 Sep 2025 09:47:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: renesas: Add R8A78000 Ironhide board code
Message-ID: <20250909-witty-successful-toucan-beca41@kuoka>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87o6rk9z6c.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o6rk9z6c.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Sep 09, 2025 at 01:45:15AM +0000, Kuninori Morimoto wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
> 
> Add the initial support for Renesas R8A7800 board code.
> 
> [Kuninori: tidyup for upstreaming]
> 
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/r8a78000-ironhide.dts    | 87 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 6093d5f6e548..8b31cc70880d 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -182,3 +182,5 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
>  
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> +
> +dtb-$(CONFIG_ARCH_R8A78000) += r8a78000-ironhide.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> new file mode 100644
> index 000000000000..16b515c40acd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Ironhide board
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a78000.dtsi"
> +
> +/ {
> +	model = "Renesas Ironhide board based on r8a78000";
> +	compatible = "renesas,ironhide", "renesas,r8a78000";
> +
> +	aliases {
> +		serial0 = &hscif0;
> +	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel rw maxcpus=1";

Drop bootargs. Not suitable for mainline. I really do not understand why
all users in mainline and other projects (not your development) must be
limited to cpus=1.

ignore_loglevel is also not suitable for mainline

rw is just incomplete and irrelevant.


Best regards,
Krzysztof


