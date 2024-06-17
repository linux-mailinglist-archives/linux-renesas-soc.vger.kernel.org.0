Return-Path: <linux-renesas-soc+bounces-6322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CD90A723
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A2D11C21934
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E04518F2C5;
	Mon, 17 Jun 2024 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hzSwGng5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070018FC8D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609434; cv=none; b=aU47zLS6KRaPtFgdYl0q2eo2E3nNa5aNzXeJSUOV1yt+DPRGmuiXwfBSwB1e4kzfE7DxwmM8x9PjbUcPmPl8yHdP00BCD/KUk3F2nFv4D/PnqGCIjTQAQa9t+K2I2g3gFPmx2j5KNWlJqS3EerbHeFevydgG4k5pA9R+RQo5p0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609434; c=relaxed/simple;
	bh=YpopGvnEYqFyRz7X35CYcR4CW+/UcvqXN6pFgcsrP+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImXibrIsKQdkuzS2GAeX1zXN94FgOzn/gInEfdFwSwA2AcyliTKWWpFrjEX1KLHj63zmLvzDBXBg/U/z/76JniqWseD6+HA/5BBbgZP/gtIuYEAdKeuvNA1I52k0f1qor+yS0/0KgN0DzChTpFg/POo31UbEoO9/dhO4Z/fQX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hzSwGng5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ypop
	GvnEYqFyRz7X35CYcR4CW+/UcvqXN6pFgcsrP+M=; b=hzSwGng5N1WpO+XwqCOa
	zOIcpD6tSxkeXtjp5kOsisyW4zcx5WkHeuRFOCddA1lG4T4L7L0KMo6hjXYa8EWz
	D+XXjxwXGfiYBnzJFP9aPuJuYf0SOkTYp5b3sqZDWoBGJi/zkuFxGY8cz0QZjTaF
	dyzxdaXdCZG4rzE9wDnq4j4IPOtpF1e2BOE3rJQMJhqZw2nJowkPRFFtAlHI0zLE
	QUfxjDPkkR4qdWO6juW7A3O1uHhOpsLxM3PSurtxCYJ1tPScVZnt342Fp+X6FJ4z
	BK8Sgy5Qd/KgZoYOFLFXN/H2gQzPCw0MIrg5/2aeSG+pLOg53yoWkpdhzwwHCoFM
	5g==
Received: (qmail 2239695 invoked from network); 17 Jun 2024 09:30:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2024 09:30:27 +0200
X-UD-Smtp-Session: l3s3148p1@xyNo8BAbDpUgAwDPXzjQABqqX1QYyOSW
Date: Mon, 17 Jun 2024 09:30:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 2/3] mmc: tmio: Use MMC core APIs to control the
 vqmmc regulator
Message-ID: <exbmp7szqrmfsu2uo7iawcqxfknd36pqdzvazjogpb7nybn5bt@xvk2gjseqzhv>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlmmntutv3el3vse"
Content-Disposition: inline
In-Reply-To: <20240613091721.525266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--nlmmntutv3el3vse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:17:20AM GMT, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use the mmc_regulator_enable_vqmmc() and mmc_regulator_disable_vqmmc() AP=
Is
> to enable/disable the vqmmc regulator.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cool, didn't know these helpers!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--nlmmntutv3el3vse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZv5g4ACgkQFA3kzBSg
KbZkyRAAgrb6xHEkS0H6xtQ+/pusoGob4ZWgWh5E62vqnAiKTNDDgEKquGaY/W5t
Sql3eAExyCHl7Jnf+K9Wbx2Z7gQiVGHupnGe6tYPkpakmRZdzdBuiJpDrAvZmjSo
VSGw33yzt7pmriGfQMBwvaIbyv+U5SRTgdn4I0G9etcGCX5Z+l0HfVSly+neQGvd
brf/xKphFAS+sbcEqXbtGRwo83rO5rLKlsUncwGP5eb1m9XOyTLkAK9aIM0bDt98
J5HHErmH69wzNnJ5cR7gg2yDritGf5O64awymQtMtf8zpvGmoLgNUD3kHrEBZnCf
yz2TVUnDem9gZArHD4LpADeGQkk/HdPuuyCpLJW7/RALD7GNPjL8/hSQVLulOS0P
4ZvCUH2lE11+agXM+ohe1dug1Thh5aPwM2mAbxCEIc8yvD283NPWXCJ6dw5a3Dej
iQJC/k7CFFV2Y8uPX3DxhsDJrpyn19q28MX99iva7KFXP+6zZ8sJxiOZWneBPfLd
nvOkHugISxJpwtkvWAMKTslyXiZlvxnyXW4vV05oJOahmWcm0Ab8p8u0Wen8ba1V
arxIeJMHgLuX9IY+p862ug3HyEMBb3svIS01cP9WE2OlXZovkA24296N1W/CPDDg
36r9dkd2sxh8c3O0Q4K5a7J6KcmVDzUEu6cmgbFpKYFSSFE+viM=
=pq/6
-----END PGP SIGNATURE-----

--nlmmntutv3el3vse--

