Return-Path: <linux-renesas-soc+bounces-12533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B9A1D126
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 08:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB443188503A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 07:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB3715A86B;
	Mon, 27 Jan 2025 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fWtHd4sV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB625A65E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737961427; cv=none; b=iGyMKeh1iaSL5lveZgb5Cq62yv4yZAGQUqEHjzTATuNZj+tw2LqycxkvEi8n5hurn3vwd3QtQj4oC8AxqZhqbScDyeEL5Sk6Nw3nU3ZvICtw7vhel+OGsN0iVYFu0htTweS+9AC8sYYL31GrYPm6Ft5D6D3nKNwKq5WAkKKgujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737961427; c=relaxed/simple;
	bh=DPdlkHkOzioW0twApfx9ejXbGU9+DDpdWWErVvfSyKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJYf5V0+Yr3eVonMEEdFey+CA+SjPGMJqkN/OhzeknI0GWC+11MYMJ4HPrC6y/p+Vb/fgOPjVq1Oc1DuchWW5WepGPgW1uwkyayrQox2Kgg004Ra4NucstJsB+cdc6wYBg0sbBgfSvZqXDYIQbeGehqNHE3YrDxQ2dhJkaWuo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fWtHd4sV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=87En
	hrZo7Qa/72pjP8z/+2LrE7B1SU0Ie4Q/WQB27po=; b=fWtHd4sV8/dlZyEP7aHn
	9SL6bLV1d9CRC2UKpVHA6s2y9rU+D1HMGg5NZ2kzyEMm3hYnNevnDiqhCJPB6EyY
	OVwsRdyNfqdmx5TkOMLyxtg3g1nXeMwXhKT62xQEEG74oiZT0Fi9dMi3ZQ69kGfz
	bmIxIJEdSiWFLfXcLYVWLhg69YkQwXJrVQIRkWyPdaV4FWg5hFZLK0ezEUJ8+d4B
	E7qG/NHqmifvZNlc9DsdMGqCGAa1tFaXISfLn3/jDucCeQ0FSW5K9dTdQ7k7fGOM
	HvQL4EMIyaej2lz9NayypNZXpC2mzF2XfwT6KWToIzFX6u7dsUX32qVO2N0eVGEH
	Bw==
Received: (qmail 137716 invoked from network); 27 Jan 2025 08:03:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 08:03:32 +0100
X-UD-Smtp-Session: l3s3148p1@lv6grKosWuEujnvm
Date: Mon, 27 Jan 2025 08:03:32 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <Z5cvxJoXVP5QqbEH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <3c265d34-9442-495c-a715-be2eab3b37d7@roeck-us.net>
 <6da29214-9ea3-42af-9ec1-7ed5a2da7bfa@roeck-us.net>
 <Z5YgfT1JhhzlLdeD@shikoro>
 <abe834aa-4989-4480-9f68-3187e0d113ec@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mga82SdcUslOQk/u"
Content-Disposition: inline
In-Reply-To: <abe834aa-4989-4480-9f68-3187e0d113ec@roeck-us.net>


--Mga82SdcUslOQk/u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

> > Your patch is definitely one solution, but give me a day to think more
> > about it...
>=20
> Sure.

So, the results of my thinking further and looking at some other debugfs
handling resulted in: I think your patch is fine :)

> In this context, it would be great if client->debugfs was cleared if crea=
ting
> the debugfs directory failed. While debugfs functions check if the dentry
> pointer is valid, that is not the case for other kernel functions. Knowing
> that the pointer is either NULL or valid would simplify drivers (such as =
the
> PMBus code) which need to make that check.

Sure, we can do that. Can you add this to your patch and send it to the
lists? If possible I would like to apply it this merge-window.

Thanks for your efforts!

   Wolfram


--Mga82SdcUslOQk/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXL8AACgkQFA3kzBSg
KbZIfxAAqAkLM/yDOuisfIXfZNqQfKPvX2JELulsKgeDQyp2sB3ppv9UIJVF/8n8
Egv1f08SXZbj1vxzftV7wEIGRPdXmb1ad+XKgqjGB+TXXlZS3Q/JM2qrDEa8zane
iwfcddlqJXZ3LEMts3zoam8d3/0z3KA+wtaW4RTndGvshwTZRYOaldqRDfLJVaow
Usl8SG6LEVqea8/TGuZbcpPRelns9ty0JeY67BY+lS3UkNL/3XtrR/lvYxyC/xhd
k/qSk/mmFOeDtF355VlDlAv4F1XdFCiUITi8f9E2aibUySqFCuZp8AgtW/ef75Ox
Q4MYCku9V464R23z2panvoz/VLX4DgnOP/lJkNxsTreH09i7jdqo9t4VpybuuSqN
bfB7gIrJ0jwh6ZPREtDWWAuiCrkgeaJDjvVkpYwL1Re6JAHZ92d7x+RI8AnaEvs7
llvcuaxkAow+CbsyULKb4+JY9BOz8zERIedpYmEpewwAOd8T6AzwNU710ahx+mrE
1DnBIUwgswWvLiU9r1V9gOSIJaDuvdxfooxcjwdmWjc7eVg+e0ZnGqroYIhHtwqT
NgZnYDAd3nvC76rtSvEKkoyKN/II2oExWQMH4AkEi4fcm3H//GZns0iaVpedKgJh
BmIR/K/pEcHxTM/aQ/l3b8IrujcEIfXxGTDWQPAk/2TeN29ND/I=
=sw6U
-----END PGP SIGNATURE-----

--Mga82SdcUslOQk/u--

