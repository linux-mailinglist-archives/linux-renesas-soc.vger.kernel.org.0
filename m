Return-Path: <linux-renesas-soc+bounces-25910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BADCCF0F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 09:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 518B43008EFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 08:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9EC2E7F3E;
	Fri, 19 Dec 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Fro7f5VL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay122-hz1.antispameurope.com (mx-relay122-hz1.antispameurope.com [94.100.132.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F802E0910
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134626; cv=pass; b=lrrgh93BMt9gn0nuE15Mq6O3kobpJh5aKQqZPhzCt2RXdZi+3TB3W534qYIrPBMui3nH/dSmBEib9+KK35XwXofRCnHGnpiYh4Eadj03R/9EbtgmxSkxM/oGtE2ihn+6h+5sKvuRgVes5By6yV9F0f1rkp5SKQzOgtx7ZX0rCJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134626; c=relaxed/simple;
	bh=BDiH1mpKIlJOp3ZxWBeYxiYLVyM0lqkiGH2JKubyH6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eb+gD89jTK2IaG0EUA+CNCpaU7rSawJeM5BhFgwaP9VD6cfU3tzpfGv8VH6u3rl1Py7gM6RjObRMIyz47i4fIfXay/ero/Aky2mX4V4ZDWeEI5HIZpm4Vbupfg7K0LdETJOTxuYINuCb6VpX34VFgScv0O0Bz9zxMt1w0pZdi6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Fro7f5VL; arc=pass smtp.client-ip=94.100.132.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate122-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134561;
 b=BEDRW9HsySq30uyEoOYnyf6hEfVnl4DdS8bZy7Gi1YYSVGOdx+ATGJPOFP9a17HfGLlTx53j
 tkNwOiaJPb2tCifj45X5REnCLtSmsBV//f2oLyHW6LvZ2sAPYxlw8qua8mAYFMH+QCSln7LyraY
 I+Y/KJG+h7Yyxc2bEcuPfSeAeeBam773B3j9AWCbDBSRxP+yxG7G1G+JTHhsrjkPPCLyx07/YU5
 S3FtbNsEuKU+jGG+0nMTIob821+laHkbHbiqW1DN6/SdluZWUQgfbRHLoe6FEbj7OakZUNl4nim
 +qAauWkyK4sOxAQI8t+ZOs12LyQ1oK/vz7wRB75KkPAig==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134561;
 b=h/42rpP8YOAdWLF+v5Vbv3xlXyc9TDXCes1B68S61gFneyMJgGjr6vJoaV5U9UycVCq0qx4y
 XXS7ROQq37BcTVhoWbaNE9fGGEIObkZypXtvHjZ4HIbRUpqR1JKp6Jf5lRc+k0tq7kL8v7Q7dLi
 Yuesafrn0jxBo5ICcqYw+dNvL8l/vh5SjeY7rPdaXtov/0NdPQ8DQsOuPXPjY92yHvrAD9UVP11
 VBErN1DDVaNHbSYCA3Se8j9XNF17r445bOQVpvE8/SmMr8+EBrWkjHXjbaH8vBRECGcMWb9A+1d
 dzkqPu+a2sNObPh1WO7g7A/lRc3yR6wvO8k7OHQnSmnfg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay122-hz1.antispameurope.com;
 Fri, 19 Dec 2025 09:56:00 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6FEDAA4140A;
	Fri, 19 Dec 2025 09:55:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 3/6] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Fri, 19 Dec 2025 09:55:38 +0100
Message-ID: <10076440.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3460692.usQuhbGJ8B";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay122-hz1.antispameurope.com with 4dXhFm4fp5z34Lby
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0c47e991cdd1e2cd38041c89430f069c
X-cloud-security:scantime:2.240
DKIM-Signature: a=rsa-sha256;
 bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134560; v=1;
 b=Fro7f5VLyW8JftEsShik9LpLwmpjFdkjyWoX5sTUCE57qyCWwN58wCp+FmFOYwEy+LxmtWFQ
 R2W15cMcWARW3Mz0Q35E1cJVvXlUTyra6tW3t7gl04PwtN9X4MlxqkJnV5spXJj/Xz4h/3FTnSp
 AALqWuoXkrAh1aK3vKReb6hHrp9YZ36hB2KAr6iHy2Kxpz8qB49+dkhze8k/VCUbppd/2Izvjgx
 1DQKQ40bxZw4+HU8R/7LmkdwCtHRnEbsZlkzLJpJseqrNx7BMr94FhFyFDS/4KHNDj+e5E+Vrzv
 HPoqLNnGNy5agwiyL8J7ap44LdNRX4QA0S44xcw6LfVVA==

--nextPart3460692.usQuhbGJ8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Fri, 19 Dec 2025 09:55:38 +0100
Message-ID: <10076440.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Donnerstag, 18. Dezember 2025, 16:20:50 CET schrieb Alexander Stein:
> IRQ mapping is already present. Add the missing DMA interrupt. This is
> similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
> DMA IRQ for PCIe")
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> index bd6e0aa27efe9..f2c94cdb682b9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> @@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
>  		ranges =3D <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
>  			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
>  		#interrupt-cells =3D <1>;
> -		interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names =3D "msi";
> +		interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "msi", "dma";
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
>  		clocks =3D <&pciea_lpcg IMX_LPCG_CLK_6>,
>=20

This one is actually independent of the rest in this series and can be
picked on it's own, especially as I won't be able to work on the board
support until February. I just wanted to give some context / usage.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart3460692.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFEwsACgkQaS+g2M0Z
/iVAFAf/c5CwO26Ggu/BI/ZSuZzcaL1LqCQ6HXiIkEKJpXXjrmbMAJ6LFFIo9ARY
MP753fb/XeCGm0ozq9rvZEfe+MQ+SYFD3GV3cNRmU59JwwBNpErTOw/jXOC67y+Q
hASUB/UEN5V7UtxEUMARpH7N0PodmW0cIQwceQoO9T9S0n+g4OwjIJV+0T7/LHx5
LOh++EEOGH/KbeOtVKwmDY/mvlYFJcO5TxNbvYfo8OrT/3PltCu2awfi+ZSOac5l
ATtxTkihCWtUFHeXYtwteS0hDXOoldi4A1137WzS5MNWkCeq8TxB/F3Fk3sKSHJk
7U2L6kHUhAjtsnQPLnIQ4yuhF7BL4w==
=Pd9W
-----END PGP SIGNATURE-----

--nextPart3460692.usQuhbGJ8B--




