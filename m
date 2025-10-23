Return-Path: <linux-renesas-soc+bounces-23457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC69BFF75A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B991E4F46E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 07:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A7B2BDC29;
	Thu, 23 Oct 2025 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Nz9r7kuG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E69292918
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203276; cv=none; b=PaIEt0avT/GswPe8k/FmJWTwzHosqHBJsIO2vaCHzcTojSjvgdf5MsQ0ujTqgr3FNqxgf0Usyq8ap8F2YYq2CnuUfkhbvzaccO8mlo6WwNxNEzwbdq31cBUlF4zaf3+uJlM1vanoMR6AMQWt2o/k+Z86+GTSKIjxNacNoJ3BRXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203276; c=relaxed/simple;
	bh=ILCfqgDT0pnO9jTKvNAzKXyV01WDX65aW3M+27Sl1vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxtRX5v6MW9oU0vmLQbB0mBt519+7Zxy1P1ymjL4sRX2O/O5fAmXeEwS/eQPvx7TwPg0QXIEXgPxk17fwKh0OHdlJdWe3vccFPI0c+LjWiiFPXRVJIsxEAjdQuUo/AvhA033hEsYzFyE/OgDkUVC30nss4FDXVQ+kgF95pFRnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Nz9r7kuG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ILCf
	qgDT0pnO9jTKvNAzKXyV01WDX65aW3M+27Sl1vA=; b=Nz9r7kuGtfMybkz11dcJ
	pdOd4gO7C4rZRdrxvn5cJAt9eCQFvOAC+1nKIC8o+4A2u5FYIoh8LdgEfd68oOmo
	IUewTw37y2VVOypg+epEEUSwPSBUf1uI9A35H9FFuIUKDGH4RmdSx5h8zVfB37Tl
	kybA418RmuVBNPBy4e+Zi+3Xp++w7GPEJCX8eR8nHCp2XAyCioP76UMpAEYisk4l
	cW+jLMcvpufjgwkyL/oVvsx2ZWoZyg/nBEsH/TYp19x6L6VYcg++XeG4Ym80zX4I
	Ueh9QIs5aqO0uWaDLtJj5mkc9aYxya6LiSjW46LPCbOzz0rgyv4HbQklj+ng6j9P
	QQ==
Received: (qmail 2101982 invoked from network); 23 Oct 2025 09:07:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2025 09:07:47 +0200
X-UD-Smtp-Session: l3s3148p1@DOcUF85BBjVtKPAY
Date: Thu, 23 Oct 2025 09:07:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: renesas: kzm9g: name interrupts for
 accelerometer
Message-ID: <aPnUQtJECB9k5D41@shikoro>
References: <20251011212358.3347-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xqgng3i+xl4NPO/Y"
Content-Disposition: inline
In-Reply-To: <20251011212358.3347-2-wsa+renesas@sang-engineering.com>


--Xqgng3i+xl4NPO/Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'd think we can apply this before my binding update patch goes in.

Binding update is in -next now.


--Xqgng3i+xl4NPO/Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj51D4ACgkQFA3kzBSg
KbbP5BAAgijmBnCG+g81QVnCtJSJ+O9xHzs3YLWHSIyuxzbeRGdKqH8dzMlcNrCk
IsKXAe2w9Lv+Mc/DFtM0G/umxRfQMDbFyD1eCA2eGfW+YZjjkCy7v1AlEC0e7gts
IzrA3MqWhHMm3ik9OJvSzOy/K+9ifWuaGUYfwFZ3L+Rt/cwVcK/KWaxnTOCiWzCF
F829VPdOH0yqJANCmrOesZrUwZxwV6bBLnvNxpn70p0QD98TcpLPLlMnHbOa86j3
sPoNH7vSUKj89HPwP/rPkO217y7qrvQddEWYB0ubFH5Ulbu/tKwMHecXsONZ5+D7
1iuysWxZslGNDsaUaf2QRzwlxL9Iqa5sCIRny55K0x9KFTQke5smnkyDC3Nu0Ayc
awYoLmhbnTHK9L5UVQP/l1oItczl4pdZo8sQuyRVOwTiSiZH1wz8XQlxn5SsOALc
FBeht00ICHB8kM+gA+gg1JmfykJTzQt9NV7qOmjF5DcD0LRaIaq6pGgdXLMP+cyx
LWFyYWlrnFdlYlpKYduED+Uz8tTUQOtKzdSINxwXnHeJUnluNK1T5S9EF+VGCBma
8ybo91zzp1bXL/wAC4BL6HvbM0uhohI6MQqJYTbu96KM7vcUsfhJxZTu7/UtnJQ2
uHsx/O/SJrnRxY3iyu9mIMzgCsNSq6wm/JZbjIXMQMzneWzw2cI=
=07LI
-----END PGP SIGNATURE-----

--Xqgng3i+xl4NPO/Y--

