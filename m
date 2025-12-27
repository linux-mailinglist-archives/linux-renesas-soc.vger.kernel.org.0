Return-Path: <linux-renesas-soc+bounces-26132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA8CDFC63
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Dec 2025 13:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 276CC3000974
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Dec 2025 12:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC602D2491;
	Sat, 27 Dec 2025 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORwsGls1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9671DF970;
	Sat, 27 Dec 2025 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840233; cv=none; b=idxMNqdHkpe65kUmQSeY4gor/LwpJuWRK4Rd1HVgfKIWmO5U8bJWA1YO6Bo1hXce7DOVhvAQEMqyzciEqtTD1MgzQwmxkj2WLy/guMeN0GLB9J7I8HcFnpSxdZ4OV6XH7lrIrB83gHaj0lnfILPV8o4IiTJnGkc4Qx45Nbx5028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840233; c=relaxed/simple;
	bh=RZOoB0WYTN7iFb8JfQjEofFcOw6y12DFNGNSrMTVYms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2uuekgMNT2dXKuBDbZrLEaRP+oS+0QyC2X30MHKqOfO3fo16tC+wydDiOMUM2eTSD7mqqlp37S4J6VjoOgAapnhqr/AffjnHVKDgqkKd//P3DUBbzJ0BL9o94ygtldMAXlgi+RHrL6AgCP0mJKiscropNd0s2WjQt9gd3hRp4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORwsGls1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BDBC4CEF1;
	Sat, 27 Dec 2025 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840233;
	bh=RZOoB0WYTN7iFb8JfQjEofFcOw6y12DFNGNSrMTVYms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORwsGls1zgtyuRHYzoBHJ/39IUA8Mta6WoeuDSRB9A32RkqhKS/W7n41EvqZKHPCf
	 iN/8OYY5tpBmqKSx/irFyQGqGmas/n+Nr8yvs2Tgglu52OBnmNbvBXL9I2sMip8F96
	 W7+eRfFraLSYwegxdX1O66GDPhacbe3/D/+I8nmJoNZ6P8FLaSsxUespXgV7biez7Z
	 K74Jz4QZBTzeDfED88WvPM6U1m+J8MTGbU+JfI1MV9NBIfl9YtsRkb4WZg6ewzNJeo
	 5oj/7aFYBRGvA2qbXqmn7GYrEnSiunppsare8ksXxqlds2+708dx5w/YArBFXMBv+E
	 UHFs83buMRWfw==
Date: Sat, 27 Dec 2025 13:57:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: serial: renesas,rsci: Document RZ/V2H(P)
 and RZ/V2N SoCs
Message-ID: <20251227-adept-buzzard-of-kindness-fee7bd@quoll>
References: <20251222162909.155279-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222162909.155279-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Dec 22, 2025 at 04:29:09PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the serial communication interface (RSCI) used on the Renesas
> RZ/V2H(P) (R9A09G057) and RZ/V2N (R9A09G056) SoCs. These SoCs integrate
> the same RSCI IP block as the RZ/G3E (R9A09G047), so the RZ/G3E
> compatible is used as a fallback for both.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


