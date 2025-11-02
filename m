Return-Path: <linux-renesas-soc+bounces-23994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90534C29295
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 02 Nov 2025 17:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6229D4E8392
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Nov 2025 16:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C09268688;
	Sun,  2 Nov 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqMsL0KA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167B25485F;
	Sun,  2 Nov 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101625; cv=none; b=DFmKBDFhv1dIuoGcLJkBBYTs9U9+MihWnMcZvgo+jwnBlHWS3eGER189K5dOdBEf4RzW3SBY6Rvyl09zgJnGJ7aPCW8twrohcdlXyWclVVVZTDYpAzb7nn+b1sS3DheCjmWO77vFSsUhK8iiO8uhl0PUN/KRb09+7u9yCbgDzno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101625; c=relaxed/simple;
	bh=tSlb6eerorU469Mu3rJFn+D3Fsn81kooO3UFfthPxD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHm/KW7X/dDLDT/aHKktA7dMztnqb78BWowXp9nEB0gVqYg04vJCRbmkPx/nrNY+pD0d1FQHKc+rgOC3cRmP266c0Q1Q3Zp5Y+fHtQ1z1UjXjaiNK3LWuvOyXWf8Phyq/blxpMtLTF+vTgrdRC4g8TPo0wRznYZ8o8/0HFDb8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqMsL0KA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB6EC4CEF7;
	Sun,  2 Nov 2025 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762101625;
	bh=tSlb6eerorU469Mu3rJFn+D3Fsn81kooO3UFfthPxD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tqMsL0KA1GIEIOwlVWxHGVoUjSiVbUt3nn+NMUUt9fwz9dkSC+mqwjgyQ16sCdOrl
	 R5/Q8AEr2L9N/CkEV/rve0i4bBzsLwN8kTTs4CoaTOFju25eazRgkbsIleY8FWT2at
	 aq2WGk3EFJ51BAVFhA1D8qQUdk1qqWc2QorOYXXLPX7VrE9QX8gqijp+MN1trU55Kq
	 ZgMQ0iEaBVRrw+sEtkkdz+WnEIg+/qv5d3qlghVOrQ3o1H6WCTaV4tbuiLKDvz5yH8
	 FMC15j/ViXOUaZWHGL/RE+5rcpXVQ1WbYV8qYsvjKfZ0/CtQdQKjKbDEIJH1d7qYVf
	 Pma7v5WBbGJSg==
Date: Sun, 2 Nov 2025 17:40:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: renesas,r9a09g056-cpg: Add
 USB3.0 core clocks
Message-ID: <20251102-smooth-zippy-goose-28018d@kuoka>
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sat, Nov 01, 2025 at 05:00:32AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add definitions for USB3.0 core clocks in the R9A09G056 CPG DT bindings
> header file.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  include/dt-bindings/clock/renesas,r9a09g056-cpg.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


