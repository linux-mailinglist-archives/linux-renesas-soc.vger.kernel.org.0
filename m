Return-Path: <linux-renesas-soc+bounces-745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361B805A98
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 17:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38BAF1F21748
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 16:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEF360B8F;
	Tue,  5 Dec 2023 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isAYfAH9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5823F8C3;
	Tue,  5 Dec 2023 16:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49393C433C8;
	Tue,  5 Dec 2023 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795446;
	bh=Bnbbb/t/neU8v4aEB3GzaAgUlxHPniDC3dcRbHvEclQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isAYfAH9S0p4OXdDl65YejvoRK2LFcFaH+0n9QDR/IZYxfwmieLqzVjc/g8s0HZ9H
	 Hy6GzxygzVaolbY+kM2SkCspvU7iUznIly6eIrftEO+RpY7X8aywc26iurNEgeRMRx
	 eZeDlWH8WWNjKUA5RM1ehQONqhb5HrhaM9yDVe93RXy8TRSmZwGKnxbe452YK4RC9G
	 Rg52rgTucYUbYpcDF/PsyPnpCxq2K8iPzt1VTNJR79kvhZj4pLPlMH1XHgespMQyvK
	 AUMt6+jOGbgvIRMgn6mbRa7fOPHDdZSZMNGqOX7lKlWvbFfTdNMKYZ0R+tTTjnH0C7
	 9koaOR56soTwQ==
Date: Tue, 5 Dec 2023 16:57:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3.1 1/8] dt-bindings: mfd: da9062: Update watchdog
 description
Message-ID: <20231205-resubmit-grumpily-bd2490dfa8d5@spud>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LjToOVLe5mRBkJCE"
Content-Disposition: inline
In-Reply-To: <20231204172510.35041-2-biju.das.jz@bp.renesas.com>


--LjToOVLe5mRBkJCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 05:25:03PM +0000, Biju Das wrote:
> Update watchdog description by referring to dlg,da9062-watchdog binding
> file.
>=20
> Update MAINTAINERS entries.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--LjToOVLe5mRBkJCE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9WcQAKCRB4tDGHoIJi
0p0uAQC3G4ZXXxM1lO3/KXzAAlMWiLzmqLEX4HA9oS4yxVMJcAEAr9ALfshBHak2
+drhazTbmJOlvNDZynJyraMW604k3Qs=
=yqle
-----END PGP SIGNATURE-----

--LjToOVLe5mRBkJCE--

