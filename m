Return-Path: <linux-renesas-soc+bounces-25523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CBC9E362
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 09:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 991824E5221
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 08:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5A82D1914;
	Wed,  3 Dec 2025 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxQp9to0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7312C21FE;
	Wed,  3 Dec 2025 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750368; cv=none; b=VEm1gbK4Bvrv7yUKIF9p8Z9VYrxKzElb4GPSkLkbMvTzeFIwxRW6UtOYmYe/4Cs7YjcL5cBp7ZL+xkIg4AOEZx9f6aMF0yzlnN1DPn+izkQgsxN2/mFjmuvs0aSshYv/2T2lJFvVRmEU0JzRn/lE7EgFgTl1y7BaeqppyWYndU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750368; c=relaxed/simple;
	bh=kQH0iNlJjfHm8ahSferCnq1iMR6JIJxlEr3jmbGJC1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oppekXk1DLLYff0eBBIh2uSb8lu3Rt52H3Dy7tmCVeKpsNBcUpMDQioTcfMYzgAD6H/CY31+NBsVWKlKu9kgwJhxg0u0NXcGgPVfsm4AHzdizo4hdk3o8lNmpKVLvbangfBKS9ppXdpkQ98aJYt1e2tPRO3FkTKUPCUEdZqQllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxQp9to0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2320AC4CEFB;
	Wed,  3 Dec 2025 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750364;
	bh=kQH0iNlJjfHm8ahSferCnq1iMR6JIJxlEr3jmbGJC1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxQp9to0Wz6STcN87tihQHaro209dAaMLnQ0Z06U5rz/OzLojS+nppo3+q8uDSX66
	 ER8A47bsJCBZkEvByOIe7+ekh0GtUuoO/jRk61xT8qwY/n7yTlN1oEn7qrIOBH7J2w
	 ZLq2oEB7blYB6eCYdyx7FQcTpeOvecm0V6cmDzyiwNLMR36B/iTXh6gQy1Jg08nRBI
	 XvXYIUCreAyO8bI+Chyf2Jh9LeIDJtd/FeVdoEpWZWKHmkxfhZr5ZyhQ/ecrSWTGmI
	 WxCQ+Cd4y7W2GwD/S0PQKyourEhNCoCtccVS69hDDV9XnTMwhILYbxB50efaINpMZW
	 cY4+M18Bdls/A==
Date: Wed, 3 Dec 2025 09:26:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 16/22] media: dt-bindings: media: renesas,fcp: Document
 RZ/G3E SoC
Message-ID: <20251203-independent-accurate-ara-de6b7f@quoll>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Nov 26, 2025 at 03:07:28PM +0100, Tommaso Merciai wrote:
> The FCPVD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/G3E SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


