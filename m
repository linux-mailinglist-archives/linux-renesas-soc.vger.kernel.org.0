Return-Path: <linux-renesas-soc+bounces-27618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFxpMxCQe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:51:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90203B2707
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C90E1304DD41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7AB344D9D;
	Thu, 29 Jan 2026 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oElgh6KB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB132DF14C;
	Thu, 29 Jan 2026 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705386; cv=none; b=u4hc02yy4UBDSRNyQl2s7tIOgKURgW7s7oGLrdOyCuNY/lZat/sACXU4D+FBx/R8FDeZ4wsA4RT4w6eGB4pewOko6wXDEtuYESpHaD2otmdQ//r+6CMN/z+OqghL1KzcuIchaPR6NSN6G11JwZlhRHeY+37/HkTSSt2AruKqraI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705386; c=relaxed/simple;
	bh=ARSzGqoVtMN/A5CweAONtNPo3wWhdsbB/r2XlA9twNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhSiLey2LKjZL020cnkIkmCOZZ1kM8Su15mEwhqfwYxSyvqONPgW3FFBl6Upwiky/xkYJGGPeWWOWqoKjKHD+qvQQOa46m4LkEkFl4YH8cc3J1zA8D2TDBWadSip1uqLJWj9eCo+7iT2IkHq6eOQyMs4WjbZ0qJe/tNcl2LgXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oElgh6KB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A34C19425;
	Thu, 29 Jan 2026 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705386;
	bh=ARSzGqoVtMN/A5CweAONtNPo3wWhdsbB/r2XlA9twNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oElgh6KBaWlxL811qbr0RY8TYzYcxeAkgXxO/EpX9eW57V/3pDHytQhEw04FlTGyp
	 KKwRykS4Ovki69I9dcmCFAqkQoxhqumIowNYoM+8/NVDRxfDwmq3FMz7as71CbCnIJ
	 Cdwm0lROerVgYK7h33PDfQgxQpnEmK4fqBH2Vn4DNaPt93JdULd36cnOO2KXv2kUDa
	 HHRxWNmXubjFliDSbXtBxQr8VnGQ3ZZwketX9QpRh+CmOW3w9hepQNvbf8vknz3g0F
	 yboYPENiqZhqIFWDi+mLkZjmyaZDu/8CyXK2cLflrwtYkrQkCJUxrkqSG+H4AFVTTx
	 yejR3c1157Dmg==
Date: Thu, 29 Jan 2026 16:49:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Message-ID: <20260129-judicial-hardiness-f40d452edbb6@spud>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
 <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
 <20260128-chaperone-hydrogen-421d911b964b@spud>
 <OS7PR01MB173719D8E22176F897D0757C1FF9EA@OS7PR01MB17371.jpnprd01.prod.outlook.com>
 <TY3PR01MB113463F7E7E5FD1F5D71E2F44869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4KIjBnWE9Wbayfsn"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113463F7E7E5FD1F5D71E2F44869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27618-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90203B2707
X-Rspamd-Action: no action


