Return-Path: <linux-renesas-soc+bounces-7746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E521894899F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Aug 2024 08:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11DB283641
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Aug 2024 06:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6301BB683;
	Tue,  6 Aug 2024 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XQF+Sc69"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D87C15B147
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Aug 2024 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722927136; cv=none; b=h1KLbOhMooxPF73n8LCmOQqX8WkEyp0rpQqeBXDwd047pEkEnxBKbvKPEst60YlioCRQORLDevDARG1n3BtUmP7yEE8PekA1Sf09/jN3InOcZqstNpoR22g5icV9tAhGPci3HYAf7b9IMyV/ijcPCUUdq2YBH3E9fMIouPw4qrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722927136; c=relaxed/simple;
	bh=D9XqZQARqCzQOl68K5eZRuL3e7N0zkJw18CQL7UqBmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF7EhZT/SHkjH7GHBcdG/f/7Ne0k3Vapj3BEgTH7hu+osezLhsQZK4dFriUFTyQrGZioBHRDsampxpm6JpTNNtb/hc+Sjb1UF4MUWjsb83rnY4VXqPOhbW55s/400o+XwF5dA95KfmmnpaTbi64AgapA2uDSXn9fwiDquD/rfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XQF+Sc69; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so4658261fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2024 23:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722927130; x=1723531930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pec/rzYJgkswvqsBMDntgFTvEZXHVCpGb1d7urlRnHw=;
        b=XQF+Sc69gvhz1xCQ+sJAlG4vPYIgljbSwDLUxprCuCE568b0deiuPm2nEAEozCkDmq
         8acYC9QexWzjt4Mtmx4J5z60iTbYzAiahEKgu09blGqOLQkvOcZUlDl2bFgHNs54smWU
         dWLbmHYVhh4d9ToFqODfCn+xTdqWQrJfNFGdySfzAXCVYIZ1jcaOThq1yLLmGycAwR6L
         KSAMnaimqEfnQviE4zdNPtTq3uBI4Qth+rO0Mgc0S4RcVhRx8HvjoGYBY2oh9JjfCSKm
         7yRMyp7fCt0/zlGoaQpB+++zuoSysz4uXMlwCtuBdyIlz5lZ4C2DOLhOSpS8mkZ2Coaw
         lMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722927130; x=1723531930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pec/rzYJgkswvqsBMDntgFTvEZXHVCpGb1d7urlRnHw=;
        b=b8R+NpiS7rBsNPgBjgt3ah00Aau8UQmZiy6t450JvnCkT1eU+EFaFmH+m1AVV7ZXrs
         VG46X8lNCXku7A0BigU5oJsr+4C3XIzvn0u2lYV1V+O164PtbO192pahQEhVsFMu+41M
         kJpW+02yCXFWkhqdOaneNJv1lKBRiuw9vV0Vl+kGZDaSHMeyrA0mddYcJ5jVNIDB7fSS
         hbY3cM4uXh1Teny4+tyYMeVtxuzCYbAjp4FF0ia7B/b97XHSNJDCgkmsheItkO87jm8k
         /VS4s9+frwBih5C5Tb+mzJUNJx1mP88D3WWexXtOP/aUeDxkn7KTFJBamiwafDdFUODy
         aw5g==
X-Forwarded-Encrypted: i=1; AJvYcCXyb9aj5H0HySwTQRGpElY8B6Q5+AaLELVrPn6bh+qrtWPkGG7Wy/AYOaot+e0NVCrft6I++uHRZGsr1konJtkeFNpOdmlD5LO1CkCpNNoBpT0=
X-Gm-Message-State: AOJu0YwZ94/co5QyTFxDTKmVRA8wnEBup0MZfk+3UUR7DPvFr1ahZvDi
	ucAtmtKPNU8A2W4U6hmfR/5frq14JlpX0ITduETU1F9ym2WGk+f6cJMBBksJwAwnbw46kn809Eb
	6
X-Google-Smtp-Source: AGHT+IEVEvnGA+E0cbwV1rIVm07SFbjc+evQoaJIBgBaqQt/HrLzON8OgRNK27gxpCGGMHjlXlwK4g==
X-Received: by 2002:a05:600c:35c2:b0:427:9dad:17df with SMTP id 5b1f17b1804b1-428e6b07b0dmr87916995e9.12.1722926799616;
        Mon, 05 Aug 2024 23:46:39 -0700 (PDT)
