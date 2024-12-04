Return-Path: <linux-renesas-soc+bounces-10894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC39E3578
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 09:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C435160F7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45A7194089;
	Wed,  4 Dec 2024 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuSZoUf8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEDD17DFEC;
	Wed,  4 Dec 2024 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301179; cv=none; b=grs7SOiOIn9sDJUDChGe5iZUofg2t/lQ0TjBY6OchgWu3LIkeiUcrKE0R4txR+McGse3A4hR9i79HBnjCrmMXZFfFjLucCm8IdO4388UBRWp8hSuyf9Zqljk/IYF41W6XjpsW4iNt3VzUi/dltQkET2jHhwfA6Vv23DiCBKxamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301179; c=relaxed/simple;
	bh=H4TPAUa5DJAJ+MfSxG2muDBlb2lejnoz/REYWg/hgwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/7dp+9JixOclljnRlmzkMgyP9EiL1RTg4sRDz2qlgrUuiYLkuYgnWFSWIYtsSAlF8Sc5Ez80ABNeO3kR40Yp2+kggXmiaqS0iFD2jLhTdc3de7jhcjVEm2LMPajKWR57X9cax9v1uNqMgVKE1NN3PTNgco7iVbyd0derCCvO9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuSZoUf8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6E7C4CED1;
	Wed,  4 Dec 2024 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301179;
	bh=H4TPAUa5DJAJ+MfSxG2muDBlb2lejnoz/REYWg/hgwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuSZoUf88TH2Q3Vd+Xsiz5qZSqSd6VPSDpciyZcD9j13N0GBlL3ziG1TsYwB3EYjJ
	 sXdjpUaCi+ClkV35XByy0bLBkMzRFdO/8xHshnHFbpgBxjxPXHQ1i+m7/fSy6OVLh5
	 4eEcXaSpUQFt/wm9M5kk2uNt8VI/yXdUjO99wPy0jTln0YaST0iCBAiD5gNLu7bGmV
	 JjWkem9+58v8pdfs3qAQgrit6fZriEpyFH8huXZNW4O3q/pIpU701LpBF72c+GnxfF
	 ofaTVtHkGl5SHfo9bCTJrXNlpV4lmPINX1WJ0jdozfSeBTW0FROA3QltVg6hhVYPB8
	 40IODTVGikzWw==
Date: Wed, 4 Dec 2024 09:32:56 +0100
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
Subject: Re: [PATCH 1/9] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Add r8a779h0
Message-ID: <bqbykuixu3qjmk4vtzfzpegeceaepa3xnah4u2z3gku4ounhpa@zkxq2a3htnm7>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-1-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-1-738ae1a95d2a@ideasonboard.com>

On Tue, Dec 03, 2024 at 10:01:35AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DSI display bindings to support the r8a779h0 V4M.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


