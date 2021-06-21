Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC0C3AE5F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhFUJ1O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:27:14 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39661 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230175AbhFUJ1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:27:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 27B8E580729;
        Mon, 21 Jun 2021 05:24:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 21 Jun 2021 05:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=QxyRCw56RmwfC4S1d/yB2NPnff0
        BTF8jycj1UZFZOJo=; b=npjXHHvytKMSpcHy05FREqM6WoH2QfHaRWOwoh1gTJI
        +P897+R0OniZWpBHMj9k+WJltAyyrpa6Yp+2/MP5r/bP+eNP+AQAPDprewP+3/yu
        g/OgybLvwOM2yn4dIzUnzEkK024WlgwpkF3X+hY4Dtr5HEfOW7RMjRuZk/TsuXIw
        u6ogHxxUOkDo3A4ahIHkKu0dcIgyZrM2YofZK0WRODW7D2tSVB9AF48kBU4NrXYc
        Gp6xb8U5Hwe2PyQP8oSoDk05eDoRlgMczrr3igl2+Z+H1s0HdpImoRqXjtsCToLC
        7MTKEtfQC/adkCZkT4+gv6z7RhSemxIkXI6d2gVF1jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QxyRCw
        56RmwfC4S1d/yB2NPnff0BTF8jycj1UZFZOJo=; b=M48pTmlIx68Lnx1QR85eFG
        Zwirpl1+Ql7Ue8l5TzNtlAxuTKvF8uZkgXPhUL6SYTaMXEMwzkzDs9j7sq7KG3Zz
        hCcQ59ufyWliuzam7l3L2K/YTZ/8lYpfd7nydQuX837KZQC6T+MTLqGYUBE7YCWv
        EYrEKMtrIVxw5LVLKAAXbpYPhEsNc8wD3YYxJ6Fcil1B1VvY6nL8FE4Dl0QSrSz/
        CJ/kLly3Kz1PBo/LevXybi2yBr95P4B/979iVvexZDK9JOI9fD99GA6XAALqwjir
        6LgKmK82gGRelYox0cvSCYVx6Vwi0L3HvgEdybLLs80K+jxRYB7Ib1Odr+ziOAeQ
        ==
X-ME-Sender: <xms:6FrQYN1fMBgyxnejtjwDiDUmGWoArg3IOR1Icv8LWs7JYFKeA9CrCQ>
    <xme:6FrQYEF7axDha0Qwas79kvOP82YbN3QtP5OeZfm1ScKbMb2QkbR20kcHlWpS06hIk
    YFUtyD9zbY-zyirE7I>
X-ME-Received: <xmr:6FrQYN44zIPubjZytZ67_2R1ybQBDgBuDhjaXPhM04YsfnaFUtaBhGASZg7F77ASIy5p3OJrvXt78jIVwvU6GnnRrhoulqZAyHWx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6FrQYK0Wl87_Xs__Vs_2d1BZLkXeyN8sKhgNI5CJu5zN4IjsshyEPg>
    <xmx:6FrQYAHac96gY3gmP-yAvwfg3Lgeiw7AMJKGlxcj_2DSobH7ltxCJA>
    <xmx:6FrQYL9UAyVtYBm1Hm3YnFUVGMOmLZr1p3JGgl4PrDQHAJUGHqQGzA>
    <xmx:61rQYI_u-BujOaCITJgA5pOANeuHUhQNrNjwiEp81SBTaApWjb2Vnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jun 2021 05:24:56 -0400 (EDT)
Date:   Mon, 21 Jun 2021 11:24:54 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Tomohito Esaki <etom@igel.co.jp>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devlel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210621092454.jvdmelk2h427jn5v@gilmour>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xz4kqr3jldf7e74a"
Content-Disposition: inline
In-Reply-To: <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xz4kqr3jldf7e74a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 21, 2021 at 09:10:19AM +0200, Thomas Zimmermann wrote:
> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:
> > Virtual DRM splits the overlay planes of a display controller into mult=
iple
> > virtual devices to allow each plane to be accessed by each process.
> >=20
> > This makes it possible to overlay images output from multiple processes=
 on a
> > display. For example, one process displays the camera image without com=
positor
> > while another process overlays the UI.
>=20
> I briefly looked over your patches. I didn't understand how this is
> different to the functionality of a compositor? Shouldn't this be solved =
in
> userspace?

I think there could be a bunch of use-cases for something that could
"steal" a plane without the compositor knowing.

Something I'd really like to work at some point for example is that the
downstream RaspberryPi display driver has a visual clue when it's
running too hot or is in over-current.

I don't think this is the right solution though. The DT binding makes it
far too static, and if there's a compositor I'd assume it would want to
know about it somehow (at least if it's from the userspace) ?

Maxime

--xz4kqr3jldf7e74a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNBa5gAKCRDj7w1vZxhR
xSSHAQDsK7MmbKj9NbX4esOTIjfHi+miWdtqwdA1VXPu7OAU+wEAsmJeTq9Unwha
ZjKrYBAvq23DkfZ79MOPlRjn2sRbjA4=
=pjsJ
-----END PGP SIGNATURE-----

--xz4kqr3jldf7e74a--
