Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09B3E8BCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 10:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbhHKI3G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 04:29:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:51806 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229679AbhHKI3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 04:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8Pm5n4YPSN8Lq7yE16wzJuvY0yXj
        VPzc3wRo20Iwd80=; b=ckERZSVHy9hLcmJaGvWZFxlm3K4EtuAGvzdOUsauvzJR
        /Fs36q3YFAMwDtXrFV/Ow2Ojxmx6aPu3zGJqpTqAkQmdNJgWLchGrxE0db7lquyg
        6QCeHz4XSxiq6JDuVf8FQIPvBI/rdKGYqgi93lh3fV50EVUJxgXMzCxvU9Xxejc=
Received: (qmail 2577701 invoked from network); 11 Aug 2021 10:28:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 10:28:41 +0200
X-UD-Smtp-Session: l3s3148p1@lSbmZ0TJjsYgAwDPXwY8AL9PxqFiRnVq
Date:   Wed, 11 Aug 2021 10:28:41 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4] mmc: host: renesas_sdhi: Refactor renesas_sdhi_probe()
Message-ID: <YROKOTm+EZmta4n0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210729103234.480743-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aotWwR6XK/29MT2e"
Content-Disposition: inline
In-Reply-To: <20210729103234.480743-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--aotWwR6XK/29MT2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 07:32:34PM +0900, Yoshihiro Shimoda wrote:
> Refactor renesas_sdhi_probe() to avoid increasing numbers of
> sdhi_quirks_match[] entry when we add other stable SoCs like
> r8a779m*.
>=20
> Note that the sdhi_quirks_match[] is only needed on
> renesas_sdhi_internal_dmac.c so that of_data of
> renesas_sdhi_sys_dmac.c keeps as-is.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I like this change! Not only does it avoid the white listing, but it
also puts things where they belong! Looks much more sorted to me.

I think we can base even further cleanup on this. Like merging
soc_dma_quirks into the other quirks. But we can do this incrementally.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I also tested this on H3 ES1.0, M3-W ES1.0, M3-N, and E3 with some debug
output. It all made sense and SDHI still works:

I also tested H3 ES2.0 without debug output. SDHI still worked.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--aotWwR6XK/29MT2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETijUACgkQFA3kzBSg
KbaOFA/+N4fs79obLJDnk1Z7QvhnXXeKWMFhnZ0YrPLEFodY4pzVgI1+UQxKatng
KgpD57/RJFjAZTA0crRxI+GcM5naIzLw/07GON1MIo6LQpUjrztpfyA5sh2WIyxs
tDcAVHweU/WFa68L613T8aFiYf8g4bNNAOwCX0uNN/MJ7v/nfLW5KUednyIyD1iK
bEzykd3wkABK6QIScWDymyvqWXYDOZ8kx51A9Ah+uumn+0H65ZM/hC9BG8+hz6+k
w71sCHGH0KuWVdmkKXDFinb6bskp+kGUe9y2fFNpnxlOMQxZJce/YX3YI0UuFf8n
Yd4peM37kuOXAVTmeuzD98gI2zQoPTejIhfFUmuNM4pBMl3DBHpnbRIvG8ZObKcB
YBxC5IrB4CtXFFiis6PMRNmOPs0RvKPIdPYFQVxLHuxDCj95QcuKqS6XZ0mRwFxD
8f/xYPqnLh0UYt7eKhXy3XQmZvKjwl4LiUtg6pY8EpMPuwDjJRq3z494ps4tosbb
MZ1v0H24GWMUsIuc+yHZ89MuQ2RDrrlaNujyjD6HReOX4YC6c3TOyCDVEkKWXlvv
ymneWp+EFeTIYpG+QV6Msl3v6eP8XbXCr2I7hUsyhCEQtjwd/o26avqqKTMTCmsx
hliE0fzPHPvuEN+6h42+wGRBfPe4PCRqoIdXYo1gjMxmsP6LeZo=
=sOfU
-----END PGP SIGNATURE-----

--aotWwR6XK/29MT2e--
