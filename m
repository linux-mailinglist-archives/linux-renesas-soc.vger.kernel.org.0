Return-Path: <linux-renesas-soc+bounces-11731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6879FDCDB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 00:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885BC3A1287
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Dec 2024 23:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4205F198853;
	Sat, 28 Dec 2024 23:34:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF319885F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Dec 2024 23:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735428852; cv=none; b=SMV0rEf3dNkSYCzwpm5m1rIDK0vzrM2JhjAhsPTXtJFai8STVwfrjxr83H5hd01A6EKNMZCHbRzQ1t/qo7aJSx5l0MSCCzwG+GttVYvzxe859+N64bUcrfQHujBQlccJ4rpvRd0R27nQUuOZhRnG44MdxpQIeoKLelES/zOtCs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735428852; c=relaxed/simple;
	bh=ixRQk6kmLRJVJgXweZ3hWxKQjtxdyphRePNjPc46aig=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PySRcCiTyxFnF//2avqhDpQl+J+fa8D+ny8c/iYyfsDsFzgwO6KKpb7MFm7LQnNuX7JFMzQnwjPqzCbnwzcgUKyu2Wv8dml9yxugy5sWZZiFHq3U8pMPWINQIjcfaESCJ9ObaS+WDlS+mQ6ytt5R6J1BsllZBElmUyMnsnWgUYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 0ad8e816-c574-11ef-8899-005056bdd08f;
	Sun, 29 Dec 2024 01:32:47 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:32:46 +0200
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 1/8] i2c: riic: Use dev_err_probe in probe and
 riic_init_hw functions
Message-ID: <Z3CKnu60lVuDBedn@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:47AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor error handling in the riic_i2c_probe() and riic_init_hw()
> functions by replacing multiple dev_err() calls with dev_err_probe().
> 
> Additionally, update the riic_init_hw() function to use a local `dev`
> pointer instead of `riic->adapter.dev` for dev_err_probe(), as the I2C
> adapter is not initialized at this stage.

...

> +	if (brl > (0x1F + 3))
> +		return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). Too slow.\n",
> +				     (unsigned long)t->bus_freq_hz);

There is nothing special about bus_freq_hz. Why casting?

...

>  		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,

I hate code doing

		ret = foo(ret);

>  				       0, riic_irqs[i].name, riic);

> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to request irq %s\n",
> +					     riic_irqs[i].name);

While this following the original code, with the above change (introducing a
separate variable for IRQ) this might also print it.

-- 
With Best Regards,
Andy Shevchenko



