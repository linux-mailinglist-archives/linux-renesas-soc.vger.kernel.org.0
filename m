Return-Path: <linux-renesas-soc+bounces-18202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F751AD74C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCFFC2C3EB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA8F26B97F;
	Thu, 12 Jun 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b0lUD+Pe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D58268FCD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jun 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740135; cv=none; b=uYg4OTrLQ+0iIbOv4rYMdL4yjKPUB6Wt5NvuAq8eVpMT9K7VVhb1VQ/QKdIrEmqmzu057DjVNB9QWL5lsk/QWfezVj5xLBZ1jC5mQqWT/yxxTIRAKkfOW0rRfIQPV0qMgB/birgRQAN+7ZA55ZNCWrvwJDh6Z4Hg1ghbWKY3MBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740135; c=relaxed/simple;
	bh=Bgs5G45b+BQKGAV/dWDNRlgOY5FObG/kCTU7sVZJaPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3QPSygSrwl9mUfyvabbnxhr+KKy1XvFYf8bqn2V5bCMYjAcIPsooP6kkxlx46lTHjxEIzKJuvtyJO4hoQciPF8AZjkdox1yRMjCHJs3MM0ept3G2cqXmYddL/aXP59ToFWP15m+0NOPvCMjvEkobAiJtZPWxUPF7R6mtkKML9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b0lUD+Pe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yNeX
	JXYfsxeBzBybMG0Lf4NyGPM03M7mzUcOLX6QJfw=; b=b0lUD+PevV7FNmTf1wQz
	vURalKlXSRZiwfZ5M8ZvX9FIenB5Oi2Ps8YU9y8A5z177RxIYNIfWkAfR3QjS4J+
	UOVit+FlN255l3/ImJUfrcVeE655ULkRtZsSh0NEBYuTvewPd/K4hKvZy7hbEj74
	Id7QJPMU23ZAXAooki1jGBO7NQT+gbgb6HDVkz+1xzUWMQuFst7tZYm4Px4SR2DZ
	HXwqsUTqloE7KGulTiPjuRGMPqVpdE4QXLpO27bwpJGIlZrk22D4rMJ22AIdibWx
	mS/5yspN4jnYo+udJVFnEeibNTjqUZzH3ce6SNmbiKKDgr/ia13XnvH46pkvfnso
	zA==
Received: (qmail 4053993 invoked from network); 12 Jun 2025 16:55:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 16:55:31 +0200
X-UD-Smtp-Session: l3s3148p1@Lrz4HmE3RpEgAwDPXy2/ACpZfVCNKldR
Date: Thu, 12 Jun 2025 16:55:31 +0200
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
Message-ID: <aErqY0QWMRdC7Pvg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
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
	protocol="application/pgp-signature"; boundary="yXXD3/XiB3z76d/C"
Content-Disposition: inline
In-Reply-To: <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>


--yXXD3/XiB3z76d/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

thanks again for the super-fast review.

> > - RENESAS_I3C_MAX_DEVS is a constant currently. So, we could get rid of
> >   the 'maxdevs' variable. I tend to keep it this way in case future
> >   controllers may use a different value, then we can change it easily.
>=20
> It is similar ADI version. Can you simple descript hardware behavor to sh=
ow
> why need RENESAS_I3C_MAX_DEVS,

Yes, for example this register has basic status info per target:

> > +#define DATBAS(x)		(0x224 + 0x8 * (x))

And there are only 8 of these registers. So, there is a maximum of 8 for
this controller. We could hardcode 8. But we could leave the handling as
is, just in case a future controller has more or less of these
registers.

> > - For accessing the FIFOs, this driver uses the same code as existing
> >   upstream drivers or the recenlty submitted "ADI" driver. There, the
> >   question came up, if this could be a helper function?
>=20
> Add common header in drivers/i3c/master/core.h implement inline helper
> function

Sure thing. I think I didn't get feedback on my original suggestion so
far. If I now know you are positive about it, I will give it a try.

> #define PRTS                 0x00
> #define  PRTS_PRTMD          BIT(0)
>=20
> Add extra space help distinguish register and field define.

Okay.

