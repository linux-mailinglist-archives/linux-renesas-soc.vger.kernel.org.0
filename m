Return-Path: <linux-renesas-soc+bounces-16657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD77AA775A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 18:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983C13B6F83
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 16:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46472254B1F;
	Fri,  2 May 2025 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFysst/0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188431EEE6;
	Fri,  2 May 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203514; cv=none; b=pfG7j0S3xywA6n2h1Am/XWfAY5SMaLTZG79X1//4k+GV0b6skKRLF9Lw4kI91GmJUAyUiH9qlbLMYX1DJ44NlvZvUB4iCgL0kQMJhIRdm04VZktP15aS+d4MFcQNEevhcHDh+6IqsTcnXMUTJYRMT44guviou+AK1stmlg72Q90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203514; c=relaxed/simple;
	bh=1UWbogJgeco5WHNezkVt8ymTxY2YVnBpAsTKrv/cZmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2xIpp82Kf8E2lfwqqFv7yOOjsUAL/v4uqgfn2TNcBuKSYFrx3B0NLyXFDmPW5UHQ1dbFOL0ssMl8RjkbovbIicgFKZ54zPVFMkszUmcRKzZT4jM13aAyIANUX4E9R2fS866qjI0La/IEZUoELDUTzK8Onvq8NoJI/QE92VT6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFysst/0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E50CC4CEE4;
	Fri,  2 May 2025 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746203512;
	bh=1UWbogJgeco5WHNezkVt8ymTxY2YVnBpAsTKrv/cZmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFysst/03X8hMdpX7sFMDrNdgbyCwQPuks5HCkYv8hzqEoQPzHdryNaChZk1HshOu
	 o63yTy7OBPNw6CYZdBX+yVGAEL009P8R5Sbe4oUtT74144L2lIBDpdeiV5KoDaCuG6
	 Pviy+zCWGlzVC8jUK107vjFkuGKs9HTF1tA83O02jwuS8ktnFaOiAkk+zSnkx002Jn
	 ZKnOZc3kGfgPpuMSHuB/BWzn8lHsZMXHb+/84agLKZeyxaw2KRRAFhQwPiLjHUSbko
	 CVdnt3iDclcrCjWsGgOk1StOxc+mqmMayJYpiUXjIrJ5270O5CTw57QiEwEV+Xi4IE
	 xvEobnpBn8cww==
Date: Fri, 2 May 2025 17:31:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250502-pound-clay-e5c00911b26c@spud>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1h659JRnvzLpgwnc"
Content-Disposition: inline
In-Reply-To: <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--1h659JRnvzLpgwnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 01:46:26PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>=20
> Also update the bindings to require the "resets" property for RZ/V2N
> by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> the "resets" property.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1h659JRnvzLpgwnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBTzcgAKCRB4tDGHoIJi
0pXcAP4z3/dK6X2Ypr13HK+ekeneGtjckP7okUIxK5d79phtnwD/QbJEr7QLNlGo
eAqFaqZ0TrpadWiEN6QfAHSjqdT3awU=
=i5nU
-----END PGP SIGNATURE-----

--1h659JRnvzLpgwnc--

