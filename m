Return-Path: <linux-renesas-soc+bounces-20925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E095B3207E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 18:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172789E7D52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 16:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C252B27FB10;
	Fri, 22 Aug 2025 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2M8VQ8x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ABC265606;
	Fri, 22 Aug 2025 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879756; cv=none; b=fi1z2ip0Lx2kIUl0XTRVQgrGn0l0pgVhv4ShxfGScbhYVBid+OmqKS9jzoa+mshJaVWnq1pP91Z5+kOHWkXboQo5SGKMd0Y6NBgFpKBxw81gLfrGi/5j+/sSUhY7Iaz/6hRv5Y2OrWE/BEyA3ZAG1Y3AfdJ9yLSzvKe1D4VmvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879756; c=relaxed/simple;
	bh=QRF5S1JctSVCfJiq37FRGDX/S/NZL6ziFSrp1lMAHW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKjxH0qX13b6N4RwEQrefR9Ivyn10N2WbhkXsteA9jvcGo8Lzo+BbRcPxXklqj0PjdqXNNC0kJKqMAphB1edv/WMvoawRnDLp/yidddsPN/TP7wlvaZSfk1pBmnvsR+pz2VvCC/ETxBvCzc2dHcIXNgMSYQIvymZBbzPpF4sKRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2M8VQ8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A320BC4CEED;
	Fri, 22 Aug 2025 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879755;
	bh=QRF5S1JctSVCfJiq37FRGDX/S/NZL6ziFSrp1lMAHW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2M8VQ8xXkYI5FF48BwvSDtjvmYmKqQG2dmzWmNJ/nr7+fKUa/jCj82iZBW+MoW+N
	 AkWp0Go3eAgAZAlexp2cSHGtTZWL2MA0J8ZCgu1CcVNXjVDidhw0t9+CQsU3b0JPsO
	 CnXIXZ+CCLekCD4sHtnpG9r+J3N5x90jUT/gkILUrsWjXOQbQ34JxU9sBFzcmGcXQG
	 plZdP7ZH1KvoUjsP3cTXv32PEixvkJMmnbQ62NT0suObmmtSRmFMzOHtAVCjzB5B7t
	 czIVMT8hKXnjcZ4DSz8VooaPmGs/nrzyfF0MMto89mqV62845tgSXQuAvv1O1UJ/1y
	 JHleRDVa0i92g==
Date: Fri, 22 Aug 2025 17:22:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Message-ID: <20250822-headstone-churn-10f632ea4be8@spud>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
 <20250820-onyx-salad-c5c96f6bd480@spud>
 <TY3PR01MB113464F2ED8BFBB823B038C038632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20250821-arrange-exhume-aed87b75305c@spud>
 <TY3PR01MB113463A076C2122107764660A863DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tBNBaExK7Ja6D/pV"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113463A076C2122107764660A863DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--tBNBaExK7Ja6D/pV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 06:48:07AM +0000, Biju Das wrote:
> Hi Conor,
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 21 August 2025 19:16
> > Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E US=
B3HOST
> >=20
> > On Thu, Aug 21, 2025 at 07:15:59AM +0000, Biju Das wrote:
> > > Hi Conor,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: 20 August 2025 21:11
> > > > Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E
> > > > USB3HOST
> > > >
> > > > On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a US=
B3HOST).
> > > > > The USB3HOST is compliant with the Universal Serial Bus 3.2
> > > > > Specification Revision 1.0.
> > > > >  - Supports 1 downstream USB receptacles
> > > > >      - Number of SSP Gen2 or SS ports: 1
> > > > >      - Number of HS or FS or LS ports: 1
> > > > >  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbp=
s),
> > > > >    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5=
 Mbps).
> > > > >  - Supports all transfer-types: Control, Bulk, Interrupt, Isochro=
nous, and
> > > > >    these split-transactions.
> > > > >  - Supports Power Control and Over Current Detection.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Reviewed-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
> > > >
> > > > > +    const: renesas,r9a09g047-xhci
> > > >
> > > > How come these don't match? I don't understand your naming scheme a=
t all, so idk which is even
> > correct!
> > >
> > > r9a09g047 is SoC part number which also known as RZ/G3E SoC.
> > >
> > > I just followed the convention used in [1] and [2].
> > > Please let me know I should change rzg3e-xhci.yaml->r9a09g047-xhci.ya=
ml ?
> >=20
> > What's the benefit of using that instead of the compatible, other than =
confusing me?
>=20
> I guess, for an end user it will be useful to locate the document easily =
without any issue

If you're looking to avoid issues for end users, why are you mixing and
matching at all between the part number and the codename or w/e RZ/G3E
is?

> Given a choice to locate a document rzg3e-xhci.yaml vs r9a09g047-xhci.yam=
l which one you prefer
> for RZ/G3E XHCI IP?

My preference is filenames matching compatibles as the norm, but
apparently Rob doesn't give care in this case nor does Krzysztof
(seeing as they acked/applied similar stuff for the platform already) so I
won't dig my heels in.

--tBNBaExK7Ja6D/pV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKiZRgAKCRB4tDGHoIJi
0iGDAP42ywp92WEyKz8PRn+lTrdgfP1Ta4wlwf4RLtmPdPnxAwD9GaY6k9mOZvTQ
vBz7pPOTGFrqTVYVu3UAC5GZZakRcQQ=
=g6VL
-----END PGP SIGNATURE-----

--tBNBaExK7Ja6D/pV--

