Return-Path: <linux-renesas-soc+bounces-26741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED7D1F9E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2C40304790F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0D33043DC;
	Wed, 14 Jan 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LtjnaUw2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C744E26CE3B;
	Wed, 14 Jan 2026 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402980; cv=none; b=VO/hjXfOY/vBhJYCldNa3u7uf8ZWKxpnjNZF5JQJt/Gc6mO4Y8I2BXWpdQbadwVZhQFI2FjpU1nHBbM4w9kW4CjuAnESuqssCTb4FlWnwn3z7Jz5SysoAZj02BuZgQBdrq8v83jiOwc9yTmIxTx4y92uqEqaZpsmYs/zl79Ru08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402980; c=relaxed/simple;
	bh=C/NxO34wAs4axmDEnS4wOzXceNFCXcCC6a1VTiqqhEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZqzPVhDiumIShHVJzLnQ/xHkj4gu/EOmgZ8AY4DBdC3rMZZalbTtXn1+QIrZHSXF6/YWqzxNMX7gAk8PnxbrHy497bxfTFSR/WToMMu3PR9MXeLUNqG+PG+qzGEX4U1TgasE2nXfnz5DFmqOTXFC6cnwqIjyLlnDjDtu2DsNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LtjnaUw2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 936434E420D7;
	Wed, 14 Jan 2026 15:02:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68BB76074A;
	Wed, 14 Jan 2026 15:02:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B60C710B68265;
	Wed, 14 Jan 2026 16:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QO5VB5UcoX6yJGvOy61nbzpj4avb0kRK9ECr1RMHGB0=;
	b=LtjnaUw2ZeD7BIR2wERCFl/9IeGVCeexdSu3q+ie4yCeAU/mKCOfzsfUiXkiFAOrezX5m7
	EPZZ08Te3boZUTT0v0Ndp+zEUvQxKCgOBhmr9x6TyDmbHws5Ic7X5eDTj1SsTqs+a+2kyN
	clIPAh2f49RMBOP0WaA3IbNhyGqFVNDgklUluf9aZyvfS/KNCAOPSARd2hlsz7A+7k5cDr
	oS9VvmGU4hZMy+IYDhwaf4V5XdBiALjoWwx8DckOAG5r1997muUBPR6NsMzFQZ1G8i7H7I
	GrHwCRuGjiA5v7BLs9ifmN7d9Jden02+6uYPqiBcYM9kMlF5YoPpfqypofXq1g==
Date: Wed, 14 Jan 2026 16:02:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: tomm.merciai@gmail.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] i3c: renesas: Add suspend/resume support
Message-ID: <176840281755.1259180.1971003582485935072.b4-ty@bootlin.com>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 07 Jan 2026 11:33:46 +0100, Tommaso Merciai wrote:
> This series adds suspend/resume support to the Renesas I3C controller driver.
> 
> Thanks & Regards,
> Tommaso
> 
> v4->v5:
>  - Rebased on top of next-20260107
>  - PATCH 1/4:
>      - Improved check for clk_bulk_get_all_enabled() failure into
>        renesas_i3c_probe().
>  - PATCH 2/4:
>      - Moved presetn and tresetn reset controls renesas_i3c struct
>        entries above num_clks to avoid padding.
>  - PATCH 4/4:
>      - Collected tag.
> 
> [...]

Applied, thanks!

[1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
      https://git.kernel.org/i3c/c/579c7255922a
[2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
      https://git.kernel.org/i3c/c/ff4e4f03f008
[3/4] i3c: renesas: Factor out hardware initialization to separate function
      https://git.kernel.org/i3c/c/5eb3e8763e07
[4/4] i3c: renesas: Add suspend/resume support
      https://git.kernel.org/i3c/c/e7218986319b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

