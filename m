Return-Path: <linux-renesas-soc+bounces-27560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id X8Z0JltKeml+5AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:41:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260FA70B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 713033007E17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 17:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A7336AB62;
	Wed, 28 Jan 2026 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjEp3Zxe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32576332EDA;
	Wed, 28 Jan 2026 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622024; cv=none; b=H6/kcCwZmciyUBgj1Vrs9X006MJ4ip3+XiK4XShovs6un2qhlvREn6N6Me3J234o+Lc+coPEYUi/Q5B5EmKq97ZY+Pmk8fxWZxYGaXUi8XN+bmIIEUG3xw/KuOMJ2c/UH4jUDtqjg4nDBER2v4oWk+d9Si5OY9vloVPb4eYJCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622024; c=relaxed/simple;
	bh=khyrGQmf+Ce2tJlN2PNwOqd2PrW3aF+HgKMEhC8haeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPUnWGBjlfq//0Xyipjv4U4gsa1fvdwuuDX1X+tkgSTv43zmw/t4eD/GYxuhwWWJPOdFYtINK4BW1Tla8NRsx3eGERJrjsfekiGmUR8zyMv+Gwo+FAGzYE6TvW660eLXPcKVvPEbmyCp3f6Hf+survzGmKwTky/8bPDPPzIGLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjEp3Zxe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77BBC4CEF1;
	Wed, 28 Jan 2026 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769622022;
	bh=khyrGQmf+Ce2tJlN2PNwOqd2PrW3aF+HgKMEhC8haeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjEp3Zxehx9gWAZSXqMQ8igZwLHRrZ1g377H1xLrs4yvIazCgxpqC9eHBqeT4ud2T
	 3juwhogKwd/twIu6zig2RHaKR6ZYAqByIvHf6adeux9BG4t9fmXd5CWeruLHS349x7
	 RiPlNBFWDNW5od04LCbLdM9Fq5BDtHLYix7vnGgcwFdVs3tzV3VkyaGTNh9s6JtK7R
	 VBTRtrJh+A+E0gWrZEcxDoFU/B1dDKCZvZ5cJMi6RD9+83LPP2XcKOGMqYfZsuW7Ye
	 PlA9lsX7L0gcqLQl1Mr/et16dNZTTWeSRBz8YHHQ4P5tTrfmZs8a1bMwD+pFN8gvgA
	 o6hqIl31EKXDA==
Date: Wed, 28 Jan 2026 17:40:17 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
	krzk+dt@kernel.org, robh@kernel.org, bhelgaas@google.com,
	conor+dt@kernel.org, magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Subject: Re: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Message-ID: <20260128-chaperone-hydrogen-421d911b964b@spud>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
 <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjTx5M0CprSqHCjp"
Content-Disposition: inline
In-Reply-To: <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27560-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0260FA70B9
X-Rspamd-Action: no action


--wjTx5M0CprSqHCjp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 02:16:37PM +0100, John Madieu wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie) =
PCIe
> controller. The RZ/G3E PCIe controller is similar to RZ/G3S but has some =
key
> differences:
>=20
>  - Uses a different device ID
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds
>  - Uses a different clock naming (clkpmu vs clkl1pm)
>  - Has a different set of interrupts, interrupt ordering, and reset signa=
ls
>=20
> Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v3:
>  - Moved interrupt/clock description in distinct PATCH
>  - Fixed clock name constraints

Can you explain why "pm" isn't close enough to "pmu", when it suffices
for "l1pm", and therefore the same across both devices?

>  - Updated clock descriptions
>=20
> v2: Reuse G3S names
>=20
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 76 +++++++++++++++++--
>  1 file changed, 68 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie=
=2Eyaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index d1eb92995e2c..d48187ca0849 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -10,17 +10,21 @@ maintainers:
>    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> =20
>  description:
> -  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specificat=
ion
> -  4.0 and supports up to 5 GT/s (Gen2).
> +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe
> +  Base Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
> +  up to 8 GT/s (Gen3) for RZ/G3E.
> =20
>  properties:
>    compatible:
> -    const: renesas,r9a08g045-pcie # RZ/G3S
> +    enum:
> +      - renesas,r9a08g045-pcie # RZ/G3S
> +      - renesas,r9a09g047-pcie # RZ/G3E
> =20
>    reg:
>      maxItems: 1
> =20
>    interrupts:
> +    minItems: 16
>      items:
>        - description: System error interrupt
>        - description: System error on correctable error interrupt
> @@ -38,8 +42,16 @@ properties:
>        - description: PCIe event interrupt
>        - description: Message interrupt
>        - description: All interrupts
> +      - description: Link equalization request interrupt
> +      - description: Turn off event interrupt
> +      - description: PMU power off interrupt
> +      - description: D3 event function 0 interrupt
> +      - description: D3 event function 1 interrupt
> +      - description: Configuration PMCSR write clear function 0 interrupt
> +      - description: Configuration PMCSR write clear function 1 interrupt
> =20
>    interrupt-names:
> +    minItems: 16
>      items:
>        - const: serr
>        - const: serr_cor
> @@ -57,20 +69,27 @@ properties:
>        - const: pcie_evt
>        - const: msg
>        - const: all
> +      - const: link_equalization_request
> +      - const: turn_off_event
> +      - const: pmu_poweroff
> +      - const: d3_event_f0
> +      - const: d3_event_f1
> +      - const: cfg_pmcsr_writeclear_f0
> +      - const: cfg_pmcsr_writeclear_f1
> =20
>    interrupt-controller: true
> =20
>    clocks:
>      items:
>        - description: System clock
> -      - description: PM control clock
> +      - description: PM control clock or clock for L1 substate and CLKRE=
Q_B handling
> =20
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: pm

and I'd like to see an attempt to keep an items list here, by making the
second item and enum if you keep using "pm" and "pmu".

Cheers,
Conor.

> +    minItems: 2
> +    maxItems: 2
> =20
>    resets:
> +    minItems: 1
>      items:
>        - description: AXI2PCIe Bridge reset
>        - description: Data link layer/transaction layer reset
> @@ -81,6 +100,7 @@ properties:
>        - description: Configuration register reset
> =20
>    reset-names:
> +    minItems: 1
>      items:
>        - const: aresetn
>        - const: rst_b
> @@ -128,7 +148,9 @@ patternProperties:
>          const: 0x1912
> =20
>        device-id:
> -        const: 0x0033
> +        enum:
> +          - 0x0033
> +          - 0x0039
> =20
>        clocks:
>          items:
> @@ -167,6 +189,44 @@ required:
> =20
>  allOf:
>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pm
> +        resets:
> +          minItems: 7
> +        reset-names:
> +          minItems: 7
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 23
> +        interrupt-names:
> +          minItems: 23
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pmu
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> =20
>  unevaluatedProperties: false
> =20
> --=20
> 2.25.1
>=20

--wjTx5M0CprSqHCjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpKAQAKCRB4tDGHoIJi
0j8zAQCLl8L/BlS/FFu8f6MeHM/NILku/Tonb1mbi0VujQSNWgEAwSYggayT+Xvw
DzeQuEWX7xE/qxptSExUedDNC4cwmAY=
=DB1o
-----END PGP SIGNATURE-----

--wjTx5M0CprSqHCjp--

