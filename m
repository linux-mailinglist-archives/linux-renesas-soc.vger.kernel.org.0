Return-Path: <linux-renesas-soc+bounces-15848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1ADA86208
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 17:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE4BD460138
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 15:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1801F76C2;
	Fri, 11 Apr 2025 15:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iUKw9U6q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B220E00B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385840; cv=none; b=YKvbiYKkmVzTHsven5mW06kB/h/INGpDdvnAtHGDd2iyXFcX3Oq6+UjYeeRrNL93YXEjPTaGNThNc3rplvv4UPt/ZNOtA1cpVrgwZoMx1qXStje9SdK+HiwwuB1D5njuhL6Xu/9fM7Gf7qKXgasnzh4dM+s49D/bgGbRsMVDliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385840; c=relaxed/simple;
	bh=DDCedDsenMx3LoiOsAS4rTMDhX29pF/BbPfRwFTg3us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRSR+Quy1y2mCpHV+XLCGpgluf5xGk9UeKMy8/OAwicHvWj7vdfmj23hcgj0tNKhJWUQgPpKxfrbjn/n1nIjzkjtaHs7mOVZQNagAtgFZLbEbrxp0nuR8ig7rPnVyiX7F2JKOs2EEqrqCoaPXY1sOg0tdWPygE8UNtshzDZpOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iUKw9U6q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rM0P
	vzizVt+4r2P9F3uwCc7rJavN4omFsTV8IYHzbTc=; b=iUKw9U6qIEyTp6sN9vNL
	YTCX/XLCRcNuVIE8YviCfCbU7NTqRt75EgJKL9srjGNoDB6whXKKl9n7hPySZ98m
	OXdBewcF3lBxLXpGfy33tavKMtSohGoNL1/+XwQgk6QcfrfC4huHaSS4hOXkm4UT
	ecdWQb/TrtVYy25zU7kzy2SuSfhSnM37mxFzYDBo9lHNp9FCv43zxhpFrrQ2fwie
	yJNI07NMWmEr5p4q+kRsWwGHbAC5JMv2vH2FnaQpS0oF0f2c/5LEG0L4ne1WwtTD
	Cz7Bs/1UjEPxpvZZPyPu3msRSqn81t+xH/hUtji4R7uXHBm+kaRo5hF+rjHa5JUv
	zA==
Received: (qmail 1345770 invoked from network); 11 Apr 2025 17:37:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 17:37:10 +0200
X-UD-Smtp-Session: l3s3148p1@Fzy8eYIyrr8ujnsS
Date: Fri, 11 Apr 2025 17:37:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
Message-ID: <Z_k3JV1dEexJurdc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <CAL_Jsq+sCDEO_n_TLmyNBfhc71NNWWe2UQ21jh8+AdHH=G+KAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j5LROqLSsZoniIDc"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+sCDEO_n_TLmyNBfhc71NNWWe2UQ21jh8+AdHH=G+KAw@mail.gmail.com>


--j5LROqLSsZoniIDc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 08:38:58AM -0500, Rob Herring wrote:
> On Thu, Apr 10, 2025 at 3:23=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > There is no need to repeat all SoC-specific compatible values in the
> > rule for DMA-less RZ/N1 variants.  Use wildcard "{}" instead, to ease
> > maintenance.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

I'll send my counterpatch in some minutes.


--j5LROqLSsZoniIDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf5NyEACgkQFA3kzBSg
KbbXmw/+MusRGq+V8xGIn23wJuJ8wEn4G0I/Vjqq3OyiyiLiSZbGIh/MhmA+L2Hy
0ORgo3WiQ1ZsQ6l5l50zD+PNHpFJiK8CtZittnfOd1ut5eo1tW56VUtW+o24tLtM
hKvfSMyeadCkmcOxwm93rk7fInFV+7/awef9xFhqUgaQA57+BR/H4hB0XGdfCKNa
Qn2S82UgJwudJUd+wUe9axgxxDQTqgV9/Xa/8Amo5tSwEDMFxgywztc7WU4MQv3Z
jW1j/Vq8kbwR8ehVim3t4oc0B1/6mXxYVxuhz1b6Yf7s7783Jtpv8f+lKVNdM8+0
G5eoR6umjjBl9iMNp5CwWZyiCT8sSz6Mmyn0lzf2vMfX5qnqWC2wrWjFa7nEarGt
zpFerc5NLH9PxTzPoOiKYXC2hbFZWOPOvycWllZkk/WQesdMyayU2MtjiZE/ToS7
+r49XmgJWqKXZgMri+1ngRjU2NeUYNnQ2Rt6A9rgeawdIFcHbQ4mW5exj2KqkW3w
LehF6lbK+hafvFSYwYX2YQeoQyVIXX/01faCoGc+Q+XwqDNSNrFGBycyBax4lX45
M7I1qhAyjQ/2Z6HaR5hiG+V9axk5JYdgLixg3naixnqAr3vFjYeysdJwJ8H6xTms
+YAKuCZP31AHSW0epA0GummihGi4BBy2uncZ/NMLDf+697hp+tA=
=qv4s
-----END PGP SIGNATURE-----

--j5LROqLSsZoniIDc--