Received: from localhost ([193.196.194.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428fe2492fesm10678595e9.0.2024.08.05.23.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 23:46:39 -0700 (PDT)
Date: Tue, 6 Aug 2024 08:46:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v20 3/4] pwm: Add support for RZ/G2L GPT
Message-ID: <cbgy643dk54zx2l6px7oe6vgqc6swihymmcyjrtcorflgi5t3l@aqnd5byiqwt6>
References: <20240614154242.419043-1-biju.das.jz@bp.renesas.com>
 <20240614154242.419043-4-biju.das.jz@bp.renesas.com>
 <yli3bq6i2467mzdtwkn3czls4w2snvegkzyun3uq4lto35wuhv@2wcju755otau>
 <TY3PR01MB11346D2E29B1A8E4F71EFF15E86B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akv2cxbtwbbngmrq"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346D2E29B1A8E4F71EFF15E86B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--akv2cxbtwbbngmrq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Biju,

On Fri, Aug 02, 2024 at 07:02:19AM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > Sent: Tuesday, July 30, 2024 8:54 PM
> > Subject: Re: [PATCH v20 3/4] pwm: Add support for RZ/G2L GPT
> >=20
> > Hello,
> >=20
> > I'm a bit unlucky about this driver. I have the impression it is compli=
cated and wonder if that is
> > necessary because the hardware is unusual or if we just have to spot so=
me simplifications.
>=20
> I agree it is little bit complex driver. Once this driver is accepted, go=
ing forward, I need to support
> other drivers like (Counter , ADC triggering and POEG(Output disable) sup=
port).
>=20
> > I guess another problem is that the time between two consecutive review=
s is long and I forget most
> > things I learned about the hardware from one to the other. While this i=
s mostly my problem, the same
> > problem arises if the driver is touched later again. So I wonder if som=
e more documentation is needed
> > about the relation between channels and outputs and subchannels. If the=
 driver only supported one
> > output per channel, it could be considerably simpler (I think). But I g=
uess that would be a
> > practically relevant restriction??
>=20
> Yes, one output per channel means, we cannot use POEG IP which is for sho=
rt circuit protection in
> switching circuits.  So, we need to use both IOs in the channel.=20
>=20
> I will add the below documentation to make it clear.
>=20
> * - General PWM Timer (GPT) has 8 HW channels for PWM operations and
> *   each HW channel have 2 IOs.
> * - Each IO is modelled as an independent PWM channel.
>=20
> Please let me know is it ok with respect to the initial driver?

looks fine.

> > Some simplifications spotted below.
> >=20
> > On Fri, Jun 14, 2024 at 04:42:41PM +0100, Biju Das wrote:
> > > RZ/G2L General PWM Timer (GPT) composed of 8 channels with 32-bit
> > > timer (GPT32E). It supports the following functions
> > >  * 32 bits x 8 channels
> > >  * Up-counting or down-counting (saw waves) or up/down-counting
> > >    (triangle waves) for each counter.
> > >  * Clock sources independently selectable for each channel
> > >  * Two I/O pins per channel
> > >  * Two output compare/input capture registers per channel
> > >  * For the two output compare/input capture registers of each channel,
> > >    four registers are provided as buffer registers and are capable of
> > >    operating as comparison registers when buffering is not in use.
> > >  * In output compare operation, buffer switching can be at crests or
> > >    troughs, enabling the generation of laterally asymmetric PWM wavef=
orms.
> > >  * Registers for setting up frame cycles in each channel (with capabi=
lity
> > >    for generating interrupts at overflow or underflow)
> > >  * Generation of dead times in PWM operation
> > >  * Synchronous starting, stopping and clearing counters for arbitrary
> > >    channels
> > >  * Starting, stopping, clearing and up/down counters in response to i=
nput
> > >    level comparison
> > >  * Starting, clearing, stopping and up/down counters in response to a
> > >    maximum of four external triggers
> > >  * Output pin disable function by dead time error and detected
> > >    short-circuits between output pins
> > >  * A/D converter start triggers can be generated (GPT32E0 to GPT32E3)
> > >  * Enables the noise filter for input capture and external trigger
> > >    operation
> > >
> > > Add basic pwm support for RZ/G2L GPT driver by creating separate
> > > logical channels for each IOs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v19->v20:
> > >  * Added locks for rmw operations in rzg2l_gpt_{en,dis}able().
> > >  * Dropped decremeng enable_count based ch_en_bits in rzg2l_gpt_disab=
le().
> > >  * Added a comment in calculate_period_or_duty() related to overflow.
> > >  * Replaced ch_en_bits->bootloader_enabled_channels and used this var=
iable
> > >    in probe(), apply() and remove() for simplification
> > >  * Replaced pm_runtime_enable()->devm_pm_runtime_enable()
> > > [...]
> > > ---
> > >  drivers/pwm/Kconfig         |  11 +
> > >  drivers/pwm/Makefile        |   1 +
> > >  drivers/pwm/pwm-rzg2l-gpt.c | 555
> > > ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 567 insertions(+)
> > >  create mode 100644 drivers/pwm/pwm-rzg2l-gpt.c
> > >
> > > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig index
> > > 00a543de8f82..3d398b308e3f 100644
> > > --- a/drivers/pwm/Kconfig
> > > +++ b/drivers/pwm/Kconfig
> > > @@ -522,6 +522,17 @@ config PWM_ROCKCHIP
> > >  	  Generic PWM framework driver for the PWM controller found on
> > >  	  Rockchip SoCs.
> > >
> > > +config PWM_RZG2L_GPT
> > > +	tristate "Renesas RZ/G2L General PWM Timer support"
> > > +	depends on ARCH_RZG2L || COMPILE_TEST
> > > +	depends on HAS_IOMEM
> > > +	help
> > > +	  This driver exposes the General PWM Timer controller found in Ren=
esas
> > > +	  RZ/G2L like chips through the PWM API.
> > > +
> > > +	  To compile this driver as a module, choose M here: the module
> > > +	  will be called pwm-rzg2l-gpt.
> > > +
> > >  config PWM_RZ_MTU3
> > >  	tristate "Renesas RZ/G2L MTU3a PWM Timer support"
> > >  	depends on RZ_MTU3
> > > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile index
> > > 6964ba45c795..fb9a2d9b9adb 100644
> > > --- a/drivers/pwm/Makefile
> > > +++ b/drivers/pwm/Makefile
> > > @@ -47,6 +47,7 @@ obj-$(CONFIG_PWM_RASPBERRYPI_POE)	+=3D pwm-raspberr=
ypi-poe.o
> > >  obj-$(CONFIG_PWM_RCAR)		+=3D pwm-rcar.o
> > >  obj-$(CONFIG_PWM_RENESAS_TPU)	+=3D pwm-renesas-tpu.o
> > >  obj-$(CONFIG_PWM_ROCKCHIP)	+=3D pwm-rockchip.o
> > > +obj-$(CONFIG_PWM_RZG2L_GPT)	+=3D pwm-rzg2l-gpt.o
> > >  obj-$(CONFIG_PWM_RZ_MTU3)	+=3D pwm-rz-mtu3.o
> > >  obj-$(CONFIG_PWM_SAMSUNG)	+=3D pwm-samsung.o
> > >  obj-$(CONFIG_PWM_SIFIVE)	+=3D pwm-sifive.o
> > > diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
> > > new file mode 100644 index 000000000000..6005a689173e
> > > --- /dev/null
> > > +++ b/drivers/pwm/pwm-rzg2l-gpt.c
> > > @@ -0,0 +1,555 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Renesas RZ/G2L General PWM Timer (GPT) driver
> > > + *
> > > + * Copyright (C) 2024 Renesas Electronics Corporation
> > > + *
> > > + * Hardware manual for this IP can be found here
> > > + *
> > > +https://www.renesas.com/eu/en/document/mah/rzg2l-group-rzg2lc-group-u
> > > +sers-manual-hardware-0?language=3Den
> > > + *
> > > + * Limitations:
> > > + * - Counter must be stopped before modifying Mode and Prescaler.
> > > + * - When PWM is disabled, the output is driven to inactive.
> > > + * - While the hardware supports both polarities, the driver (for no=
w)
> > > + *   only handles normal polarity.
> > > + * - When both channels are used, disabling the channel on one stops=
 the
> > > + *   other.
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/io.h>
> > > +#include <linux/limits.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/pwm.h>
> > > +#include <linux/reset.h>
> > > +#include <linux/time.h>
> > > +#include <linux/units.h>
> > > +
> > > +#define RZG2L_GTCR		0x2c
> > > +#define RZG2L_GTUDDTYC		0x30
> > > +#define RZG2L_GTIOR		0x34
> > > +#define RZG2L_GTBER		0x40
> > > +#define RZG2L_GTCNT		0x48
> > > +#define RZG2L_GTCCR(i)		(0x4c + 4 * (i))
> > > +#define RZG2L_GTPR		0x64
>=20
> These will be replaced as
>=20
> +#define RZG2L_GET_CH_OFFS(i)   (0x100 * (i))
> +
> +#define RZG2L_GTCR(ch)         (0x2c + RZG2L_GET_CH_OFFS(ch))
> +#define RZG2L_GTUDDTYC(ch)     (0x30 + RZG2L_GET_CH_OFFS(ch))
> +#define RZG2L_GTIOR(ch)                (0x34 + RZG2L_GET_CH_OFFS(ch))
> +#define RZG2L_GTINTAD(ch)      (0x38 + RZG2L_GET_CH_OFFS(ch))
> +#define RZG2L_GTBER(ch)                (0x40 + RZG2L_GET_CH_OFFS(ch))
> +#define RZG2L_GTCNT(ch)                (0x48 + RZG2L_GET_CH_OFFS(ch))
> +#define RZG2L_GTCCR(ch, sub_ch)        (0x4c + RZG2L_GET_CH_OFFS(ch) + 4=
 * (sub_ch))
