Return-Path: <linux-renesas-soc+bounces-16798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F01AAF672
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 11:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5B804681B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116222571D7;
	Thu,  8 May 2025 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvQswoa1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104412641C6;
	Thu,  8 May 2025 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695581; cv=none; b=Tw0AVPm+FDq5fCQMgjY/+gtNiFsuyXcaAM91evTMg324K9NDIZ0rn5SANJbenuWAZGS9q7G+E3PiH6PwFr7WUG/WzStgh86DrUl/YCHViL2OyZXzObHhA8/ClrCEu43rqTua1NYgdjFi6GMsLdh9r51/F7oVIvLEonSG9kGbl+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695581; c=relaxed/simple;
	bh=DjPPqyZ7pZEMb9GjAxxw2AsCbyg+yLeGxWgwbDjBbk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PukKkfZpl9T9UZ/hwZjjIfGNTy6eSHUnEqbF6fBuMUcu3W8OHDndCh1ru56PAdXUPd6TFeVhuH27FGTNQp64ZBKaddlut1LojJ8McxJ5MM/T1vb4JhveGf2C6e8DpEbccOJSEdeHeYee3+ix3eXQv6AkCGho30/ePtBgsGyjPBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvQswoa1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so1373363a12.1;
        Thu, 08 May 2025 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695577; x=1747300377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dp1vstYqz3mDBq4CkJf4LU45gaqxJrhVS+uXqNfvYk=;
        b=OvQswoa1iGqnb1YIIFIsDjS13m14QCu11j7TQrY0Hpo7zmhT+nmZo2JjdGuhA6uad8
         o/MQJbDFy8DV7bch/BqTlrvL0nR/OJ9xEpy4xRG733liwyKVBse/+/gBpt0T1OVp3wC0
         BrqgFLgJaymFjHd5r3qw78n3ikNiyg5gEnchDo9DmUfG/8OWvEg/hTmlUcCPMmUZXD1r
         ooORxUySAMVJQbzRmkn6XxeUDLDA98HvS1KgN5HSHYZ8AP4r1kSwrT6fmspRIxWhnOXt
         9cYw+E8p/IPYZN77qkKDrLJ89Er8UFGI3At8CPd7yzXqg4T4BtEja7hGBRnFTDgeVLPd
         OUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695577; x=1747300377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dp1vstYqz3mDBq4CkJf4LU45gaqxJrhVS+uXqNfvYk=;
        b=W+Z8CfVQw8BBboR8eHyGNQtkFNIus6COl2Sm5ROXK7phV0GYrYVMZKz9jRl1MMxj59
         w1Wc2zEt3q7xCYnS4imt9xX1JJKpowL7UB7Lg24idd58GYCLVZe0CMrzPigq6jrprp+Y
         +chyBGOn19pucMNcGKuu+eOu5Z2CHjP6/3TC5T36KFRjXQtmXqI7/sFXM58/5Kx/FK++
         EOlUt+Abrty9KqkAg2Rn40cAdZPNsT7/DEndAWJhkhik165c5KC7EAxN4IJd9Udo8JEg
         c9Xx+scD5hjEaXJIvejy3squsJMJl6PndQUg503xKdsn8HREH21Lnk040cThPPMYUges
         VvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa97466N6AJ2SZBl/t6wa9sNRmeivUSln+mho9S1AIFoveCzO8NYLON+VgnZxCvlwMXgbJHg+mP4CF+DHJyRjxvw==@vger.kernel.org, AJvYcCUr5GC3vYbC0UuCwkbnsl+xuv5N93d6vvx4Lm7xt5Fjfvt52vJjaHbWbGu6JWEyHPBhrL1W2F5WhqIqj90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQx5cpnNp1CCS1nL6rcTr5u/2ydGrYPdh0QsuuSX1G9qzzQWho
	/D5N4Hm+/3e4ETo2qNoM6LPxjfGoz3eSJSFEr9oDsDE0LHtqWC4a
X-Gm-Gg: ASbGncsGFNB0IwSsDPfVbR443gNytGjRj0WLd1UHdIsh/KoIKOrOPyu+BNaIDO89aAG
	RdKWNyV4UO2zBrm+lGomO8dG61bI47xKIz4ADW1+rxAmVCew5WAycaf/m1RBFB5fyIzOZcrt1G3
	ohz/aM4ms6o5Wv7C1YXeT17jBMNUma/DQzc2czquznOgrpulTBRV9x65Od/2rJRPPo4may+2SLJ
	oIhE4Dh2tNEsEDYTydS1ZW2DsKhGMN7PnoM/owpr83O7ysMYpv8dpgWCUgw8SP+TW+56+ZvAP7Q
	lNRbMyhTSBSoaHc6B68UxcHhxCBu0DL0h3TM6Gkttkof+7Jz4riAzEXfgD5kVCQCsSXWuYHuhd1
	3I93fypuoBhEZ7uDb4rwHjD7vmLc=
