Return-Path: <linux-renesas-soc+bounces-11736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BB9FDCE9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 00:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DC3A161DD5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Dec 2024 23:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C291990D6;
	Sat, 28 Dec 2024 23:40:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76118858A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Dec 2024 23:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735429259; cv=none; b=a5PR2uQxWGzpDJF6MK24NjayuRaUb3g9SknNtbbkgPC3xYfl2bXsxWTo26PzqZvcdxQ0rZYF6uDVpyXtT3LB8UxQfQqYyl/GL2uLU2S5fv93vpTsoQxMtG/Hst0fPEmxR+0WknAZKo9GOiElXyKg1QWc6xA5b8duIgZT3VfSzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735429259; c=relaxed/simple;
	bh=GxT6OU5DMMOzXUdLwmBKpReesSqumSB7KsrSv8mTWmE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/WH+hcHSilceirfKTHp0FNfdqrbG40xTNV8Vtz4mJgsAMiK5VYsoOccUuKjwt3jMgc6hFR6K8/fVL9hwRGimxhdCxsbIgKIpy7iCH2ioTTPyxOQQcgZap9YijKiRIFY0HDXDki6PfjyrYhSSTqkvmd9RA0gaUsr10FF+nVuBeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 2e11aa48-c575-11ef-8899-005056bdd08f;
	Sun, 29 Dec 2024 01:40:54 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:40:54 +0200
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/8] i2c: riic: driver cleanup and improvements
Message-ID: <Z3CMhhEyVpQjgpun@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <huhbfedblerrw6koztkiij3hgdrty2oihmacug53734wctq34a@aqlgw63zj3ad>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <huhbfedblerrw6koztkiij3hgdrty2oihmacug53734wctq34a@aqlgw63zj3ad>

Fri, Dec 27, 2024 at 11:10:22PM +0100, Andi Shyti kirjoitti:

...

> >   i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
> >   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
> >   i2c: riic: Use BIT macro consistently
> >   i2c: riic: Use GENMASK() macro for bitmask definitions
> >   i2c: riic: Make use of devres helper to request deasserted reset line
> >   i2c: riic: Mark riic_irqs array as const
> >   i2c: riic: Use predefined macro and simplify clock tick calculation
> >   i2c: riic: Add `riic_bus_barrier()` to check bus availability
> 
> merged to i2c/i2c-host.

There are some comments, up to you how to proceed, they seem not to be any
critical.

-- 
With Best Regards,
Andy Shevchenko



