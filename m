Return-Path: <linux-renesas-soc+bounces-34115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TK4ODclLMmouyQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:24:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8892697289
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:24:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HGDyUQDh;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32356303A130
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790793BB673;
	Wed, 17 Jun 2026 07:24:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84F3B9DAC;
	Wed, 17 Jun 2026 07:24:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681093; cv=none; b=Y41278/Ov7KpdBVacmg21cQ/dyzLs6ZSJqOkFz3nXrKIz2M/VRjzmtKml+J8uBUeuXAMPQ9n6NYo9aokVvAnbfQfIDP3X4IH2n1d1H+fRhac0+zoUZby37E/SdAqF2V85tjt0hAE7cRws8MPuER/VqxrCU4PcjqiGV40w/VsUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681093; c=relaxed/simple;
	bh=+WhFvVS+vcC6PQnZ3lAB2A+Q19f1UD0uekBNMfGkxAY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIpZfOdgPKUoPh/gg7FBg33mHuOsHHd1KMcTELUTM0sMf9BELVhDPj4QZHCtWi1j3Hi5hssQrkrWMtpY1gaGhxZcuAhICeRm+w1BMHS4Hkm0VUkPIekBwX06A/ViHXmRQuDX3ajUYtDy8UUo3oAiauJGcRwdM0BmHqMGp8F0ukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGDyUQDh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C84A1F00A3D;
	Wed, 17 Jun 2026 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781681091;
	bh=JYgA4r+iMvN9v+KvAsaOKYP1T3sIeJZ4mxJT+xgfLbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HGDyUQDh3t+aV2B7rWzcTrOtt8o66v8zDf7qbV3Ab7Jye4Q7ltUKNppxgXSX0Vi9B
	 kD/aZioiQMRuEHAhHIP4ZUR1sYQNBpCi2pfOLX5pvo+IKMm4p/2S3ez4P+75Gg3jpS
	 3mbzuiu0cuWPfk4lskEYenAJrCoUZrfHxikwvXEdX6dgtQJrAGx0t5fdvDkcHaNSDW
	 xfe0bxl4sT4Tm/ER4qdDD+vMa10j4FFhXGu5iHEnZ1SQ5YfDiV/AyeEAUsKDoYt62c
	 NrxkVr2AxjIWBYEdkZFNDEBkf47x+j3eigd2Ov1COJARgI1XWTYl8A7IgXdtIGf+3D
	 LZzrGpJWW3MxA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZkdl-0000000Da9B-0HQw;
	Wed, 17 Jun 2026 07:24:49 +0000
Date: Wed, 17 Jun 2026 08:24:48 +0100
Message-ID: <864ij1tyrj.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,	Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Bjorn Helgaas <bhelgaas@google.com>,	Catalin
 Marinas <catalin.marinas@arm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,	Krzysztof Kozlowski
 <krzk+dt@kernel.org>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Manivannan
 Sadhasivam <mani@kernel.org>,	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
In-Reply-To: <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
	<20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: marek.vasut+renesas@mailbox.org, linux-pci@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kwilczynski@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34115-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,vger.kernel.org:from_smtp,arm.com:email,infradead.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8892697289

On Wed, 17 Jun 2026 03:59:45 +0100,
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>=20
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>=20
> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
> common for many ARM GICv3 implementations. Therefore, add an extra

Not quite. It designates GIC600 unambiguously. It is just that GIC600
is integrated in zillions of SoCs, most of which don't have this
problem (the machine I'm typing this from has a GIC600 *and* 96GB of
RAM).

> of_machine_is_compatible() check.
>=20
> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.

Is this relevant?

