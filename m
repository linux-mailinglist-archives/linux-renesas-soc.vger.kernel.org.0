Return-Path: <linux-renesas-soc+bounces-19588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9499B0A108
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 12:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C87A5A6E4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E915F2BD035;
	Fri, 18 Jul 2025 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f1AsJS7b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928691B21BD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jul 2025 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835718; cv=none; b=rvJJu8XnCojChgIhSI0Go5a1+eQVsbVVYx4fsoSgJpoXSkQ03AXi2WxKTRnPhWMBWlEEHA+qQJrK5tCz4f0Pu/TQFhm8eZT+9fSjTlPfnrm90Trgp0uKDp9pSVrRycMhL+bat/a7b2R17qGyQgC7aCfaXKBzyBKVtRMnf3Aemo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835718; c=relaxed/simple;
	bh=4LTXnAcUBsgWRXbeGo2njI8Om68Wwn/Qh6Q/fLhMR/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPeegC4GhOvcAKUTD52mH8PYOaAVexNmkvOghbgBXRQM/2DcARfXRo9PoKy5ut5nWYXJJ0wAdaPGtmAwucQJwG8CclhJMSlN5RWSzHcDilLJLk+KluqZvkjdws/x2MVR6pJ0b49IwwlJ2DydB5V1HupdXNmygBPh3+WfHl5RZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f1AsJS7b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YiG1
	IShrAJJD2nBW0s3CYWEa3UHJFS+PznTuJurnABk=; b=f1AsJS7b3SR9leX88GTm
	UayW9XFd8Y3eOa1wFxwyBsYiBZ+WnU1CdhgD4p0ZFf77Z1cvbYQV6RJr7YB9dbw4
	wNFdaoxYxJ1oyV9Zbw3HHZOT4SUzOK3Vn4Y2ZGZ+WwN6ZCZ1PM0syRQCkmgqlbto
	p4tABsZnTFd3dZdIQZHWhoRcYNHQXKIAKc9UJEKdtQJKn+zNTNVXwjd69pCdZzmu
	V2AOSb1lBjoJyrnP39QjPc3YrTphgM4hPdesyU94A0cYIeOL3bMrHge+4rXOU5RL
	+E2iLf9eASg432JGo1eK2e0P6ie6RnRVdRql1qtqnL09ZIDD1iB0KNKEaOsYh4mQ
	ew==
Received: (qmail 4026406 invoked from network); 18 Jul 2025 12:48:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2025 12:48:32 +0200
X-UD-Smtp-Session: l3s3148p1@IXr33TE6RuAgAwDPXx+vAAkEB0lWxGP4
Date: Fri, 18 Jul 2025 12:48:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aHomfzV_dJMwFyCN@shikoro>
References: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
 <20250717122455.9521-3-wsa+renesas@sang-engineering.com>
 <aHlJ8KQzcamyaZA1@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHlJ8KQzcamyaZA1@lizhi-Precision-Tower-5810>

Hi Frank,

> > +#define NDBSTLV0		0x398
> > +#define  NDBSTLV0_RDBLV(x)	(((x) >> 8) & 0xff)
> 
> Can you use FILE_GET()?

You mean FIELD_GET? Probably yes.

> > +#define RENESAS_I3C_MAX_DEVS	8
> > +#define I2C_INIT_MSG		-1
> > +
> > +/* Bus condition timing */
> > +#define I3C_BUS_THIGH_MIXED_NS	40		/* 40ns */
> > +#define I3C_BUS_FREE_TIME_NS	1300		/* 1.3us for Mixed Bus with I2C FM Device*/
> > +#define I3C_BUS_AVAL_TIME_NS	1000		/* 1us */
> > +#define I3C_BUS_IDLE_TIME_NS	200000		/* 200us */
> 
> Do you have document reference to such timeout value?  If it is spec defined
> timeout, please move to master.h and add ref to spec sections number.

They are all in the specs. Will move them.

> > +#define XFER_TIMEOUT		(msecs_to_jiffies(1000))
> 
> Is it engineer choosen timeout or spec defined? add comments to show why
> choose this timeout value.

Consistency. All current I3C controller drivers use this value. If we
want to improve it, we should do it in a seperate series for all drivers
IMO.

> > +	/* Wait for reset completion  */
> > +	return readl_relaxed_poll_timeout(i3c->regs + RSTCTL, val,
> > +					  !(val & RSTCTL_RI3CRST), 0, 1000);
> 
> All you use customer's readl at other place. here, you should use
> read_poll_timeout(renesas_i3c_reg_read, ...) to keep consistent. check other
> place.

I will use regmap_read_poll_timeout().

> > +			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_NS,
> > +						     1000000000 / rate);
> 
> 100000000 use NSEC_PER_SEC, check other place.

Ack.

> > +	/* Extended Bit Rate setting */
> > +	renesas_i3c_reg_write(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
> > +					   EXTBR_EBRHO(od_high_ticks) |
> > +					   EXTBR_EBRLP(pp_low_ticks) |
> > +					   EXTBR_EBRHP(pp_high_ticks));
> 
> I feel renesas_i3c_reg_write is too long, renesas_write() should be enough.

It is long, but precise. renesas_write() could mean anything. It would
also be confusing if some functions start with renesas_* only and some
with renesas_i3c_*. But this is already too much bike-shedding for my
taste. I will do the extra work and switch to regmap and hope that the
overhead is not noticable. I hope I can squeeze this in today.

> > +static struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> 
> const?

Yes.

Kind regards,

   Wolfram


