Return-Path: <linux-renesas-soc+bounces-19593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA0B0B93B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 01:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A063A6466
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jul 2025 23:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0891C245C;
	Sun, 20 Jul 2025 23:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8ihaHbg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B1AD24;
	Sun, 20 Jul 2025 23:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753054309; cv=none; b=XJAU6qR+kuzUZ7r3CzJOqBHNud+S3rn4CyU6v+C1ppjSmJSq47QNnWnrfmoG6bYXkP7Iy7zHEiZls6sNUY7ATX/83fvhQhUwCqYByQkFQx1dyCevGC22RXzUIjZ0y1lvgM6sbv5LLrsG7ze6530z6KPNfaasna+9KgIYNauhMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753054309; c=relaxed/simple;
	bh=+hYXnYULbaJgyUVTwYKqdlYBEBB9051Tt0CMsxT1e0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhR8oglWu3xe4/4JzVe/VF9aKfR/pL12LjSocfmWnnPQ1Igv2G6qm06oTq6dVa6A6HoXGzMj+0QtnI+byuntC8XVZhKdX8gDrUKiqEcGA6zqQMM36cqUV/n9mt9jVbGv9mMccv2kAm979eiJLWwGjjL+6nPQXAPUUp92o5KHFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8ihaHbg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE4DC4CEE7;
	Sun, 20 Jul 2025 23:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054308;
	bh=+hYXnYULbaJgyUVTwYKqdlYBEBB9051Tt0CMsxT1e0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8ihaHbgNN9lXZH7oAR2RgEGYmqoSVX3Qcoqs2HU4/POKDKcyNb59UA8n39d/s0DN
	 CQkJ6H5j6Cb4zzXcNsL44hbJJWPD4SPsJ04kLRzmo9Y7nRL5itqTbgeztkzshk+LX4
	 dpjX9bXLtqv5L9O4XZYTpmU61vtilpb/W3QbWbm8HHuNvLWRthD8PNManMLnlL1It0
	 oPKCcFYjFglIdSw4+vSEtXLrvt43zzQ4wmYSgmaD03q/nOjw3BCd4qOJiBeL1a2vVd
	 Ma9L6didwjxro5jX/cJi17WqB2ltPGFopYv1HDOMBHQ+/dx7UP0lSdkGdKel7JfBo1
	 XDKiBU+GQeTXg==
Date: Sun, 20 Jul 2025 18:31:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <175305429252.3069370.16176862151205935873.robh@kernel.org>
References: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
 <20250717122455.9521-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717122455.9521-2-wsa+renesas@sang-engineering.com>


On Thu, 17 Jul 2025 14:24:52 +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Available in R9A08G045, R9A09G047 SoCs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * removed useless generic "renesas,i3c" compatible
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