X-Google-Smtp-Source: AGHT+IGKlsVS9Aggzopar0EguhK232leccJ6N51EzyZlx36/ZSXJN9uVC7qPM4dsor1ubnH6vieEUw==
X-Received: by 2002:a05:6402:2809:b0:5fc:348a:e21 with SMTP id 4fb4d7f45d1cf-5fc348a34a1mr2057037a12.31.1746695577114;
        Thu, 08 May 2025 02:12:57 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbb4ceb417sm3893637a12.60.2025.05.08.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:12:55 -0700 (PDT)
Date: Thu, 8 May 2025 11:12:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Terje Bergstrom <tbergstrom@nvidia.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Message-ID: <lqbli5eryxnl52bvncg543zkqqbteheixhcb4nmxljx6nozhay@nli5n47oelft>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
 <a3gzox3ajhvatfmld5ny2lulmp325ycnukksusfbtldg37nqp3@jb4qajtuzczb>
 <TY3PR01MB11346CB37650B2F888CFC6DE48688A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="72qnzxkycxla5eor"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346CB37650B2F888CFC6DE48688A@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--72qnzxkycxla5eor
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
MIME-Version: 1.0

On Wed, May 07, 2025 at 04:10:07PM +0000, Biju Das wrote:
> Hi Thierry,
>=20
> > -----Original Message-----
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Sent: 07 May 2025 17:00
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
> >=20
> > On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> > > The of_get_child_by_name() increments the refcount in
> > > tegra_dc_rgb_probe, but the driver does not decrement the refcount
> > > during unbind. Fix the unbound reference count using devm_add_action_=
or_reset() helper.
> > >
> > > Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > > index 1e8ec50b759e..2065157daab3 100644
> > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > @@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs teg=
ra_rgb_encoder_helper_funcs =3D {
> > >  	.atomic_check =3D tegra_rgb_encoder_atomic_check,  };
> > >
> > > +static void tegra_dc_of_node_put(void *data) {
> > > +	of_node_put(data);
> > > +}
> > > +
> > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > >  	struct device_node *np;
> > > @@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
> > >  	int err;
> > >
> > >  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > -	if (!np || !of_device_is_available(np))
> > > +	if (!np)
> > > +		return -ENODEV;
> > > +
> > > +	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put,
> > > +dc->dev);
> >=20
> > Actually, I think this needs to be:
> >=20
> >   err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, np);
> >=20
> > otherwise tegra_dc_of_node_put() would attempt to call of_node_put() on
> > dc->dev, which won't work, or rather cause corruption of some sort.
> >=20
> > Shout if you disagree.
>=20
> I agree, is it something you can do while applying or you want me to send=
 v2?
> Please let me know.

It's already done, thanks for confirming and for the patch.

Thierry

--72qnzxkycxla5eor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcdZYACgkQ3SOs138+
s6EIghAAnYd6socF/Wj9gjVWp0eaVoJqHClj8WN/mrPAskJ39aZVMYsTi+Vt7DmK
Kz6RHFBCvGL465K9DenItSWa7+wSqz7SrxLAT4pc5PpHRs1AlSeY9aeBhCMMQ/Sd
ivx+3ycn1MjeYyRxmRfUzNFtv4q8K9A9AAyuhg5fI/lLZuMBwnV43d6/iYygNW7C
VQ6Jl/LV7gphu4pxvPJwnyOyfOS9P7vsC9a0lssMxWMJ39oJH/WuvgX+CpYsyDLU
+BhyfQcfjD4GG5fHTcQia5IUutt3MnGYPpsRL9A6ZmxGGkHjCU9T1l8G1kADAoCz
xeDg0QEs0ycWCKCU7XeaOc6AlQYyJg7wZQmRa1+yqQ8a9WkrlXd+K/gTu5nlJ2yG
JCEIkPRCjfKKsGDP+nmH9zOsVWgGeRHSpN0i75aF5a0n4PMV3NvRRRLjBMwONnX2
E1iBcnmXuoOL+sr+vDPS00eUqI/F0Yzl7CUmIiotK1tg+58A075aYZn1WXOePIq+
+2WTTWm/QOe9iFQxW0mjNXP0DlBM7AWHqgLD4xMfChJGMBnjbMHGoCCdXJlZTgeR
VSW/SWviIpAriG2wrUEukq6khinVZRmLHVfo6cTTAnk6RvRrPTGrr3vOy1Kt1y/f
IG/+dLxsyPVHT9Ju9LFx2mssmO/Ky5lGUe6hN5mnGSObk8+WvY0=
=1Kba
-----END PGP SIGNATURE-----

--72qnzxkycxla5eor--

