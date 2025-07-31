Return-Path: <linux-renesas-soc+bounces-19804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5130B16ED7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 11:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB7617A72A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 09:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3A728FFE3;
	Thu, 31 Jul 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XtbHuCnP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B981E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954923; cv=none; b=BicKixUAWumz4O8VKIzykWu+3eAYiQzkhl8Qi5ymulUYo53g4x5/mpWX/kfylY787aGNqg3U7fFVKekxHhaiKe1/HItIXzu4x8/RBJUKEditTw0mocywlwyp21Lb+6iNO8GGNXmgKIlZ0jl4SCTT5wMvS2X7rJeRPCHUKMA2Wag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954923; c=relaxed/simple;
	bh=QnOkZh2xfL40YRumGUqUgGUVFVo0T+Nn2lfElsVl5SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4oHHA9T9SXnghrmp9cBKs0C467rPN22TVyGl1ZF5catr3jUHLYd421pqk6A9CzZLxBjZZEMvMUQq+oKjQysPLvlDKzWD9PnzPNOtUGqiyw0z9cYki3MNBIe6kAPzeRazv6KlI8i4x7tXNEHF/30Rxh+AE2v73eYG+KTbdB0PKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XtbHuCnP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af915e625a8so99483466b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753954919; x=1754559719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnOkZh2xfL40YRumGUqUgGUVFVo0T+Nn2lfElsVl5SA=;
        b=XtbHuCnPgShawN42UuT/Qb3Pi2h8R3QsL6qB2isbVBJ1h98GBpNF/MOFItlxq5+mtZ
         pmksa4C/mKxzy4fud0jCazKn14NvAdWG+e5RLSvhs3AMyODYJgFG8bvF1b5KpoergXyK
         54g75FzJ+VepIzkSy0wKs+PrZutDMvVnXX1GCfMam0yBAyTI5a2yNVss95jfKxJAAnkx
         Hltyjia7HzcJuXj09baeQOm6RuoFPfA0TVQVeEASly5UxoAYHbeKaXeI+Xgth7GmUqI9
         6OSSONEvtDN6IeVOwM8gagEhlslAWaVfVc98/5fsmckknxK90GQ9Po4FwCbt+LB9fpiM
         nSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954919; x=1754559719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnOkZh2xfL40YRumGUqUgGUVFVo0T+Nn2lfElsVl5SA=;
        b=u2Ow27w5Mtb1em7pBlkxuyYafAzYbkXf4eAMgszi+p1Oirf6SDq6oL7r3+nvTeeRCF
         IBwZCb2dCFDY8+QXhsBKwgoOjuUfEi9O+aMZrralBV6qQc2LY1BFfsU56TZ9Os9jnmHu
         IQNvW86BkIZHJJ3/wYcSXeRIIIwHJudP6jSxBqN0VwYxBRZR8Kpf2QhCdgGTJR76bier
         75f9veSVVtQZ+hx+Ygyuon912BfUzFuI21PXe9TB4LRZw8LhY3sJSJu1NAxcmCCt7bga
         VbQRE0w/v2r/L9kwFtNvPKiUMuPlhuxfbkjODsU3FvAk/DKgsk2ewjCd20OAegwNP/Hl
         ZutA==
X-Forwarded-Encrypted: i=1; AJvYcCUW3ykVtRg17ROnTljq0LMaTwW6jKRuIXt07icUhPZyq54Oh3VRSqx6Fx2FGqiqeYAB1WoM9V56fR+DAfI7RMy9Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw628kTlhB2jeuYya5/lPDKizODmvcg3iRjdcVahv75D0NHSval
	OXqU/7pnIJc8IIwW2i1eyxZjoZPoUFRjIFigrS0F4Gqg6otEF5/OK63NDN0C4ZXOO+4=
