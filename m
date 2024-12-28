Return-Path: <linux-renesas-soc+bounces-11734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD849FDCE3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 00:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A357B188134E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Dec 2024 23:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8EC1925B4;
	Sat, 28 Dec 2024 23:37:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB0F2744B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Dec 2024 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735429075; cv=none; b=V2IB1R5jExhLCSvorhVf5/JvMEF/ugoTAvRreeP4zwlg11jb0s4CE7Wr9ijcXB6EUx3opMNv21qFrsyzFoIb8uxKKIL+8zMQtCGmoOokSe9WE39HrjGH2dR1MKeAC+M4Kk0E8hrsZRt9e9KxWMauIaeB57BcQrXF/ymSqLJ1ar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735429075; c=relaxed/simple;
	bh=4P/JxsvWIy9nEkDkkdDgK8A7i6ezBs5pomUCP0e7j/I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+4bCSp/e29rgNHi2sqpJxaKEpOrB45eacaX0yQUDF5h5WcIsWECwIln4LzU4ce/Q09ZsH9dz+t1wTDD+UZDO78WaJaRmt6rKrB1hffcXGHUwy7Y78e2NwHGUx0G+jN3V5diLoX5NJO+0pZmXH3K5k8s73tlGGu84O1WnW3p3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id be12f6aa-c574-11ef-9c75-005056bd6ce9;
	Sun, 29 Dec 2024 01:37:46 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:37:46 +0200
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
Subject: Re: [PATCH v3 7/8] i2c: riic: Use predefined macro and simplify
 clock tick calculation
Message-ID: <Z3CLypNNqqlSsabo@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:53AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Replace the hardcoded `1000000000` with the predefined `NANO` macro for
> clarity. Simplify the code by introducing a `ns_per_tick` variable to
> store `NANO / rate`, reducing redundancy and improving readability.

...

> -	brl -= t->scl_fall_ns / (1000000000 / rate);
> -	brh -= t->scl_rise_ns / (1000000000 / rate);
> +	ns_per_tick = NANO / rate;

So, why NANO and not NSEC_PER_SEC?

> +	brl -= t->scl_fall_ns / ns_per_tick;
> +	brh -= t->scl_rise_ns / ns_per_tick;

-- 
With Best Regards,
Andy Shevchenko



