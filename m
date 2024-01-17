Return-Path: <linux-renesas-soc+bounces-1609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF7830798
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jan 2024 15:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938F81C21492
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jan 2024 14:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9C620312;
	Wed, 17 Jan 2024 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jxq1VhGe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03C200DE;
	Wed, 17 Jan 2024 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500518; cv=none; b=u1KCRhivcF/uRyoMLRNhdbp2yAMKPRpMbC48xEutrM9GE+TCPpBMVY3eOUj8Xdjl69IFMdb9ecZfEjvKGP6EuxRtG6FeBQ/AePR5KNL6xHZFwR8CznN3oP11cVdI3xjEpccAqHHzKVoXPkDAcD6VygElHbpUAo2EfB9X33PmLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500518; c=relaxed/simple;
	bh=qjYGIkHICpe0Z0dACHKFFmyiWosuvqoeWCRjzmSc9hw=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=K+zm1lLShhcgrYiIeRJaE2x/vlM4NfUnmyScNqmXv2SehDsloR1p2iAm1Sf/hvNEIfQHxDheS2RA6c/kRmc0FFdC4hEf0jJ5h5PmpXzgyJDbk1dVqecQFV1L61tdh1tw1Nco4ncSZtboQ6Q5kC0HLobaYIAUTicCqRs9rAtdaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jxq1VhGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7D7C433C7;
	Wed, 17 Jan 2024 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705500517;
	bh=qjYGIkHICpe0Z0dACHKFFmyiWosuvqoeWCRjzmSc9hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jxq1VhGeBHXXzjpnwUH+hoiBgw4k7S2cHqouGInnFW2VI8pBU/srH+FipPV6FFAiA
	 CjSD9tbuYuaIusakunF7ikLsHn29ZPflFYeHO1/47LvT2cN4T7rSNGFtyIMaIAfga8
	 60qa1sTSYCNsVfH9Kjt9A17tU0G5dS7AY+GT9k4mWFkmEJmo+jZ6hLpFXNfMnHOtRi
	 YiR8UTT9g6UciTH3rwq2s04/Nss2ZdCYr9E1pluxfYEhy9Qe5kMbX5t0of0sPi1nP8
	 O5wz1wFIIT9sm3k/Uy+vO9A6MJXNgSB/fiuvwvCRpc6GXFRyjRhznare4nxQNRaU0R
	 0ltb+zjIrj/tg==
Date: Wed, 17 Jan 2024 15:08:33 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document input capture
 interrupt
Message-ID: <ZaffYczD0E34zNMo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
References: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>
 <20240115-wages-secluded-b44f4eb13323@spud>
 <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>
 <20240115170807.GJ5869@pendragon.ideasonboard.com>
 <20240116-coasting-pastrami-1dda8d1025d0@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BnJW/9g9dKSPOiUT"
Content-Disposition: inline
In-Reply-To: <20240116-coasting-pastrami-1dda8d1025d0@spud>


--BnJW/9g9dKSPOiUT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Maybe writing this as
> >=20
> >       - description: Underflow interrupt, channel 0
> >       - description: Underflow interrupt, channel 1
> >       - description: Underflow interrupt, channel 2
> >       - description: Input capture interrupt, channel 2
>=20
> I, for one, prefer this wording.

I agree.


--BnJW/9g9dKSPOiUT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWn32EACgkQFA3kzBSg
KbaH3g/9FB2Z/5Mpn3Q8jmWo+Xi/7IOOZYsMhlye6Vh3DXao/Yp9kjgUF6+/vnJi
F/Xf4k4mKWN/mP+NEdMvm2QuJsWeRtWXHNHBK+en2AIhTxRLDTFb6g/B614VCTyQ
9haXR7RQndmsYwnfvbflHy0wzkRV31Bpp738fWYMUv39XqBePftZw6+j8yok0Zg2
Boy3HpirVMUUjSJvDUVmYEnsON8/LWUK23q7XldORcUn8zbE2lg13lEntKW9tZjk
6vsSAHs2bjhRjl3sIBGPVHafDoGZSf2l4P2d7Z+ttlzeFryQVUnpih4L6E3ddhfq
DqiiNwJY8UEDBOdDFCIHu6MoJcn5HkUVJmcDTJU9jAzvQuwr5ZJqBO3HIC4XeErz
YAM7MFTsvt0MkxvMxRuaip8dmMMtArZ9+WgZjxL/BBezysw44CCI/gbt+UQ7RIBM
ySlWtcx5dARH56I1CEUhBOc1NyNVhtcd6fYxOVP1BakeOCy8F0XFtmvrcRqzNDVa
0EcqN2jRKfbqsPN0oP6al7mA2P40yVV4fFEwzX/NQ2ZW3OVPhXyrJQI6XmOrhdkk
fkpo+3raNI/kBLgSS/TvMonwlgO8ax6xbzsaiLIeaPgEyafuWEh3ux4RGp2B8AzX
1075MNXwlFvlmBsp8T3v0YIHiZ/wur9Q0KaIJFHIPMyzQoHGMGg=
=E/0h
-----END PGP SIGNATURE-----

--BnJW/9g9dKSPOiUT--

