Return-Path: <linux-renesas-soc+bounces-23161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAFBE436C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5941505B51
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE2E33A037;
	Thu, 16 Oct 2025 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDRi6ofF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85993469F1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628364; cv=none; b=XtylOpBbY52xFl+Kp+IYcTDTPrh1cfUu/K17eDaobXfNWvIcOp3zUqFKGOU51mWThj+ad9UYs17WXAewWuBTpunq1vata/OtL5hYYI3X1x9RPf0o22lyj6P5YLMIjYtuya55mN3l+evpyQA+NUz1qRF4vjL6lYH5b8LV5K/pT9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628364; c=relaxed/simple;
	bh=wM3DzxHSzsdJPxpS1qHX9kLtKFDt/p/Ag27wAKJy6z0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mj8uCnelc6Lmos1ZFTT9upwESvSqU3CsVkHJWa5drzcmGBYjR2D1bYxCN6OtRVNxCNrLBFbiO06//RDs+7hudU4uFN2IMLlEyuuwDiH102F8H5KLYaHOxDH3HQVPljHVlqvnuYlDFQmVX+EfTmnAUaHrVnr0lRWExt2H6RSgdlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDRi6ofF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471076f819bso7342815e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760628360; x=1761233160; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Liia8RsaOD9yQrd+3tJSK0OG/Nub4+LqqPt4624COE=;
        b=gDRi6ofF/WCdroRBEnqV66pkNSLWH8KGBw8vtboEDQU47+wyeq72f3ysEoMgXeV1tv
         5+DLMyrjEQYx+o3z/lBn4DoQQ9HCH/eDaU8ai+nO7M45LD7sLRXJTSvZ26Z4MPM1931D
         vOjr89DbJmwXloz2mo30Z60ENA9eKGWyLHeUCG9VUTSpvc4ZA2X+cZkB120G1LkCJPep
         Ziw7dKGMT+23ZX8P4VkDLOFxx/uaIs93X4iJokiumkck2/LDQdwNvUZxINWs0YF7c25V
         1IgDNwipz1UNz/6DfHf0cInngAvIN/U2hQenT03RrUWMzjPCKaesRInuLauPCinw98vi
         JXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760628360; x=1761233160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Liia8RsaOD9yQrd+3tJSK0OG/Nub4+LqqPt4624COE=;
        b=SdZ2z/9wNRLOSgGONjBYVHxx0uVRhnQHvTkOFXcS+wMoS3m6RSN5rur5AxYK6A2X9B
         RzO1spFbSsSFvasx1n7pkaD/Af/Y56MB1dSSFbuTEmMYv1KfN5Co+7gQXzWEHicy7QA+
         pKcU1UaUe1nJ3o3KRoYvDCc/xWBZppoe0qhobPq90rg5wl4ann4VFYEqY4cv6iYFUz5U
         iPq3gfm9O6JO+fK6Cc4MFgdVvCTRg24PM7TUmo87JlB3HN8RT+rs4T1Jv6UUFCyWuRxy
         323/HfeJBZ/+f03VfjtZKh9Ns9dX9OotN0bDQLU1Grm0Qd2T22W/fMKRtWR9IsDnRBOw
         XdZw==
X-Forwarded-Encrypted: i=1; AJvYcCUNu7m9yk+c0CqnbnpUprODdbGgwYkCTZzPICOV5TT7lX0DCbPDdvt0pN01jFp79LnYQrAF9+MpKRmxydHE15vfqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykIHwtQWLpzYAcN16+lGH8kIFEvMJWTAz2yxyLIYqEmNlaL8/1
	8kj7tZnrf+2LcMUYF9L2AJf8AEwA3B+Y8ZF0O9plEu3I5y5Dz9TRZJ+N
