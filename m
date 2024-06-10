Return-Path: <linux-renesas-soc+bounces-6011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EBC90249C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 16:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92B21B2A69D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A8413C3CA;
	Mon, 10 Jun 2024 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NGa9YuF1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F90135A7E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030901; cv=none; b=DsWweezHLpwix0wN+fg20o4bCpB1paRl9d60tdGwiPCn4ibESAfm7J8+LmR/2HiyqZZLH7PTJDuEeacu14erSquCzYalOKqWtg3YgKIXEZlRnFmUuJFiWDRgC5qyXtXU5X3NP7OFTEZj7lA5h5w01SaC0K7xhhoNedp4ctFKA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030901; c=relaxed/simple;
	bh=x5DrS7FQZMXT49cldFh+kXWFHLyDBEI8B/KA9evGjOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhjXSqc6HnzXcScelh2P1wxU0Y3Pe228Dkm3i3xuMIZthdbHMHHUYVRWawk+QrQT2fxnG4G6VEzfeB6ahL7Cez+Wp6B4rgPRTmzAKdSZHWBEUPgRHm9t1TJEcraBzQlCGBgKlHaeyjXCYnBw8RBulVZs6uh0S77TLet/tu4jMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NGa9YuF1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x5Dr
	S7FQZMXT49cldFh+kXWFHLyDBEI8B/KA9evGjOY=; b=NGa9YuF11u2hrn/bd/t+
	Tm7OfHnd6oCpAjYC/WNxX1qknVGXQ6AZvZ24O5Y5xnfF7eyivlmvhHHAMvNyogj8
	j9FgIAwfltcec/YLi/zMidFWLQ6jo5FNekS+A9vnMkiBIX9qB9vUK4Hp0M4xX/fB
	wqldMmCbjIePedIZJ3+NaSV70n6z55mCNj7rudDkWwQREbfnhW35vDIScCTi+zW3
	HKI7w4yBjqX3RCI6M1bKo448vMW1zjHJsuxYUIj56t+peyh5BAg2DdwtaGFv1x06
	AbaAt7MCjrb+E2WeMlEuPHJ1UPNQldwn8dHZGiZeE3I+3/uZ9pndx/3wmcEFHn+I
	iw==
Received: (qmail 113496 invoked from network); 10 Jun 2024 16:48:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 16:48:12 +0200
X-UD-Smtp-Session: l3s3148p1@bZkDPYoaPJ1ehhrL
Date: Mon, 10 Jun 2024 16:48:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mmc: add missing MODULE_DESCRIPTION() macros
Message-ID: <6ldatdtijc2jbzkasbzvze2m3vche5wmcogjfh2h2k4jsbtry4@oj7efn32ucoz>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-mmc-v1-1-c2a2593e4121@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rl6f7hqoje2ggj43"
Content-Disposition: inline
In-Reply-To: <20240610-md-drivers-mmc-v1-1-c2a2593e4121@quicinc.com>


--rl6f7hqoje2ggj43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 07:17:18AM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc=
_spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/tmio_m=
mc_core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesa=
s_sdhi_core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_co=
re.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq=
_simple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq=
_sd8787.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq=
_emmc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_u=
art.o
>=20
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>=20
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for TMIO and=
 SDHI


--rl6f7hqoje2ggj43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZnEicACgkQFA3kzBSg
KbbOoBAAgJ9UCaAhB+6Ip3/eQ9lYimnwlKzdejrL6uWwiqmX6v9VR/O/9Q6phaz2
4txU9LHS2K3f7rnQUGS6kuDZF5v2BagNg1HTdVXTGvKgIp7SJeC8BsaZVczlKB9Y
JddntTCF60+teenVaVmb5CBOQyRFymJE/xNdRejYLJwtYoU4aaG1WbQiYE5nbiub
OMigd5HMAg3hj076VF7ocCyBoJbLn18vSb3tOWHCze4AIJ1yQtIdbSfA9kUf8H75
b+cKpHXNpZrg1ZnuO4VxS7uUQPT22rH4HS8mU4sQId0g+K3yJOey7/Q2rqdbKL0W
cTaKDO/c5QQEXoUcqoSIUW5Z42Lc5vG/M8Cw7602jx5DCZYkOWq0Ii8y1YzP+J6Q
c2XaVUzfzZDbi/9cIOw4z2SZu1/Og/C9ZbC5pejiw9OXqAnk866h4cHqB0f4kSZW
ZxLICmsQycLU2guIPCEsCkyehVGe4YOASBTap302FWhb8NWyMzaW6iYeD+jFvoLF
/G92HIBeZqzh4b6iCk8xutpc3AbORw/YsaTmvbU9nbm2RFGlxuYnB1RKzCqdywCM
P0o9ACagy9M4wi/mb2eTLF3flGY/EAQjd41y5/iRT+MpgOnIZqMAAf3cgxXUMfdq
wbMbOWqjAiUxGts7XGD26FYScY+JTKn5iow3rzPMWsruJu/Rgdw=
=/mFQ
-----END PGP SIGNATURE-----

--rl6f7hqoje2ggj43--

