Return-Path: <linux-renesas-soc+bounces-17292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84453ABF241
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 13:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDA9D1BC0BE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 11:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3701F153E;
	Wed, 21 May 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QjI942zD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C34DC148
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825255; cv=none; b=nV56e4MHNCj+Vp1yilqEl36Olv4haqStcONspz1hIXt/um4cAZwe+u0wVYiuSVwElbfpOPByaIMGQpzmpcd+YnXo5v8Bhs98r1CXKqFj3mE5NhftK+TowYq12RnLj/jcnRZbAOdqsGwgqSmLc28c/51AwV3IDhgw4QkQeWs36Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825255; c=relaxed/simple;
	bh=kQeuco4+e5SsARtY3nfrCmGKpElXymN3zNb4E6sJy9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuUCwiWaODsEZigMkohScqUupEL1OZTH9fSghv7xGCL92I1fN0Dz/Wgnhgv+kDMjc4ElRxrQDDaM/7UJcwaJX7/h4AJF04kxtrUNTW40fL0a82MAiC1p9n7hDuHNUrNn68dSinx4/spbi0cqtN4iLy2S8G312FHDcUKuNpypBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QjI942zD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RM2B
	44woUcjorhr9JLF9M8YKkzNP8iwLoLPgMAmQoBE=; b=QjI942zDQMU3wXSQKXRZ
	R4gk1IzYpI5zjowjyt4U6b5trqpvVoelFRw7Xuk3wLlADF9qGgZX9y1uoY5+Fvgh
	Fyse6BZWQo2cw/6H4MCkzEmTqjTMABMj6LW+kan2njJqiY816apQI7pRZTc3/DO6
	lJpJ3Jr6h6p6U5xSt+GYkw4Ddr+REaJtQs8OgbCtZF7SjLnWFbVj7t36+iVq2mLs
	pb3hN70dzGXhrucPn+M42xkCtuDLkYMz1vEs99zsihXcJIZCp3No63yBD2CSl6MP
	QNkGacs34XVz/qN7+XjK0+Yndf6lDpqKMD3WTArctgvCI18HJhOQAEBjFBzY/Rtr
	VA==
Received: (qmail 3232836 invoked from network); 21 May 2025 13:00:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2025 13:00:48 +0200
X-UD-Smtp-Session: l3s3148p1@Ea4MR6M1bLlehhrc
Date: Wed, 21 May 2025 13:00:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 06/10] serial: sh-sci: Use private port ID
Message-ID: <aC2yYDpsv7ef9IVA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
 <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/HOrjV2F0H4FDVet"
Content-Disposition: inline
In-Reply-To: <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>


--/HOrjV2F0H4FDVet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:18:21PM +0200, Thierry Bultel wrote:
> New port types cannot be added in serial_core.h, which is shared with
> userspace.
> In order to support new port types, the coming new ones will have
> BIT(7) set in the id value, and in this case, uartport->type is
> set to PORT_GENERIC.
> This commit therefore changes all the places where the port type is
> read, by not relying on uartport->type but on the private
> value stored in struct sci_port.

I quite like this approach to become independent of serial_core.h by
adding a driver-local type. Because it changes only access to the
variables but not much the logic of this driver. Two high level comments
I do have:

- I'd go for bit 31 as the flag, though. It is extremly unlikely that we
  ever need a number in serial_core.h again, but if, it could likely be
  > 127

- whatever bit numer we choose, it should be hidden as a constant. My
  suggestion:

#define SCI_LOCAL_PORT_FLAG	BIT(x)

?


--/HOrjV2F0H4FDVet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgtslwACgkQFA3kzBSg
KbY9hw/+KCPfBEqpxSdVAC0NmTxrvYGMxQdLx9nhBGbKTSF65kHMvHbCeB3/VCMX
EtIonj5Gm+ZLLEUFw7rPOlByOAXn/50pzmLN5Z9h6I++dM4MDMdj24LUMGLU7DbG
/Eydt4Du2bjmKviosBJnpV/Whz2wfI4FUOHinI8fWvuo4BwLHuYUHj0EtIkrI992
EbaUg77yTdb0qZF+e322wS2+E+b483MZHmgYzT19jbd9RzfLJ4BbLbw9SXXldpoM
ljbVN1Jg6T9tZxQjFGJmhTRdW/BHMF+nimu4/uSuIp9ANGDhzahxbm200+TQtNl9
0De1Bu2rKqanFLWbNZns4xcsj3eQVn719zt30g1GxB3PLJuHazLRzX1ed+yha85C
KczWWLWECmpY9X7FooNEJjUI8IAx8hupjPo76lFQUrapujwFrbk0ilRbRS7tnB/g
FeMxPbYgkQB/rPThjTo3lqdFxGSur/HUzGwdddiCEZvYayhbG5wWNXjWiVHJoMen
cgxyhpFmcQVyE2dT9wNKtSLxApxPgRlfMxpqfcAvWHXHtntk6Swa85Ti1FVg1UhM
/LU5p0RfsWJoB75ooAiISVN+7cPrtRsnLONK7YyZ1G+UK4A2fnn4EuIzwlE02bjB
Ul0khEfB+0kv2wZYUqsxmoMTDjT44Q9Sz8gOWKSiRcbNc4uyPPs=
=vEFG
-----END PGP SIGNATURE-----

--/HOrjV2F0H4FDVet--

