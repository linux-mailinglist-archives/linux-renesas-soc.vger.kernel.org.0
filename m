Return-Path: <linux-renesas-soc+bounces-27940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IP9KMp7hGlU3AMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 12:15:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BDF1BD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 12:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D1873002D2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 11:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50FA3A63E0;
	Thu,  5 Feb 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHPX2Iru"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EA62DECBA;
	Thu,  5 Feb 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770290116; cv=none; b=HHP995Dmw0wjaIYaB6X6COjw+wvMJZZZFoDRsFXsp5+SU2MpD+JImAxAR9ociCuCWDyMQyytuPc0SyJgUIxKT0D5ChrEAPs37AdJj0f1R4Az2yBHtZ5OOFqJnFVupQvw3Ljq5954j1qqwLVZAZWalPMUFEsSgxOrKl2J+xn+WU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770290116; c=relaxed/simple;
	bh=90rJI2I0GWWX6P4dhbIklArjDfuQ/kBmEM5Q7dfGuqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaRUUzX6X1CXU9yriolH9kzmfh+gVPK4dF6A+7oHkz7iHSYgqizGNw3XhH5yHqjAhlMBFWSUFUAIFrSWIh7Cuv46Cj/K9dm/gK49zYFaiCbC9ivK0YBQyfwBXsibMvg1BWEM+6CcJo1GHc7eAiDyMUH5ssybYZSAifapZ6BpfLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHPX2Iru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE917C4CEF7;
	Thu,  5 Feb 2026 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770290116;
	bh=90rJI2I0GWWX6P4dhbIklArjDfuQ/kBmEM5Q7dfGuqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DHPX2Irus9gKoZGGPFND8XCPfowKkXIgpcmur13lEER8xtL806fbq9gXUDCLGUeEl
	 ZgjJxN1lW9LvTeq1KIh46GME3o8IxOWbhDfcHDNqfUBUlYozIe6W/XE3F6pOg65aDx
	 KRZPMVzqEannbLrWsvul6yng8E7mrTQvdOuTmgA7SQjQgvj75u1/xDtB55hdMAVFig
	 luD81ydQeP7DXFlK6JsvhAA1Aj/V2kEFlcO/smSS+FSJKs+wSOLUIyvbT5jzRK/rL8
	 8fljfPPBjgVH80Bwc5oBBp1/VvQU0Sp3iuYLlGDwi33uMjELenGozp0QjXM30qmlU3
	 IaqPcOsKDgF3Q==
Date: Thu, 5 Feb 2026 11:15:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/15] spi: cadence-qspi: Add Renesas RZ/N1
 support
Message-ID: <ffdf1942-a675-4b33-8d3a-ffd5b6a4d041@sirena.org.uk>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
 <176968523282.21695.1970063208785534195.b4-ty@kernel.org>
 <874invft4e.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/oOXtLGEidV/+ag4"
Content-Disposition: inline
In-Reply-To: <874invft4e.fsf@bootlin.com>
X-Cookie: Non-sequiturs make me eat lampshades.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27940-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: BC9BDF1BD6
X-Rspamd-Action: no action


--/oOXtLGEidV/+ag4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2026 at 10:16:01AM +0100, Miquel Raynal wrote:
> Hi Mark,

> > [02/15] spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
> >         (no commit info)
> > [10/15] spi: cadence-qspi: Kill cqspi_jh7110_clk_init
> >         (no commit info)
> > [14/15] spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
> >         (no commit info)

> Git was actually smart enough, it solved the conflicts without asking
> during rebase :) Shall I resend these 3 patches (+ the typo reported by
> Geert) updated after a spi/for-next rebase or do you prefer to wait for
> next -rc1?

Sure, resending now is fine.

--/oOXtLGEidV/+ag4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmEe70ACgkQJNaLcl1U
h9CBdgf/QjDIw5SxCx7/vPCcx3EmuUU27gUZJjJrkjnuVa2kPfTdpdqAv2SzO/vC
yfWxeDdbfQ4pSI5mHlXHVeRgcLg3m0Hwc/CMF/wR96NgHfZtm/YJBPMNCFMUgRR/
xF44M8vJ42KoTMnQu+V6w5IM2Zgzwk6O6VwUJnQSWrzfb5TpqIXE4yQfovKXrpcp
ZJRP3KnbzW06Te5GcZ5gr4GvCUbM6WsPVJZGCSjBVE/lcS3Tzxv+FE1d+k6XYaXy
uDGDYlhWEtTQEeWPCf/0hwCGtqGt9lkUyt/Ma36vpmsAXsQbJfJIUppGymMH7Dic
kd7CxmdgDOTc9qAS3UOP8ZVuEgKO3w==
=6BAm
-----END PGP SIGNATURE-----

--/oOXtLGEidV/+ag4--

