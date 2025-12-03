Return-Path: <linux-renesas-soc+bounces-25522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0183C9E338
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 09:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1524B34A5FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 08:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954822D2496;
	Wed,  3 Dec 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRdsc/jd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FFD2D0C85;
	Wed,  3 Dec 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750327; cv=none; b=kdEKLieSr2MfnDzRj0QnMzgtH9iDgqIDcxNGLCfdhCWU9eAbMQ/7CIDSu3f+MMZ7GXQzfmrGWdu6uCYPctujiqdn3oNVMQRps1qr5XPvVRofHVn7bcDVSNkaFBtCE8M1n8bHGirzzgrAYxKl6OyzX63+qx1/JYS/KnpU2ao/NDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750327; c=relaxed/simple;
	bh=GH9c445FS+Bv0QIjALZIfJHArmxubl1+AOj/4TvDSMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ5oUcuK1EDqMF8dTq/HmLauA+Qbycz3Popm8FxEu2uNY1E2+QZ0SlWR/LZI8ydS9ovkFX6WVmmaAoHTCzmpeOKmLtrbxzD0cirX8TqS3o3TAs0wVt+3T6MfFIBzO5EEF+oq4ljeL3Ow0EFK81HyZ+/DDBdCYUO3xCL3/Im+8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRdsc/jd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5549FC113D0;
	Wed,  3 Dec 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750326;
	bh=GH9c445FS+Bv0QIjALZIfJHArmxubl1+AOj/4TvDSMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRdsc/jdu/qfgYZWWSDhpKphjvRNhizrsU/lvzj1fi+ToHZBRMMfnWKVgoAHQ98n+
	 rWHOFI+WWyXxbC/8OarLudb6VgaUfjI5LmmN9mmAoS+WBD541Fae4N1fry5ARqYKCe
	 MwV8/epLbGzVe97rVdnvag/1vEQux8kEh+89NtX1mxaAUL10WQX2eqt5lbjb5BwgEf
	 5ZVh7fAXjq6QIFx6ymAZDpdEox6N8RHYl6LUfbkONTCMi3uql0DgrfWGOfa3khLkyP
	 WhXVf1jafP23DnwSJGgrAjMtucn/9Utck32TghwRh/1emlK5YQeZcwjZGYsWC16Ihx
	 gpBtFSKUzrJ0w==
Date: Wed, 3 Dec 2025 09:25:24 +0100
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
Subject: Re: [PATCH 15/22] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G3E
Message-ID: <20251203-competent-hypnotic-roadrunner-3a4e5e@quoll>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Nov 26, 2025 at 03:07:27PM +0100, Tommaso Merciai wrote:
> The VSPD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/G3E SoC.

Last statement is not necessary. The first one stating they are
identical implies this. Also, this is mostly about bindings not drivers.
If my other driver in other OS needs custom code for this compatible,
does it invalidate the commit msg?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