> +#define RZG2L_GTPR(ch)         (0x64 + RZG2L_GET_CH_OFFS(ch))

I like this better, thanks.

> > > +	 */
> > > +	tmp =3D (u64)val << (2 * prescale);
> > > +	tmp *=3D USEC_PER_SEC;
> > > +
> > > +	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz); }
> > > +
> > > +static int rzg2l_gpt_get_state(struct pwm_chip *chip, struct pwm_dev=
ice *pwm,
> > > +			       struct pwm_state *state)
> > > +{
> > > +	struct rzg2l_gpt_chip *rzg2l_gpt =3D to_rzg2l_gpt_chip(chip);
> > > +	int rc;
> > > +
> > > +	rc =3D pm_runtime_resume_and_get(pwmchip_parent(chip));
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	state->enabled =3D rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm);
> > > +	if (state->enabled) {
> > > +		u32 ch =3D RZG2L_GET_CH(pwm->hwpwm);
> > > +		u32 offs =3D RZG2L_GET_CH_OFFS(ch);
> > > +		u8 prescale;
> > > +		u32 val;
> > > +
> > > +		val =3D rzg2l_gpt_read(rzg2l_gpt, offs + RZG2L_GTCR);
> > > +		prescale =3D FIELD_GET(RZG2L_GTCR_TPCS, val);
> >=20
> > Can it happen that prescale is > 5 here?
>=20
> Yes, if bootloader wrongly set it to 6 or 7. I will add a check in
> Probe and forcefully set to 5, if that the case. Is it ok?

>=20
> +                       if (prescale > 5) {
> +                               dev_warn(dev, "Invalid prescale %d > 5, f=
orce setting to 5", prescale);
> +                               /* Set prescale value of 5. */
> +                               rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch=
), RZG2L_GTCR_TPCS,
> +                                                FIELD_PREP(RZG2L_GTCR_TP=
CS, 5));
> +                       }

