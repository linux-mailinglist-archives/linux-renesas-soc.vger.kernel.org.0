Return-Path: <linux-renesas-soc+bounces-3318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489386ABAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 10:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 861361C210FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 09:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6824364AC;
	Wed, 28 Feb 2024 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RJFBnZ67"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02811364A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2024 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709114054; cv=none; b=PcFbG3UHId07GWPPeijbDwc2p7pfkQzdb7DbK2hKhXZOt2n160vF5XvhmvCqM9HPA+XB0ePblWXMacBnUY14vwIGW5lyq5x53nd6s0bSHiZG5m0tQ76/ZS2R76j+8KBKdtJJcWmeXLQstNNkRa5ZgyzBqYFftZ/S0fjOcz2mSx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709114054; c=relaxed/simple;
	bh=q6TIO8YxEJj3X9BD2uPV492hRKsZ2KXK71kcVeU8lkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDv96EqlJubMPcg4RYoFZlCZEsk7K7vNPzMzHOmFs1Iz/KeODFz1fk7+ReGCPalJVVSYptER4RBlZ1fP0rsFlO7MQquRfdL/Fh92khl5VPUpIsRiBxI0cRbC+yKftaBioTZ3gj2FujdrDqBlQAMi+ZswZtlxAkS1ld0jlyjauMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RJFBnZ67; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FXk5
	w+wEO2tIl//8GRvqZBkCaV0Jx+nisdaOxY3Va3U=; b=RJFBnZ67b59TNbiWJCCJ
	tuiko+wFFB9XctP6gtFbtFp8aamovvfmhyQflcwhhTITwgu6gIV8Ubsx+SOlBR9v
	r9TVDKU8NhuW+rlkFRJOqHjkIf86xAyJ4HzFxIrnIdlKceWQ8lTHvEZDW/Ipwb3X
	0QKuD1yusZ7EWBf/D2WTc9AwDgBYq2Mg6XMfFgoo5bOUEHUAuReLg1aB9Xd2kfvN
	IyUy/nvfMlbz/vbVoF6ReLWN+LFb/QGb9E8Uly2IH7TR8B+pn64msyonksY/YZzE
	dBnwkDWypKQ8xzUrWUFrNNjBRfKGOhskf6/rIa9adD+Fuc0t3pl9dRY0St1l/UNL
	kA==
Received: (qmail 1903704 invoked from network); 28 Feb 2024 10:54:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2024 10:54:03 +0100
X-UD-Smtp-Session: l3s3148p1@SvxtH24SorwgAwDPXyvUACsbJ+4rxOVH
Date: Wed, 28 Feb 2024 10:54:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] [RFC] mmc: tmio: Protect the asynchronous usage of mrq
 by a lock
Message-ID: <Zd8Cu_y8nojPklXr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20240220061356.3001761-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/4ogms7ivIXhIKwZ"
Content-Disposition: inline
In-Reply-To: <20240220061356.3001761-1-dirk.behme@de.bosch.com>


--/4ogms7ivIXhIKwZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

thanks a ton for this report and RFC!

On Tue, Feb 20, 2024 at 07:13:56AM +0100, Dirk Behme wrote:
> Analyzing the KASAN report [1] tells us that in
>=20
> mmc_request_done+0xcc/0x30c
>=20
> what can be resolved to an access to
>=20
> mrq->cap_cmd_during_tfr
>=20
> in mmc_command_done() called inline from mmc_request_done() "mrq"
> becomes invalid.
>=20
> In the driver we have two work queues, tmio_mmc_reset_work() and
> tmio_mmc_done_work(). Both operate on mrq.
>=20
> Synchronize this by extending the spin lock protected sections.

As discussed further privately, we both see the problem but want to keep
the critical sections minimal. So, after some more investigations, a
counter-patch is coming in a minute.

   Wolfram


--/4ogms7ivIXhIKwZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXfArcACgkQFA3kzBSg
KbbPBhAAjXioApUy0nRBeYV2ExfmIzjZEK+h4Vjv+DZ2KM0xNoq7oTqMp39MR5Uv
uM/tBitwlnFsS2xaln1YdvhCJZq3Uh8gkU0mGCqKOTGonaS/tGdUVJr8n70WmWbG
9lCj0YjSfE0cYPUYtm4YH/mJDqzZpe40fuiRiLt0YPJ+KLhJld09TjHtjTJCh0dH
Zj4gWIAicbxRlIyoCur06nugr26dtjFNMRaoy6pBMtWG2gMBedLchPg+ppPMGzb4
ju6fQVhkMEPMiu5sNFQO066LT+O4GZi50v98mNPjLqRrnyv14Tp/MmOjvVO5jXVo
Abl0Ytuq9chjEC8j3skxux8lnDSH9VjXEc/HFMvKtcBRvPB2laIUJp4fc7n0RvQs
4LZNRvqOuaUrbu/Cwi+UG21O7AwZgGVIikck2dpN2k3MF8gpFtfyVbiyeHImFAE6
ilCsNjH9UEYG48Hvp2PDZZoH21ixxvxB0QfEM2AicajGZ+iKaKSeS34WreksV/se
io/fmxVIojEmGAguGoPLsyq27i4FGO0TfRUl9jKZNHHlrtZfrj6bt+3CoWStkFTN
lES0UADXIXc5aGKqiTq0sqM/p4ye84oMTDw9qbEb7wF2AhuQPY4uXxN6hKFXEWsP
PD1W5Hkda4kOxOSbNqtDkDQxPMZ9J5uejSy6Hfn78xP5NTtTa+o=
=daYr
-----END PGP SIGNATURE-----

--/4ogms7ivIXhIKwZ--

