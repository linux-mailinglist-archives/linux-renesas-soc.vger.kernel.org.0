Return-Path: <linux-renesas-soc+bounces-15262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B1A77EC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 17:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A36B1891D7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 15:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE4D20AF64;
	Tue,  1 Apr 2025 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="afXea0NW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F22A20AF8E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520802; cv=none; b=q34SOFHOo8+5a7gmD7I0lVT9l48/Q9vWgw1BLdm6GDBDLH0rS5lNmrDYV1uaUtMpaBvHqLvDR83APPHlXxdVmV/Wx3luaO8JNuJOfdgD9+WkUIyVcvQUkTveLX3VSVzbSNgPs91RljQ3V1MzBt6GcFleq+AJJY59JlTekxcixJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520802; c=relaxed/simple;
	bh=Bsrct6pT9P+xwQnjuDB+9ATEbtS79tHJ/rbWZlEHUFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ll+e2Xgg9Pg3Az3MyNv93xD+pknNYSLj+DfyUzhnq6ZznW2Mpfakxzc/kqc7xrt2uhDC4rNsxG50xEGSmhxonSVX9LCKL9aPhI0Kgr1iAoIpTPWB1dqc/kfGSUOcdA1GpsmpUVeBNnWc4NLfA4ABEKHg0uhq1qQggkp2LtVaMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=afXea0NW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZpNG
	Yt6N5k7DHHaYdl06H/yqoC6ND60vLLXsQPJabpI=; b=afXea0NWsAlEeGPshquq
	dFrXvvBwBRwjL7CciXEjs/szZTYR2IjfN2FymEUM+SvVpdUodPWLP+wmbsy3o3yH
	fGjptNe8NKEO01Cx7ZVs3PaVLug2TuhBf+/xG0abnN7Gv+qJkmGZU39y/IA5Xq6U
	2NV5ObZAJ58VBEnjg/hrYmH2KStKY6X2X5h9fOHsaMsRon0p1FKydTJWw1LYSEfj
	SbR2D3SCnmNI5HL/43zv4+yDBwNiAc8P4fPLe6PjzeG8H4emuSnGg6caD3WNQoT7
	QbTk1UT0oUbXiMQylKGy8+kbTPe/XGlL6Rg+hpGods0XSjy7KGVbHVtVlL/vVBwf
	Ug==
Received: (qmail 1663192 invoked from network); 1 Apr 2025 17:19:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2025 17:19:56 +0200
X-UD-Smtp-Session: l3s3148p1@ElGvEbkxyNsgAQnoAEfTAHFphPy3/0G7
Date: Tue, 1 Apr 2025 17:19:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
Message-ID: <Z-wEGyV72abGuuvR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
References: <20250401100837.29792-2-wsa+renesas@sang-engineering.com>
 <174351601673.3283654.13923027888464994082.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hjs8mf8LQAl2bpdS"
Content-Disposition: inline
In-Reply-To: <174351601673.3283654.13923027888464994082.robh@kernel.org>


--Hjs8mf8LQAl2bpdS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
mc/arasan,sdhci.yaml: properties:interrupt-names: {'minItems': 1, 'maxItems=
': 2, 'items': [{'const': 'int'}, {'const': 'wkup'}]} should not be valid u=
nder {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

Huh? Need to check why my scripts didn't report that. Sorry!


--Hjs8mf8LQAl2bpdS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfsBBcACgkQFA3kzBSg
Kbb4uxAAge1iacyEQ91QPAD8emshoeiLL65tK86da79+6yUwkaV4lkrdzTtQY36n
M9XNsNdAlRiKqR8ejE5UZjN4qsbgyYQYDIe2Y++kfVjdp1Aquz8Z5MM8uAE+1ijJ
JH81VYhNsNMSqVAyJvedkjpExrrhUrR26up/G0dHyu8nvozUEIan+F4tDSUq1GRR
f0hbYV+WNF6IH+71jvx085j3yelI1ramzyZq9EvpBih9Ayl6uDQz+hQMTfPZ9BtV
QCMqF20D4lLvjez7KRPJlBOKJD9V4s0Jip+AxdOQTRKjCWFGHS58m8NdnFzTllUr
A/uOaYQMnuIIL8zm+p2BZKJ7jP/MPpm1604rSK+5esn+42tWH1gXAhoqw15bipPy
YsTZ97tTt07fISyLObMf2dZMp8G+MlGrlTL6onBD4nxCUhyhtQLn5cuPK6PjfCp8
jz/EjCGl45Kc19z0a3eUszL5HJa0epHrS+SP5qdch33Tqj8ln36idnIfXrzQNAWl
HlyLA7vl7fd/pDtyz3bZAIl5yKuYqtWQ200Q5q98UW4mq2BrRQg9n5QbmmFtkp/S
PAe+qgs1WcsURdl2+ImNqajMess1Ya7IblOnzsPR6T8SK7ycAfMPILD1J3NZ83P9
mvcdrUcsp7RCS+dlRIENCFxriWNcTg1lpucxG33V3VDyM8ABgpM=
=zBd6
-----END PGP SIGNATURE-----

--Hjs8mf8LQAl2bpdS--

