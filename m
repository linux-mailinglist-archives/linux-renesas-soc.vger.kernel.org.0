Return-Path: <linux-renesas-soc+bounces-19156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D3AF83ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 00:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA8E176656
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 22:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48632D3A68;
	Thu,  3 Jul 2025 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QF7J8jz1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9802C15AA;
	Thu,  3 Jul 2025 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583193; cv=none; b=JSupy9rN97z9OPtOvd6svfq6fYeZZJg/NrBQLGF24RG7lrGzZjutUa9ExAaoRwDsdjFMat1cwXobIC2ItweMwmhG1kJLgp7FEUshAU25ztfd+dud9VhU8DNugkhWv/Lv4q8GKCfoFhI/M9c1NB5zkJWkJPr9dFCJaBN27HUuhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583193; c=relaxed/simple;
	bh=dnLsOvKEg5PteS72ScqjZ5c1b2hf6+csvYSytfOs3UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiKl8z2H1tWW/jl1r5kTuplKnhiFMzVf4WVYjophbItfUaPLWlz31KPRUDkEtGFUMVFrqhvmRzwS5ZEOZ/lu8pNSioyZicL7h39OBqZYFmqBZ3qGwURYcltJ17LD143DqzNLSjFEHAsfbwLkgWN0fwckwYGYivelhxCXOLkodwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QF7J8jz1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7926E667;
	Fri,  4 Jul 2025 00:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751583166;
	bh=dnLsOvKEg5PteS72ScqjZ5c1b2hf6+csvYSytfOs3UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QF7J8jz1tVsFUW+G/Fa+iCSy0CiNy9dE6iTSTvxYutA3CLQqEeUUwriES3yD/gMKu
	 KtAEQ93UY9riE8EQ2jpCGH9IZ8PQhYGQ3HvBzIwKKi7EfVKLB4x/MwWbejDrGEUIN4
	 5WjMuoSo0n5fqCcJxVvt/MeUspHBJ/3Xwc42TZ4c=
Date: Fri, 4 Jul 2025 01:52:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas:
 r8a779g3-sparrow-hawk-fan-pwm: Add missing install target
Message-ID: <20250703225243.GI3798@pendragon.ideasonboard.com>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
 <20250701112612.3957799-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701112612.3957799-2-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Tue, Jul 01, 2025 at 01:26:08PM +0200, Niklas Söderlund wrote:
> The target to consider the dtbo file for installation is missing, add
> it.
> 
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 677ba3aa8931..47e46ef99d36 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -96,6 +96,7 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
>  
>  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
>  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
>  

-- 
Regards,

Laurent Pinchart

