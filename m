Return-Path: <linux-renesas-soc+bounces-24836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D8C6F8AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 16:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F52634E660
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F0C1DED7B;
	Wed, 19 Nov 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pvf8N5GN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E8F1F0E29
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564174; cv=none; b=uIdEouKl73Ssdg7zgrQ6F1Aa/b7d6kEw6pEvsidbUkyRxZB49tpUDqTx0K3gfvOwMZB/K3h4a0DF7M4E082mKG34i/1Rh2CBp15kRE+daFlYDKAzlrI1oaO4F4g28d9AQQ3cqUBcYgmkgkk1+1uHIuyrpx2uxTqXgvSGv39QZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564174; c=relaxed/simple;
	bh=/LJ42jm+ZDIp0e8bSLx2Y1EDOT4x58zPFjO5t9ov3FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=BAsHbUWMq+yS4ToHFSK1OYsX1fB6EdlnSon6V60flWvLvHRxJqmcieF4HPGWUXVs5J9AVnzh849wdYZ4ET6RnR/0CU2Cn4lLeo1yHxYKl3yVk5+iMhabrcjRmlLvi+EHMiR0kY6VAfdjACv84R+AlO0waYWmuTpNBv7rsL/A7BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pvf8N5GN; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251119145608euoutp02747812d2f4af1113d63353ed2f752aa9~5cESNHDYZ0179701797euoutp02N
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:56:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251119145608euoutp02747812d2f4af1113d63353ed2f752aa9~5cESNHDYZ0179701797euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763564168;
	bh=bTNOqgaZlRM7M6ydZWtUNZLt3QeCgjYKGj5gs/tpHsA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=pvf8N5GNJzdWKkKbxIxfhxtvIqvVRjK2vXIEPuwGUxCXklo4bzKPbxvu4LPhrsmyM
	 9e97DCqbG1y/p+Xn/eQvA3D/oBvxIWxtqpI6JIljahRcgph41sV4ABzIZlEF1dsDLD
	 ntxVCWv27H6J0KDd9svUG0xMeVPatpHwd5BwGxEc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251119145608eucas1p2bafd557fd8e8730f7482117f024d6e29~5cER5zeD30435804358eucas1p2H;
	Wed, 19 Nov 2025 14:56:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251119145607eusmtip22c2420a597a9ce378c48929f165f131a~5cERKU-j22216322163eusmtip2x;
	Wed, 19 Nov 2025 14:56:07 +0000 (GMT)
Message-ID: <94216440-dea1-4346-9086-fc20a3e6fe7b@samsung.com>
Date: Wed, 19 Nov 2025 15:56:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] of/irq: Handle explicit interrupt parent
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
	<robh@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier
	<maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251119145608eucas1p2bafd557fd8e8730f7482117f024d6e29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251119131924eucas1p1667eb6127eeb0f19671bc02b0e67fb02
X-EPHeader: CA
X-CMS-RootMailID: 20251119131924eucas1p1667eb6127eeb0f19671bc02b0e67fb02
References: <CGME20251119131924eucas1p1667eb6127eeb0f19671bc02b0e67fb02@eucas1p1.samsung.com>
	<e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>

On 19.11.2025 14:19, Geert Uytterhoeven wrote:
> If an interrupt controller is used as a proxy, it may have an
> "interrupt-parent" property, but lack "interrupts" and
> "interrupts-extended" properties.  In that case, the "interrupt-parent"
> property in the interrupt controller node is ignored, causing the
> interrupt controller to fail to probe, and leading to system boot
> failures or crashes.
>
> Fix this by also considering an explicit "interrupt-parent" property in
> the interrupt controller node itself.
>
> Fixes: 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt parent for nodes without interrupts")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/20251118115037.1866871-1-m.szyprowski@samsung.com
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This fixes the issue observed on 32bit Samsung Exynos based boards.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/of/irq.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index a68272db9879bedf..f374d8b212b8669c 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
>   		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
>   		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
>   			desc->interrupt_parent = of_irq_find_parent(np);
> +		else if (!desc->interrupt_parent)
> +			desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
>   		if (desc->interrupt_parent == np) {
>   			of_node_put(desc->interrupt_parent);
>   			desc->interrupt_parent = NULL;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


