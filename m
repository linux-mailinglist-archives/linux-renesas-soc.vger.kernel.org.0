Return-Path: <linux-renesas-soc+bounces-11359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47F9F2B55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 09:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE85A1888781
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 08:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446BB202C3A;
	Mon, 16 Dec 2024 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBZCiC5t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11741202C2E;
	Mon, 16 Dec 2024 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335933; cv=none; b=Pm+GZlD5uBNGtuirOn7xFGZEMv9gDukjbNmlEiGYfhrA9ikUuG1VOOUCaL2tX7mF4myYmuKTREmXrIuA+kwwhIf8svzQzYPuFMnF7hGiPO4s3Xvlds6qP/YolvPBW9iw0huNZV67FCZeAq73DtAt2egIKDx5dxL20jrhfKu7lZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335933; c=relaxed/simple;
	bh=86rMqP/WtCR5k4n5iIFjBozgm/ac1HefdAeeBPp6VTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsZnm29bHwL0lKGh3vUAjf+l6ZZuAEkekmS4Lp0fYBgVVh+ic+NgzLhL0huZwwdVed7e8GCwMhZJgX3eo18UImyt/Vudoex/CAyL4pE3djnL4FcSV82XgylBiKaimZU9Uxd4G4SG3nU7Xi4tOeMZx10oKar8GLotX8ojDRc8yi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBZCiC5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6B1C4CED0;
	Mon, 16 Dec 2024 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734335932;
	bh=86rMqP/WtCR5k4n5iIFjBozgm/ac1HefdAeeBPp6VTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBZCiC5tWu/KEnpK8VcmL9veMbh2v08TBDASgJs27RUsVHhdETI+TgilNZXdp8ken
	 VHuGF9Fl6d3Uat8pzqKMuP4k9u7sRJuQMIMenTwWqbVxgd3gaIQiEIbHqUiQRgd56o
	 dDMpwfohujadN+SXoQ0ZMmMdK5XCCx3YpbM5J/ZlN3yvYi1t+NSFsOjSasXfNy7WIv
	 Z+K6DUpRD0GOHBDdzTie5jhHTtlykuhNLg9SIpz7VPQW4haBlPfaCIGop0djFH30cb
	 N+zQNzsoC3hV9SAf9lr6eRPPc/wcB/cVNDJT2hCU4hUmxrHCFKqUMkTPDFm9ESKzr/
	 uGlQBi/U5iMdQ==
Date: Mon, 16 Dec 2024 08:58:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Message-ID: <l2r53ipif43k7kkjqc66z2mq6tyw6niiz4t4nnfge23hygx2pw@xrgk4mv5ljzx>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>

On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The top level property should define widest constraints as well.

Best regards,
Krzysztof


