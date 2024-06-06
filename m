Return-Path: <linux-renesas-soc+bounces-5929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67908FF2FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 18:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0C41C23550
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 16:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B2D198A2D;
	Thu,  6 Jun 2024 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TT/3eRhF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5C198A20
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Jun 2024 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692764; cv=none; b=OS0LrvA+0bfWboTc3jcjzgI9NfzVSGdAgnbAy4fKdpGLgDN5St86lQqKpoNWu24YhgfAvSUxRLc4+XjzHdDzwKeN558xZPVzFWmuZYUvvMaGnfSqIOoXTDQR0i+bqmAM4IZIKdQu99XfjciF4MM+Iop4A6s4ElyuGUBy6Etu4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692764; c=relaxed/simple;
	bh=FDuXNbEVC7eOQ76PjSiXvzSb9Yh+Sj1qcE+WEaQHlYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppYbVyBGKDanQPNGHJzo/TGCjVxtC02TO952QzMIq9qOc6fpPOl6NPsO1OFAqmRDlc/zRduusc8iIEeQrIMPFPIPDxOZHHeWW+6Kjd6WpkoBQQL9RP/J4oFompubx9YdFenL7mK0iG7j0aVDZjfpFk8i1kChcMq4V+0s7PRdMGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TT/3eRhF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hyzm
	RM3c8f/q/dLDwcASuwVUnOptm9NfAUFLu3Zohdk=; b=TT/3eRhFNazSROra/IGl
	CDyk/Y+2gPxdC6YTKGsf7uFWute5TAGQHnmHERSlmWnEJi29m9ak0vSGegHKq6yw
	QDrICC+DNVA7rHfignR6BzSEbegn1mi2AdBrWLFDg9pDnYXSUNlHN6qkW+MhC8ox
	ibm6e/L7TXzYlRsk5IttyVnTCUrinFyqxpjK2+2+vleQ0ltUqkEFuuWFH/t45o3k
	AuDaqV8Z5VDIBm8SvFfaAHH3w435upezMzXLFQhFHaj9giMGPdScl3Q0HDn81/At
	5qNxfn3uPDE7F/zZ1zZlFK5eqkRlgb2EXQ3seAYPofyATHUNKKXpc0aDSOxSezsy
	yg==
Received: (qmail 3060235 invoked from network); 6 Jun 2024 18:52:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jun 2024 18:52:34 +0200
X-UD-Smtp-Session: l3s3148p1@13ZugjsaqsxehhrL
Date: Thu, 6 Jun 2024 18:52:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Message-ID: <20240606165232.szabl4q7ymfyrnae@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240606100810.eskr7bd3oqpphaxh@ninjato>
 <CA+V-a8vAkuHN8_4w5QJ-V_ehnmWrto=Ox2A7D6Wrr7bnaf=t9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t7vjfnc3hy2gr2dc"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vAkuHN8_4w5QJ-V_ehnmWrto=Ox2A7D6Wrr7bnaf=t9A@mail.gmail.com>


--t7vjfnc3hy2gr2dc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> > - can't we use .enable/.disable in regulator_ops for handling pwen?
> >   Then we could simply use regulator_en/disable in the code and be future
> >   proof when other SDHI instances have other kinds of regulators (unless
> >   I am mising something)
> >
> Ok let me check on this and get back.

Thanks!

> > - what about not using regmap and use set/get_voltage and friends? My
> >   concern is that other "new" registers might appear in the future and
> >   it will be cumbersome to handle the scattered IO regions.
> >
> I'll have to do some reading on this. Can you please point me to any
> example driver which does not use regmap.

Sure thing!

~/Kernel/linux/drivers/regulator$ grep -L regmap $(grep -l devm_regulator_register *.c)
aat2870-regulator.c
ab8500.c
ab8500-ext.c
ad5398.c
cros-ec-regulator.c
da903x-regulator.c
db8500-prcmu.c
dummy.c
fixed.c
gpio-regulator.c
isl6271a-regulator.c
lp3971.c
lp3972.c
max1586.c
max8660.c
max8925-regulator.c
max8952.c
max8997-regulator.c
max8998.c
mc13783-regulator.c
mc13892-regulator.c
mtk-dvfsrc-regulator.c
pcap-regulator.c
pwm-regulator.c
qcom-rpmh-regulator.c
qcom_rpm-regulator.c
qcom_smd-regulator.c
scmi-regulator.c
stm32-pwr.c
ti-abb-regulator.c
tps6507x-regulator.c
tps6524x-regulator.c
twl6030-regulator.c
twl-regulator.c
vctrl-regulator.c

> > That said, having a regulator is not a quirk in my book. I'd think
> > 'struct renesas_sdhi' is the proper place. Or?
> >
> Ok, I will move them out of quirks.

Cool!

Happy hacking,

   Wolfram

--t7vjfnc3hy2gr2dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZh6U0ACgkQFA3kzBSg
Kba4CBAAnLT8AVsnOncKdZGZ1t0dwqj0PHoUxAkHyiRvOYMR0OImkUMpMu3bArPA
b8YHnOAYOSMx8TfSQS7rJGIa+kRnPaazhRvpnABTBvNxqOZG3jaNrc9GRl5YEOf6
0B39r0taUQicMTBAWO7HtVYHAgUBIW74P9B0r5ntmr8ROeMjGZhHlsSHg4hQ5kDs
xQsic9RJ1WA9HQU1IuElk8rtp5e3yS90odj11kmuQNhzWnQHwBThv6Xivz9lddOM
BbJY+PW8XUE/gR8+4Twnu1+7bUScGKlC++HsmLohKYD8bOafrkt6MAiFsym5FPk6
hkfepTMLTHRSpKuQ0M+m15FfkO4O015zaSUVSThftcKGtKZRYKW1ddjNnYRTj+gC
pf/F1Xd8e5Ue5Q2fPMjO7Bxeot5/wuG7gvNlPBUJcR2qS01+85f5Ry9lp8hg4o0x
I7/b932/L+ksUUz8QB5dFhxWu6bEwvdnlda46M/QbyWUw4e8i3Dqw/YHlxQyeevw
TH2SugO+3T94yG4if1+2K7OTPEqD/aRu+rOaHapclaM1DDVvyRhSMMV49RfwMfpz
qMriY0jE4joM94/Pr0i0Ab7wXv+l5rnzJZhqw7d22ML6B2WMq2uCfn8H3tj2ZzCN
Ke+oSIP/7N1OxYMBwshHIWfgQUp/JrRrmvgYzdz/84XATimW/WQ=
=zmhL
-----END PGP SIGNATURE-----

--t7vjfnc3hy2gr2dc--

