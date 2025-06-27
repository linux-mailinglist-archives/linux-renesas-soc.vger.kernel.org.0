Return-Path: <linux-renesas-soc+bounces-18854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE2AEBFFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 21:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BEC818832A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 19:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457E92E92DE;
	Fri, 27 Jun 2025 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUkCoLLa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9420C000;
	Fri, 27 Jun 2025 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052760; cv=none; b=FRkGFebyGXMWiEShsEmR+8h/qJziNsrH6Pon6X7MqpGrKH4eUa90MSZHVeL85s1W5mQzZ1rn8W0dJDFDZIZOHUhBAsP/MtpQil9IxNFi4HBuoPDDe2l9ptd/eAg9l/f1wS7waY4oyIKBwgGQhjjkl+aPXMmrx2gYHDpaUYp/Kms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052760; c=relaxed/simple;
	bh=N2LlGZclOXCw7TE47Z4FmdVZl/MFbgtwae0FgUWZL2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ef3KTRa6N2QbBmvR/D3tDAdqU+aP5bPctMQLaOZ7lubsE9Tv4LJXxS1jpdNMCcMXdFYmCchuTNXMBgrAASmdCUleFa2/FhCXJKzFdss7j1BKpDh8OHZI138ZdLTt8Wb/1xOZl8norinuzpEDACqolP5kFgalS2EpY9jPop3nnv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUkCoLLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612E6C4CEE3;
	Fri, 27 Jun 2025 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751052759;
	bh=N2LlGZclOXCw7TE47Z4FmdVZl/MFbgtwae0FgUWZL2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUkCoLLaU+FTuL7hpCLEOfDH1TS1ct5XQxvZZ3ato8k61iiYYzo1jMiIU1mP4ENfi
	 +xjZnNF9JCXUMZohhtLqd6jyEHtZ93jZKH1f0x/yCMB6+Nj1rATZJ/JLTgvsu0Fe02
	 QkusVYMyS+y7Uj8BoZysWD9dafU68FeBu0oZhnRZRnP4GZ5nC0iduGWsaksCVzu7Vv
	 2/KtYm/b66UTC4Km9MDhYKEsgsnZ5B2HNu6FSjr+jZF/5fKTlvVOePNEknLwZ9mVfu
	 b5s+hHSZ4/fdpVSaNXHn/4Sjx9ei4R9iT6oxYthUPP1hz0qGGZe47XMQ+j9AeSv2CU
	 V6AMNI0c75fXg==
Date: Fri, 27 Jun 2025 14:32:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-mmc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
Message-ID: <175105275812.4046920.1856778113483721034.robh@kernel.org>
References: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Tue, 17 Jun 2025 17:49:14 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback since
> the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> allowing reuse of the existing driver without modifications.
> 
> Update the binding schema to reflect differences: unlike RZ/V2H(P),
> RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> two clocks instead of four.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added the high speed clock to the clocks list.
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 85 ++++++++++++-------
>  1 file changed, 53 insertions(+), 32 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


