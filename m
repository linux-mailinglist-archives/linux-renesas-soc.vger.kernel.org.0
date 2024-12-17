Return-Path: <linux-renesas-soc+bounces-11435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C49F439F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 07:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F627168F9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8A7158874;
	Tue, 17 Dec 2024 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcqMZEV7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92C08BF8;
	Tue, 17 Dec 2024 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734416731; cv=none; b=om7dGp3gR/GzQHXotsKEz6TIJ/4o4khIcd+re+k0ap5lDWipCCynAGHaPKwXvNqylVt7vFU1yXK4FxaiMpZDktQGMwuar7Uulgi0y6DfOCqXCLSVZZLgv9ygCHRozT6bEkYupsRfWqDmFoUzC7jeqdJTeAZ4V1HOdbsz/Kiwh4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734416731; c=relaxed/simple;
	bh=Y6LbvDJlmf+0mpaA5iDftTqoXnOt33TJ6zvRdZBfgtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGx9m3ufo0y3b8nUoXvnie3SgBI1wLNiR1j1aeNt1Gee47DpPAqPx+sk7IO/MY4puliWfbP3RlhIo/ObwiX7SFlG/76sDf2aNRaRt5LqMWS9X0ce5tosuKOmk+DcjWnv1thTFqd29tXCtyw727D2jGG6W1fnx0KtRUS+fz8xqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcqMZEV7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C53C4CED3;
	Tue, 17 Dec 2024 06:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734416731;
	bh=Y6LbvDJlmf+0mpaA5iDftTqoXnOt33TJ6zvRdZBfgtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcqMZEV7VpDyC1RWlXRgQf9VWReS1mdMJ0IxlMX7MK1IWNHceSz+C3pHedYXfTPDC
	 qPxol14HF9NCUOtx5lhD2D+GGnNhyRYlBxX/Db7TCJtkIuqIAMyo7XJQiL7pK+J07W
	 GDEoIfTF+eypW005FkSaapP28nYus3yxLmrxxDx8y0DuSV9T3GdPvIp8l6Fb5gSKJq
	 6F7ujBjW3U+M6NhkTqtTYTf0WzAFeYF40Ab2Dw2HBPzMdKbCIiFaIBnVlEZehW3EP5
	 iaoxRZwbllWjcc91SEEM+RRJZ29kEDjUD3QXIMr0WUfyHvc9WOrSCxIovjOx4gU3KA
	 WgwBG+FNSE4CQ==
Date: Tue, 17 Dec 2024 07:25:28 +0100
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
Subject: Re: [PATCH v5 3/7] dt-bindings: display: renesas,du: Add missing
 constraints
Message-ID: <jn5fsjg5zufi2c3u3tvpzoafrshgrze67e5x4iyhbyzf7opwbp@6i5vqdgeor3l>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>

On Tue, Dec 17, 2024 at 07:31:37AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Also add the minItems and maxItems to the top level properties.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


