Return-Path: <linux-renesas-soc+bounces-14783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B9A6E286
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 19:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33EE716E902
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 18:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5BC264FA2;
	Mon, 24 Mar 2025 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QME6XJmc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D428265611
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742841395; cv=none; b=WY8r2tmyUyX+l1n8IkLVKtymWG9v9JU115g2lK123qkz9Aj/YAFSk7bqJTufpnNRWE+a3QSfYc6j6xvZOhSAbXBWBtA78f3eIo0oaVxIQ8lzpkKdCrFL2fgbVs7yioCa20ifHeTep3ugGfr/sYJCLstlCUtiIEtwtfIXEjaz55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742841395; c=relaxed/simple;
	bh=LQsAKvmhZs69Y2s+zhZyJiZr0l+G260wB14+wSq0sOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1UbBxKqBjy78h3PKkG4TbqPQiQJxcsjrmMcnbhQ3+nrdkrbMIdwDhjnHPwQJWGZDcRTKMknmVGM0SzOsfL+l1QI/bgb1qyQKKIhiJQduK5rDd2fRs0r3MiP+L14lN3h6L7KrCqP/JxzG032rOtGsVIt+SelTgNRU3YirSlMifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QME6XJmc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bSAr
	Y6VLETwn/qhfzi/EeyRVJVQ4dIOxDFxzv8uWqwY=; b=QME6XJmci3F2c5/2GR+P
	n1p9LcrBopL8aB7I1Hl9pTZeWtPie7LtZ7ghEaicmAEyWXFi1uoh3Tb6jB4GGMBr
	GEaRkJe3f5nVTosIgmYVkhq/jJI3Zq1iuhyBMbJxlP6i5frTG72N7ZxhiCQnsP1z
	WSOLwhibXQQbR7+qPq8yCl52s19TZ6vRQzKexUSh6AvLGIJgM4WdU1FdkCjrdCI9
	fjD0IkJuqsL3oQNI1C9214B7PxKKPdiYkkpM2ekp81hruVtQ3qEuR03orbqSopCq
	ACzpdPCZncIKGzhS1CugThr9xdB7uLZZVuG1rINr/NBrV/Ly8BFFQ9hjabcbZqYH
	uA==
Received: (qmail 2686366 invoked from network); 24 Mar 2025 19:36:28 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 19:36:28 +0100
X-UD-Smtp-Session: l3s3148p1@YgfY4RoxjDFtKPAv
Date: Mon, 24 Mar 2025 19:36:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z-GmK9EwMrRP1_Ay@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
 <174283702242.732993.11666137383985833104.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PIVksPbFURqImh8e"
Content-Disposition: inline
In-Reply-To: <174283702242.732993.11666137383985833104.robh@kernel.org>


--PIVksPbFURqImh8e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

> My bot found new DTB warnings on the .dts files added or changed in this
> series.

These warnings did exist before the patch and come from the underlying
SoC-dtsi.

> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: cpus: cpu@1:enable-method:0: 'spin-table' was expected
> 	from schema $id: http://devicetree.org/schemas/cpus.yaml#

This needs to be worked on (indipendently of this patch).

> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40060000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
> 	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
> 	'snps,dw-apb-uart' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40060000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40061000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
> 	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
> 	'snps,dw-apb-uart' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40062000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
> 	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
> 	'snps,dw-apb-uart' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50000000: dma-names:0: 'tx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50000000: dma-names:1: 'rx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50001000: dma-names:0: 'tx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50001000: dma-names:1: 'rx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50002000: dma-names:0: 'tx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50002000: dma-names:1: 'rx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50003000: dma-names:0: 'tx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50003000: dma-names:1: 'rx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50004000: dma-names:0: 'tx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50004000: dma-names:1: 'rx' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#

For these, patches exist and are on the way.

> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#

This still needs fixing.

I don't think these are blockers for the patch here.

Happy hacking,

   Wolfram


--PIVksPbFURqImh8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfhpiUACgkQFA3kzBSg
KbYEYA/9H+CYHaCahyIkGv6fXme01DrgkyELEd2MgSN6wcJQFjKJ2XsfPL91ULv7
nwx++3sFKGZe5WontBykySjf42wg3+cnIp9sEns0uDwPcV60EXorZjx4lOTrOP/6
gsCZc5S0IJfY/516+Vxuvo7GzWUPtovjMZMRdfNuB4rJ9sRPtfDimRJaNePKU28Q
waCMbenQGG1g5caFyi5v06tLoy7uAPQwv3WCdRyGQyVFakzfUwBZB45UhcxVrtd+
rKNxtjvEGfbCLNph28D99/UKMFceieNOz0jGmnNgf2gs7XwTxyZguobSKLmwDy/+
9CHAM5mFOKmyaBLfb/2C6Cc/E0LlGq4GoNrYcv88v1JGu1P6TYMcjmUU44Eu+qBJ
/yBzIVOvu69dGHbsxxTRbAg84CiAmuvsDzE+yl/zBiqNZjJzA79ozo7I6KofJVFL
Y05IPur05UbrxiNCadyQwMCHAn4AzUzusFIMSGvn6ZxUF0bh1JsJ624PZUL6Tgi9
Lndh290bXgh6+wHqaXDqTL66Gz+BoyceP0uUUpkLeGI2fofDOswYlfesjaGlb+2Q
CEbH2a7EdkyyawRZPXSdxDuKA/pJEMWpl4kzW4loqFTsKd2YHMC8qj08/GAKy0iw
qg/u64dBnfa1/P6j+YyT5O88hx+4Z7omVC+OJiOP+SuT8O5gc0o=
=Ry7C
-----END PGP SIGNATURE-----

--PIVksPbFURqImh8e--

