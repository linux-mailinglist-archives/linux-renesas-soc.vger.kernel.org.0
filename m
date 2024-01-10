Return-Path: <linux-renesas-soc+bounces-1489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F7829E4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 17:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDAAD2826DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 16:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83324CB23;
	Wed, 10 Jan 2024 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKz+MkGH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE84C4C601
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 16:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CAEC433F1;
	Wed, 10 Jan 2024 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704903284;
	bh=Xx0Rbe8QTGItzmg/lcxSs/JDjzXu4x7aHez4euG12i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKz+MkGHDrZ5TN6vtJKdN/gdUvfbqTG4WLH+XQPp7QIIYYUJW7F5/sS3iJ3KXv7u4
	 XDmDjkRvFDBbXRlj3S59L++jtcLJ0oQz6H8vdpKUrngbqAveGVbYUscj5kR/iMulth
	 KWhTpKuPrbbpPhSroCp+w+2krR81PkaQVQWTuliy8rShSbvDZaWWBKea3jRdf2B9nt
	 4B1UPnFVYsRXoku8MXgrKGgfLd+37X+xM17i8JxiCjy9KBBocczIRFxXcfRh++Rsim
	 J/P5VCJMpZLmBGkW4RWoRSghCJSB0gBKK2NJOXeIsHeX9l7Ai7enE4DJIN/4fR+guf
	 9fSs/1ZGVjFoA==
Date: Wed, 10 Jan 2024 17:14:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <w5yc4ahv7tlr2bb4otzy7cnvke6q63w4msaxhdvpmeia3s5xi5@yhzvc3rxrowj>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <he23e5al3hinegebvq7qai4jdw3qjgbzmnx34xgxqnu3hw4jke@dts2vi5kcs4u>
 <TYCPR01MB112697575E0CF41CC26A8140086672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="quvacqf5r5l65bcx"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB112697575E0CF41CC26A8140086672@TYCPR01MB11269.jpnprd01.prod.outlook.com>


--quvacqf5r5l65bcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 02:34:33PM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 2:24 PM
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > On Fri, Dec 15, 2023 at 01:25:48PM +0000, Biju Das wrote:
> > > Hi Maxime Ripard,
> > >
> > > > -----Original Message-----
> > > > From: Maxime Ripard <mripard@kernel.org>
> > > > Sent: Friday, December 15, 2023 10:24 AM
> > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > >
> > > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > > Hi Maxime Ripard,
> > > > >
> > > > > Thanks for the feedback.
> > > >
> > > > Thanks, that's super helpful. The architecture is thus similar to
> > > > vc4
> > > >
> > > > Some general questions related to bugs we had at some point with vc=
4:
> > > >
> > > >   * Where is the display list stored? In RAM or in a dedicated SRAM?
> > >
> > > [1] It is in DDR (RAM).
> > >
> > > >
> > > >   * Are the pointer to the current display list latched?
> > > >
> > > >   * Is the display list itself latched? If it's not, what happens w=
hen
> > > >     the display list is changed while the frame is being generated?
> > >
> > > There is some protocol defined for SW side and HW side for updating
> > > display list See [1] 33.4.8.1 Operation flow of VSPD and DU.
> > >
> > > All the display list operations are manged here[2]
> > >
> > > [1]
> > > https://www.renesas.com/us/en/document/mah/rzg2l-group-rzg2lc-group-us
> > > ers-manual-hardware-0
> > >
> > > [2]
> > > https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/media/platfor
> > > m/renesas/vsp1/vsp1_dl.c#L863
> >=20
> > I'm sorry, but I'm not going to read a 3500+ to try to figure it out.
> > Could you answer the questions above?
>=20
> The answer for your question is,
>=20
> If a previous display list has been queued to the hardware but not
> processed yet, the VSP can start processing it at any time. In that
> case we can't replace the queued list by the new one, as we could
> race with the hardware. We thus mark the update as pending, it will
> be queued up to the hardware by the frame end interrupt handler.

Ok, so you need to make sure that the list entries are allocated and
tied to the state. That way, you'll know for sure it'll get destroyed
only once the state isn't used anymore, so after the vblank.

Maxime

--quvacqf5r5l65bcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZ7CcAAKCRDj7w1vZxhR
xfi9AP9ZjMEY1DG5Kf0hgpbXKMvYDWH7F+QdjnlW1yZK6Rl9ZwD/SE1pHnLKJe6e
TDH7FGGhUZWvBi7Bvy4ckxCXQD0reQM=
=qAb+
-----END PGP SIGNATURE-----

--quvacqf5r5l65bcx--

