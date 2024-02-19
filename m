Return-Path: <linux-renesas-soc+bounces-2970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6A85A958
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 17:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF7E2861A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 16:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1AB41C89;
	Mon, 19 Feb 2024 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TuucYJjB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A041C7F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708361606; cv=none; b=ilWrxfRAFsKnTpwUnQu3E8QwY6b9KO8D2lSrvUAYzmjeaAH/FQi2jzWxlLCMM2PBSVw3uXripD16oEx9AzElBUTOf3fngbZxsupX+DHMgdvExESqHdHUGh6JRIp7blK99TXuJviHUjjRz0Z/h8X1les7EWkN8Ogq/Dw+WzK832k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708361606; c=relaxed/simple;
	bh=QrE7sYv0kVPFS7XEuZEhUk+WpMNWr2beohCwEe16k0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXvyLaT1jSyzM7ueYRiZE2jvYMuxmcs8bZV8n62rSwYr5jPcG2rCy4ZcbcIRfV7Fw0Qi9VCglg6ZU9ExHSy3T6HE5/AR545hf7GY0NYoKd68SZMELZCCZhHE/b3X67IuSIT/m+4Q+9ptfFeyB26KoCUCFpAnNToa70kg7uHHoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TuucYJjB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QrE7
	sYv0kVPFS7XEuZEhUk+WpMNWr2beohCwEe16k0c=; b=TuucYJjBBM4ytNb/H42L
	ADQI0YOQZhK6J6rUdQ044SolQ99YTe0eSoWqVekXTqV44JaQFLG4x8pkh5r0qaOM
	ssTg8guoggit6GdobZ1k2yXl8NL3F1s2vqQzxyDeko5kd8T+YwiRdK9PMUii670F
	Uy2kyAXLbFfiQVLzF8SYMAQeNeJ8NmjczbhBq0l7Q1UtfsrNIUavPccyQJ0dZ8Q8
	+K5r68ppwTGK665DTEC3NJR9FjWReeFY0NT9BVgdIVbevK+7cSvV5if906rVIIq9
	vDi5HFaC+GRp8SbXRD8cc1EE2xE2o+DPCaEcmrERnMJSkb9UTyDTbAShhKAIHQvZ
	Dg==
Received: (qmail 2983479 invoked from network); 19 Feb 2024 17:53:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Feb 2024 17:53:20 +0100
X-UD-Smtp-Session: l3s3148p1@XatP7r4RZMoujnsZ
Date: Mon, 19 Feb 2024 17:53:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add QSPI
 FLASH support
Message-ID: <ZdOHf9ZQZWwQSkp4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>
References: <cover.1708354463.git.geert+renesas@glider.be>
 <96d6567024cef9fcd6b04f92a697301c1c8d1d8e.1708354463.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2CoS3ic4ZQoswjU5"
Content-Disposition: inline
In-Reply-To: <96d6567024cef9fcd6b04f92a697301c1c8d1d8e.1708354463.git.geert+renesas@glider.be>


--2CoS3ic4ZQoswjU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 04:00:41PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Describe the QSPI FLASH on the Gray Hawk Single board.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--2CoS3ic4ZQoswjU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXTh38ACgkQFA3kzBSg
Kba6LA/+K7GBWYX536hRW+e8eh2C62q9+b34m+UtGjkCE1lyp5+jQGaCQwhtWdiO
r0ua73+XVKenHzmCmMYJIcqaHQcTadOvj0ApqiDrV6xGRSBK6rybf54fxEcRJBlg
ZUa9RWuT3Acvoi2sf8t6Cp9K+tEbXz24Udxj/HcABlMMFIG2xrHGj19e7W5ejBxg
ppdoZ6MgXtaSVTr81QSVdx9miPhZkTjoRNW8XKhSS9CW2C/OVSy0VprSsujq57Fb
7gqs7V4Lxd7r0g66Hs7mOXMTmHl4ZTlobkkGQTJFxMiDT8mzAEis0I4ynLrasoaW
+T3TBdpywlK0IOLu/+M5el8kn13qTRWFAdpQ0fXOS+UmWwdhTZgnP+wR+OXGpNy5
yqgO5UA/IZnDvVTfnmPN4lk71meYwm/C42b0aL3t9e66Z2atXKIlPVcbfDGII4y8
AJYC296unDwfwQ7ZcDSzM0NMsZyazx1fZiXvm31hRRGThyvaO7YhoY2DgFWnGRaQ
pkDp2H5lZDNEyo98nJmEeHl1Es7beARh+VH3ePk2mSROXbA2l2xjbwVvqMrW3Jm3
wWc94YAA3XfaPuZ1Ql1Xaeh81fovo8+WUNZo5TVwNuRePb9ZdBreLLkNFUDuRoCM
IoYna7eFwxNK4l8YsjbhpN+ylWAM05759gQ6LLdPIXm10KtJs+E=
=Jtiy
-----END PGP SIGNATURE-----

--2CoS3ic4ZQoswjU5--

