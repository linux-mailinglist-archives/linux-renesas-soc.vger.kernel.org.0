Return-Path: <linux-renesas-soc+bounces-14159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB336A573EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 22:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED0157AAB25
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 21:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B95208973;
	Fri,  7 Mar 2025 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7KKr860"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278E01E1DF1;
	Fri,  7 Mar 2025 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383921; cv=none; b=hz5Pw6oSPx3JiYlfOB13b5s9yE7HgAPg2NEZaOv9ZvLhUO7NnTLmjHs5P1Y0Z1PMM3ih7xjq2PKahE9Uk+ueTxpuedzwKsaKOdlOgu4PzgY+ZBwEw0E4tLQPrqgALB9KLd1qsLObvc/A2Ol1SUozpqWXJO86PAvufIAwQKgxqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383921; c=relaxed/simple;
	bh=exvCaQAecMG84V7ugK1HP+4nSWq8HFjLuH8XlyQhdkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kksFctStgkQNyHSaGPkW69+cWJCBey2ZiuIMRIg8srmsAUe8dqeJsxLvtKGyzcL+okMcwyLiCGjLcxqQRu8p3nuyixXykbfrsI1jbHbCAHuFYROh/rhVH/1ZH0JWEiCFPNEdoCLbEs49QvwT94+s/pl7vIBAf2oZULv+T8g0bZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7KKr860; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A609C4CED1;
	Fri,  7 Mar 2025 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741383920;
	bh=exvCaQAecMG84V7ugK1HP+4nSWq8HFjLuH8XlyQhdkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7KKr860b0jKBtRjU4K37jmpsjRIKBnvlMODn5HA2ang5Ax1ONMTJh3rgNZVNHFu3
	 xq/YZOgNtpl0e5RlSKvRe9UvVqyrujV29zpfGFQ20U1exRIPHJP1LujZy38v/dov60
	 qpiynHfPP5g2vDsBM5sNWxljo/uhuXbi6tu1Lmk67kxNss11Ry27js+i80/h3u+BF2
	 K8pT/bY6dvyfoyWNmWejwZpTLYlceF7C0hjxof+JwGWtLZHB726v4fBWBKp2PtU9nX
	 iEqGEHTlD3jCSU3efMwzbb5T/UZxic+2ZzzTGaAEBRLrRb8ymUMEFckyXFNUBPmeva
	 tE7wQtG10ndsA==
Date: Fri, 7 Mar 2025 15:45:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, thierry.bultel@linatsea.fr
Subject: Re: [PATCH v4 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
Message-ID: <174138391846.660308.3115874488734848744.robh@kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-4-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-4-thierry.bultel.yh@bp.renesas.com>


On Thu, 06 Mar 2025 16:24:37 +0100, Thierry Bultel wrote:
> The SCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
> of similarities with other Renesas SoC like G2L, G3S, V2L;
> However, it has a different set of registers, and in addition to serial,
> this IP also supports SCIe (encoder), SmartCard, i2c and spi.
> This is why the 'renesas,sci' fallback for generic SCI does not apply for it.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v3->v4:
>   - Added more details in commit description about why renesas,sci
>     does not apply.
>   - Removed uart-has-rtscts for !rzsci.
> ----
>  .../bindings/serial/renesas,sci.yaml          | 63 ++++++++++++-------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


