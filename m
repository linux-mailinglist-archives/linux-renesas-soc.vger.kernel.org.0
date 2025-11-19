Return-Path: <linux-renesas-soc+bounces-24771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2339C6DD60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 10:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C21422DCB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 09:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D69A3446D3;
	Wed, 19 Nov 2025 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uPmwArdO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200083446BC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546123; cv=none; b=Q99RKBov2nfDOwkY8I29brJHzBfijua5lb0dl9XEY7xCnXPEUNSjNjiGuDC/oH3JfgpH/hT4jiXU712QygrOzuJNQJ7WTVSJWy7oN3+ssDCONL6b7AXKSTXlWoI9F9Zv4rq9fMsNGID5kXoWx9bDqvnsSOd2/FWvcxGFE3m2yhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546123; c=relaxed/simple;
	bh=64h2U+bC76oJIPACy/1e19gVkOarzbd3SCTybXSaLwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=McFLqhAyfgSKjXow9dBpTkO7cz7HVpAysR335BbGlZum4stNVljOilH2o13TpqeMciYSLen/lR6ZrD25VjoP6Sm6bJMtBvUUDNqrnVy0zZOQL1ZkdwZbMvrRysmhcrtJ95HRQ0LAElKmYgQtV/BjYQeXZ9ZlI0+o8vjjHiJHCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uPmwArdO; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251119095517euoutp01b877e6d1b2803d4c8ab4939232ecb408~5X9mVgl5e0859608596euoutp01W
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 09:55:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251119095517euoutp01b877e6d1b2803d4c8ab4939232ecb408~5X9mVgl5e0859608596euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763546117;
	bh=L9QUbT5sfOfSl3yIBpPIQUHqDme8WznARKwtO6/UvWc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uPmwArdO3anYJSblTHIv1FqLZgXX/Pg8rCYKAcM+LI0I49VBk/SyIV0lp7vIufial
	 hPm7nJ6mOy+30TLQRaHTLQXuhmuI3ejU8K5wCbEGxXF0BUfeGYET4bYBkF3J4e+EpH
	 /JlmQ8o5qfMTC3SnmLMjmTwChk7CTASiryfl5T0E=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251119095516eucas1p2f3b258d1a710192d3ca6068433be4b85~5X9l2Ux8E1400214002eucas1p2R;
	Wed, 19 Nov 2025 09:55:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251119095514eusmtip2bf01f8bfcbc9230cf2e7669fc51637bf~5X9kNe68a0439904399eusmtip2m;
	Wed, 19 Nov 2025 09:55:14 +0000 (GMT)
Message-ID: <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
Date: Wed, 19 Nov 2025 10:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski
	<krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
	Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier
	<maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc
	<linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251119095516eucas1p2f3b258d1a710192d3ca6068433be4b85
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251119085902eucas1p223cb580bdd4cef2698382835c77210e8
X-EPHeader: CA
X-CMS-RootMailID: 20251119085902eucas1p223cb580bdd4cef2698382835c77210e8
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
	<b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk>
	<1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
	<CGME20251119085902eucas1p223cb580bdd4cef2698382835c77210e8@eucas1p2.samsung.com>
	<CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>

Hi Geert,

On 19.11.2025 09:53, Geert Uytterhoeven wrote:
> On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 18/11/2025 20:34, Mark Brown wrote:
>>> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
>>>> The Devicetree Specification states:
>>>>
>>>>      The root of the interrupt tree is determined when traversal of the
>>>>      interrupt tree reaches an interrupt controller node without an
>>>>      interrupts property and thus no explicit interrupt parent.
>>>>
>>>> However, of_irq_init() gratuitously assumes that a node without
>>>> interrupts has an actual interrupt parent if it finds an
>>>> interrupt-parent property higher up in the device tree.  Hence when such
>>>> a property is present (e.g. in the root node), the root interrupt
>>>> controller may not be detected as such, causing a panic:
>>> I'm seeing a boot regression on the TI x15 platform in -next which
>>> bisects to this patch in -next, unfortunately even with earlycon (though
>>> just earlycon, I don't know the platform specific runes) the board just
>>> dies with no output:
>>>
>>>    https://protect2.fireeye.com/v1/url?k=7efe2b91-216202bb-7effa0de-000babe598f7-79b85fd5422be185&q=1&e=a2b4aea0-c947-472b-ae80-9160750f84a2&u=https%3A%2F%2Fvalidation.linaro.org%2Fscheduler%2Fjob%2F4252918%23L409
>>>
>>> It does seem like a plausible patch for this sort of issue though, and
>>> the bisect converges smoothly:
>> All Samsung platforms fail as well. I was waiting with bisection but
>> Marek was as usually very fast:
>>
>> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/
> Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
> properties, but no interrupts{-extended} properties.
>
> Does the following (whitespace-damaged) patch, to restore finding an
> explicit interrupt-parent, fix the issue?

This also fixes Exynos case without any need for the changes in 
arch/arm/mach-exynos/suspend.c. The question is which approach is preferred?

> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
>                  desc->interrupt_parent = of_parse_phandle(np,
> "interrupts-extended", 0);
>                  if (!desc->interrupt_parent && of_property_present(np,
> "interrupts"))
>                          desc->interrupt_parent = of_irq_find_parent(np);
> +               if (!desc->interrupt_parent)
> +                       desc->interrupt_parent = of_parse_phandle(np,
> "interrupt-parent", 0);
>                  if (desc->interrupt_parent == np) {
>                          of_node_put(desc->interrupt_parent);
>                          desc->interrupt_parent = NULL;
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


