Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E08EC15AE8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 18:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBLRQB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 12:16:01 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56539 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726982AbgBLRQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:16:01 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 373D77B86;
        Wed, 12 Feb 2020 12:16:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 12 Feb 2020 12:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=VlwaHrYSMc5EXnk7OL7eHGgUQRx
        9+OHs9o+E4xgjGdg=; b=hYIlU5K4+ezqu7KluFhemjtph9JOs+x11ZR5fXOy0zW
        kq/xY2VBXMX3S4I+qE0fXsNQrIpAu1cOYcCm3t8I7qrLhalik1b9oKjJ6EpT3xov
        8/7iBexBt2i/aydlwFqSh7oiHChvKi7SmJgmv90dFD34oNSOn0rsoXCnBuMqM7yR
        Cvezfcu9kB8wMPSNrvROYswP/61c9xMg7YB6oy4//k+dJpbpOn6c/Hgur+bpWKUP
        YCBd8U0nJALJojMf3cmeM/FvSLXOVGQlT2fyX5sD+JkzDWq1T5RZFpkbkbKnZeOD
        kL6lvzEVR4hoGq+TKBaaj1KbGl92MREUNKjuh9PHDhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VlwaHr
        YSMc5EXnk7OL7eHGgUQRx9+OHs9o+E4xgjGdg=; b=w4dQ1bvkrRBqTnYkwbOESa
        5Q3Itg4wv4HIEiNLypSnDC9vw5/Or1wnm27ZHa0Jr07PMBZbC9m1j6uzxzOTKXSJ
        MCaUi6CraFraYKsy1+6UaL0U+TvGNbGP4Tow0w0sv0PgDTtOh11DnDH5SFwtDa6o
        cn5rIM8lBSJtiXlmSoA5cAMwO80n/B6bJot2/TZbCY1APr7hVCQArIRSoXO7+36D
        b6Y6ECkYlbluMSOSIO2Nt9q0fI3wjA0s5+jQp4bKwqf27YkSzX37011B/1rMr4gl
        A3/dzay78+4zK6xw0YFq+CKh9PfsPFowEwA9x1Y8rtFoOv6V4DqJOLV/FuRhf6fQ
        ==
X-ME-Sender: <xms:zTJEXk6EtNTrdAC_6kwRCIcAhu0CuZLe0RUaLqvKA621vAbYoSUG8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zTJEXqNUOvm3UA2ubbpF_Mn1RE9LyA6nP91YSYaPQpIRo0jz9JXPAg>
    <xmx:zTJEXikuucGRdFkbOzYAUFF2EO1s2d_p6nErMSPNQqNkd383GH6-yQ>
    <xmx:zTJEXhR176hzeg3xaL_go2tR1R3dCGONt-5Kwg8QurmJNHuhng5LTw>
    <xmx:0DJEXlEm2yYxWz6W9MxkKZt8pA49S7ySE_nGRRDsAF5U_RUkpLBazg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5A7833060717;
        Wed, 12 Feb 2020 12:15:57 -0500 (EST)
Date:   Wed, 12 Feb 2020 18:15:55 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] ARM: sunxi: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
Message-ID: <20200212171555.rhglnhhfxljd2ktb@gilmour.lan>
References: <20200212100830.446-1-geert+renesas@glider.be>
 <20200212100830.446-7-geert+renesas@glider.be>
 <158152739647.121156.16877229572128607400@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ww2rdwwsu4sgynif"
Content-Disposition: inline
In-Reply-To: <158152739647.121156.16877229572128607400@swboyd.mtv.corp.google.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ww2rdwwsu4sgynif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 09:09:56AM -0800, Stephen Boyd wrote:
> Quoting Geert Uytterhoeven (2020-02-12 02:08:29)
> > The Allwinner platform code is not a clock provider, and just needs to
> > call of_clk_init().
> >
> > Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Applied, thanks!
Maxime

--ww2rdwwsu4sgynif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkQyywAKCRDj7w1vZxhR
xVAyAP44cXhjx/0CW1CFNAKxhdKU4gzpGWXvxPJibw12XvM6WQD/a/OTdlgu8Ofs
1nDzz3yzF/+ciyJSn/Q0Gv9vy5DD3Qs=
=bEj4
-----END PGP SIGNATURE-----

--ww2rdwwsu4sgynif--
