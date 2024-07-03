Return-Path: <linux-renesas-soc+bounces-7030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212E9256F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 11:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FA2CB22C36
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C789813D612;
	Wed,  3 Jul 2024 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eCTY/vzi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299913B592
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999374; cv=none; b=qsXqEMUD/1X/YOkNFQxANKJi3P3JjPAWoANqPkyXsYglqT3rQfrGE7fK3JO8pKOWTDQOifwGALP8W1vhe1cSXf9xS6AGPqc2+RjG5CHRGiu/cjBbLAUk9qGGr3gEaWvAYx6K4CqXsLW5DzKJ2oEoP56AbLu3TC1mxJaD1Az3oVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999374; c=relaxed/simple;
	bh=n+jdkbPPtgEx0i+SGDSpmHywksKyQTsmVlAtf+FJmu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyGW7dhJkHElbpLiAJmuF9Mk1hnl2fwO1IA+2jtbzqnOtSYRJYddWf6PDcHojpqmscIdpo0pYO/q2EhL5Xi5qwrm96ZPHmt+479KrSZhQZ+KoH37QeFNh51Y2wr6Wi0YrzXIyWSZH5SwXpfgctEFFBzdkBJ58/fQr7mwUdEUdgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eCTY/vzi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n+jd
	kbPPtgEx0i+SGDSpmHywksKyQTsmVlAtf+FJmu4=; b=eCTY/vziGeBWFSGGmnGQ
	SsrHwfthg+k5WuVTs92U0CxkTK2zlJlRBPyu8J4nbuWsRvd2J7rFlt5CIJH8+DiA
	EIrhoMraVKz+1w282FC10g1Tu7GMiJKzdl14lhgOl6SmxVo5yRcVvilMOKKGbgfV
	gnhgwSWvZwb/egtlgRtPVtxa+2i8VnbqIQLe19Ir4ieoZyB5kFR9HVLJeki362qw
	wZu7VgPPRFMYA/YDQm4DjVAkmzNcqfMRCX9PM8pITzVrhJNHUDYTQrJPeh32eNJH
	BONWS4QlbmnGw45l4vCB6hUXYWBPcCyQe/vPl3wX+qumf+VWTcKk34kOhQESbVuT
	Jg==
Received: (qmail 2756515 invoked from network); 3 Jul 2024 11:36:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2024 11:36:08 +0200
X-UD-Smtp-Session: l3s3148p1@Uoxgj1Qc2N5ehhrb
Date: Wed, 3 Jul 2024 11:36:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Message-ID: <ZoUbiEy0AJ_JVVd8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11332F92C1D1987336FA316FD86D72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oqjJyTnaIZISeIV4"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11332F92C1D1987336FA316FD86D72@TYCPR01MB11332.jpnprd01.prod.outlook.com>


--oqjJyTnaIZISeIV4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If I understand correctly,
> VMMC(Always on 3.3V) for card detection -->PWEN pin
> Vqmmc(1.8v-3.3V) for UHS operation for voltage switch-->IOVS pin

If these assumptions are correct, then I am sorry to have missed it. I
thougaht PWEN is for vqmmc. If it is not, then we need two regulators,
one for vmmc and one for vqmmc. This is what the TMIO core expects and
already handles correctly on its own, or? Except for the reset handling
where we need to preserve some value in the SDHI core.


--oqjJyTnaIZISeIV4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaFG4QACgkQFA3kzBSg
KbYGrA/8DqG9qnspQS5905afzuTyGnGosgKWmjE9tk5S9QIv2QTGIm9Fjqb0X9km
fy601hmq3CbiU11VwlbZzZF7YhMDCv2EsGCGA+HUnJNTUHUTVaFmhn3oTX+o4uoi
yeukc0GgBLCD6si6xJ8WvuKcz4XqZN/wAGzSCIUO6OsRRAGQivjV5HzqUDFsoKqo
kZZIHqrRQwYcNj9mpVQr0MXTvmTphKD2UVA8VmuT22a+NG9j9c+K1yd2Hn8n+gIC
rKCFEDcdlpItNJ76iMvmOYzF3snsLZ7lrnLxoohih0K9rfX0WOsniisAiZ6mNleJ
vuz7hGXqwXPxT71BrsgN5yNtGWwkhuKjGYIJtgjyj1tmz5vpO3DMKOfiLCjIzDpg
b24P2SKOXdzt+UQUUr+TjXlCFMXneusgoosZ2gDQK3yRHJyCbQdLRUguuPmvgDM/
RPUdKfRqF7GgJ9iuhdf1GPO8yZtqngHa8oTfdugF95Zt0JFr/GE1TjMiRbD2WlCT
ai00rIYm10TLDl0Ge085zfIvvQVv/WxyAYLURAI5NdxfW/q+YhHJSOLJ9djNBPfF
yjEMuTJsnPOryHwRQ3wdhqO96HrgXCm/l/pTBZDcJwdyxO4gJsuD/n81UXdRp7Ea
AYyEpP4F4aWFL4PVY1jNX1rWeEsE6O1ggDXuEza7VvxJGgeFQU4=
=RiwX
-----END PGP SIGNATURE-----

--oqjJyTnaIZISeIV4--

