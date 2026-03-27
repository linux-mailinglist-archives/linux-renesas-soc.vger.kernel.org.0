Return-Path: <linux-renesas-soc+bounces-30439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHMaFeW1xmmgNwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:52:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BCE347DDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9958F310B9D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 16:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B0D353EF2;
	Fri, 27 Mar 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X3qCbJPR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818834DB4B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629995; cv=none; b=k1/xZ3i6peFScXwGfuXlz1M5Rxrqh4mz2zkIIqWKG7Enzs8XrKmEWHnQe95TFK9hBiX2wUIUea+W8m/iOz5fbewi+acmMuecAV9xpD3T/8rspdohuyWfit+/pY6DB7o3mjVb1oAf2zjr2js9azULdaLYNrNx25xVv3iTzebWjqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629995; c=relaxed/simple;
	bh=nmnNOSZra5VKM8rRDPTT6EwSxDFRxMABF7GuoB2jK3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF5ywKjEhStOafxiqV2Sqsj95mufOB2cf066CC+7zik0frqC2jVp1TSE4N+i18oeZ8s2Fn8CIRw0qjqSAY3nxV/j56DoZAWSVlqBLFw0M2C/JzgqWRnqp1i1U12cr3lez630bXBUaXz6262o41wI0rdybWsHUFFC1BS0B8sE0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X3qCbJPR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so22498585e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774629992; x=1775234792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmnNOSZra5VKM8rRDPTT6EwSxDFRxMABF7GuoB2jK3A=;
        b=X3qCbJPRTd7xbL8qvOAhh5t2Vm89DA/HzK3ek9oBYqvAwJUPNCGTFVTN1aMv4sirfV
         24R5BFyO2MlgU3v3mspvTkzF5SfBWsfZSbxwqOmh4YDwvhfpR03qhO7U0Gk/ODtmGabw
         RMm83677nQpXhimbI5ingMvYkUoEx2cNGUYha54X7UR3zxFkMiujrBKFNNKlvJtmiKQU
         ek9RCjm6wKg6BM7i1Sfdiea0tqahMZy9E+MZxsPyE/ZyCIfVU+efH1cWOglUZmp2y55E
         IqCzgVtLs8ZKkhNV7OqnFtcOSRUPRfiSpBxhrKHQt/j3f7oB657w05WeDca3MPtZiwKt
         OUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629992; x=1775234792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmnNOSZra5VKM8rRDPTT6EwSxDFRxMABF7GuoB2jK3A=;
        b=HAmi3W4T8ADqhvOASuOuXDARmFStedO4XrZKhU5RsqL+5zl+MfskGB4Oc72vXZ2Cud
         Z6NwPx5JBizxVGm65mfjUoMWSo2NI3luZCnczPoHJFdyrqQX0Kdam618QXIlum/wTMw+
         tC7dKLiw0C+CrFz2O8yEoyls2EVXx7O12/0wikRL0eV3LaFWjxYjnj36KliQ4tgVF2b9
         05UQWHXuR/RrZWbqEvJw0cBKBDLPpwTumBrDo2HQM9b3QrVrB4REXEZ/k5VDorYENXYH
         TsZNr/dnJt1YuKPJQ8RXXGWbtI6OGzU7fhVzmQsU4X29oyDnxYs/vXhswaw5NxU/UJ2b
         AfVw==
X-Forwarded-Encrypted: i=1; AJvYcCXW5/cQYNWQPcW+DMeSP03Gkmlh0zoZlzXCLh5jReHLmuLI5xK6Q8UchRoKCcvlO2ni9UBoARcWarJJHgUPTP84dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXW/oY1SVnMsvTZ8AkWbVrzrM/muALLPox14Qd0rICE0bfAlFo
	4Wu1tcLpvxjhuxFmZ5ZRAB1JqoE9SXGLGXmSVdIhP3QCYwTx/IL5RD7VBdlrUj12qYc=
