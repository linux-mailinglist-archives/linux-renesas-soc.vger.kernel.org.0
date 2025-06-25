Return-Path: <linux-renesas-soc+bounces-18753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECCAE8E79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 21:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F33168AF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 19:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758702DAFA9;
	Wed, 25 Jun 2025 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKn/Am9G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6402D3A77;
	Wed, 25 Jun 2025 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879253; cv=none; b=jZ1hYOaDvR+8uxdauBeZ4yRFwje1LG1o7t73tV5GilMDdeNWzoXoRZUoegDIcUAo1ujYezP6sanQ9U0u4VPGHL6skZct+55gHx9wdCpdE/r3aOtrPdpLv8vJIahBLCpq8UgTeY73iY5s+dNTKw3ayBVOiaRMKHmCugyDlev/hC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879253; c=relaxed/simple;
	bh=0M5isegZ+u88QFyNHKXhyISo4jB/zwu5zpA+8O1xpgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9/sg7pBSukHRyFUsIv/UDFBskCbZ79P4hq46Ksiy5wb/rQ8qyOg/Eu4ttmviwHkXh5VXaI6Ma3vNCaZIFrUUomHhgssh4pdeBXPUnRv1iSYORFSd+g9kmBkyZraLijZ605lg2FUtuAc9hW1jZX2R9y9G8mIlvfPQv4ayY7klvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKn/Am9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC56C4CEEA;
	Wed, 25 Jun 2025 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879252;
	bh=0M5isegZ+u88QFyNHKXhyISo4jB/zwu5zpA+8O1xpgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKn/Am9GrBnYVo/vRcXGXe/epWOjVSybz0XxzThZ6Jgg4oUFOvDIXKt6NlJM3x7WC
	 E8jQEXbcgrk+jjI1BUl6yrTd5r7wgC3surQRs5f5fBdR/2k8ZuaRYBvihcBA2hQ54k
	 XjKgcIHiWxnsn6+yh8PxQ04eteLonRTA859Uy02ZmkbWHNklD1Qs7Gdg+uzv79AwaO
	 70cpwasBQKNPPSVz6qR2RCtk5I7wrRB9D8AEvMVdTGRTgwMCD3CZYjtPLooxqD5A8a
	 4RxRNcHf+cEAtfYBoKVcvFWoTwy5J9aakDv1ZhyMAayPAWJVwHf9jSlCtn8CwEjT72
	 dJ6/Uvi5P+gyw==
Date: Wed, 25 Jun 2025 14:20:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add Analog Devices ADT7411
Message-ID: <175087925106.2068953.11227381201215645741.robh@kernel.org>
References: <20250608162240.3023-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608162240.3023-2-wsa+renesas@sang-engineering.com>


On Sun, 08 Jun 2025 18:21:09 +0200, Wolfram Sang wrote:
> Describe this SPI-/I2C-Compatible, 10-Bit Digital Temperature Sensor and
> 8-Channel ADC. The driver is in hwmon for ages.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Found while using a local setup, but there are upstream users already:
> 
> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts:                compatible = "adi,adt7411";
> 
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


