Return-Path: <linux-renesas-soc+bounces-11360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA1F9F2B6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 09:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD72188B5A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 08:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428501FFC78;
	Mon, 16 Dec 2024 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbEOKr7j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9F1FF7B8;
	Mon, 16 Dec 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336031; cv=none; b=h4GcXkS495Y2fJDbHvrNZo0sGmW8ZZmIahmVu0G492ixEeKt/ek7RLf+/EfyQZWd2xjqWbltYcYGP5HwOe1PQjjRmUCJxidyBKKsA6QPH6gwnITDsVhj/UmQ87K31I9O6JFIpOU2LyroEm8ceQg4Sc3EuNs+4MXG6qMhNyHqtrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336031; c=relaxed/simple;
	bh=cleT8kKGNwdfGdbgCrYsfy4Dtbwt4FlTlSPcSnCBNXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP9PaRAPGb5T1peJDovsIdBty96cMGWO/MJ7UoXxu1mfTie3iNT3jXpRMJaVI9zq18h2XFqGETYhxcUg5YRGFy2bkxo2A0eTawSj4iKjyIuxM9RHgd5Jc7po5RhIga5amk5z85f+gQSHpFOv0rAdvzCD/NmyhuD7tLWgzOrrWH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbEOKr7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB02C4CED0;
	Mon, 16 Dec 2024 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734336030;
	bh=cleT8kKGNwdfGdbgCrYsfy4Dtbwt4FlTlSPcSnCBNXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbEOKr7jhXXOqYyzom4UkeSPHyG3yI9GhbrK8snkf0zLbjbc9jner7fIciCJ5Zqqp
	 2xTRoC0/cnrjODXjbpTtw4bSyZizR0khDbY0Bz5+ypVLn6njDfBroJO1UKoOjnUi6x
	 TBhLuJWe1sOZDgRYK0tAKbFGV5CG4lItdR7ijvnTKJ1R+h7CfZXIM9yQ9ywHuCtBDt
	 ncQS4ulsLX+HKUxAXG0jJuKXj1tN/Kc7CH/9Bvzu2ivA3lDN7PcwQ8m0lqkECihQL2
	 dRfYTeS9aSDT9kSXpPfnbfGKcrGTkRdnZhPP7moVABNT1dT4yZMVsw1lwugyZbmZ0N
	 GVWohM7bWd54A==
Date: Mon, 16 Dec 2024 09:00:24 +0100
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
Subject: Re: [PATCH v4 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <5xualllquamelkxnjqe32lasba5wkgxzy2jnbfyvoot2mz26bg@ns2bdnhpqknv>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>

On Fri, Dec 13, 2024 at 04:03:00PM +0200, Tomi Valkeinen wrote:
>  
> -    required:
> -      - port@0
> -      - port@1
> -
>      unevaluatedProperties: false
>  
>    renesas,cmms:
> @@ -817,6 +814,54 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779h0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Functional clock
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:

No minItems here...

> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +            port@1: false
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +
> +        renesas,vsps:
> +          minItems: 1

so drop minItems here as well.

Best regards,
Krzysztof