--4KIjBnWE9Wbayfsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 01:19:55PM +0000, Biju Das wrote:
>=20
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 29 January 2026 12:55
> > Subject: RE: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pc=
ie: Document RZ/G3E SoC
> >=20
> > Hi Conor,
> >=20
> > Thanks for your review.
> >=20
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Wednesday, January 28, 2026 6:40 PM
> > > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Subject: Re: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-=
pcie:
> > > Document RZ/G3E SoC
> > >
> > > On Wed, Jan 28, 2026 at 02:16:37PM +0100, John Madieu wrote:
> > > > Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> > > > controller to include support for the RZ/G3E
> > > > (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe
> > > > controller is similar to RZ/G3S but has some key
> > > > differences:
> > > >
> > > >  - Uses a different device ID
> > > >  - Supports PCIe Gen3 (8.0 GT/s) link speeds
> > > >  - Uses a different clock naming (clkpmu vs clkl1pm)
> > > >  - Has a different set of interrupts, interrupt ordering, and reset
> > > > signals
> > > >
> > > > Add device tree bindings for renesas,r9a09g047e57-pcie compatible I=
Ps.
> > > >
> > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > ---
> > > >
> > > > Changes:
> > > >
> > > > v3:
> > > >  - Moved interrupt/clock description in distinct PATCH
> > > >  - Fixed clock name constraints
> > >
> > > Can you explain why "pm" isn't close enough to "pmu", when it suffices
> > > for "l1pm", and therefore the same across both devices?
> > >
> >=20
> > Regarding using "pm" for both, the underlying hardware clocks have diff=
erent names (CLK1PM for RZ/G3S
> > vs CLKPMU for RZ/G3E) and serve slightly different purposes - the RZ/G3=
S clock is specifically for L1
> > substate power management while the RZ/G3E clock is for the PMU block. =
Therefore, I wanted the binding
> > to reflect the actual hardware clock naming.
> >=20
> > There are also SoCs (such as the RZ/G3L) that have both clocks (CLK1PM =
and CMLPMU) as Biju stated.
> >=20
> > Is the explanation ok for you ?

yah.

> >=20
> > > >  - Updated clock descriptions
> > > >
> > > > v2: Reuse G3S names
> > > >
> > > >  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 76
> > > > +++++++++++++++++--
> > > >  1 file changed, 68 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > > b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > > index d1eb92995e2c..d48187ca0849 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.y
> > > > +++ am
> > > > +++ l
> > > > @@ -10,17 +10,21 @@ maintainers:
> > > >    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > >
> > > >  description:
> > > > -  Renesas RZ/G3S PCIe host controller complies with PCIe Base
> > > > Specification
> > > > -  4.0 and supports up to 5 GT/s (Gen2).
> > > > +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> > > > + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
> > > > + up to 8 GT/s (Gen3) for RZ/G3E.
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    const: renesas,r9a08g045-pcie # RZ/G3S
> > > > +    enum:
> > > > +      - renesas,r9a08g045-pcie # RZ/G3S
> > > > +      - renesas,r9a09g047-pcie # RZ/G3E
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > >
> > > >    interrupts:
> > > > +    minItems: 16
> > > >      items:
> > > >        - description: System error interrupt
> > > >        - description: System error on correctable error interrupt @@
> > > > -38,8 +42,16 @@ properties:
> > > >        - description: PCIe event interrupt
> > > >        - description: Message interrupt
> > > >        - description: All interrupts
> > > > +      - description: Link equalization request interrupt
> > > > +      - description: Turn off event interrupt
> > > > +      - description: PMU power off interrupt
> > > > +      - description: D3 event function 0 interrupt
> > > > +      - description: D3 event function 1 interrupt
> > > > +      - description: Configuration PMCSR write clear function 0
> > > interrupt
> > > > +      - description: Configuration PMCSR write clear function 1
> > > > + interrupt
> > > >
> > > >    interrupt-names:
> > > > +    minItems: 16
> > > >      items:
> > > >        - const: serr
> > > >        - const: serr_cor
> > > > @@ -57,20 +69,27 @@ properties:
> > > >        - const: pcie_evt
> > > >        - const: msg
> > > >        - const: all
> > > > +      - const: link_equalization_request
> > > > +      - const: turn_off_event
> > > > +      - const: pmu_poweroff
> > > > +      - const: d3_event_f0
> > > > +      - const: d3_event_f1
> > > > +      - const: cfg_pmcsr_writeclear_f0
> > > > +      - const: cfg_pmcsr_writeclear_f1
> > > >
> > > >    interrupt-controller: true
> > > >
> > > >    clocks:
> > > >      items:
> > > >        - description: System clock
> > > > -      - description: PM control clock
> > > > +      - description: PM control clock or clock for L1 substate and
> > > > + CLKREQ_B handling
> > > >
> > > >    clock-names:
> > > > -    items:
> > > > -      - const: aclk
> > > > -      - const: pm
> > >
> > > and I'd like to see an attempt to keep an items list here, by making
> > > the second item and enum if you keep using "pm" and "pmu".
> > >
> >=20
> > I'll use something like this in v3:
> >=20
> >        clock-names:
> >          items:
> >            - const: aclk
> >            - enum:
> >              - pm
> >              - pmu
> >=20
> > If this is Ok for you, I'll keep this approach with both names.
> > What do you think ?
>=20
> So, for RZ/G3L addition, it will be
>=20
> clock-names:
>    oneof:
>      items:
>        - const: aclk
>        - enum:
>           - pm
>           - pmu
>      items:
>        - const: aclk
>        - const: pm
>        - const: pmu
>=20
>=20
> RZ/G3S: aclk, pm
> RZ/G3E: aclk, pmu
> RZ/G3L: aclk, pm, pmu


clock-names is mandatory here, could you just do

clock-names:
  items:
    - const: aclk
    - enum: {pm, pmu}
    - enum: {pm, pmu}

unique-names should make this right on the g3l and the others can
constrain. Might make this a bit simpler?

I looked driver, where is the clock control in it? I see stuff with
resets and a ref clock from some syscon, but nothing with these? Am I
blind?

--4KIjBnWE9Wbayfsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuPpAAKCRB4tDGHoIJi
0hEoAP4p6SRowHvtuHrp0bKKrd3nn9qddnesOzRdiu5m2TfWCQEA/eqKsLrNmt7t
Y9I7sy/zqU98vVEApPXN4F+QWbgf+go=
=1yvi
-----END PGP SIGNATURE-----

--4KIjBnWE9Wbayfsn--

