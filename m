Return-Path: <linux-renesas-soc+bounces-23334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A6BF2B78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 19:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E35134BD90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 17:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86D61EEA55;
	Mon, 20 Oct 2025 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5cpivVp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D983A926;
	Mon, 20 Oct 2025 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981435; cv=none; b=Y5Bj48qcdKpAfJIpPmkzYIb4NnLrI6koB2p5gW8Vdlpeo0DCRR7GrTSRH0/sV9aLqAFt2uU3bwtNgWgevahbY5iR6o/dqEBDFJMS0NSHuEEZaqwBP1O0a3G2n2Fr3KpKbb1z33hsCZ762Dnga0HVUv27wane4EWY7pou+2YbbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981435; c=relaxed/simple;
	bh=j1YYlwvZJcHj3cRypJW49aARjh1abXFYf74hk2SqfvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gtl0i+PWz+8vvs26x9eUJe3HnRXBW49vHgE8Jo1xzcXROZKk8iRgJBO70irF9Nm/jIgnezDHZIp1xWBVcOfhgziiffb5fq8HXNEa4UtmY0NbLpQsu50Vppo5es4HHTSReAuRzcy/6ZRjcU0XtSQZYOvx1UMedoN3oaifD+7I474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5cpivVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821A5C4CEF9;
	Mon, 20 Oct 2025 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981435;
	bh=j1YYlwvZJcHj3cRypJW49aARjh1abXFYf74hk2SqfvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5cpivVpgWMuClQFbbF5i4A5x2SZJX5tpGoPlmmQ4DBWAXEJLDHjehrnbYfYlMuSP
	 8WX7axy9a2VOBkpd28GA24JngncaurJDCSyFLaBmX0rGtcXZ6E04avpv2L4OvDXttf
	 j8cP0n0cVK24SfhACuoVMhS2OOVQWdfKJmqBhCJgacowioHIZHqtycJQMWBvKBKHV7
	 ywTLw7rmdgSxeN7+neYTUN8AO9zPvgRQpxVUytbfFhKyIlyZPrJqvC/b5nzJcxRhWl
	 3HYkK5Up5UPBkEMk3/lLozkiMyrepLHU1T76HCQuPApY3IurwD43Q72SE6b5+uZmgd
	 eJDtx5O95XzXw==
Date: Mon, 20 Oct 2025 18:30:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the
 allOf section
Message-ID: <20251020-deserve-tipped-fbf75a0e7612@spud>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVNoAyQTwvsLjUE5"
Content-Disposition: inline
In-Reply-To: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>


--TVNoAyQTwvsLjUE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 03:00:59PM +0200, Marek Vasut wrote:
> Rework the current allOf: section such that all handling of
> clocks/clock-names properties happens first, and all handling
> of power-domains/power-domain-names happens second.
>=20
> This allows the allOf section to limit various GPU models to
> matching clocks count in the first half, and apply the same
> for power-domains count in the second half, without conflating
> the two limits together.
>=20
> This makes addition of GPU models with different clocks and
> power-domains count easier. No functional change intended.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TVNoAyQTwvsLjUE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZxtQAKCRB4tDGHoIJi
0kRoAQC70QJpZNmQzWYCj25MA0DaOEK7Tqn0OizZPOjwMtu+/gD/boMVKbDhI6jf
r2UD8AMHhsO2/IE8GGzp8eD9r0aoywU=
=bmSF
-----END PGP SIGNATURE-----

--TVNoAyQTwvsLjUE5--

