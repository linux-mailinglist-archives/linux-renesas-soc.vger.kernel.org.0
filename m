Return-Path: <linux-renesas-soc+bounces-22771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A69FBBC2C01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 23:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80EA44E4933
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 21:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347BD247295;
	Tue,  7 Oct 2025 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MD0EZlDH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB762475F7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759872610; cv=none; b=OSYw/Zdv7O5tigzqawQQVQ+7iKwfoPqYe4D9zZo1/iQQW6jGwMxpW5WJ/Q29aBwdQP7d+V3OqgyG6EJOuT4z9dKW4CXZYf5dAGp70J52H4h1jUiEZOThHu3SWPRez6inP0IwMO3G0VmT4FeZvsYHVESUhU4/899vAvPDgP2naC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759872610; c=relaxed/simple;
	bh=oJtRLi8U+RgRrylcyvfVnoe1OUSjfaApKrzriaOehgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDe4NEhaJkQUhAj+VqNYL9TuzXJMA6JaVXIHEDuib0QQorRMXml/OQ1Ku5oYUNm0NTknIx9+hrTETGUiLGjXwXzF252a5f0QaI4d/Ro4cK8l3DfkAne0LkYFVUW4verD1BNy//DVksPiIEy5vAX0UdKnYR/Y/1iarhMQYbdP0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MD0EZlDH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hcnR
	RLeDO1+t55l4jEspW/HLykhTa1GY+zVLa7xk8ys=; b=MD0EZlDH4eYJ2iP3PfS4
	RL9/Sws2bMLI0f6BBYGJMw6L2n4s94/h8XHalKkUVyDaAtdqpkpz+K6sWfVUZ2IK
	WYb82bj/0CclxzAXoFfmxfECUb+kJhY7NhbGTpAwV1yCV6EGaQog8mhCFjcR2ffA
	BHZyMGsbL9RLg1+p3jZu5SAUzLoxXCAamdtkKp/92b5fsLioSr3CKr7ezAFZAMmB
	tX3kDVTe2/mBxe5vV11cwZNjlres9YXkT5dCrdEfpulsK0c9loFVgpbfQdk9FLQ5
	ILehfXrlbqU9fW2rdy/j4huazOjCejGiMnH2yegpleyk+KKkWuWiLfIkaxDGawRf
	wg==
Received: (qmail 412255 invoked from network); 7 Oct 2025 23:30:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 23:30:03 +0200
X-UD-Smtp-Session: l3s3148p1@PJdeRZhAntMujntU
Date: Tue, 7 Oct 2025 23:30:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional
 properties
Message-ID: <aOWGWkQn1AK22tJB@shikoro>
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wI5vIvjbiJ6Qh0qO"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>


--wI5vIvjbiJ6Qh0qO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +patternProperties:
> > +  # All other properties should be child nodes with unit-address and '=
reg'
> > +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
>=20
> I take it the "\\-" means escaped dash, to avoid it being interpreted
> as a range? I usually put the dash at the end, so it needs no escaping,
> but I am not sure that would work in yaml.
>=20
> I would drop the "A-F", as upper-case hex in unit addresses is very
> rare, and non-existent in *upstream) Renesas DTS files.

As said, I copied this from 'bus/allwinner,sun50i-a64-de2.yaml', so this
got reviewed already. I have no strong opinions on your suggestions
above. But whatever we agree on, it should be reused for all busses, I'd
say. So, we should put it where it can be referenced?


--wI5vIvjbiJ6Qh0qO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjlhlcACgkQFA3kzBSg
KbbXHBAArllUUHeCLzEhxfJsHX4uPsnrrXnj8BL5UbRBFE7JOaLQ8QF1GBGWQMRq
2FZPNxiBRct6PfwxWwe76BuGECvbxDbxJQ+B2Mr1tygdCYMyraxw801ISBH8Cyuq
cnZNW4We8K80xXtdod2I+kDWPPnq7vnwophzqpOdM194peHQ1z28V1PwHrJbBCaz
eYjS6I+anuiV3Dw5Hva5pESzuV+KBB8cBMB0W/i9kjjRCJZynnXE1RTwW+3UypZn
/KnJcshKbG+xRUtuFEQmBPqIVdaf7pB32sdDnCg+8AnWfxZx7LvXCNuLoTaln6J1
XWhELoyfhTYurVOTDZTPlv5PFBCjfVa97ilncUn873GNdR84FyBDfW7YOdyDNNhu
9cPEvnxxM3zh4g1wbJeg51FwLcncnQ2uSvw5s5u88DyM8PiJrxaZarrtc++THL92
jayoMtuLyCnAXi4VS4POhSZzKHiQ68wLWNwDZqcml9ajvFq+yKrBIiNf9oNtXeVS
+RKxuQtSe6YKnToYz+Yx3U3ntH3PhAI3He/kWJceLYvBzXPxUo0yqmvHzyilL8ki
mTB6atjpwmaHYEVg0qIjpmsxVYJxVR5BoZpOvRnobZJKR1keiJXlW/ub7iAfBdEs
UyOGmZNvc/NOa4l0B64+QHzxSj61V6J+z+igdJOsAldVVY5d+K8=
=s8zn
-----END PGP SIGNATURE-----

--wI5vIvjbiJ6Qh0qO--

