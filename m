Return-Path: <linux-renesas-soc+bounces-1782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF583AA83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 14:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD471F2B161
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133747C0AD;
	Wed, 24 Jan 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6e3TRWe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41BA7C0AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101173; cv=none; b=dWBUqb8A81IuDQfvJ+Gb8MnMDT/Ja6D9S6zbxZWUpK90jXUeQbRYMveQ94Hkqs/Q7dsfLjVyIRdZl2wnmbqeAghrDN7a/ZHq5BrvtvMEkN2vjdUb8YnoqaG18HWCw3R1NNBay6UKqAanECmvRPXUbYVqyY2MFMpu0gFvDyZE3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101173; c=relaxed/simple;
	bh=IbBDrJR6Z1wGaqtEPwMapse+hDunma+RLoakQbmbVjw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPfYT8wKTm8TBkUpMJirq0ahHG9ayz+loydyBTbZX9yLM7Sze14Zsp5Dsr87EikKt2zvhqtOhfqY2l0LMZaFop1D7CKB2Ssx1lv5fP6PkNEzrcYi9DEHBztbqxHGDJGKNREW47ATSOGwaxiLW62+ZnTSD6eOakKkkr8hi4roCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6e3TRWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457E4C43390;
	Wed, 24 Jan 2024 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706101172;
	bh=IbBDrJR6Z1wGaqtEPwMapse+hDunma+RLoakQbmbVjw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=u6e3TRWetFbQYEx7U50qM23QTD42RbD222777F+fDBTOZO/H6dyYgaoKCYz3v6jPa
	 3eO/GMgLwZnS7kTMXgfj1O3uUw9nIE6FPmAbcwpWDgvM3hZhNMf77X+OKAXyZV/b7n
	 ycuB8ZkUqk8iKOguYuwNEQh4SZhI2fHs+dFgc5SMqNjhWth0IK6NXJfC3XLgYD2s1O
	 SyszgTFR6EMqtyUAHD85JxlhUz+l+lECZn2iqDckTRnCFyq+9kX7o16hzlnOouaI/c
	 xDQ5dLMxvXjmLWQEnytjVusC6Za8OIaDFrylRDGTPo3ozkCnp5IeuXQdlZTwuhOoDq
	 X1e4H8s0OHaNA==
Date: Wed, 24 Jan 2024 13:59:29 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 5/7] arm64: dts: renesas: r8a779g0: white-hawk-cpu:
 Factor out common parts
Message-ID: <ZbEJsTKiyu4pBFm3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <e9a9f541870450652952bca2b50603f9f8be940a.1702309604.git.geert+renesas@glider.be>
 <ZbEIKRyd82rMPGuy@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oC0ZsM18TqZFv08N"
Content-Disposition: inline
In-Reply-To: <ZbEIKRyd82rMPGuy@ninjato>


--oC0ZsM18TqZFv08N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Why was this moved?

Other than that, approach looks good to me.


--oC0ZsM18TqZFv08N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxCbEACgkQFA3kzBSg
KbaCWQ//XKgxem6RhILdkIQ80t2CyfK+8xRTGxL7bNQE4o1jCjlAH64enRyJZ0xT
/QL820NXXrnaEIsVmNNddb0mCIX4GYjJwVLMfDbqJqPF7HAxuoQb4vXevPpSd8vZ
j2dUUg1NrSSZPOb03aY08HPgzBtvJwWaJjxLX+qT6SYCDu3Dp9K7fv2yZW9yphoJ
OP9mz/e8r8ardCChGrDWmN+p3ZHYlF5WGmOV07Kdlqm3MkV6lVevBKWyiGOK3a1G
u85kAi8PsDGbBbaFlbdzJv6n3wBr+AvtHnJGH/6mB1mgU1xYN87x8B0PBsVYhQ50
nKBjoQ5KTkwmrdE02g8GX3i3teO4Xf+cXOBzH8eQbZXys/VyWbhKpnFPprl4aEOf
srEta12hjl879d9HhXpmDhKxac/FhLac5kNf1S+bX0vAKCUKW+BXnQgVOvNzwpRf
F0EPGNtv0on3mjimKO9rw8EdXyqXSZEjlQQGvhTqZpnNUrE6oLcfW0tV47F6gDVY
KSMOJpu6CVsCEgC+yEERrdOO9NlOJOsyAhl2g5w1L3yggm8IPyXEspe5JqJEj4SU
+ST/9X3lA6B2u7qtLMOo63HNut82se3oKGSYC7HfVvVReMngEb93LMouO9e3EX89
1TY62VKyoMBqIAHbG3jSbGzIZhAH+LRHsxxBagPBGiN45FxWGPA=
=JzN0
-----END PGP SIGNATURE-----

--oC0ZsM18TqZFv08N--

