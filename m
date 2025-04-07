Return-Path: <linux-renesas-soc+bounces-15425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC98A7D46E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 08:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A414B3AD82A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 06:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1142225405;
	Mon,  7 Apr 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtQo/Lm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707652135A4;
	Mon,  7 Apr 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008201; cv=none; b=uVY24RWVPekqNp3D9PB98ii5yk+Ll2RJhK1wqO3NSpGVJIiah2aBhpysNW58vyV7cARYw5WfPV5+yM5q5TZ6G7+rjkcZeOXZNpMNhdGvprRYmFSVuX/Bib0UDoZxW7PRSSXdc596E5PLeKk+keIfbfLlDrTsAHXYceMmfghJEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008201; c=relaxed/simple;
	bh=gnBFumum9PP+8xhx0Y/DA+stQr0WbR+RKX2uP2j/1Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxinarkqUCzIIISIgMwRFzOOzcbqdFXLYheGwJDH0OfOIG/clEUj38pQmaClyBDZGDLX6+YDD31amZsKeav8JU2inzWCRoIoIzPk9DwXKAMPmJqP83qzR/Kp31uFR1zlUztjOiPjBFH9xmpxniHau6mbo9JRdUCc0U3nTc2WMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtQo/Lm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AF2C4CEE8;
	Mon,  7 Apr 2025 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744008200;
	bh=gnBFumum9PP+8xhx0Y/DA+stQr0WbR+RKX2uP2j/1Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtQo/Lm2yeKEZ5c+E6SJuXZi2DWesmqvHyQQaiSX5+vmJsQc8YKn+GEkrVlRj4mrx
	 0Egkpwkk8Jeg7sDEp7oDvqxFFTURmbuNQioyThDP2uXhKD3OPq5CazopBNoVlafp+M
	 xnwyQlarGlNd6uM60mclp2MMfZV9ZSHqapDKrEcxGXbSBs0kpgWZg3BpqhPxXLS3QZ
	 wJ17rTuinzWXLbvDxTMiC/lZqx/wgZU1E6ldOAD/pa3QbA3mTJjVbLCuOGXs2kXcS6
	 WLTBvuMIt+XrGA4T8QNqct0YQ6aQhIDsWb4Fdynfb30FHkbAECo14nDyC5Miq7Cnv7
	 NwJN4+tFO6c4w==
Date: Mon, 7 Apr 2025 08:43:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3E SoC
Message-ID: <20250407-weightless-sincere-beetle-d1986e@shite>
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
 <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>

On Wed, Apr 02, 2025 at 03:11:39PM GMT, Tommaso Merciai wrote:
> Add a compatible string for the Renesas RZ/G3E SoC variants that
> include a Mali-G52 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