>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: This would not be possible without prior work from Shimoda-san
>       https://lore.kernel.org/all/20240214052050.1966439-1-yoshihiro.shim=
oda.uh@renesas.com/
> ---
> Cc: "Krzysztof Wilczy=C5=84ski" <kwilczynski@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  1 +
>  arch/arm64/Kconfig                          |  9 +++++++++
>  drivers/irqchip/irq-gic-v3-its.c            | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>=20
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/=
arch/arm64/silicon-errata.rst
> index 014aa1c215a16..b0c68b64f5ac2 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -352,6 +352,7 @@ stable kernels.
>  +----------------+-----------------+-----------------+------------------=
-----------+
>  | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_128=
6807       |
>  +----------------+-----------------+-----------------+------------------=
-----------+
> +| Renesas        | S4/V4H/V4M      | N/A             | RENESAS_ERRATUM_G=
EN4GICITS1 |
>  +----------------+-----------------+-----------------+------------------=
-----------+
>  | Rockchip       | RK3588          | #3588001        | ROCKCHIP_ERRATUM_=
3588001    |
>  +----------------+-----------------+-----------------+------------------=
-----------+
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919b..b9e17ce475e61 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1382,6 +1382,15 @@ config NVIDIA_CARMEL_CNP_ERRATUM
> =20
>  	  If unsure, say Y.
> =20
> +config RENESAS_ERRATUM_GEN4GICITS1
> +	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses abov=
e 4 GiB"
> +	default y
> +	help
> +	  The Renesas R-Car Gen4 S4/V4H/V4M GIC600 SoC integrations have AXI
> +	  addressing limited to the first 32-bit of physical address space.
> +
> +	  If unsure, say Y.
> +
>  config ROCKCHIP_ERRATUM_3568002
>  	bool "Rockchip 3568002: GIC600 can not access physical addresses higher=
 than 4GB"
>  	default y
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index b57d81ad33a0a..ec3756f29cf1a 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(vo=
id *data)
>  	return true;
>  }
> =20
> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
> +{
> +	if (!of_machine_is_compatible("renesas,r8a779f0") &&
> +	    !of_machine_is_compatible("renesas,r8a779g0") &&
> +	    !of_machine_is_compatible("renesas,r8a779h0"))
> +		return false;
> +
> +	gfp_flags_quirk |=3D GFP_DMA32;
> +
> +	return true;
> +}
> +
>  static const struct gic_quirk its_quirks[] =3D {
>  #ifdef CONFIG_CAVIUM_ERRATUM_22375
>  	{
> @@ -4975,6 +4987,14 @@ static const struct gic_quirk its_quirks[] =3D {
>  		.mask   =3D 0xffffffff,
>  		.init   =3D its_enable_rk3568002,
>  	},
> +#endif
> +#ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
> +	{
> +		.desc   =3D "ITS: Renesas R-Car Gen4 GIC600 32-bit limit",
> +		.iidr   =3D 0x0201743b,
> +		.mask   =3D 0xffffffff,
> +		.init   =3D its_enable_renesas_gen4,
> +	},
>  #endif
>  	{
>  	}


Honestly, that's a bit too much copy-paste for my taste. Just refactor
the erratum handling to be more generic, something like this:

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-=
its.c
index 291d7668cc8da..380c4758647d2 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4894,10 +4894,17 @@ static bool __maybe_unused its_enable_quirk_hip09_1=
62100801(void *data)
 	return true;
 }
=20
-static bool __maybe_unused its_enable_rk3568002(void *data)
+static const char * const dma_impaired_platforms[] =3D {
+#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
+	"rockchip,rk3566",
+	"rockchip,rk3568",
+#endif
+	NULL,
+};
+
+static bool __maybe_unused its_enable_dma32(void *data)
 {
-	if (!of_machine_is_compatible("rockchip,rk3566") &&
-	    !of_machine_is_compatible("rockchip,rk3568"))
+	if (!of_machine_compatible_match(dma_impaired_platforms))
 		return false;
=20
 	gfp_flags_quirk |=3D GFP_DMA32;
@@ -4972,14 +4979,12 @@ static const struct gic_quirk its_quirks[] =3D {
 		.property =3D "dma-noncoherent",
 		.init   =3D its_set_non_coherent,
 	},
-#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
 	{
-		.desc   =3D "ITS: Rockchip erratum RK3568002",
+		.desc   =3D "ITS: Broken GIC600 integration limited to 32bit PA",
 		.iidr   =3D 0x0201743b,
 		.mask   =3D 0xffffffff,
-		.init   =3D its_enable_rk3568002,
+		.init   =3D its_enable_dma32,
 	},
-#endif
 	{
 	}
 };

Then add the two lines you need in a separate patch.

In the future, please provide a cover letter when you have more than a
single patch (git will happily generate one for you).

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.

