Return-Path: <linux-renesas-soc+bounces-11732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 202ED9FDCDC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 00:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC840161D16
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Dec 2024 23:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC7F26AEC;
	Sat, 28 Dec 2024 23:35:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB611474B9
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Dec 2024 23:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735428919; cv=none; b=lodxmJXszlPjav9yhEJSKcw6TOZqsw9D1ilm5Zxnoi61WTpkOd6MIXbGgffqVR+pVvO9ZM8J06jczUl57PmqcQJPhpTdQTM4LW202eI7bhnr4RLT0TsaVLDk/gIhwmDLxDYNU0Q/D9Tvt3V+I8zarAqI4foF3VgmtgHv0MA9r+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735428919; c=relaxed/simple;
	bh=2Q6s2b4H5T/TFfZxexsTDIaXQWsP0D2YL2gOlXxZcVo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv2LKblTh6t6tp413R7Gq1y39tyGLer1pH7xmduDMnGHH0nf9dEXIBbf3a5aQBLzbjGg4+CDxOqV5U8CBB4Tldew41G9f3eWO1g+4CQz1ECp0w8INtgoofzqQGrCSi8T2e5C0+2qfF6++KTjYbETXif/eq6itYaagrDHBfj8NY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 59c7d618-c574-11ef-9c75-005056bd6ce9;
	Sun, 29 Dec 2024 01:34:59 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:34:58 +0200
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
Subject: Re: [PATCH v3 3/8] i2c: riic: Use BIT macro consistently
Message-ID: <Z3CLInVi43HW2Gmj@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:49AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Easier to read and ensures proper types.

...

>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>

Does it include bits.h or equivalent (bitops.h, bitmap.h)?

-- 
With Best Regards,
Andy Shevchenko