X-Gm-Gg: ATEYQzzwWLhpGS5SPg85oSs0noC2sYe0oIBxfpCpf1CQCt3WpK2HAW2+X2Pb1kJTHD0
	z/Z4gLT7+0DpQQIkfpm3LCOyEJcKAuYPDzVJD55Dojf1WZOdWvkJs+6SvFawfoU9U21J+gflro3
	HocLCEFAtCWAKbFNvh7l/Kc+UvjrAZLgzeorS8AFVLpb46n0ABXKp13/05VNH06f0xBLnDOGD4l
	rX6dW8RrdnGCtB4fF3W8aHoFbONXf5RTtOoEm3BmFNYWNWisCUb5kh5zqSDkPvdfBk483/VsAAA
	ik9GObYA9NP/ssC2jf7KIcyIcpozc52hjPsmgL8r/rpebjyOLaHYFUaNLXsJkYHfZ6prA6wdrN4
	/i55kBr0NKZD5TT6RXGa2c5zgiSV1gQQ23ZY64t7I3yFyGbxPsd48rhgBkjPowqQpqdwjyWsM4m
	gs9Cu/axufnTxqxrMyzi/GfQ==
X-Received: by 2002:a05:600c:1d1e:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-48727f069eemr56959445e9.27.1774629991836;
        Fri, 27 Mar 2026 09:46:31 -0700 (PDT)
Received: from localhost ([212.133.41.47])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48725eae727sm38380005e9.2.2026.03.27.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:46:30 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:46:29 +0100
From: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
Message-ID: <acax6VgK2hM2bjel@monoceros>
References: <20250527205823.377785-2-u.kleine-koenig@baylibre.com>
 <TYRPR01MB1561945B6057A2ABFCF25C6788549A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqo3pkbr3kw3htxb"
Content-Disposition: inline
In-Reply-To: <TYRPR01MB1561945B6057A2ABFCF25C6788549A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_DN_EQ_ADDR(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30439-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,linutronix.de,kernel.org,glider.be,gmail.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.921];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ozlabs.org:url,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: C7BCE347DDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--tqo3pkbr3kw3htxb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
MIME-Version: 1.0

Hello,

On Wed, Mar 25, 2026 at 01:24:40PM +0000, Cosmin-Gabriel Tanislav wrote:
> Sorry for replying to an old patch, but the context is relevant to my
> question.
>=20
> I'm working on adding MTU3 support for a new platform, Renesas RZ/T2H.
>=20
> From this patch, it is clear that new platforms should use
> #pwm-cells =3D <3>; as <2> is deprecated.
>=20
> What I would like to clarify is whether existing platforms are also
> expected to be migrated from #pwm-cells =3D <2> to #pwm-cells =3D <3>.
>=20
> My understanding is that changing the provider to #pwm-cells =3D <3> would
> break existing consumers that still specify only two cells in their PWM
> specifiers, since those references would then fail the checks inside
> of_phandle_iterator_next().

The conversion doesn't break dtbs, because in a single dtb consumer and
PWM device are consistent. So from my POV updating is fine.

> There are no existing consumers in-tree, but there might be out-of-tree
> ones that depend on #pwm-cells =3D <2>;.

That might happen for out-of-tree dts files that include the SoC's
=2Edtsi. IMHO it's ok to break these.

> If we're okay with the ABI breakage I can proceed with the changes for
> existing platforms too.

The reason that made me stop continuing the conversion myself is the
somewhat stuck discussion at
https://patchwork.ozlabs.org/project/linux-pwm/patch/crk42dsypmbyqk7avldghj=
q32vslmalfmmouwxzgtdci4agfhz@rkbmxj5z22fx/
=2E

Best regards
Uwe

--tqo3pkbr3kw3htxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnGtGAACgkQj4D7WH0S
/k4B7QgAkrjyiqIOxfTYLU37jtZHVvglcPCSu+AxXEZvPLhgJIbGOX2Whlv8Itm3
TjMQW1kSHf86Ml8+Us0r1Gfg0xtdpWTCLXoG9X8SwNRHo5Bs5kPE2BjE3jnimbUz
N2e1EyuC1MlRRm3Qth4APLqn1O/qGM+LhTqJpWzRt3hakH6sZbulAjYgIaZ3c3hW
ZziSJpkddseN2oiIX0G1x4c51+sw2IMsZd7slkc+6gZvXAV9PFrzm47cp6lm655j
D4mnnifOPJ0IQY+mgj73yl4KBOyhYejTnRS8WuyUxySXomY4wy9hnYNE9SdWzj70
br7SBGxmv4WPfuvCiMGrtBmIkObrpA==
=a9Lm
-----END PGP SIGNATURE-----

--tqo3pkbr3kw3htxb--