X-Gm-Gg: ASbGncteS+5mu49p30AXlTQ5ZqmF9oyj4oM5i2KoMGBl9a3oJo4XHxmQoCzv5PQtqEW
	AeA8ylkfqsUm9JhScqn3VFjQz5Ka9uCC3qGATj3K3NL6HqmThZO/bJVKFi8IeND4a/7/i8zd4H1
	wmNNFyMsTtcccIuIWGniZSfrVRER6YVKV7l4WiroXvZxRzon/p8SHPwB11yVFH+RRJ29dDS0MQx
	pDTaHklAxFvDPrO07LdZ7EVIodWHVmLF90Lr5ryY3OF9ef1deNJsMEOHCvc21k6Hf+lRiwKK57V
	8nLakYLobjj4kPw1zfMn4vJsRpLzVT+jpCW5WMPN6KtJE+708PsUeMWvcfpVPSyXGZl+zpwbmDj
	pjLCuqNpTYfaC1RyD6B2uft3GiCEHFi+6buCu/aiY+b4ps9jhMrZ48tPZrz6RsYxbfSX5ohZ42v
	e/COYgZr+d
X-Google-Smtp-Source: AGHT+IGTg5CjF8+LxlH7KHK7krh6vjgKUIW8blkrBwnz+QKj01kT0jC/CqAAbFsClWPGaKXE1epkCQ==
X-Received: by 2002:a05:600c:444d:b0:46e:1f86:aeba with SMTP id 5b1f17b1804b1-471178ad982mr3015155e9.17.1760628356645;
        Thu, 16 Oct 2025 08:25:56 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e10e8sm35438907f8f.39.2025.10.16.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:25:56 -0700 (PDT)
Message-ID: <d7576a0bb9a8d5326d77ae434131540b4359bd2a.camel@gmail.com>
Subject: Re: [PATCH 2/4] iio: adc: Add support for the Renesas RZ/N1 ADC
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jonathan Cameron	
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown	
 <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Oct 2025 16:26:28 +0100
In-Reply-To: <20251016160202.3d4d0a5e@bootlin.com>
References: <20251015142816.1274605-1-herve.codina@bootlin.com>
		<20251015142816.1274605-3-herve.codina@bootlin.com>
		<1e8d7c96cdfaa93bcc0f581103dc0e13dfee17b7.camel@gmail.com>
		<20251015211420.031c61fa@bootlin.com>
		<de57f5274b2fe0aac3621dc10cb6d4d0d98d3063.camel@gmail.com>
	 <20251016160202.3d4d0a5e@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-10-16 at 16:02 +0200, Herve Codina wrote:
