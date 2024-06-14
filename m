Return-Path: <linux-renesas-soc+bounces-6268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20C908F90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 18:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5C71C20ECB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 16:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03FF17FAC5;
	Fri, 14 Jun 2024 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SH5y5sGw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A244817C211
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718381013; cv=none; b=LUWrpKyoa0eGIejuLiJS3ygm4BC4QqksJ7e53XWS0yDTp/PHMLqZVycS9qcvJXbTKnj+v2Mz4oJKRocgVYWZUmCHw+BFV80VXxcw0BxWVPuwceYc8gAD7NaKdeSJKE5b87mmPqnyz5XIqfw4FtE2AOgMEZEwED0pjEp36L+07HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718381013; c=relaxed/simple;
	bh=nCqEta/HZ8CxlBxcLP0B4zQQpJ0Gawcz7hr11EbtCjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYeVnFPWLhkVZqzbEGUSg74fuowZBDBWrj7t4ExEqNvczIbzO8u4ERwD4qFMM6wO6ip+conPSt8Z5euyWfXxJ0soMOt9PYf13o8ELtPLZ+WEaXFy7C3xDi+qLLlW/fzyfeJ1BxnOMh4SYnLwoe1EQHdUTdrk26wvW/Jbme1xbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SH5y5sGw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso275855466b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718381009; x=1718985809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKtAsZ/sDThAT3xL8w+kDHqUgJMXDOLqqKFXz/jORBk=;
        b=SH5y5sGwkMhLfh/BPsfqJcPYVxDcbeCpl/OfL9sSABHTXmqFlBvzJmb7ZQy2CBPHfW
         FoFQkVnbp5e3cSs30Hnmo1GC3hppsf1rXvm3c4wbBu7C263tzxLHR8EA0UezZAw8Nxwa
         hHdty3l8FYXCWUYfj1lyqWvNutNB8j6I+Y/dFhL/eueX5mnkrgTd+pw8olGz5C3acGq6
         e7O3B5OAaq2F0m5z+4YXdrece3dOVYnQQ2fYyj1ifN8s3YGva/Nm7TSQH4/v9J/Qz6SX
         TDilGo8gCzm/Yfo6njOe9aB78qQK/7xUU2JFrCkZqfLAF9BL6qgYW1ah5xG5ncIzZ9VL
         SmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718381009; x=1718985809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKtAsZ/sDThAT3xL8w+kDHqUgJMXDOLqqKFXz/jORBk=;
        b=g9XASG1zUrXOY6x4rLwTfDJa7N2cW8D+wShUocdsMjASv1IDEiT4HGIdKPDSLMKRSe
         gmGbg3qJ2X7uVNQSJg+4yYNuiSvNKE6qweosCvtzhw+1zceW6eGBZjQ6gs4r8EK6sUiO
         a+d5b0TtWNVl+JVAKdvgZGfDAu0XHm52jlv2xfwKEFEpJel4TaquzV0jfpl0D0MfGtVZ
         AZ9tImb1XvOFuM1orllrHGSRv7pWx/zR0iwWEJWBHQ9uZAGx+9H/TTnjLQSbF66vMkhk
         MBGXcYoncepdrE9oGhuHKnAWryr2+WNBOaAwlhArl/F2Yx8/bm7b1Fa9aKylUzT3+BqK
         /4GA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Vn2kUlRzv2kmCednGUqIb8gppw7ehQ4kPCxuyqG7dmKUtyvwQi38/lvEyPBewW7byA6lT6nZH9bQJga9hBbKH8bg7+ooAiNRshf9j/klRbs=
X-Gm-Message-State: AOJu0YxOCWi3Gryg6HZsuNztCLEAl426uCWYvLR5mOIq433lw4uNT4IE
	i3tkGLJrfCN27sTyJv3+UVnzSIOMRcqqSY3KWXNgeLKrUZIW8wGGheZLF74wjNY=
X-Google-Smtp-Source: AGHT+IGOwMMN0+xH3RlKkB9DrN4UaQ09Z5i2SosZta2BJdfhYBEMev7JDSRvc5lKrgSq7cOfUiCF9g==
X-Received: by 2002:a17:907:2089:b0:a6f:1166:fb7a with SMTP id a640c23a62f3a-a6f60d2c44emr176295666b.32.1718381008838;
        Fri, 14 Jun 2024 09:03:28 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da43fbsm198644866b.39.2024.06.14.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:03:28 -0700 (PDT)
Date: Fri, 14 Jun 2024 18:03:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] pwm: Fix namespace error
Message-ID: <jyoiieidwucmjxad2hoy5l2s725x3ffx2fyzrsqvlgku2mdgbi@h3i4ryqpx6ej>
References: <20240614151233.398463-1-biju.das.jz@bp.renesas.com>
 <ld5tegce2dpiehqg2offdyrazew2l2vkq3unm3fe3l74lyufg4@vnebm7soytym>
 <TY3PR01MB113466693077CD17D73AE7D4086C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrqi5ob4filqaucp"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113466693077CD17D73AE7D4086C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--vrqi5ob4filqaucp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 14, 2024 at 03:44:27PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > Subject: Re: [PATCH] pwm: Fix namespace error
> >=20
> > On Fri, Jun 14, 2024 at 04:12:33PM +0100, Biju Das wrote:
> > > Fix namespace error due to typo by replacing USB_STORAGE->PWM.
> > >
> > > Fixes: aeb9cedc87a2 ("pwm: Make use of a symbol namespace for the
> > > core")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >=20
> > I found that issue locally, too, but obviously failed to squash this ch=
ange into the commit. How
> > embarrassing.
>=20
> Yes, It make sense to squash the commit before it lands to linus tree.

I squashed your patch into mine now and added:

	Thanks to Biju Das for pointing out a cut'n'paste failure in my
	initial patch.

to the commit log.

Is this ok for you? If not, keeping the fix separate would be ok for me,
too.

Best regards
Uwe

--vrqi5ob4filqaucp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZsacsACgkQj4D7WH0S
/k51uwf9H9QrNG8Nkizz0bsQeLk3WM7NssV1i7ytp/F7yw8VLEZl4Yq3zxQxKugI
ArL1RapUXrYoMrbRJrodaNL89iVYdgNOwICDcadp8d2hL7v/wRxugxVsCa9l5Xvt
tA5U+SuJUfwFlIFkwnhIWm1i6UoLyj9+BgNmAVbswlQrlz7p03NXD99Xhi+tc+eQ
v9tAum4qEDDf4r2tzQlavSKY6nrgUrGidtDyQAwmt9/76dqtwF6TlUzDfb/sD5Sz
OrsOAmumYmSvk2AlT/X/0gMvGeLggUR43P19rkWnhUEWHQit1I4U934Tj534JE3f
s4V2jJn3RXbIp2Ecnx8aOIBJ+O1qZQ==
=JsHp
-----END PGP SIGNATURE-----

--vrqi5ob4filqaucp--