>=20
> > +
> > +#define BCTL			0x14
> > +#define BCTL_HJACKCTL		BIT(8)
> > +#define BCTL_ABT		BIT(29)
> > +#define BCTL_BUSE		BIT(31)
> > +
> > +#define MSDVAD			0x18
> > +#define MSDVAD_MDYAD(x)		(((x) & 0x3f) << 16)
>=20
> Use GEN_MASK

Sigh, if you think this is more readable, then OK.

> > +#define STDBR			0x74
> > +#define STDBR_SBRLO(cond, x)	((((x) >> (cond)) & 0xff) << 0)
> > +#define STDBR_SBRHO(cond, x)	((((x) >> (cond)) & 0xff) << 8)
>=20
> FIELD_GET FIELD_PREP

Ditto.

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

Yup, coccinelle should make that easy.

> > +out:
> > +	kfree(xfer);
>=20
> you can __free(kfree) xfer =3D NULL at declear to avoid this goto branch.

I'll give it a try...

> > +		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {
>=20
> Only pre fill fifo when len >4? what happen if only write 1 byte?

Ehrm, good catch. I will check this in more detail.

> > +			renesas_i3c_write_to_tx_fifo(i3c, cmd->tx_buf, cmd->len);
> > +			if (cmd->len > NTDTBP0_DEPTH * sizeof(u32))
> > +				i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> > +		}
> > +
> > +		renesas_i3c_enqueue_xfer(i3c, xfer);
> > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > +			renesas_i3c_dequeue_xfer(i3c, xfer);
>=20
> This may common problem, I3C spec have 100us timeout, target side may
> timeout when driver wait for irq. So target side treat "repeat start" as
> "start" and issue address arbitration.

There is a specified timeout? I couldn't find one in the specs, can you
kindly point me to it? So, the solution is to use 100us as timeout?

> > +	i3c->addrs[pos] =3D dev->info.dyn_addr ? : dev->info.static_addr;
>=20
> Are there extension of "?" operator in C ? I remember
>=20
> dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;

Dunno if it made it into the standard these days, but as a GCC extension
it is used in the kernel for ages. I encourage its use in I2C, other
maintainers don't like it much. Mileages vary.

> > +		if (ret) {
> > +			dev_err(&pdev->dev, "failed to request irq %s\n",
> > +				renesas_i3c_irqs[i].desc);
> > +			return ret;
>=20
> return dev_err_probe()

OK.

Thanks and happy hacking,

   Wolfram


--yXXD3/XiB3z76d/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhK6mIACgkQFA3kzBSg
KbY+5g//ZOGmbzxc9K/Y+AxcEBuHzmPhs+PEnKMGh/FeUmIXwx9liKzPa+aBpGRg
BUtqb+RLGK2kZ+fLjfo7PA86uWjCr2cEQFxiYJUm3aXDBwUiOvDU0Imml3TThz3o
PhmnY8Nr9sLpTj/k7MwwGxz284UEgya7TifCbgzU6A9yZ9DXRWxKj6eNDim9F0Bz
D42egYCA63Wsp8ZeFN7oUy2p9X8ymCwtG7DL0lIoe9U9lI1i836lQ73sIbDK6A+l
rJJzqhrrU4icVIeQpSWGZQrLJQ212Bs/EEbibMpo8WT6iopY4bpm4HRxNyxuZCNC
i2+KGqJjaIWQeCqamELyQk5xfI2C6LOoQzYWmEB33ldQfvron6SMEtIriaG9/OHj
YxzgkcNRIG/nDDVP8LVyluy7aUa6qkISMhrhyggp9sk/bnisp44IM272mhOkQsHQ
tI5MRzrlakhPSHNiAHcAjZtKHy58lm1wm9m7rBf3GRLhZ5SjGSyaphYesuJ70JXT
H4v0T/7DZu4IwqTT0QNZmKY8yTU1pxAUcGhCCrharTPexniAKWegX7mSen1q3kfP
s8gs9A+4meSsjsaKG2vAOw/Ovk4W09NgKMeNOU8V4dSgwhpc2UZ+S1LEXaJCB/Lo
u60gIZuHdAv/4GM28vLxHOZLSVz5xpQuyuO3PwB10gLjdBcwa1w=
=Hl8h
-----END PGP SIGNATURE-----

--yXXD3/XiB3z76d/C--

