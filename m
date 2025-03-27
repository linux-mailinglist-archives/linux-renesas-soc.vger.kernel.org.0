Return-Path: <linux-renesas-soc+bounces-14926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1BA7371B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 17:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1E93AF205
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 16:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D96D20CCF1;
	Thu, 27 Mar 2025 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjNJmDSj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F41A3159;
	Thu, 27 Mar 2025 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093647; cv=none; b=sh3CK+T03RFFeepvR3rBOHpXVBOBRpRdBeHta0Va5z9RsY2whbCXR4ncSSC+JeR7PR0FjpTOypktyJq1CNe0xAkC27l4Y0FqWfVKRsz6hPMlITDTdOt9KiaFQHHdjbjXijKRqT1mSVdhTz2QFUpMrqOL8/GzdlIQ5clH6i9BU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093647; c=relaxed/simple;
	bh=nw6QSPdQYYmQyRESFL7Fz5mINk4DCE5DFYZA3PpZUDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4yT8xdmOUevaz2JwgFb4h3VTLYZ3PDTmxPmWvn1F16xuFwIDqC7ffj1tKMeFzjgKbsiFnRc8k/29IIiohjnfyRO5JtBbkl7h/4vnMQNwmboEkdmVdOrTdsC9mo1k8JfCJ2pKKd3PEEUIg99T/m++d/OKLOZh+ZT6Wz2H0d2q/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjNJmDSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733A2C4CEDD;
	Thu, 27 Mar 2025 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093646;
	bh=nw6QSPdQYYmQyRESFL7Fz5mINk4DCE5DFYZA3PpZUDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjNJmDSjniiHESAwwEREi4LiwbjB3qor5cylvoS18QWsR+Spef+njkGLG72eVnT7y
	 o0iaHMB+d73aM7hBDVdH0f4LqWTrnhAAat++01K8k+za6IJaN0SxSIkJZxyiEg3UP8
	 yIqgGQ6xvariEMMzu0YlTCyclpVmNMCi1/7a699YhXlNjfn4VObZn6FTT2FB0hF/2c
	 MGSbokdLs0844btP/PGeq6aIefHkqSZGiIdrffl3HFxA0Nnf6/ja6NSyj6VE0ad3aO
	 kh778KziwBFVv4XvJILvkZqGI2RGLHqsQBwvwZTEeqtTSFLl9cOWkI/BEeb/A+mn1A
	 vk5rep2sL1xwQ==
Date: Thu, 27 Mar 2025 16:40:42 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 Control
Message-ID: <20250327-comply-murky-cffc47465429@spud>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305-cesspool-headlock-4d28a2a1333e@spud>
 <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>
 <20250306-slather-audition-a6b28ba1483e@spud>
 <18780ad4be2c28999af314c97ae4104fb161a691.camel@pengutronix.de>
 <CA+V-a8tYv_u4UM5XVysVMPbfJoVwKFHqucLdJOmDP-xrXZ0L5Q@mail.gmail.com>
 <CA+V-a8sfx-QwzPz_zEEmGAyAoqha5cfMs9CvWDVJ_b0-D7QfpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t7DfaAM27KeM8t9g"
Content-Disposition: inline
In-Reply-To: <CA+V-a8sfx-QwzPz_zEEmGAyAoqha5cfMs9CvWDVJ_b0-D7QfpQ@mail.gmail.com>


--t7DfaAM27KeM8t9g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 11:06:33AM +0000, Lad, Prabhakar wrote:
> Hi Philipp and Conor
>=20
> On Thu, Mar 13, 2025 at 1:17=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Philipp,
> >
> > On Thu, Mar 13, 2025 at 1:09=E2=80=AFPM Philipp Zabel <p.zabel@pengutro=
nix.de> wrote:
> > >
> > > On Do, 2025-03-06 at 16:26 +0000, Conor Dooley wrote:
> > > [...]
> > > > That sounds awfully like "it was wrong before, and I want to keep u=
sing
> > > > the wrong node name"... If you're claiming to be some other class of
> > > > device, "ctrl" should really be "controller" like all the other sor=
ts of
> > > > controllers ;)
> > >
> > > There are "usb-phy-controller" nodes on the rcar-gen2 SoCs.
> > >
> > Ok, I will rename the node name to "usb-phy-controller".
> >
> Fyi to chime in with other reset drivers I'll rename this binding file
> to `renesas,rzv2h-usb2phy-reset.yaml` and have the node named

> `usb2phy-reset@15830000` in the example node.

At that point, isn't it then "just" a reset controller with only a
single device that it resets, so "reset-controller" is the right class
of device to label it as?

--t7DfaAM27KeM8t9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+V/igAKCRB4tDGHoIJi
0nDwAP492sO8TrE28FCvFPFQPB+n3zVDKJ701XsdVAH4BZIC8gD/WPlRuig/cC4Z
dsNjG53TeGJNVW1VNZGR4PzVV2wLlgQ=
=rz9f
-----END PGP SIGNATURE-----

--t7DfaAM27KeM8t9g--

