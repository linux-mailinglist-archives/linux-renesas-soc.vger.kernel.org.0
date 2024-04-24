Return-Path: <linux-renesas-soc+bounces-4874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC48B08FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 14:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6686B20FBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B4915AD9E;
	Wed, 24 Apr 2024 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hby3XIFN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C52158DDD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713960765; cv=none; b=oLxTXUYdP4YPWHbygsJ+OBAXLPsZ+m+u5mziAEuHMxZGG4/eqDXyqhTGj/8UKQwQesBri0Yg8MgxPXPgHDMfHVUTnlLR+0N/DeR0N4wrtbXCM1mS8S6foQHHIno7GEjIPymj/73TDrf9q1taoczdw/Ssh9YK+S1gJpFr5XrCZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713960765; c=relaxed/simple;
	bh=go0Wlt2KDYbr/eDTCHpWHqFKUnZp04LMK8IkPC3j20o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWfOGNBKw2QKZl8ZIWBkVnaYxvNumC10XQaJZUWrjdIbDX7al6z8KShq1RdUk1kmBMAG9ZkMmGiMo6w14jtkSYlOcRrRvd+jfkC/gWMRICXZitKQ1IkSxorR5xmeGo/1ApeWAMPXVmtdAjWC47Jr0VOK+gi+0ZIMs1Ci+qk6EGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hby3XIFN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zXcw
	t7nu5w2SdV56VaduDqEIK2jjgJcVX+7bKfBGxMY=; b=hby3XIFNY3l1OYZA3oAb
	Dg6K7cz4mAgmTskxQ1q6J7UhyXKG7bOYgD/yvbvDPh8RKvFcym+Y05qBdAk7PZ65
	028CmMQ54ts00F+2g9XciAPsKJDHUb2EdcdEUUx1nvbis+mU4AEvagoff5eGNP5J
	z5JvPCge05jWM178W91H02arbcKGWa4zoDG3kew+mUGezMJZCQ/hm0xs3bOP09ZX
	e3VN3Yu+6NMtvvbrIlGh7p3NqdNjAqhHHrTdWVeo2dGS2gk3d6AmWZ+K5vh9PAWZ
	essTAD+RNiWYMtIpWCIsDKt8q+2VvvjPGOA7VrCvHVhZWeV5TMAY1kL1n91zqoNI
	hQ==
Received: (qmail 557726 invoked from network); 24 Apr 2024 14:12:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Apr 2024 14:12:29 +0200
X-UD-Smtp-Session: l3s3148p1@OOuildYWFq0ujntt
Date: Wed, 24 Apr 2024 14:12:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Message-ID: <yxjkzoctsagjswen3i5srvdun5mllvf4l5smtqycgeu5gb456u@yzyocxv4svrx>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
 <6fcp525uab7fggrkoftpz5bjrvvpza735wnp5djzuab3hk5zte@vgk43d4ijbww>
 <CAMuHMdVH9LnDHtfhCYNKPPUTSp1rRG_fX70zxsF1qWUiZrPs=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="344qqrimb5uudcpa"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVH9LnDHtfhCYNKPPUTSp1rRG_fX70zxsF1qWUiZrPs=Q@mail.gmail.com>


--344qqrimb5uudcpa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The timer is started before DMA is set up. In the unlikely event of the
> > DMA setup failing, s->chan_rx will be cleared while the timer has
> > already been started. This is in deed a very rare condition.
>=20
> Or when the previous (still running) timer expires...

Yes, ack.

> Note that DMA is disabled for the serial console, cfr. the check for
> uart_console() in sci_request_dma().  For testing, you can just remove
> that check.

I didn't test with the console but with the other debug port of a
Salvator-X board.

> Also, plain text typing (on the serial console, or on a getty running
> on a secondary port) does not trigger a DMA RX transfer.  Pasting
> a block of text larger than the FIFO size to the terminal should
> trigger DMA RX.

I dd'ed random data to the port. '/proc/interrupts/' showed some DMA
triggers but no indication of that code path. I need to recheck.
Probably my fault somewhere, but I need to finish another task first.
I'll come back here after this.

Thanks for also looking into it, Geert!


--344qqrimb5uudcpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYo9ykACgkQFA3kzBSg
KbacqxAAlTXnctYqqLGKFiw6rxZ4Wh1m/EUHLhSY917Rn6VOBHiT6W1t0bqwhdeu
RfZ3huC0keCunjK9ceDs8/zi7DHEJnQU1ioPxoBkdujiONpZs2YfQ9121ADh8buB
bYMkMYfIZUvs01Q+YpGNEKzf51ny0q6gUZN4hr27CaQd8C6ctVa8GEp0knjQBubX
VKaqteKD4AtOTqSEZreoRHjQIyfszjR75v4J/LAEOpVLIziIi4rI6AWAqXR6STYs
YlWorrFgb0e4OSdebAMc5tt3OvItExtLl4d7CmzSkBgfuCkbyweLnwCst5rLz+Wx
4HTx5/iRimsqEfRwj99wR8qrgT3ygLqn3ZQo+jZ+hOGvkV6B9TYBjA5GEpWem18I
1PGWv6qu7QhCrpDqZLyUEA+QFnxiv7nRTuxuo4sdr1ky5UeI9k3gDdAPOLAcsgBE
9cS7AMekx87E7x6FpHnvdO92uleIgn+x6+0XmYjKiM/bPzvt3jrW3IZuQ9qzr7H3
zyEVdqEaeHNn5QKn3HLk6rH8s4Mw/+lKUI/Brc/M0OuOhv6pXH89sjgX7lZ+FQrH
2FQb+txH0EtN/Koi2+gbCg7UFak0edj52+O8z1gKjdAnhrFEr2b6Zus+EXbZbdOe
tFpsX7ISAsPkUW0aH/VGql0zDLFptgHHmyyRbxH0xaSrz7dRVuk=
=XMdL
-----END PGP SIGNATURE-----

--344qqrimb5uudcpa--

