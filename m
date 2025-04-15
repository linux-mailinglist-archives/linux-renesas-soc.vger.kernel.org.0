Return-Path: <linux-renesas-soc+bounces-16029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0BA8A7A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10CD1894580
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D258242913;
	Tue, 15 Apr 2025 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qxs4CJph"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE9535D8;
	Tue, 15 Apr 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744590; cv=none; b=rzdeG8Db8devIEXYOUTAMQBzXsJC0GXXxjqLjV1tP2MzrRMh8Qg5TK5wGwoZiZma74nD0oLGRswN20oXZLvra9LK/eiVJeAwG5JmTwMNVnAHH4L8mitLBPqu7vYilxN1N4iFd14gKJcsj7AjxsclL5HECeAuC2xMgRz3LAcg14g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744590; c=relaxed/simple;
	bh=q7ozO8AZtsyES6546d6+JPlRvMPy6bWzEQ9v3E+B2Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkXYiXD+jlkOFdbpMHVjdFI+7bjFb5GaAjaRPWYBDNgpYjl73RC589wxfk8T107jscMZL3kPHkiMkGOGD1ntJ40INuUOt6Jm7F+AQvYTdxIPd/E0GUKhvqThp7fMNifjyThVcKJsreRceiYPKDpHmWGMXRXsVscTObTZ1L7KRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qxs4CJph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E235BC4CEE7;
	Tue, 15 Apr 2025 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744744589;
	bh=q7ozO8AZtsyES6546d6+JPlRvMPy6bWzEQ9v3E+B2Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qxs4CJph4YyB1BLqyCZ8SCCCqAsp+7bXOKj2nJbUy1AXOzyuvfbcVDY4ZvgMZqeAz
	 U2QN80CU47LSQTzPk7ofkvpDucTEUj5elTFPuoa19Huw9ghWfWwIEFDjNfVgkJUcBj
	 DgSemh4ysSbCpzwEtkpUne7Llsos0P/boaFcAU6qjN/dofVQIKBZxq3d7s3ZENqnub
	 0CCnNrQ1DXLuvuLwNgsVI82ic7QyH9bF9NTtwrtAzMBulGu8W0y6+sL+Lh9ILG16T3
	 /jYT3WPsUgWd8XNb8CrTfsW8rRkfm7HeEwerxU3WujAR0O3b1JIryLiTI7xnWFZooC
	 cW1mHxoRd/tqA==
Date: Tue, 15 Apr 2025 14:16:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, sboyd@kernel.org,
	magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be
Subject: Re: [PATCH 6/7] dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
Message-ID: <174474458585.827869.1606862651418663689.robh@kernel.org>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410140628.4124896-7-claudiu.beznea.uj@bp.renesas.com>


On Thu, 10 Apr 2025 17:06:27 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain IDs. The corresponding code has also been removed. Currently, there
> are no device tree users for these IDs.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  include/dt-bindings/clock/r9a07g043-cpg.h | 53 -----------------
>  include/dt-bindings/clock/r9a07g044-cpg.h | 58 ------------------
>  include/dt-bindings/clock/r9a07g054-cpg.h | 58 ------------------
>  include/dt-bindings/clock/r9a08g045-cpg.h | 71 -----------------------
>  4 files changed, 240 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


