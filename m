Return-Path: <linux-renesas-soc+bounces-5777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F032D8D8288
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 14:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CE141C20446
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 12:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939AB12C47A;
	Mon,  3 Jun 2024 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r/w75eBh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZX52S748"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5458615A;
	Mon,  3 Jun 2024 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418410; cv=none; b=Ev/iopkmj686unLEFZpWQc52w9gIrh4nCchbUgP0cMVCODJ/c3t2vZJ4bRBI0ZKyp7AgRkUnMJ6DxGozbfRx2ka2gkJzNWu1CeJJ0hEnw8l/fbyrMUdnoFXmv9v7JDG6xzlh4pNbc6+JVDyWtatIVu1fu6tQRLepTcaQx1VBP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418410; c=relaxed/simple;
	bh=gpQL63nMCWWMr/5E+JsFptrCi9cZIqQUjqLAiNsUKP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FNVZzjjZ68hJQbd6gC455VdIRZHNuMPxy5yWxfRThtuxrfKzwkXAe5Abw5pCJTYllBEYHYmMkWgyJ9V6YPfLISgR+fvtYkmsQcCUGxglQQOsQY7U8ujPJGuXLP5WyWLiYK9GUstYB7yGfQ0rE8xManvAtH6ccQg12QpQAW6ITBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r/w75eBh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZX52S748; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717418407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C9km54j17Gw209l87deKX3nwEPnFegL/JeTGbnPu38A=;
	b=r/w75eBh7E/klvxf4UQL8eEznyuUAQ3KCresDlr+i5LtUtkKbZGsI6m/tvhWU/SMUnJ+z0
	5eijwHlttnzTrL7TyuCtOxZnv3dloyEiVyqhA+57dJeKdLH42/XsusVCux/vKAB6ryhOxT
	iONds2ph3J2Aq85sT9hU5E6WDRLC+QJLtioTYNbEO2SedK4glheTjUqBBH8umml8Ep1nPW
	sRZLdztaNHMUapYHnm5QOh4/l74uTNFik/YvJL7TYangkjJcEVsFHplvmZFBS3ik4Tnpnt
	Qrk0XJPSGecSI+8Up3ZxZhFPCqrOzDl2fy0t8+6/Khba3Sv4YmNPTZaBVE1EJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717418407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C9km54j17Gw209l87deKX3nwEPnFegL/JeTGbnPu38A=;
	b=ZX52S748sx3bSTdjyDDDO08mTDvvi/65oGvQhhO19K6YaZ5saSvvpKF0D7Cpqt1bSWvTUd
	v/3Sjc2xPwyHUBCw==
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/2] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
In-Reply-To: <20240430141438.132838-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240430141438.132838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240430141438.132838-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon, 03 Jun 2024 14:40:06 +0200
Message-ID: <87bk4i6vyx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 30 2024 at 15:14, Prabhakar wrote:
> +
> +static void rzfive_irqc_irq_disable(struct irq_data *d)
> +{
> +	rzfive_tint_irq_endisable(d, false);
> +	irq_chip_disable_parent(d);
> +}
> +
> +static void rzfive_irqc_irq_enable(struct irq_data *d)
> +{
> +	rzfive_tint_irq_endisable(d, true);
> +	irq_chip_enable_parent(d);
> +}

This looks wrong. Enable/disable should be symmetric vs. ordering, no?

Thanks,

        tglx

