Return-Path: <linux-renesas-soc+bounces-12556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E0A1D558
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3D953A6CF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BB9647;
	Mon, 27 Jan 2025 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Do5XSKW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C701FDE1E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977462; cv=none; b=WUWipzc0dpihYR3inAZkjWdsrKoatrbCwq5A9kdYu5iqGLzSondyPPYFaigePqAZbmSJrTyDtOuOnqE/rSUQLODQRlam0uTdbIb76V7TUuTA4ZOSUiPRmNRr6vEMJz85XC2/0qUi4NADYZ3TodQW6NfYTGlF+T2AQhAaaJF+cVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977462; c=relaxed/simple;
	bh=EjPdSZN2hmK9qO+VNqttvEI6BshE8XfK0xeJRa0IUvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLGkdbLGPR0kQp5t8abUBOarrxQPGgceNxYhz1pFK+W/boHqnxqcRnnx5sfqYbTgM8oTds+dyNVtTJUsQwoMZ7hjYMD4AII+qdIWBy2q+IBfK/WVC/M8KE+bUm2diyujLwQ95+3a1uSowDUxWUGrg8o/6LeEJSDCFmmEsjmLPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Do5XSKW/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EjPd
	SZN2hmK9qO+VNqttvEI6BshE8XfK0xeJRa0IUvs=; b=Do5XSKW/kK6McdcYyOof
	IOLvi0IrSTQIJ3lDFZHdsroel8LMU0i1o4HALYs7Dp2UOdgCzsZQ1GBoy3HqBahJ
	2MfenQPwnQGzCM61sZbY6L5e4S311qZgpjB77pCZpyu6vIwo45bjCBgmNemMzyZg
	kzmB71ATyO+jobP9loBLaL1opCtuyHeRJRmu7RNHLFL0Iih7Xcm3zS08s8valWyK
	3kNfZcm0ewR8opuQ+864SE2Uk14F/nb9vJBUZDQK0VH5+mz9mI33N/f8VZq8DHPc
	ykn4EKRGq4Kc3CirF9BOPhZxx6m7uvpdKF/gNEu8srfpOKJr95hIRsqHCXDHBsFo
	CQ==
Received: (qmail 218467 invoked from network); 27 Jan 2025 12:30:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 12:30:56 +0100
X-UD-Smtp-Session: l3s3148p1@oY3paK4sos8ujnvm
Date: Mon, 27 Jan 2025 12:30:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Yury Norov <yury.norov@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5dubh2mVR9vD0Ws@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
 <Z5Z06WowFspmXby9@thinkpad>
 <CAKwiHFjM+H4ZQ5MjY9FVaHni3XiWnMkoVM8na=KPfHN2Q0eWTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b/hMV8ZJr9tNtuk5"
Content-Disposition: inline
In-Reply-To: <CAKwiHFjM+H4ZQ5MjY9FVaHni3XiWnMkoVM8na=KPfHN2Q0eWTg@mail.gmail.com>


--b/hMV8ZJr9tNtuk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So when I saw this, I even wondered why it needed a comment or
> reference at all. I thought table-in-a-constant was a standard trick
> everybody knows.

I wouldn't go that far.

> Isn't "The constant 0x6996 has bits set in exactly the positions
> corresponding to four-bit numbers with odd parity." enough?

As I wrote in the mail before, I want to aid users who wonder if they
can replace an existing implementation with this generic helper although
it looks different.


--b/hMV8ZJr9tNtuk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXbm4ACgkQFA3kzBSg
Kba2Kg/7BZ6VUzBV6uveLQVHwVpxPZ4YQWeS32XeC2dwnCOY0QLIOt1yardHOoAy
xVk0TL3v4inL4cnvgr7Dvg5C84IYQwJ83tK2/+cXe9TXS/EY0aP7D85plSBfm+YS
uJUx9wXHYLsKY5QW6A+KOOXaN+s99qV/Hn4b06le0V+7yLnlQDzvuKqkTJFIKp+N
FxlUkcbzKrgqGW7QORh94t3vYpMiuaM8AT4DFbfTMnZuDGoFn9zqM2tWg7Fzz2GJ
G/ivYFbdo9OJ3EPee4mCPv7jKue4ma8dwpsiJbtYlzb5ONb27IbLxZqr8eP6hvBc
y0ttlzBrzU15Bn1vwW+YvbwRfF0+U3DDXu29wu7VSJ17OCpVeWs/WFBi9KNm+uhn
5/DXGl1HdTnTNhEAHJCrrSDIBRzJhPejLAwE6Gns1nIT7ixduoGgjUCEbASlUK6q
gexZbBUbElETP4kgSG+tuwVJn0LYtlGFqZUZGF7L+g1pWf23k3PTy+2syNPdj6H1
CJpS2e7SfehLoLQdLae6hC2uQ4PYHFoHpb0up8qZGzA9ry/W9u0sjCXbNQ1sWnzV
H+gTd14Bf+IxNEMU40y33tVRkZPZammXLHFWaxwCg3ySedMVU/oT80EpL1+9d/rp
+VAgRt2BJrah4ko05CSgjqlxlsXMH3ep2VclbZZKL7V1/g5hoyg=
=WuZb
-----END PGP SIGNATURE-----

--b/hMV8ZJr9tNtuk5--

