Return-Path: <linux-renesas-soc+bounces-14364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BDEA60EBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 11:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10402883D62
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 10:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4B31F4607;
	Fri, 14 Mar 2025 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X7tJSFf3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC241F3BB3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947830; cv=none; b=mW935xL3/u2hkcEv3JKUL2AqV6FQzvFqisV4fi1y3VPZXtiFu9DgQoV354Ii9Vf490rePjV/s9aFD7ywsvb3KL9nWS4fI4H5r0QF0n72VVkDLuNg17erkaUd7VS6FIlyntLIx3vI09DPLIRjcatxweWrMZiPV4O1KHV5kXpqOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947830; c=relaxed/simple;
	bh=RwHUEFoZdZgr03VzPBr+9AJlrYW+0SA1AtDcxQ3ZAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bjuwhzi2Mf1LPfZFPAFhMSjA4nttnpxxYXtBSmLvWdismA1DaR0d/oLUrUjeke8zUBQApKNWJKwcmdbYijh2kXRu1q6G11wRzSQ4APiHDdBfjst2eNBVNuBEay9f053v+RftN1ZZhka6qLhrIVt5UIKHEBkG9Sw+CFYagQSHoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X7tJSFf3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KOdn
	diPExjl+FV5Q9Mr9rbep06b2nMpNWpnD6VJnwWM=; b=X7tJSFf3/OEnN2fA1JBU
	aVFoIp2lPIQsYltmlPAl1547gtlMmdtYZMSx6F0O5e6HGu6v78Ez7q5z8MOAGKhZ
	BCSVXmxWgGByV0m3X6giowwqoc6FAqTU2asB+FL7HIVmF3BcNMF36jzm/TKdWBWC
	oAY/s6uMAwjp4kUOtcV27+qdmSytoEgO821tOcRhUlIkdEFm1jTlyBbVs9gMQFxA
	D4mit4drKyItMNOaEXI7QT96VjQPjYUGGA3YpVDWPRa4OuHE99+6EbvjPAdUtwUv
	niRkJdgnvcpt4CzL8AeJEjS2R6B7TiBKYwU175G7qMmZsNO1erOscSRdbTGnR1GW
	Dg==
Received: (qmail 1971825 invoked from network); 14 Mar 2025 11:23:43 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Mar 2025 11:23:43 +0100
X-UD-Smtp-Session: l3s3148p1@1a041UowRowgAQnoAFsPACcmk70XhM+l
Date: Fri, 14 Mar 2025 11:23:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mmc: renesas_sdhi: fix error code in
 renesas_sdhi_probe()
Message-ID: <Z9QDrs367B_aQZtn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
References: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akDpcFiVA4/yEH+2"
Content-Disposition: inline
In-Reply-To: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>


--akDpcFiVA4/yEH+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 01:11:09PM +0300, Dan Carpenter wrote:
> If devm_regulator_register() fails then propagate the error code.  Don't
> return success.
>=20
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for this and maintaining smatch!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--akDpcFiVA4/yEH+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfUA6sACgkQFA3kzBSg
KbZBVg//Vv3KxGo7LNJe7xCPbiK+z7jY79lgea8ocpbXOhTkEBy0uCP02hAnNrY8
J99c53f+TENuFdD0zQQtyUvkJ2REO84PiQDUqWG1lGAbAMU7eFErsxSUM756pemW
e1ytRQtDhcMPWcFKQ6ddlqyidw+42noOtBAYwx1DssHtYtNGJbEcyk477TncD1d2
p1k4wcA7oYjUBxJpuAQOQPlRYUG/o5fMqkKCwaNsAByhYN5gaxVB7oxmcCv0Z7kB
J81Xb16R3nZioqT9P5iSYVdHY6vIhQrqJG8LP/iRKQ0P+0+sED2WKy/9N0P4WUuJ
okReenUz6jlQw30FU5UQ74zkIlx+BFJocsE3CoUhLapX7ijGSkWRDI8UEZKxQZ9k
GXouiVVO2/1ezHtxrQYOh67HrsmLf8o4q7lGocN4QSGDCLLIl8GolOiPc9Yn0NbQ
jtfwWlqxYwa2ByIMEe0mbq4pmbR+orf2qvCcpISks4ZkNhAV1KSgyQRAFo4eDSer
Kb/zOea9Os57p3vvjBgSshggSReOdgY9PpTK0dTOoLf7aXye3meP68Bzftp/ZhbZ
KA2fRajscilEJRdfiwb+v6nSQtGu16AS9424F1zCVYhjUf9dQ34RVcGx9eYanY2o
BR2L8zISSWh5DRFJuHNjuYHbAtEun0t2kzY/kTrCZ/hKOAKiLes=
=lOCa
-----END PGP SIGNATURE-----

--akDpcFiVA4/yEH+2--

