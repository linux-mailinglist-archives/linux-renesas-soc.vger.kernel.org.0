Return-Path: <linux-renesas-soc+bounces-26326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05356CF938B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 17:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85147301B2D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 15:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5C378F2E;
	Tue,  6 Jan 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qd8o6nXA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD434C92
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714872; cv=none; b=dg5BfFrcsL5UPa+p5Hu5ZVyv7lQJEIAk9qjweDu2LzpXv/rRK4tempMWCKexKv/PwDMsvJmDsPEHMXdckn64gb8rjAvfgddo/h18TV0dU1uLblOoQcl1YwSSD62VWDbmVj/C1hNuCGwxmHzf2OuzcqOATSTo52OOK9OZxtIZwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714872; c=relaxed/simple;
	bh=spl46sNW9pMB1RwXAsR6oj4iFSUeGGd22wdLHtZrTNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khNthG1S9nBZskmA83V6rGGOmsBtn7kqkhYEI3fKq+Q6QEVQ3ezuw43aPqX+QAFzRw4r8Y+yO6ZUjKPg0gWx7HEQDpS5TrrqFe5uMKvaGiWXCDtZVkL5I5aXzUGwSuDg8/n+UMxvU9GmPJMxYF9t7FXXDYmyDZ8jUXOnjQ7gDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qd8o6nXA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 11C704E41F8B;
	Tue,  6 Jan 2026 15:54:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBB7360739;
	Tue,  6 Jan 2026 15:54:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D58C103C8393;
	Tue,  6 Jan 2026 16:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767714867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=JKmJjeA+TbghONDMBCgVukZFNKdcsUhTzD7QTEwX/zE=;
	b=qd8o6nXAYZ+5kWfVoatRsGedKaWYu4nvHV/5dYZioOpnY28/2wmYNT0VrqmUxstiTgeO7v
	39idbBH1mZE6j2QtHx59ZVhsFv9zn9iKMUgeMw8eZ7gc5GHlwZ4pI4TjhriCduwdkiKhwG
	SmYb3nOi/HXireBeuEgzcofm+kLVh9NSY0QnyYqomRQwqPUvBB01qVQCyEVfA0gwLEpz+7
	rI4/Y1Wc4LVjYVesmLABzJBtoB5r2Rzv+SaYxYTO1dN7UFg7aCc5Fd/EXsA0oARH5FJLj6
	qRd3ahYUyKbN5jeb1+NUQyEpb56VHIeE+YJwwcLXVHGW7mzADSfwxa9JpoHFxA==
Date: Tue, 6 Jan 2026 16:54:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Frank Li <Frank.li@nxp.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <20260106155423992035a6@mail.local>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466AB09CC77C375492A0E28687A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0neUGcqiGkE/Sv@lizhi-Precision-Tower-5810>
 <TYCPR01MB11332395B91D672D6BD46CECD8687A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11332395B91D672D6BD46CECD8687A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3

On 06/01/2026 15:41:10+0000, Biju Das wrote:
> > This is just more flexiable for clk schema. If your schema is simple enough check num_clks >
> > RENESAS_I3C_TCLK_IDX should be enough.
> 
> For avoiding crash that check is sufficient, but as you said wrong dtb like crash
> can also lead to non-functional i3c device
> 
> Eg:
> 
> From bindings, we expect the below entries in DTS for RZ/G3S
> 
> "pclk", "tclk" for RZ/G3S
> 
> But user mistakenly just added "pclk", that will lead to kernel crash
> 
> Or
> 
> Swap the clocks
> 
> "tclk", "pclk" this will lead to non-functional i3c device
> 
> On both cases, user ignored DT binding check warnings.
> 
> As you said crash is fatal, maybe stick with just num_clks > RENESAS_I3C_TCLK_IDX

Yes, this is enough


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

