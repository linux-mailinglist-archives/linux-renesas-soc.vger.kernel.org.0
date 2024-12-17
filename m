Return-Path: <linux-renesas-soc+bounces-11436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CF9F43B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 07:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F73188DB74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF2A1607AC;
	Tue, 17 Dec 2024 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RND4xKEW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616615CD41;
	Tue, 17 Dec 2024 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734416941; cv=none; b=NWjmz2whcXp0O4iFWkPRD3HvUKm5UuJYcTyV82LC1Nfes0cO/JA1agTOIui+5WslNQrki9xKpsUpm9KQJVE2qdhyz8dWsPqFej0Y9hDGBGmR+3MUboKdMuqQ/iFFis2Gl+gSipHt7qYXZ+HrcfDoyTZOMVwIRGr0lCwzyWiBTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734416941; c=relaxed/simple;
	bh=WkBNe+eP+F4BK6723AWaUuVIWNcGrL/HjaD/Ci8rAP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d93l1HeGsvF4Qg8Y53fEtmiESHwcB+ZKMcqdqeH0wj8WdI9+Ubmb1WxjzGLn+fBnNjYtQ32yzrAEZRWiLmvfpC28FTLKNRlqeQKxLQuwC0fsa/60nzBduM387sJh56GC/EVI6NWZ3UqzDsWXtzxEyz7KR28q5MST+us1HqdbP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RND4xKEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ED1C4CED3;
	Tue, 17 Dec 2024 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734416940;
	bh=WkBNe+eP+F4BK6723AWaUuVIWNcGrL/HjaD/Ci8rAP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RND4xKEWxt7vdTWdkIU7it5yUpAtBOCNw97V/HIFGjfjMVVQLolzfEzVgmAOwAgWl
	 +LJAi0F+aZ2tDy1eTyhD9U3QbntECczz3SGfdDJJiz/etAM9T78XubhhodBqawVNo5
	 Jv+0+2kmYyNrQLKtujN09btdg+9JTzXF1OR/IkD/slvzw8jc+SIa1BrlZ3lqp09P6I
	 pBqfkmygfzfc3BOVJMcvUF9Peh56u8Ob2fEhjeSZ7kFboSL2dNltIqEFAEPIfIbb37
	 DfN0e8i1z4q0u5S5Z1xgOfRDuYrtOd5Hk6dMlgRJL21BXR1wKp0nOXOz4z9UdOjEfp
	 pY/IE3iGZVjMw==
Date: Tue, 17 Dec 2024 07:28:57 +0100
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
Subject: Re: [PATCH v5 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <g63spu33rn6hso3atynur7nepu62t2rspwptbot4mty4b4fldx@tpv2wnr6jixq>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-4-e77421093c05@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-gh-dsi-v5-4-e77421093c05@ideasonboard.com>

On Tue, Dec 17, 2024 at 07:31:38AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> 
> Note that we remove the requirement for two ports from the global part
> of the bindings, as each conditional part defines the number of required
> ports already. This came up with r8a779h0 as it's the first one that has
> only one port.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

TBH, I really dislike tested-by on bindings, because "testing" is
essentially "building". You cannot test the binding different way. You
can review it, that it matches datasheet. You can test the DTS on the
physical hardware, but not the binding.  So if this is equal to
"building" we do not act like: "I built a kernel, so add my Tested-by
tag".  Maybe this was added to cover letter, so the tag
populated here as well.

> ---
>  .../devicetree/bindings/display/renesas,du.yaml    | 52 ++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


