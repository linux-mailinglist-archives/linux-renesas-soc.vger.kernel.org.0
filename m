Return-Path: <linux-renesas-soc+bounces-33775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PU23FnFGKGrRBQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:59:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0824662B1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:59:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CGnbzpbq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 414773014130
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 16:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE733B27FF;
	Tue,  9 Jun 2026 16:28:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378813B0AC4;
	Tue,  9 Jun 2026 16:28:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022509; cv=none; b=g7L50Lhjq+BJEYzBbsqKIzWSXiTyv+Gc2HqB3YOVFuL2eic+0nt+jl+NOmBAikPBZA4p4fIB+mymi/aJvW1ukqrra7cqItdlSNEC8JuT54pDwc2VMjzlnZalDr+sWwjqjqRsp+1qrpWyKXpOauL9IqIyoaNoQiBTPrPi7nQ/XDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022509; c=relaxed/simple;
	bh=dJQQCW8D034RuKqi61gnhBl2I01Xy7W672XwaMirEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2EgLtaPMYG3+HcGySTLs8hYbpB0glimUPv+yezxyDYTNNqxjdzqPdmVO34AJQSXXEfrLuPXqfYGyqWxUiu/bAA4kLxDoBCAF5S73YPZm/dGyRo2DJ+PEfzRWjWsJjDX/4U9zR3qGHtWKKSjiKxt6ICr/aE834R5U+UCb1qp16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGnbzpbq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871F31F00893;
	Tue,  9 Jun 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022507;
	bh=mnBqr/oojprozlQZfNYplJlBKL2vf9+PvY5mWTT3dsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGnbzpbq2ir2U0YUoU/MVcUkdXc64ZBJ+JQYXxd1mlBrNLidxG0iEGQtF794/JCSf
	 Cm87Zv+Kr0eeLuesxsB5NlkuHMBtBXm+Rl4JQvFG8eE4dXoCjapRwJCfklohYejAsN
	 Kl1bnCQmucj/MxHTBB8rqq1uRx5WVM8asYTBPM+OxIDwvzWxka4jWUJvTZQmKk3WWt
	 +YgG7EHJyx8UW0IIV9gZNkI+gzoBTNNSSfrDASZ33xMKUMu2Qgz0WP+P5J2GZbyk/t
	 gk/w5WmaVZ0OSwl/wWMwuEKu0Jo5cLTUzjIwysY9xH8sK/9E31SKoQqaqmVcBxoKYM
	 5uamaEaf/Nl5w==
Date: Tue, 9 Jun 2026 17:28:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mfd: syscon: Drop custom select for
 older dtschema
Message-ID: <20260609-vertical-antarctic-e18a7ec91685@spud>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
 <20260608-n-dt-bindings-simple-bus-syscon-v3-2-4eba9ec1212a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ht75Ke9Mrmo6QJOk"
Content-Disposition: inline
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-2-4eba9ec1212a@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33775-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,baylibre.com,atomide.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,microchip.com:email,spud:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0824662B1A


--ht75Ke9Mrmo6QJOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 10:44:25PM +0200, Krzysztof Kozlowski wrote:
> Older dtschema <2024.02 required custom select to avoid applying this
> binding to anything having "syscon" compatible.  That's not the case
> anymore and this additional select has two headaches:
>=20
> 1. Duplicates all the compatibles listed in the schema.
>=20
> 2. Is error-prone, because it requires contributor to add the compatible
>    in two places, otherwise the schema will be silently ignored.
>    The select list already misses mentioning compatibles:
>    mediatek,mt8365-infracfg-nao and renesas,r9a08g046-lvds-cmn (with the
>    latter being reverted for different reasons).
>=20
> This requires bumping minimum dtschema requirement to v2024.04, which
> feels old enough to be a safe requirement.

