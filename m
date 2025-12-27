Return-Path: <linux-renesas-soc+bounces-26133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC6CDFCBE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Dec 2025 14:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4824430019C1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Dec 2025 13:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AC6318139;
	Sat, 27 Dec 2025 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKCERT6V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8F28504D;
	Sat, 27 Dec 2025 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766841003; cv=none; b=LkETYGPGFVX9pUlUKx8XYlXBwKCjmdQ0KTLowei2SWnawSPt9L7ofDH7NRtZz1xBOtAb/bwJ167mFj45H0ruVmLj47oiItnWOBLdycmacTlle8YTI6ytFQk54edu36OkYx+zJGlRM7JW9XVhjeOmkibm44i0JcuUfbZkJLbpLsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766841003; c=relaxed/simple;
	bh=FOIaIYDoEOIiDhgl4/trIXetAmZFNb2eAgvnwP1I3OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+DJgRYY2gWbHZX+xzvptSQc9xot7TcZN/c4hpk1VTTRhQbfxLYVakSBnDD+GOeESFi9IexEy4BUtuFt8z3gaSIw/0tAeMkNhb1Tb/GzsaMiVUzg40ciNbnUaKPcKKusY27sAEYeU9y9uBcuyh0eu7bSXikrjmHsSr2pgnrp3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKCERT6V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916CFC4CEF1;
	Sat, 27 Dec 2025 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766841003;
	bh=FOIaIYDoEOIiDhgl4/trIXetAmZFNb2eAgvnwP1I3OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKCERT6VtqQ2+Sh5OWVsfNDZfC/sXBG7roCad3xT+u4ph8OevXNRtnRju/YXhBNSJ
	 DTA20ihnx4B6dcaJZnmnLn0h3UOcmlvE0qs1FMaq6LHGy4ut70ZLax+d8MxFBVNpao
	 ZG4mP6HXvIXHZZ/Bwjkl+5zTi4S5ezfhrod48KNlXboeOf0oCUc1Qg4AQq87FmZK6e
	 Ypp+XyuNYpv8mgYD2+GmWR09qlPYv21GOHfJk0es9NRoZ4jPVKt+XyAOhOdYxKmrn5
	 sYY1Nylp6L+jNYM7+SwK7KkrpEa1+Vv3/OzQE24xLdttm/N+fxG8Kkz7/pBtlerN6W
	 f5oP94MfxxZVg==
Date: Sat, 27 Dec 2025 14:10:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g077/87: Add
 PCLKCAN ID
Message-ID: <20251227-origami-elk-of-pizza-49e688@quoll>
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Dec 24, 2025 at 04:50:46PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add PCLKCAN ID for CANFD to both R9A09G077 and R9A09G087 SoCs. This
> definition is required for describing CANFD device in DT.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


