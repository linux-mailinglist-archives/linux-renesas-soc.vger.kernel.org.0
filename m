Return-Path: <linux-renesas-soc+bounces-18365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE267ADB12C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 15:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD0651884E61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD1A292B51;
	Mon, 16 Jun 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NYjVVVoN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE37285C80
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079327; cv=none; b=gyaIdYdNQBkEAUYWQ+Js88eTozGuSdVl/kVgKr5aqfBX1rofe4bn7cbp04KcvAR54nXk2ePRW/2SRxrDvnNLwgW40Cd5pavodX9f7Y/PT2aDph/EYYvi+fCcosJFCZ50CRLTYWz7JFGGK8jR2W3xXqy9J3jlz+zwo7R6JRyh1Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079327; c=relaxed/simple;
	bh=ah5rJLZ6Ag5bCpEGVmMK40ONVUS/hIUB8mOhOGYJuYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zur8+VqUOMFUGlzORKW6JZ9a5e4mSvXReBb+k4dynsTYVUp0UkaHbUVGlse4qrGVBozYTMWPI9rhF3g9EevlojNfMeq0QJilRkWwK08hHS8q+6hLRi4NyVzVv+bIzNHnMo/EZkl+DBYCpOEOOLhMw+nkx9e0Zja5jw1+8vDNq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NYjVVVoN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2615366f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750079324; x=1750684124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ah5rJLZ6Ag5bCpEGVmMK40ONVUS/hIUB8mOhOGYJuYw=;
        b=NYjVVVoNdHkwu2PC368UJbulp3NULBtBfS8pOrfLgPPVNDB3BcHkGt2XN9MUzKt4Ei
         XawkIEMCciJaEgaqDweI2jwILrTI0yR9gop7Kmf3idGJoRb46gSeZEM+XXWLa3YB/0rL
         XSkucm3M9UKgxybgjqH581gHRLAC/8R9x8Hvw4tu1nxVQukrrz5bq9FW8dPSe9wfk6pA
         wBuB9BGoctfZTTkJMGoWfNxxZaq1VNeNtrBxWjyJ8KYejfmDdvuAHqdhof9irCwl45mj
         lLftbTw6c88mDs7NxzENC8nmQx51pK/WHJhB3QSxmu0G34aJUBVOfhY2iVwJZRuFeUhn
         WCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079324; x=1750684124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah5rJLZ6Ag5bCpEGVmMK40ONVUS/hIUB8mOhOGYJuYw=;
        b=v0seI4+Bv8ADEY1AEVV/MpGFCGyPlMPXrSRwhFkyI8+k+viVl1iI0aJr8P0s/9E71f
         0tVrgv0lP9H5tXd2PZ1WkK+8RtHNAezXqq8wWa5pOYyJi7q9awPo8qJZ8E8P5bIZMZWd
         rZaiWKb76YtapC3tNaoucsv/wgA+KFW48GXGv0K1+fX6JqkgLDuhlGdqcVz0mWMxe2Fs
         oQd/4OKNxm+E64S8DwTU/42Ak1HYA+yXKWXOPVkqYnQ8sgSGaKrHNCd4t1diLepFmRK+
         +6rdFLXxHNZmSRNYRzHBUC22B3M+YOMZ2jlxhM5mNC6Ux5082PXj4E/LSmMVHc3RYNPk
         0U/A==
X-Forwarded-Encrypted: i=1; AJvYcCUZSX6/T0VotYW8PR8zhyh7f+W9YPJYNbFnOW48qzOhOEBXx8Lsc8jHW+i/fYjCFclVeHmhgL1bYnjxSk09Qw9PTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaymkmZQnVazZ6LD3q2BaR18n7v62xpnOPQHei6ywttcHvXDAy
	QTbs2swxuzkepEqT8BEL+5kERiVPytcMyneVAx+e6Lw73DlMZAWRCezXPez/uY5To3haaQnSklK
	k9VRf
X-Gm-Gg: ASbGncuyKTOddL9QV6KJZ1J5TGPV5E5vePHwsrl7kp7WlRWL2y2qAVBsTgHm8hwApGY
	aJ0QczjTp21poqP+xRwycBT72gr1uDC/2ANLUTD56YjBxjKJnXKOa8Xja8RMZbvczTthEvxOXM/
	yRLPnRCqVvv3A/Y60ug67k4o+InMDHcFM22ZOgjFX+0vv3weneagyZuqcUwtizpZK9tW5JKalyy
	PAAIoRghZSoFQFV3GdLKSjmfd5L4wBvZrSANSjOyjzg8nDCy3q8+LiIACGaTx0XDpxRU8kUwYim
	Y7bYmgN5Q0cKLowVruzQUCFiYBR3vrVTjfsOHvZlE0HePn/Ba1e1Lw67tJERsvKR01cuIqsAMDe
	luitTJKZxy4S3qLXzt472xBLzvihh
X-Google-Smtp-Source: AGHT+IFNPYRALxn7pyrwOurNwG2b2zOxZ8DWDp/HD4Av4lUT1jBW6B1aDoGMobxjeaaXuhPwxcq0HQ==
X-Received: by 2002:a05:6000:2284:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3a572371cdcmr9144801f8f.20.1750079323743;
        Mon, 16 Jun 2025 06:08:43 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089a7sm10888086f8f.49.2025.06.16.06.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:08:43 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:08:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
Message-ID: <fmn3mrcbih3oq6hgl45jipdofko46ur2sux5p4lf3nzlpahklr@3tm5molhdfdx>
References: <20250527205823.377785-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iilopq2yqcjx7szu"
Content-Disposition: inline
In-Reply-To: <20250527205823.377785-2-u.kleine-koenig@baylibre.com>


--iilopq2yqcjx7szu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
MIME-Version: 1.0

Hello Daniel,

On Tue, May 27, 2025 at 10:58:22PM +0200, Uwe Kleine-K=F6nig wrote:
> With the goal to unify all PWM bindings to use #pwm-cells =3D <3> update
> the renesas,rz-mtu3 binding accordingly. Keep <2> documented as a
> deprecated value at least until the in-tree device trees are fixed
> accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I would expect that with the positive feedback by Biju Das and Rob
Herring it's on you to pick up this patch. Or would you prefer that I
take it via PWM?

Best regards
Uwe

--iilopq2yqcjx7szu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhQF1cACgkQj4D7WH0S
/k73Rgf/c74I8St/PS/sSA0sdengOBRQFwBTHGS4TSdeSMCM6NOyPPRbdOldZt5W
q1zo6ebUQPfsmw0PNrLy8+1VM0mo7VODoKzbpzlJbU78nNY6dClrEh1NQhO8l1x/
AGNrp70au94sZPzQ+Wl5kDjekdgZWRNhTqnvDB6Zr6N0yZQYJTTG8szaHAdn2MBA
w79oUyr9u4CHCNKeSrmsng+LutRYTWa19H+euEWY6pfNoUevc6KcSLFQjuJFTa8G
Bcl+0K2D9ds2udo5OX0fC2paLmzIdrNJOXLQdb15x5gtiPNeYUJpRwj/W6wLSGvr
0kluQjZBdst9MdruqyCa0RRRSxFFRw==
=CsNM
-----END PGP SIGNATURE-----

--iilopq2yqcjx7szu--