> Hi Nuno,
>=20
> On Thu, 16 Oct 2025 10:24:36 +0100
> Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
>=20
> > On Wed, 2025-10-15 at 21:14 +0200, Herve Codina wrote:
> > > Hi Nuno,
> > >=20
> > > On Wed, 15 Oct 2025 16:21:09 +0100
> > > Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> > >=20
> > > ...=C2=A0=20
> > > > =C2=A0=20
> > > > > +static int rzn1_adc_enable(struct rzn1_adc *rzn1_adc)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret =3D rzn1_adc_core_power_on(&rzn1_adc->adc_core[0]);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret =3D rzn1_adc_core_power_on(&rzn1_adc->adc_core[1]);
> > > > > +	if (ret)
> > > > > +		goto poweroff_adc_core0;
> > > > > +
> > > > > +	ret =3D clk_prepare_enable(rzn1_adc->pclk);
> > > > > +	if (ret)
> > > > > +		goto poweroff_adc_core1;
> > > > > +
> > > > > +	ret =3D clk_prepare_enable(rzn1_adc->adc_clk);
> > > > > +	if (ret)
> > > > > +		goto disable_pclk;
> > > > > +
> > > > > +	ret =3D rzn1_adc_power(rzn1_adc, true);
> > > > > +	if (ret)
> > > > > +		goto disable_adc_clk;=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > Can we use devm_actions() on the above to avoid the complex error p=
ath
> > > > plus
> > > > the
> > > > .remove() callback?=C2=A0=20
> > >=20
> > > rzn1_adc_enable() is used by the driver pm_runtime_resume() function.
> > >=20
> > > I don't think that devm_add_actions_or_reset() will help here.
> > >=20
> > > In my understanding, devm_* functions are use to perform some operati=
ons
> > > automatically on device removal.
> > >=20
> > > The purpose of the error path here is to restore a correct state if
> > > rzn1_adc_enable() failed when it is called from pm_runtime_resume().
> > >=20
> > > In that case no device removal is involved to trig any action set by
> > > devm_add_actions_or_reset().
> > >=20
> > > Maybe I am wrong. Did I miss something?=C2=A0=20
> >=20
> > Nope, I see now what's your intent.
>=20
> Ok, no change planned for the next iteration related to this error path.
>=20
> >=20
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +disable_adc_clk:
> > > > > +	clk_disable_unprepare(rzn1_adc->adc_clk);
> > > > > +disable_pclk:
> > > > > +	clk_disable_unprepare(rzn1_adc->pclk);
> > > > > +poweroff_adc_core1:
> > > > > +	rzn1_adc_core_power_off(&rzn1_adc->adc_core[1]);
> > > > > +poweroff_adc_core0:
> > > > > +	rzn1_adc_core_power_off(&rzn1_adc->adc_core[0]);
> > > > > +	return ret;
> > > > > +}
> > > > > +=C2=A0=20
> > >=20
> > > ...
> > > =C2=A0=20
> > > > > +static int rzn1_adc_set_iio_dev_channels(struct rzn1_adc *rzn1_a=
dc,
> > > > > +					 struct iio_dev *indio_dev)
> > > > > +{
> > > > > +	int adc_used;
> > > > > +
> > > > > +	adc_used =3D rzn1_adc->adc_core[0].is_used ? 0x01 : 0x00;
> > > > > +	adc_used |=3D rzn1_adc->adc_core[1].is_used ? 0x02 : 0x00;
> > > > > +
> > > > > +	switch (adc_used) {
> > > > > +	case 0x01:
> > > > > +		indio_dev->channels =3D rzn1_adc1_channels;
> > > > > +		indio_dev->num_channels =3D
> > > > > ARRAY_SIZE(rzn1_adc1_channels);
> > > > > +		return 0;
> > > > > +	case 0x02:
> > > > > +		indio_dev->channels =3D rzn1_adc2_channels;
> > > > > +		indio_dev->num_channels =3D
> > > > > ARRAY_SIZE(rzn1_adc2_channels);
> > > > > +		return 0;
> > > > > +	case 0x03:
> > > > > +		indio_dev->channels =3D rzn1_adc1_adc2_channels;
> > > > > +		indio_dev->num_channels =3D
> > > > > ARRAY_SIZE(rzn1_adc1_adc2_channels);
> > > > > +		return 0;
> > > > > +	default:
> > > > > +		break;
> > > > > +	}
> > > > > +
> > > > > +	dev_err(rzn1_adc->dev, "Failed to set IIO channels, no ADC
> > > > > core
> > > > > used\n");
> > > > > +	return -ENODEV;=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > dev_err_probe()?=C2=A0=20
> > >=20
> > > Why? the error returned is a well known value: -ENODEV.
> > >=20
> > > dev_err_probe() should be involved when -EPROBE_DEFER is a potential =
error
> > > code.
> > >=20
> > > IMHO, dev_err() here is correct.=C2=A0=20
> >=20
> > If I'm not missing nothing this function is called during probe so I do
> > think
> > dev_err_probe() should be used. Not only unifies logging style during p=
robe
> > it
> > also has the small benefit of doing:
> >=20
> > return dev_err_probe(...) saving a line of code.
> >=20
> > You can see that, at least in IIO, we even have some patches just conve=
rting
> > drivers probe() to use dev_err_probe().
>=20
> Right, I will use dev_err_probe() in the next iteration.
>=20
> >=20
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > > +}
> > > > > +
> > > > > +static int rzn1_adc_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct device *dev =3D &pdev->dev;
> > > > > +	struct iio_dev *indio_dev;
> > > > > +	struct rzn1_adc *rzn1_adc;
> > > > > +	int ret;
> > > > > +
> > > > > +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*rzn1_adc));
> > > > > +	if (!indio_dev)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	rzn1_adc =3D iio_priv(indio_dev);
> > > > > +	rzn1_adc->dev =3D dev;
> > > > > +	mutex_init(&rzn1_adc->lock);=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > devm_mutex_init()=C2=A0=20
> > >=20
> > > Yes, I will update in the next iteration.
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > > +
> > > > > +	rzn1_adc->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > > > +	if (IS_ERR(rzn1_adc->regs))
> > > > > +		return PTR_ERR(rzn1_adc->regs);
> > > > > +
> > > > > +	rzn1_adc->pclk =3D devm_clk_get(dev, "pclk");
> > > > > +	if (IS_ERR(rzn1_adc->pclk))
> > > > > +		return dev_err_probe(dev, PTR_ERR(rzn1_adc->pclk),
> > > > > "Failed to
> > > > > get pclk\n");
> > > > > +
> > > > > +	rzn1_adc->adc_clk =3D devm_clk_get(dev, "adc-clk");
> > > > > +	if (IS_ERR(rzn1_adc->pclk))
> > > > > +		return dev_err_probe(dev, PTR_ERR(rzn1_adc->pclk),
> > > > > "Failed to
> > > > > get adc-clk\n");
> > > > > +
> > > > > +	ret =3D rzn1_adc_core_get_regulators(rzn1_adc, &rzn1_adc-=C2=A0=
=20
> > > > > > adc_core[0],=C2=A0=20
> > > > > +					=C2=A0=C2=A0 "adc1-avdd", "adc1-vref");
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret =3D rzn1_adc_core_get_regulators(rzn1_adc, &rzn1_adc-=C2=A0=
=20
> > > > > > adc_core[1],=C2=A0=20
> > > > > +					=C2=A0=C2=A0 "adc2-avdd", "adc2-vref");
> > > > > +	if (ret)
> > > > > +		return ret;=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > Hmm, is avdd really an optional regulator? I mean can the ADC power=
 up
> > > > at
> > > > all
> > > > without a supply in AVDD? Even vref seems to be mandatory as we can=
't
> > > > properly
> > > > scale the sample without it.=C2=A0=20
> > >=20
> > > Where do you see that avdd is an optional regulator?=C2=A0=20
> >=20
> > You are using devm_regulator_get_optional(). That's for optional regula=
tors.
> >=20
>=20
> Indeed I use devm_regulator_get_optional().
>=20
> We have two similar function to get regulators:
> - devm_regulator_get() and
> - devm_regulator_get_optional().
>=20
> devm_regulator_get() returns a dummy regulator if the regulator is not
> described in the device-tree. The calling code has no way to known if
> the regulator was present or not.

Yeah because it's mandatory and the part cannot work without power :). So w=
e
should not be allowed to operate without a regulator.

>=20
> On the other hand, devm_regulator_get_optional() returns -ENODEV when the
> regulator is not described.
>=20
> That's pretty confusing but it is the reality.
>=20
> I use devm_regulator_get_optional() but check for -ENODEV to see if the
> regulator is provided or not.
>=20
> In order to use the ADC core (is_used flag), I need both the AVDD and the
> VREF regulator available.

And that is why I don't get why are we allowed to proceed if there's no
regulators? That seems wrong to me.=C2=A0

So I think the regulators should be mandatory in the bindings and a dummy
regulator should also not be allowed in this case because that should get y=
ou=C2=A0
-EINVAL when calling regulator_get_voltage().

>=20
> > > =C2=A0=20
> > > >=20
> > > > Also, can't we have getting and enabling the regulator together? Th=
en,
> > > > we
> > > > could
> > > > use some of the modern helpers to simplify the code (ok I see you u=
se
> > > > them
> > > > in
> > > > the PM callbacks).=C2=A0=20
> > >=20
> > > Yes, I rely on PM callbacks to handle those regulators.
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > > +
> > > > > +	platform_set_drvdata(pdev, indio_dev);
> > > > > +
> > > > > +	indio_dev->name =3D dev_name(dev);=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > dev_name() should not be used for the above. It's typically the par=
t
> > > > name so
> > > > I
> > > > guess in here "rzn1-adc" would be the appropriate one.=C2=A0=20
> > >=20
> > > I thought it was more related to the instance and so having a differe=
nt
> > > name
> > > for each instance was better.
> > >=20
> > > Some other IIO drivers use dev_name() here.
> > >=20
> > > But well, if you confirm that a fixed string should be used and so al=
l
> > > instances have the same string, no problem, I will update my indio_de=
v-
> > > >name.=C2=A0=20
> >=20
> > It is a fixed string, typically the part name. David Lechner not that l=
ong
> > ago
> > actually sent some patch or documented somewhere why not to use dev_nam=
e().
> > To
> > identify different instances we have a 'label' property.
>=20
> Right, I will set indio_dev->name to the "rzn1-adc" fixed string.
>=20
> >=20
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > > +	indio_dev->info =3D &rzn1_adc_info;
> > > > > +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> > > > > +	ret =3D rzn1_adc_set_iio_dev_channels(rzn1_adc, indio_dev);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret =3D rzn1_adc_enable(rzn1_adc);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	pm_runtime_set_autosuspend_delay(dev, 500);
> > > > > +	pm_runtime_use_autosuspend(dev);
> > > > > +	pm_runtime_get_noresume(dev);
> > > > > +	pm_runtime_set_active(dev);
> > > > > +	pm_runtime_enable(dev);=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > There's a devm_pm_runtime_enable() API now.=C2=A0=20
> > >=20
> > > Will look to use it in the next iteration.
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > > +
> > > > > +	ret =3D devm_iio_device_register(dev, indio_dev);
> > > > > +	if (ret)
> > > > > +		goto disable;
> > > > > +
> > > > > +	pm_runtime_mark_last_busy(dev);
> > > > > +	pm_runtime_put_autosuspend(dev);
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +disable:
> > > > > +	pm_runtime_disable(dev);
> > > > > +	pm_runtime_put_noidle(dev);
> > > > > +	pm_runtime_set_suspended(dev);
> > > > > +	pm_runtime_dont_use_autosuspend(dev);
> > > > > +
> > > > > +	rzn1_adc_disable(rzn1_adc);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static void rzn1_adc_remove(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
> > > > > +	struct rzn1_adc *rzn1_adc =3D iio_priv(indio_dev);
> > > > > +
> > > > > +	pm_runtime_disable(rzn1_adc->dev);
> > > > > +	pm_runtime_set_suspended(rzn1_adc->dev);
> > > > > +	pm_runtime_dont_use_autosuspend(rzn1_adc->dev);
> > > > > +
> > > > > +	rzn1_adc_disable(rzn1_adc);
> > > > > +}=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > I'm fairly confident we can sanely go without .remove().=C2=A0=20
> > >=20
> > > Will see what I can be do for the next iteration.
> > >=20
> > > Maybe I will ask some questions if I need some clarification around
> > > pm_runtime but let me first try to go further in that direction.=C2=
=A0=20
> >=20
> > Yeah, maybe you can come up with something but given how you use pm to
> > enable/disable stuff I'm also not sure the above is easily doable.
> >=20
>=20
> Hum, do you think it's worth a try?

Not sure. But it got me thinking about all this handling in the pm runtime
routines. So if in the resume() call you fail at some point and then disabl=
e
stuff in your return path and then we get an unbind won't things (clocks an=
d
regulators) be unbalanced leading to splats? In fact by just looking at the
unbind path [1] I can see:

1. We call pm_runtime_get_sync(dev) which can fail;
2. Later on we call pm_runtime_put_sync(dev).

Not really sure if there's special handling in the pm core to be aware that
resuming failed (the refcount seems to be incremented [2] before resuming s=
o...)

Maybe I would keep it simple and get and enable clocks/regulators during pr=
obe
and only care of rzn1_adc_power() in the runtime routines. My 2 cents.

[1]: https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/dd.c#L124=
9
[2]: https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/power/run=
time.c#L1189

- Nuno S=C3=A1