I agree, seems reasonable enough given it's a jump from 2023.09 and not
some large jump.
The diff is nice too!
I assume Rob will be taking it, but just in case..
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> ---
>=20
> Changes in v3:
> 1. Bump dtschema requirement
>=20
> Changes in v2:
> 1. New patch
> ---
>  Documentation/devicetree/bindings/Makefile        |   2 +-
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 116 ----------------=
------
>  2 files changed, 1 insertion(+), 117 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/d=
evicetree/bindings/Makefile
> index 7b668f7fd400..40c2094f47c2 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -6,7 +6,7 @@ DT_MK_SCHEMA ?=3D dt-mk-schema
>  DT_SCHEMA_LINT =3D $(shell which yamllint || \
>    echo "warning: python package 'yamllint' not installed, skipping" >&2)
> =20
> -DT_SCHEMA_MIN_VERSION =3D 2023.9
> +DT_SCHEMA_MIN_VERSION =3D 2024.4
> =20
>  PHONY +=3D check_dtschema_version
>  check_dtschema_version:
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index 9c81010d5a74..b70018bf1bcf 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -19,122 +19,6 @@ description: |
>  maintainers:
>    - Lee Jones <lee@kernel.org>
> =20
> -# Need a select with all compatibles listed for compatibility with older
> -# dtschema (<2024.02), so this will not be selected for other schemas ha=
ving
> -# syscon fallback.
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - airoha,en7581-pbus-csr
> -          - al,alpine-sysfabric-service
> -          - allwinner,sun8i-a83t-system-controller
> -          - allwinner,sun8i-h3-system-controller
> -          - allwinner,sun8i-v3s-system-controller
> -          - allwinner,sun50i-a64-system-controller
> -          - altr,l3regs
> -          - altr,sdr-ctl
> -          - amd,pensando-elba-syscon
> -          - amlogic,meson-mx-assist
> -          - amlogic,meson-mx-bootrom
> -          - amlogic,meson8-analog-top
> -          - amlogic,meson8b-analog-top
> -          - amlogic,meson8-pmu
> -          - amlogic,meson8b-pmu
> -          - apm,merlin-poweroff-mailbox
> -          - apm,mustang-poweroff-mailbox
> -          - apm,xgene-csw
> -          - apm,xgene-efuse
> -          - apm,xgene-mcb
> -          - apm,xgene-rb
> -          - apm,xgene-scu
> -          - atmel,sama5d2-sfrbu
> -          - atmel,sama5d3-nfc-io
> -          - atmel,sama5d3-sfrbu
> -          - atmel,sama5d4-sfrbu
> -          - axis,artpec6-syscon
> -          - brcm,cru-clkset
> -          - brcm,sr-cdru
> -          - brcm,sr-mhb
> -          - cirrus,ep7209-syscon1
> -          - cirrus,ep7209-syscon2
> -          - cirrus,ep7209-syscon3
> -          - cnxt,cx92755-uc
> -          - econet,en751221-chip-scu
> -          - freecom,fsg-cs2-system-controller
> -          - fsl,imx93-aonmix-ns-syscfg
> -          - fsl,imx93-wakeupmix-syscfg
> -          - fsl,ls1088a-reset
> -          - fsl,vf610-anatop
> -          - fsl,vf610-mscm-cpucfg
> -          - hisilicon,dsa-subctrl
> -          - hisilicon,hi6220-sramctrl
> -          - hisilicon,hip04-ppe
> -          - hisilicon,pcie-sas-subctrl
> -          - hisilicon,peri-subctrl
> -          - hpe,gxp-sysreg
> -          - loongson,ls1b-syscon
> -          - loongson,ls1c-syscon
> -          - lsi,axxia-syscon
> -          - marvell,armada-3700-cpu-misc
> -          - marvell,armada-3700-nb-pm
> -          - marvell,armada-3700-avs
> -          - marvell,armada-3700-usb2-host-device-misc
> -          - marvell,armada-3700-usb2-host-misc
> -          - marvell,dove-global-config
> -          - mediatek,mt2701-pctl-a-syscfg
> -          - mediatek,mt2712-pctl-a-syscfg
> -          - mediatek,mt6397-pctl-pmic-syscfg
> -          - mediatek,mt7981-topmisc
> -          - mediatek,mt7988-topmisc
> -          - mediatek,mt8135-pctl-a-syscfg
> -          - mediatek,mt8135-pctl-b-syscfg
> -          - mediatek,mt8173-pctl-a-syscfg
> -          - mediatek,mt8365-syscfg
> -          - microchip,lan966x-cpu-syscon
> -          - microchip,mpfs-control-scb
> -          - microchip,mpfs-sysreg-scb
> -          - microchip,sam9x60-sfr
> -          - microchip,sama7d65-ddr3phy
> -          - microchip,sama7d65-sfrbu
> -          - microchip,sama7g5-ddr3phy
> -          - mscc,ocelot-cpu-syscon
> -          - mstar,msc313-pmsleep
> -          - nuvoton,ma35d1-sys
> -          - nuvoton,wpcm450-shm
> -          - nxp,s32g2-gpr
> -          - nxp,s32g3-gpr
> -          - qcom,apq8064-mmss-sfpb
> -          - qcom,apq8064-sps-sic
> -          - rockchip,px30-qos
> -          - rockchip,rk3036-qos
> -          - rockchip,rk3066-qos
> -          - rockchip,rk3128-qos
> -          - rockchip,rk3228-qos
> -          - rockchip,rk3288-qos
> -          - rockchip,rk3368-qos
> -          - rockchip,rk3399-qos
> -          - rockchip,rk3528-qos
> -          - rockchip,rk3562-qos
> -          - rockchip,rk3568-qos
> -          - rockchip,rk3576-qos
> -          - rockchip,rk3588-qos
> -          - rockchip,rv1126-qos
> -          - st,spear1340-misc
> -          - stericsson,nomadik-pmu
> -          - starfive,jh7100-sysmain
> -          - ti,am62-opp-efuse-table
> -          - ti,am62-usb-phy-ctrl
> -          - ti,am625-dss-oldi-io-ctrl
> -          - ti,am62p-cpsw-mac-efuse
> -          - ti,am654-dss-oldi-io-ctrl
> -          - ti,j784s4-acspcie-proxy-ctrl
> -          - ti,j784s4-pcie-ctrl
> -          - ti,keystone-pllctrl
> -  required:
> -    - compatible
> -
>  properties:
>    compatible:
>      oneOf:
>=20
> --=20
> 2.53.0
>=20

--ht75Ke9Mrmo6QJOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig/JQAKCRB4tDGHoIJi
0oLlAQCHwNbINj7drMDGPuJbu0+4qMK+maKGF6EB/ix0tWHZuAEA142K2XiPf6pe
EJkgVBoshBZ7NIiPUqXP5uO/FD3ooQM=
=4Xd/
-----END PGP SIGNATURE-----

--ht75Ke9Mrmo6QJOk--

