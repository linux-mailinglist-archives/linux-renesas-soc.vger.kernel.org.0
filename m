Return-Path: <linux-renesas-soc+bounces-11735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2249A9FDCE8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 00:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B25161D1B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Dec 2024 23:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3879E192D79;
	Sat, 28 Dec 2024 23:40:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DBA2744B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Dec 2024 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735429213; cv=none; b=CLT8MlITx/x04jy+Y6+idJF8We0ToGJFXHn4DH1uIB7ywWXeyWQzfkolE0zjrbe99VVBocynkGLbA2Z2ThRYnia6OhSAG9sntuTnjWOqnanp5cG0+ypxq0dmRggT2Vr2fD+YhWUyb+BANRsCQHReoSYu7dSaqMTfCvNSwI+zjeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735429213; c=relaxed/simple;
	bh=QN49srVCDXdySo4rqm/pmDcfG/7bpIGph7dt+CPHUIM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBsHFmASgKhnclV9zDbnyd7V0BENe7O+6qBoGCOFjkl+6cU6Wl6FHBF2XDrbSLDXRyMY/0E49B0JXEc72XeLqTFEXDRMqj08Tk/rfNMBxv962ffVnbRlzrp2OEywnhLYdy4WLiDwmRBfzn4pxRfgZti81Fu0YooRBAdAIovg17M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 0dea58d3-c575-11ef-82ff-005056bdf889;
	Sun, 29 Dec 2024 01:40:01 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:40:00 +0200
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
Subject: Re: [PATCH v3 8/8] i2c: riic: Add `riic_bus_barrier()` to check bus
 availability
Message-ID: <Z3CMUDX4evaVdizJ@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:54AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduce a new `riic_bus_barrier()` function to verify bus availability
> before initiating an I2C transfer. This function enhances the bus
> arbitration check by ensuring that the SDA and SCL lines are not held low,
> in addition to checking the BBSY flag using `readb_poll_timeout()`.
> 
> Previously, only the BBSY flag was checked to determine bus availability.
> However, it is possible for the SDA line to remain low even when BBSY = 0.
> This new implementation performs an additional check on the SDA and SCL
> lines to avoid potential bus contention issues.

...

> +	/*
> +	 * The SDA line can still be low even when BBSY = 0. Therefore, after checking
> +	 * the BBSY flag, also verify that the SDA and SCL lines are not being held low.
> +	 */
> +	ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], val,
> +				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
> +	if (ret)
> +		return -EBUSY;

Why the return code is shadowed? Is it requirement by ABI?

> +	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
> +	     (ICCR1_SDAI | ICCR1_SCLI))
> +		return -EBUSY;
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



