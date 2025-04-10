Return-Path: <linux-renesas-soc+bounces-15732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA1A83EFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 11:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE6527B64F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 09:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CF32676D5;
	Thu, 10 Apr 2025 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J2HWf7DP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275726A1A3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277844; cv=none; b=NoWYS6ot6ulWs8btEFmXYrqGn9F03dt0HsgEXy6lQzuxaL+RC6xZhwwncyRg1P+Z/aQKvs2YzzS9GpcyHZww3zhH9BLthtBeudz2uSQjuCiKf0M722kC+zIg1kFkbywXNB9Rp925ld1E68wWyixDH6wm6/0EfqK0SzK17FsC/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277844; c=relaxed/simple;
	bh=9BVvnuQ6fCl62EYpepZFFM6P/9BBWAx1Aa886gI+GLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb3h42oNGtwCJ03WPwlWmgvAje5KGcgBE4ohzALt4YFBc3vFik3dPqui32UPSrbNeKHiVFwYU4zy9ULNaaAMaTBpdApXcW89k/cafZWK4PJCpCsPc9gvr6r0EmxEhzf8j5D8ZpEoKoj4HavD31RX3mIOnUE9pa6VCb/haRMkMiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J2HWf7DP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IMkv
	6mF2Z7fWGwFCIqoOe7mXoEAAuKKFHb+aQFyHTRI=; b=J2HWf7DPeRZoBAI5FRXL
	+CixNkfOepoTLZlDhzG5g4VhaWiDIz4XDoH4jBYLIkGFExFzgoMgJdsDvxzjhU4z
	Kpl+t89iFhrL8m6+XK033+BZZkXxQgz0iLWcUsocqz/t0uMWzg6hmf8yf5dbStok
	321UvW0SWxbveC0zZdvGxSDBLKrN2+ydwYi0Sb4HJzs29JN9xJEkrBuGjG4e+4UV
	cGCZ8/UUBlOo3OORt7qAN97QfKCwhPKNG/5pNin1Bl/MkG7fQaWp0k6az0BXsnRM
	Q5EpMROeSipzVVzhOxV7OP6SHPvCMr5LFawVvDXyl5WTL0lbvH/fgA8agivGGJhm
	6A==
Received: (qmail 836129 invoked from network); 10 Apr 2025 11:37:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 11:37:17 +0200
X-UD-Smtp-Session: l3s3148p1@znThVGkyKsEgAwDPXyfYALbiJ46yNPq3
Date: Thu, 10 Apr 2025 11:37:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
Message-ID: <Z_eRTafA9mjDC175@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <Z_eCV8aTmr4t1_xZ@shikoro>
 <CAMuHMdV5w_9VpVrJPHy_EtmXoWV9fdBBO_YwhPt2TcX_D4TUxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VlYVZXkNo46z8BQq"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5w_9VpVrJPHy_EtmXoWV9fdBBO_YwhPt2TcX_D4TUxg@mail.gmail.com>


--VlYVZXkNo46z8BQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > What about simply dropping r9a06g033 which cannot run Linux (no RAM
> > controller, only 6MB internal RAM) and there hasn't been any upstreaming
>=20
> You can run Linux on 6 MiB of RAM, if you try hard ;-)

Whoever tries that hard will have zero problems upstreaming the bindings
then again. I will happily ack them. But it will not happen.

>=20
> > effort for other OS in the last 7 years? And making the remaining
>=20
> ... which does not mean there are no users.

And these mysterious users will complain about a removed UART binding
while there is not even a clk binding upstream?

> We don't allow "everything". Valid compatible values are checked by
> the normal rules below.

Why don't we use '{}' with all the bindings then? Would simplify so
much. From the watchdog driver:


      - items:
          - enum:
              - renesas,r8a7742-wdt      # RZ/G1H
              - renesas,r8a7743-wdt      # RZ/G1M
              - renesas,r8a7744-wdt      # RZ/G1N
              - renesas,r8a7745-wdt      # RZ/G1E
              - renesas,r8a77470-wdt     # RZ/G1C
              - renesas,r8a7790-wdt      # R-Car H2
              - renesas,r8a7791-wdt      # R-Car M2-W
              - renesas,r8a7792-wdt      # R-Car V2H
              - renesas,r8a7793-wdt      # R-Car M2-N
              - renesas,r8a7794-wdt      # R-Car E2
          - const: renesas,rcar-gen2-wdt # R-Car Gen2 and RZ/G1

      - items:
          - enum:
              - renesas,r8a774a1-wdt     # RZ/G2M
              - renesas,r8a774b1-wdt     # RZ/G2N
              - renesas,r8a774c0-wdt     # RZ/G2E
              - renesas,r8a774e1-wdt     # RZ/G2H
              - renesas,r8a7795-wdt      # R-Car H3
              - renesas,r8a7796-wdt      # R-Car M3-W
              - renesas,r8a77961-wdt     # R-Car M3-W+
              - renesas,r8a77965-wdt     # R-Car M3-N
              - renesas,r8a77970-wdt     # R-Car V3M
              - renesas,r8a77980-wdt     # R-Car V3H
              - renesas,r8a77990-wdt     # R-Car E3
              - renesas,r8a77995-wdt     # R-Car D3
          - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2

      - items:
          - enum:
              - renesas,r8a779a0-wdt     # R-Car V3U
              - renesas,r8a779f0-wdt     # R-Car S4-8
              - renesas,r8a779g0-wdt     # R-Car V4H
              - renesas,r8a779h0-wdt     # R-Car V4M
          - const: renesas,rcar-gen4-wdt # R-Car Gen4



--VlYVZXkNo46z8BQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf3kUkACgkQFA3kzBSg
KbaQVBAAkMj6dR4lQUEQzzrjGuxqHhGf0KTH4g3s8S/FRcNL0S+6AF6htkwir/V4
Jcu4tYHAIHEsbvjW58pVvKusNlGNE8X0/vTBVyILyfqGn6UVH7B6D/KIj2VR1K9o
so21zggKrYKdcM+UE9Ql5o7FcyepMcJAneibxM7lm6mu5V6Jvut8v8nDJmnNC59w
pwuFZOL5AzMoh4sxre5ZkFhj/S6ihwVIw+ylyFmQ6Z1sK6X8Hr+LJuF5v7Gdp79B
PfSAtyd/jbl48ynaRQny4uAFweXas5iQ+asxJrFgPJDxBs7jRtf/kYB2ojzwo0DG
AYghjlra9bl0jXRdrzi0dEdYfIoU0CR3rAMkZLAGX/sKXCJra0wBVzMc6QZfF79/
nXTk8PPxI4pUZxxxX2yenXckU8v/ivUGmL0WTrBgrZtbnU2umn0OVrYLGJBmpihf
t+Yt3bmp0qxfqy4qwgauZtsQRhtT8WlbnU5Nvkew82LNnQ2GvARIiBpnYfQP5CeX
dqeFVJ1u5ZzEZ68Spn0aVnQXjzfDKziI9l5rt3j2YkBv4ZrtD8MIa3iCO7+k8DPa
6JoeDJbxAeZOa6y9HDnA+g40XLEOmyDVWm6PyPlr36DsELQ5eAp1gB/fgExddPEf
KHt4G/0pI8r/WbZvwOW/meXBgZsGaVihAwBz7Y+yzZeVo9UUprU=
=CKzT
-----END PGP SIGNATURE-----

--VlYVZXkNo46z8BQq--

