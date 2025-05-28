Return-Path: <linux-renesas-soc+bounces-17618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54954AC69CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227171898098
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAE0286411;
	Wed, 28 May 2025 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIKZgbMn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61428541C;
	Wed, 28 May 2025 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748436727; cv=none; b=aaU6bi3PoEfDO1z8rTWMKQ6EWb9JkyyB89eymRJwcADmEeKOZs6GvhA/MpR7qcBC58yy9tRHj/3cMzaoUJG8snAmOc+q+hTDe43ZmW1qteUScrVvR8kYyA561Edo8S6yDAxbfxbwDZJuGgYcf2ttdqnqdDQMkNERMRC+9Quh/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748436727; c=relaxed/simple;
	bh=Tx1soG5xi0/OQ1HgMXSwNaV5R2DfipanGqwLWjiDG/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOXuWOgKnxGeDwLkdjpCLD41uNxR+JoN0uLqYZMvlYbwQbQegzrEIJ4jUJh+IMB1/5PKKHpa+uWT8eaLYmA+vYydX9t0uEyw0VCcjyAYXC7fQ6xJ4Rm2leTIYHqTYGHGV03cK3dHjuGR7QxJotHqSACEONtoU8u2+96mD56cKC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIKZgbMn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20C1C4CEEF;
	Wed, 28 May 2025 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748436726;
	bh=Tx1soG5xi0/OQ1HgMXSwNaV5R2DfipanGqwLWjiDG/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIKZgbMnYKb8Uv9YpuRtgDyLrpcxf3WqxH0bcjyAmyP5j0Vwn9w3Fntx6TuM6FRL5
	 /zO0qR/R+ZQODy223sQh4EHiH7xNJ2OcweKJDZK1udEcdDHJvyLhMq33eUq/YWdPVq
	 IJ7Kl+QNOvi4oAw0Nvrgtvzyazif2lJg1UtYvfumUBxcYeq9SLrHOKi5HH/es1n4eb
	 eCgtvZKGQTyCaYv2EwD+/bjFbyJu53Rpe6G2tJYaTcx+PvunQgHiAveBhzGvxlHZwQ
	 AWmH8iXLM/nhowb+OaD/PwPtGyrJy8JH9VoFmynLEncQ4VNiaQiaAnFJwiRk62VHRV
	 Zmb5qa25Ks0Mw==
Date: Wed, 28 May 2025 07:52:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	biju.das.jz@bp.renesas.com, Thomas Zimmermann <tzimmermann@suse.de>,
	Magnus Damm <magnus.damm@gmail.com>, tomm.merciai@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: gpu: mali-bifrost: Add compatible
 for RZ/G3E SoC
Message-ID: <174843671875.3661556.2233132513679539264.robh@kernel.org>
References: <20250528073040.904033-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528073040.904033-1-tommaso.merciai.xr@bp.renesas.com>


On Wed, 28 May 2025 09:30:40 +0200, Tommaso Merciai wrote:
> Add a compatible string for the Renesas RZ/G3E SoC variants that
> include a Mali-G52 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


