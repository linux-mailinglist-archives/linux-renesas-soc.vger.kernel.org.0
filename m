Return-Path: <linux-renesas-soc+bounces-24739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5BC6AC0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 17:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8F463522A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541D629BD91;
	Tue, 18 Nov 2025 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C1NGi9dy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196723009CA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484229; cv=none; b=ByXDofTWWcbxaszF02OfaLohUqKxhPgNESokWQ1HOSNSWckKNB/IAtWM9rgogdOi1hq8g0V+sR36M2IKCy7UI7VZodamUgFAuNGsU+5BzBcF3Q6MnMfG1hYAy11Y/kXdEgxjbctmjXgbfDjJDlHLNePBogt/N96pTJwb6mg8+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484229; c=relaxed/simple;
	bh=kD2bTpskN+R2R0Ewmq1B7y1XuurZvw6bCxQuVndeNIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEb70grvUW1v8K5NMOb0XPZ31+5K2F1i7AaLha/rOdJssOLW9IHR7bn5GP8XtkvPpByIOViIrz9pLp8lqt2vNAmbVL4C1hlMbEc6pxAgWPGKnAOmAtbSdRoYBo94wF15Z+QdMYcTJQ7hJ37TIxlcIw+qoJWI/4GbAUGZNkWVVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C1NGi9dy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JEYP
	KkIFPPtzRatyt4KcwSJcyaTGpCaEAGFXugh3Jac=; b=C1NGi9dyUrWZm/AiII7i
	kGFK1uR5AGGURH+nS9j85MrEcymMQ9WH8osnyiKn+fXEyRyGZzSHtdlkPU1Z53kS
	LYYJ5yNOW26QyBi2xsxiFO+e2bNEZJImN/p44OZdy3+MJolfBS2R1Rb5Yms+8M4G
	7sSx5CZei/OLXQ9CU4ttRQ5L31pwywshZwBseTryGeGai8dE1DQJgbx0najJdOp3
	zwz/v3xk3qTs+A+dkBp6s8OwPjJm255pfA5c/yndIblCjuV9QnHXtIokEwEs6cA7
	MufB4utUoDB7M39eoHn7CRVEecu9UM6mLM354zRBqc3kXOl/tJytaQQn32zMd5+V
	RA==
Received: (qmail 3814294 invoked from network); 18 Nov 2025 17:43:45 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2025 17:43:45 +0100
X-UD-Smtp-Session: l3s3148p1@LVPIKuFD4pgujnsI
Date: Tue, 18 Nov 2025 17:43:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay
 for P3T1085UK-ARD
Message-ID: <aRyiQJsu6gob3Gf9@shikoro>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJLxk9yKi6A7ZHht"
Content-Disposition: inline
In-Reply-To: <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>


--rJLxk9yKi6A7ZHht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tommaso,

> +/*
> + * #define I3C_BUS_MODE_PURE 1 (for I3C bus mode pure - default)
> + * #define I3C_BUS_MODE_PURE 0 (for I3C bus mode mixed-fast)
> + */
> +#define I3C_BUS_MODE_PURE	1

Sorry, but I really think this is configuration and not hardware
description. The board has only I3C capable devices, so unless you
connect more devices externally, you can always use pure-i3c-mode.
Enforcing mixed-mode is only for debugging.

> +
> +#if I3C_BUS_MODE_PURE
> +&i3c {
> +	i2c-scl-hz = <400000>;
> +	i3c-scl-hz = <12500000>;
> +	status = "okay";
> +};

So, the above is all that is needed. Which is the basic enablement for
the I3C bus in general. I mean, auto-detecting devices is a key feature
of I3C :) Which basically means IMHO that this overlay is superfluous.


> +#else /* I3C_BUS_MODE_MIXED_FAST */
> +&i3c {
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	i2c-scl-hz = <400000>;
> +	i3c-scl-hz = <12500000>;

Despite this else block being debug only...

> +
> +	eeprom@1a {
> +		compatible = "atmel,24c02";
> +		reg = <0x1a 0 (I2C_FM | I2C_FILTER)>;
> +	};

... there is no device listening to 0x1a on this board? What do you see
there? Did I forget something?

> +
> +	/* U2 */
> +	temperature-sensor@48 {
> +		compatible = "nxp,p3t1085";
> +		reg = <0x48 0 (I2C_FM | I2C_FILTER)>;
> +	};
> +
> +	/* U1 NOT MOUNTED as default */
> +	temp-sense@4c {
> +		status = "disabled";
> +		compatible = "national,lm75";

Yes, mounting U1 is a hack I introduced. The compatible should be
"nxp,p3t1755" BTW. But as said, the whole MIXED_MODE block is not
hardware description, I'd say.

Happy hacking,

   Wolfram


--rJLxk9yKi6A7ZHht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkcokAACgkQFA3kzBSg
KbaXGA/9EN59HBrsS06XPdPvLNPi0PfCeZELC06Ja8715Afj/6NlSLH7itxgWsBU
mPO2NtrVJDaWz5ga+xDwr2FRF/mvLPj5c/sRmPIPQOKU7bpAT1nt+U/DHlq9mBey
/9WwKpfH8lAsjI70QRLFis/AiJav1V1X/+9yum2ln7i9gjh4oYM2n7LKME3QRYYj
XO0pGFplKOFClPDRK7Hdlrway8weQHSINxbYwsOkgtuV/9WBp1H0AjXMdUWt+DbL
cMhwsoF8WcWx585EWdsALjeiP5IHDOCft97uC49FuTRdG03xPDlJ116VyVbhG2qQ
4r1bW8PZHcPe2a43TqjHJeE3X4xZlPzv28yD8jA+1VZtamrz50sXWA9xmQDZSVOB
BBYnPR0x8ySHQdiJ17fYiv4uFlXO2Xay/zdoehtxTaEHUw9emNzuxX8xRoRC4SyS
cuWqGsf4PnTp/QjyZo85a+tj5KlN9UA7tCjO/RhfsIai8a4WrKCtMQvoHOgPqNiN
3+p2ppTKa22C57mKvv1MCRdaJe1lAzx24Zi2eG6kxUF8luqHj0IZWPpC91n7Qcgf
YH3MdMz5W8CwLOM5F20SdPGxav0sLA/jPB3XoJ9mGzm/03inXqpKRUpkX8EMacyh
NdXWL+Gwl48fyEKutAvhLywD/1MgNi+8wdGnNDNb+mayihNgEts=
=XTNw
-----END PGP SIGNATURE-----

--rJLxk9yKi6A7ZHht--