I wouldn't write back the 5 then. Just assume that the value read back
was 5. (Well unless the hardware behaves according to the normal formula
that applies for prescale =E2=89=A4 5, then it might make sense to continue=
 with
the read value.)

> > > +err_pm_put:
> > > +	pm_runtime_put(dev);
> >=20
> > A guard (=C3=A0 la guard(pm_runtime_resume)(dev), similar to the guards=
 for mutexes and spinlocks) would be
> > elegant here and simplify error handling. (Only if you're motivated, I =
wouldn't make this a
> > precondition for accepting your driver.)
>=20
> We normally backport these drivers to CIP kernel(SLTSI) 5.10 and 6.1 once=
 it hits mainline and then linux-rc series
> From that angle, I would like to use mutexes and spinlocks, if it is ok f=
or you.
>=20
> Later I will send patch for using guards for pm_runtime_resume, mutexes a=
nd spinlocks which I cannot
> backport to 5.10 and 6.1 kernel.
>=20
> Please let me know is it ok for you?

sure.

Best regards
Uwe

--akv2cxbtwbbngmrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaxxsgACgkQj4D7WH0S
/k6QjAf+IBTS3BkaQ4gsHWYqVHL/5CkeXRMEfd7a2h0tBhkp1ouUsaGEzDQwh60q
cGgmxutF4M4jCKMePBZNTzE7J2vNZuda7som315689HP9aikLdE+j2PceoDdrkZR
yVO49vUZjpviqla1Wn08uZmvacafRONQSv7KOqYqSMVV+VqBJGe8yRALNDgC1R55
ZPeb5y/2XWUwr82DVAL/tp9ofbiqtYnzSDvp71jeLrOjzBoYMzlnamswYa1YJLkA
TNKiwneGZNMtk7v0se703CvBfY9wC2kXwzD0jQ+LVhPchYD5o1UNmf9sCX+oZI0X
DkAe65Lj0PfuZTreyNYprm3hR3pSCw==
=OwiR
-----END PGP SIGNATURE-----

--akv2cxbtwbbngmrq--