X-Gm-Gg: ASbGnct9oAhwbt3hqTEhzpxlfvsAsT37hABPw82EbD6y3gTPOPz2LIV60BpnQ8fMCSR
	c5geNJKSfxKhC5q/jj4jdwlAMpQpRMWHrO2eaHwr3gyQmJ2tipWoTl+T+LM/6CGrsuweF78pJJD
	/138n0UrL2MTHzpZmqCI+92e09Dkz0gRT2CjQmrc2GEk3rvEponXtC6CnztZAawDvw4620ekJsb
	PK2OcRmg9qfdU6pgdbq00JHuAmowo8V8jF76hCR0Rlm9vn5YNBVbXX/1Su9oaFqqcPxZIO7JWfp
	Ly+MCeQkbYtnYs0XL+ZN9R8qKGD4CIwip//GZmitSizzwyf0F3DvV+6od3Sgz4jZVhBq7bOWGFv
	hUmZGQRrFPlAzrjvPFpYP2HtX651pIgYYQG5SQg454nnLWhhGUkYYyNPzrssuB6qP
X-Google-Smtp-Source: AGHT+IGLYXVQtDxNwo330E93me7kT0e10jyCYoV37P7PPC8dqrFgzE417WGD+xvPdcDnkSu32KUyXA==
X-Received: by 2002:a17:907:3c88:b0:ae8:8d00:76c3 with SMTP id a640c23a62f3a-af91bf24846mr181679666b.29.1753954918666;
        Thu, 31 Jul 2025 02:41:58 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a21c039sm82055866b.110.2025.07.31.02.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 02:41:58 -0700 (PDT)
Date: Thu, 31 Jul 2025 11:41:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
Message-ID: <n4ivjvd6hq7phwkzbmvg2tqtejc6ufcybslnyh62kegjkhdvoj@cvfjwstrhlwh>
References: <20250527205823.377785-2-u.kleine-koenig@baylibre.com>
 <fmn3mrcbih3oq6hgl45jipdofko46ur2sux5p4lf3nzlpahklr@3tm5molhdfdx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m7medg3g5ye5skkb"
Content-Disposition: inline
In-Reply-To: <fmn3mrcbih3oq6hgl45jipdofko46ur2sux5p4lf3nzlpahklr@3tm5molhdfdx>


--m7medg3g5ye5skkb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
MIME-Version: 1.0

Hello Daniel,

On Mon, Jun 16, 2025 at 03:08:41PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, May 27, 2025 at 10:58:22PM +0200, Uwe Kleine-K=F6nig wrote:
> > With the goal to unify all PWM bindings to use #pwm-cells =3D <3> update
> > the renesas,rz-mtu3 binding accordingly. Keep <2> documented as a
> > deprecated value at least until the in-tree device trees are fixed
> > accordingly.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> I would expect that with the positive feedback by Biju Das and Rob
> Herring it's on you to pick up this patch. Or would you prefer that I
> take it via PWM?

I understood your silence as "Please pick that patch up via your PWM
tree" and did that now.

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Best regards
Uwe

--m7medg3g5ye5skkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiLOmEACgkQj4D7WH0S
/k56gQf/YVbE8M4YImhXFa56R+9I6mz7mcCrs5jdK4BGolG38W3TFlZeG2daO2nh
MdBRKKRp2w9UTC1sM30Vm3/xuSpVgRKzBCIrgWgrrkIyZ1r1b6DqBc8D4Tz424Yt
sgEB9dsoygEHyp34HxePgqG3fOgwbhwVd7Ww/IDBaM8kxDXxf4OfG34krIJhLEJw
9+v5HZTlnLJEeBBqxytwp+v4fb+b4vBLlmZhLp1Kj2IPZGLgFFADAFDPpmRHf0Op
e3CmdYPWGgDCPSQUV7w0DMY0bzcpvl3IXjGKD5MCObCrxnHxAoikvViOA7DRFe/i
FgWZgSCLMO3luQ6woVmvzYeaEnII2g==
=fddD
-----END PGP SIGNATURE-----

--m7medg3g5ye5skkb--

