Return-Path: <linux-renesas-soc+bounces-5924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 423858FE60B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 14:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9105728750C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 12:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F5B195813;
	Thu,  6 Jun 2024 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsOjvGcT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1013C3F4;
	Thu,  6 Jun 2024 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675539; cv=none; b=EL7GB/5b7qax4OIDQris19kA1/k6r0t0y5kOPPKPIoGDJYI6MdbkC5yR46yJ+1aMb/3RMVWyDpepcYPZn0Dz10SNdxHpHfMojkCvIWDJEsPKQ4wSSMg7I9d/xIkRJ0grE7mdtOF7jFmHJi15Kl2J7CwM3+5jYcejZ0cpsLMcqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675539; c=relaxed/simple;
	bh=vo04VGdNJ9fq7X8QtlYEzJoyJaGM71TN5jI3iFBYjAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=no+uMXKnTF1GHqwuSdbVo6NzFni6b+vwFIp6eAzRZKTX60kNXTnxfFqPK/DZ62p+AMW605Oj9rVWfpTTjPN5FSNqY80OZTzmZuW7IClenydynBVc6JzV24B+OKLoRbp8bMeJPurEyQDfRVuqHKLWxlcDqFH1KKslWLkefpx1cCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsOjvGcT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F373C2BD10;
	Thu,  6 Jun 2024 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675538;
	bh=vo04VGdNJ9fq7X8QtlYEzJoyJaGM71TN5jI3iFBYjAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsOjvGcTV0S20I02LeeVmdqmU0E6U5C4SmN2X2Dxg7LcsN3fQs5EOO2xREgykftek
	 uM1RwIhthtkPL6yM8INVQZ3mxEin/y4CbBFnUMh54bVE3JvrSfst4UCJfjNyu/WRrF
	 bzvYnFRyGBdMzyhlQud0ieXDUWwL4kOXSeuhr1JJ2CrFPwj4XEnQ5sInNprP9AwExe
	 5LK7OJIyacAV0ksdc2MHeYby+Od4wYAUfLg9/uvu44BPRKhEN21vhruJecsagNswhP
	 8zx2sF5r3Jj3jtbxWe3oFF3fXEyRsry8wFlI7/yDzXesRUYPfR76Nu6xiE2190r4MU
	 /4Bz5+ggejW/Q==
Date: Thu, 6 Jun 2024 13:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH 1/4] regulator: core: Ensure the cached state matches
 the hardware state in regulator_set_voltage_unlocked()
Message-ID: <22664e29-4c7a-4544-ad32-25c3d7e342e9@sirena.org.uk>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wn7S9cxDJrFLWxbv"
Content-Disposition: inline
In-Reply-To: <20240605074936.578687-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Simulated picture.


--wn7S9cxDJrFLWxbv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 08:49:33AM +0100, Prabhakar wrote:

> Driver code flow:
> 1> set regulator to 1.8V (BIT0 = 1)
> 2> Regulator cached state now will be 1.8V
> 3> Now for some reason driver issues a reset to the IP block
>    which resets the registers to default value. In this process
>    the regulator is set to 3.3V (BIT0 = 0)
> 4> Now the driver requests the regulator core to set 1.8V

If something is resetting the regulator like this that's a problem in
general, we need to either have the driver notify the core when that
happens so it can reconfigure the regulator or have it reapply
configuration directly.  Obviously it's not great to have that happen at
all...

--wn7S9cxDJrFLWxbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZhpgsACgkQJNaLcl1U
h9B/pgf/U9GUyfyKf99GtjHy6TsMmH6pC6aP4sdbFrkkuRvcg8XDzGqB/lFNcQd6
TWOA0kydF00JnCm+RJGlTvgu+c72kbFLwcSPfHLGnEOeutyz+ozkOHLM7oHsEiBe
pbNoT8wKWiK5gqxQJJheCqZyFdLVzARyJeqNbiehDNdPl2AzcC61dfMi/PNqbY2Y
yICxjX4aXKRq1MzZeKfN5sN250F20CNUQE1K+x4Lpg16DhwlZnIqobophE66wte7
KlXBR93ADAvKja28SqoTaOR2xTq/caVUQurl/dGYuMIgIM1Gfpi3IhyDmICfZRHl
v/OML0PmwVuUZXkox97kbwmVBkLtXA==
=FsHa
-----END PGP SIGNATURE-----

--wn7S9cxDJrFLWxbv--

