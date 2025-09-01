Return-Path: <linux-renesas-soc+bounces-21130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC8B3EC34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 18:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35CBD44458E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 16:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01C62EC0B9;
	Mon,  1 Sep 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erBBuXVg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9132F745;
	Mon,  1 Sep 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744104; cv=none; b=fVj63Tzmd9oC4f2JMaO0yglVXXXvVytBrrBUCoIxxHPTarL8YD464NGs6ME5hLHotK9J4Ad7YGZ9TIdgTc9XXOiTEyT5D1x4LNjcifSWX9XL9egt76hR48Qf6R1Mwrsjw+Z7Wrj8LI2lTgl8l4AuVXLb0BzfftObYf0XfQQfVu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744104; c=relaxed/simple;
	bh=viw6wcLJ9dNt96CV0hewJVgxtXzq50eavaC2cG7cjho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYChLKky3ps5eax3/0jZB4lRO18dgfRVejbUsv09PT8d98KgqVWmYeEAvvX94mbUNXWrS+x2DbNf/OPWH7fRIoZzofVvMQbvtlO9OVWjYfx8Ag26x6aEAQ5ZVyC/GuRIloUGhO+ustVkYZ5murtFoXP+ZG3mlNHq5gOuJSOp8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erBBuXVg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414DEC4CEF0;
	Mon,  1 Sep 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756744104;
	bh=viw6wcLJ9dNt96CV0hewJVgxtXzq50eavaC2cG7cjho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erBBuXVgQZv37o75NFkFnzj1JNuHwmNa41C2tuunXJAqdAhWWn7gdM8xoRjhLtlbb
	 l3Gt/sYbTdnD86ODgtofGn00enO0G/o935z81/DrlJ5Uu5GID0rTiTzlM3ybqAxLAK
	 RwmRKVEGnqQqxUhLF0eELSiFKNoAtsarvrLAJgn01uBwV5aihRhNUHJYvt5L6XjpRP
	 BYwsqsnVzA0Ay0a8kZxfNDiEhdHDxHBfhoCridA0acWUkU9jfuds893IYqv3islZ+7
	 0XxVjRvVhzxjbiHM096hMIy3lm0D6+PXyn+tIs++d+MyTIC9fETjiwPCDpQEXgoSAQ
	 uWNsyn1exfBlg==
Date: Mon, 1 Sep 2025 21:58:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 04/11] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
Message-ID: <aLXJozzGsbIndK9P@vaman>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171812.402519-5-biju.das.jz@bp.renesas.com>

On 20-08-25, 18:17, Biju wrote:

> +static int rzg3e_phy_usb3test_phy_init(void __iomem *base)
> +{
> +	int ret;
> +	u32 val;
> +
> +	writel(0x00000100, base + USB3_TEST_CREGCTRL);
> +	writel(0x00000303, base + USB3_TEST_RSTCTRL);
> +	fsleep(20);
> +
> +	writel(0x00000004, base + USB3_TEST_CLKCTRL);
> +	writel(0x0000000d, base + USB3_TEST_LANECONFIG0);
> +	writel(0x00000301, base + USB3_TEST_RSTCTRL);

Magic numbers...?

-- 
~Vinod

