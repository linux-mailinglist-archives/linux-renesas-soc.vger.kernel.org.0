Return-Path: <linux-renesas-soc+bounces-6026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A9902B5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 00:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D48981C2205D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 22:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD4014EC41;
	Mon, 10 Jun 2024 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVIkwt9z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96BA14B963;
	Mon, 10 Jun 2024 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057201; cv=none; b=exVDwuoerIEop7NRc0bolP/2+32yO+6hXoIhUTd45RwAQNE4X9YuaFupfllp/i3UvmP2tnxnbJCihm1kqiSZQMEXuOh2QrcLMMUU0mul3yCKLlzVdFZ7UBwfbznx8bRRJYfN3IrfRY0y8gACEqzB41jtaOf0ga9tI4Lm7VdGs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057201; c=relaxed/simple;
	bh=00WZSUWsTSDnwN0Kckc1HGo/AvqBUGNJWg5D8kzWBPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApMgw75jArac6b7VD2ztWt9HOQjoLqrgTgEipUuZ8ZvivUVmjQZXNPU8qkeaxdDToMNnjnCCz1y2B3KJdrCRavpeZsAg6aH9tVwO8DrGOdgt9EbHPRlF/ezRIkSR1Sz30M1/5ymn02o55Ts8Uy0fEOl3kwim3PQxvE5TnXS2wVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVIkwt9z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F38C2BBFC;
	Mon, 10 Jun 2024 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718057201;
	bh=00WZSUWsTSDnwN0Kckc1HGo/AvqBUGNJWg5D8kzWBPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVIkwt9zMRkkZ5EjY9c/KjYV3s+zdy+xWvd8nO/1sKsswV5A7OpRHK569D/TgsZrx
	 UdXfw0XNmcYvMkr/e42sKD2Y0Uc21Z4IgQmyKRluI/332aRK0FeZmwXmafbsIxTrsq
	 wLCw+LvHOrV4usi2eQ01Q+bx2faAYmiX4neg9b36zlBQrJtfKFmXySuDlP86l5kuaR
	 0eL8ImZkZo41C9VL/SbfGHLeBi8EU3+cZ63EgCCOJMK/BCAcc3RqfnhxdhtXaS4BBs
	 iVUWrFX9Y2B2ny3JU6pli/Uo1vsEAmzSRCc4bxJ/TbzNI8Tz0wBEVV27f0D7uWlQ+H
	 dXaWsyMqJin+g==
Date: Mon, 10 Jun 2024 16:06:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas,rzg2l-cpg: Update
 description for #reset-cells
Message-ID: <171805719826.3150710.5828109706727349472.robh@kernel.org>
References: <20240606161047.663833-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606161047.663833-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Thu, 06 Jun 2024 17:10:47 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> For the RZ/G2L and similar SoCs, the reset specifier is the reset number
> and not the module number. Reflect this in the description for the
> '#reset-cells' property.
> 
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


