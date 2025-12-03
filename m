Return-Path: <linux-renesas-soc+bounces-25521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120DC9E2F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 09:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DC694E0539
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 08:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096CF2C178E;
	Wed,  3 Dec 2025 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3nlzz4V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BF71AA7A6;
	Wed,  3 Dec 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750235; cv=none; b=gw7pOAsiIOwqoYEVUdDwQyCOQIn1+9xmh2atK/HSTRDHGlFGn9KvA2RwWyNEDVTggK4npq5zFdUT2b1phEqdt/gbfCoZ2CkTXFn2y8AnKwTjZrIXic3vTBYBqpoOVZ88HPU5Ry+0Fxg9oD9CqQ9XsQvhQ/USZIKLCs9jlWKeLt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750235; c=relaxed/simple;
	bh=n3u0bYIQmBFhwh73ozlRA2yCRbZDQPt995my3Yipc1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVTUpStY9nDsBaPji4i7kqXmabhwNul9XACZH7EKkUjumPwoUYU9MZDO/uYmBJwQZ72lX/c3/jIKnq10C/yGtCRLtgIjO0FwKD8MVdDBk0zIa1gViSsBTKQBFzxrQW9uheCKXCdy5BA4zIO2sHhjCzj7UxeXc+Y14ptpieuVyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3nlzz4V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F0AC4CEFB;
	Wed,  3 Dec 2025 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750235;
	bh=n3u0bYIQmBFhwh73ozlRA2yCRbZDQPt995my3Yipc1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3nlzz4V/84NdWfa2+pF+O/3O3Pw4JNVli6LSummPV5P3DFPf5Gaaqqjp4Cygt84n
	 f9BeCd3sI7+51uzpaq1kfagGLdFIIJyD8zg084EZtOHNei+OVB7eZM8GsBN2DJJOkL
	 fSG7E20LZgQ5EtZWGq5uy/B6dGi33pCI9gVNvmcUgP1wZ4Pm4yuOgGSiOBlNjVlQjF
	 dDMfnsEEATAxnrGZsyxXi77fUucXF+hOhdo/qtBzyzJraGPsj6EFgAPvrWrMaiQyFA
	 sqxS9RlHylc4bUjYB2Zc0bbyxcka4Zu/T6IHoaNx7T3TRaBED+XoJNEyqw9Bh2NX34
	 DeD+kVb5l0rag==
Date: Wed, 3 Dec 2025 09:23:53 +0100
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
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <20251203-shrew-of-original-tempering-8a8cfc@quoll>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> and 'renesas,r9a09g047-du1'.

LCDC0/1 but compatibles du0/du1...

What are the differences between DU0 and DU1? Just different outputs? Is
the programming model the same?

Best regards,
Krzysztof


