Return-Path: <linux-renesas-soc+bounces-18429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529AFADC6D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 11:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3518A3A9C2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1C829346F;
	Tue, 17 Jun 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GMWwKYhN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6853528F508
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153373; cv=none; b=fkY/omFyM9Kkm05asm0mL1gCT75Hh0+HeeGfvZp8sWgOCNfUGtIaJff0pZS6++SFAv9YKXudk+f22hH/4MhyEI3i5oQvsr7ywtpuEVkzw/7WrHHWG9nfUvrh8dRgeHVBHgVdgGPdY5IOHfCGvRJWSVTvL5v0+jubkS0LvB/MFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153373; c=relaxed/simple;
	bh=xaE/PMeoOICl6xRLwJIOUDitFaeMYrwS0QlpB2Bo+gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLVHk3WDd2h7uJbzLKRwQUm+a6ihzpnTc0uRyDtTr1Fa10aboQVOL4DCY9eb3vug0cH5z+REge+q++qoopAgedzlaNo/OsmZfwDc3ew/enKnT6mmqYWPZ6GeIoYYbn30p+/9aYA5RQdc/OHpIJAWcd/Mgmjwgbr8peiNY7zha4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GMWwKYhN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5Nu8
	wYWOVF85nemsZ/25+lLkQ0qafeZ231O7LDkXoXY=; b=GMWwKYhNyjWQbrAjDmk5
	ALhySfdH2SBIbpPrN8OF+qNr1gBtkbZJX8LFYfK0+mvERoiUyg8Sbr61qzDZxFo5
	sI+MtnwhzKTEkqvoymiGms1zmu45ImFhL3h0JQ3WkVjqyCJ8rwWz2PCnYB5nIMOW
	GUDJ6G1BQgWI74qThx9sNu9/9l+opUdzuy3HZXnyQULuWZ5gDVGfeTx6TVPbnMzJ
	DTH/XbxMkExkjRa3z558hQgmzJ545MEnaOIlY99pa8cTfthHsZcXlG0moC6PHhLO
	SM0PSqTVLZ2FZeNaBWbVUXi1/Thx7EdNVOWlVyTj0HWPbOedMggO8bIohfWxFB7J
	4g==
Received: (qmail 1600317 invoked from network); 17 Jun 2025 11:42:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2025 11:42:40 +0200
X-UD-Smtp-Session: l3s3148p1@Vc1UVcE3DtUgAwDPXy2/ACpZfVCNKldR
Date: Tue, 17 Jun 2025 11:42:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFE4j86NaZcMvxBF@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ty0/U/BdEFVy0pZE"
Content-Disposition: inline
In-Reply-To: <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>


--ty0/U/BdEFVy0pZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some status updates...

> It is similar ADI version. Can you simple descript hardware behavor to sh=
ow
> why need RENESAS_I3C_MAX_DEVS,

I hope the documentation links I sent were helpful.

> Add common header in drivers/i3c/master/core.h implement inline helper
> function

I decided to handle this incrementally. I need to work on the real show
stoppers first, I'd say.

> #define PRTS                 0x00
> #define  PRTS_PRTMD          BIT(0)
>=20
> Add extra space help distinguish register and field define.

Done.

> > +#define STDBR			0x74
> > +#define STDBR_SBRLO(cond, x)	((((x) >> (cond)) & 0xff) << 0)
> > +#define STDBR_SBRHO(cond, x)	((((x) >> (cond)) & 0xff) << 8)
>=20
> FIELD_GET FIELD_PREP
>=20
> check other define

Done. Also with GETMASK

> > +static inline void i3c_reg_update(u32 mask, u32 val, void __iomem *reg)
> > +{
> > +	u32 data =3D readl(reg);
> > +
> > +	data &=3D ~mask;
> > +	data |=3D (val & mask);
> > +	writel(data, reg);
> > +}
>=20
> can you move reg to first argument to align below help function?

Done.

> > +out:
> > +	kfree(xfer);
>=20
> you can __free(kfree) xfer =3D NULL at declear to avoid this goto branch.

Do you insist on this? It makes the driver less consistent because there
are other 'out'-branches with kfree() in them which we need to keep
anyhow, because there are more instructions needed. I can do the change
if you want but I personally would prefer to leave the code as is.

> > +		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {
>=20
> Only pre fill fifo when len >4? what happen if only write 1 byte?

That was a really good catch, thank you! I think the code is completely
redundant because we fill the FIFO again at a later time. Then, also
handling the case of < 4 bytes correctly. Sadly, I can't test this with
my current setup right now. I hope to have tested this by next week.

> > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > +			renesas_i3c_dequeue_xfer(i3c, xfer);
>=20
> This may common problem, I3C spec have 100us timeout, target side may
> timeout when driver wait for irq. So target side treat "repeat start" as
> "start" and issue address arbitration.

As said, I will try to discuss this at the I3C plugfest.

> > +	i3c->addrs[pos] =3D dev->info.dyn_addr ? : dev->info.static_addr;
>=20
> Are there extension of "?" operator in C ? I remember

As agreed, I will keep this.

> > +		ret =3D devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
> > +				       0, renesas_i3c_irqs[i].desc, i3c);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "failed to request irq %s\n",
> > +				renesas_i3c_irqs[i].desc);
> > +			return ret;

I removed the printout comepletely. No need to do it for irqs.

I plan to resubmit the non-RFC version next week after the plugfest.
Fingers crossed.

Thanks and all the best,

   Wolfram


--ty0/U/BdEFVy0pZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhROIsACgkQFA3kzBSg
KbZ/Xw/8DX5jexSQzPCertcmZdvx2WFQht/3bF3fEGKe2TolB3N7T6+8ufA4IKTR
66mcTrw/JX+hmPbyxFb4ycfNiczSJ2JwhM8r4Wi+29DKO5VN5Ijp77eGASXlCUOz
9jQKbz8pbFY9X6yCY8YZGS8KWGA0Uy4icKY8tnGmtOgWg7A98fYOk5zN6YY3L1Ua
P92qa55YKSdduD5P1oWWxg7xdwKGztgwuhts4ImslmMjR8DaTROHuDUGWbA4A981
nUoqoZ4bTvszO7ANJ76Vi0blUVZd6uPC5IMfg246/r5fXWtMtPUArWQ5tsrGgj4p
vAzQ3Scx5dgNTtfVJ+aVR80+LYO4RHkXzV8UGmZpb/FDo06qtNyXbayCF1m+kDC9
KvieuLnfsZro5T6WjeAjDs97CCnf0Q6MP0HPbiHUGxr5DBL/fUGxCI5W7nNJE5Q2
IlU8vJev+xu1Gs5IYoemJvpquiVP/dDiTW8cOfJzW9EsQyypseasCSf2QrzMHkNT
hoDiGo0Op/gV6YZ7Kq0t1qNfHM5vMI1fnki7YIo4oZduPWlzhUleb+FCjQJosfQl
ypC0WYwprqZYVzX51d3EderVsu4o87OeydEa72ctv2gp4WD80lJwbxOwO9BHFAOT
UChANBnupaV93h/WDysb5jB8ZCgE0laQ8m2Z/+Y4KGvW4Qj2gtg=
=gPHu
-----END PGP SIGNATURE-----

--ty0/U/BdEFVy0pZE--

