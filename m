Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD2D450834
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 16:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbhKOP1h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 10:27:37 -0500
Received: from www.zeus03.de ([194.117.254.33]:56650 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232424AbhKOP0v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 10:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=shoNJ4zQL6aY89k+n+/ckjNC6mE6
        LxV/uIaRVU4+4IA=; b=XwZOeVsV3MXPfIeBMQWZ4inquKPGxW90/YeYvZo4e+o7
        L3qnrC7mubkVAoReAYJWdbC0Jv3vnOHsPq+YiF+cdKXZU/rpIC2ykUsbNJHHnR8F
        lUAFhfkkDgeerAitjk07LAlzMECRo7nu43oxZx55ga+TXQY4GAbLJXgZ4ki0LBE=
Received: (qmail 2381361 invoked from network); 15 Nov 2021 16:23:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2021 16:23:42 +0100
X-UD-Smtp-Session: l3s3148p1@eb+oZNXQdIAgAQnoAGuqAcpaucS5KLT8
Date:   Mon, 15 Nov 2021 16:23:38 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RFC PATCH v2 00/21] clk/mmc: renesas_sdhi: refactor SDnH to be
 a separate clock
Message-ID: <YZJ7ep2A91AjFntJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB5922A97F46F04F3EBDD8E55886989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I5IM6s6XROec0zQS"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922A97F46F04F3EBDD8E55886989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--I5IM6s6XROec0zQS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I have tested this patch series on RZ/G2{M,N,E,L} boards
> and all looks good.

Awesome! Thank you very much for this testing.


--I5IM6s6XROec0zQS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGSe3YACgkQFA3kzBSg
KbY76A//Q0fjDxz7N4oeypqYSSz6Xn6h//GkaD8hM2nnApqVdV3GLUmEmPGgyyh5
weWY+nzavQfUB/HMIBnxrafVXTtnU3UvqqJHtUusJF1GFspeI1XQkLNlUWZDq11x
qo/ZAIyrelj+sQFUUIKwpFw+3CeAdQz4gi0xC/v2hMdjaRcrx0b/4Gxil4nsjfoL
HTuB0Qy8lkS7rmvSxJHEw/Wm+TUlkO3Q/vkQyxlMALz9JmaBqBuUgyqevrX6cP3Q
BCyz17k7uGgqcLAB7mTTkGHDCgfkU1w97Dkws0DQRG7u3cu5JKT2/y/PxYs9/CmC
oWjB2ISnKzpDkat8rVFVnRmUQHwz1Vse51oVemh6kfuYDWyENGPfLNfYckHP9FLs
tWqVGlU27Fqoo72SraxjtKfdcgbWOhGYYRkWOe8frBn9hGU1yS0zG+YN1xO7o9ri
KwSv4FGcJeRafM2z6t82CvdfCp7+AIv4PylNOOkCYCU0PvQ85acfIHErUeEgKY+a
1Lho2ueEU6fmpn8kRcwRaX8V5/dKPS1AOOuYc+f0unS+A4mcyQjOJPcnRJJog8zV
iAeNC/eowV2dc1KUbGWGzGc8vCZwrkpXovAovXY7IgFTlLSpxkabWE4ZzHDeYTDv
b6lvPaiZ8+Q4DpJxKNoIHXQ7829B61MAtCi48y8HkXrtQIiEVHk=
=89iR
-----END PGP SIGNATURE-----

--I5IM6s6XROec0zQS--
