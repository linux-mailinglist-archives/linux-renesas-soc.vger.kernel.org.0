Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B4E2E7AEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgL3QHE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:07:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:50876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgL3QHD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:07:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60049221F8;
        Wed, 30 Dec 2020 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344382;
        bh=bmXAtPLzNXWv7GJkY+HXOfgSF+c/I/VqflCssZL4iBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RQjeqZ5Uv+t4JrAW6y8V0ub/qxY2Sg3WqMw0kQ3R9tbuR+P0Mbc4MVMApZUzdgvAR
         hYy6cOgrTRO3x17dWZ0HwzZFzNdHBtk1zwydeuUSRxW9qjkW1AZb2VFW84bWXOIpNY
         FDnXjmLlbZ456HIm/EraKYCzuENiGBUHr3FqqZpkh2+gw8Im8h796imwZUitRqJh/t
         SkyvRV5epgFiJSvQag9F83PmGWI/K2y55dVfTGa9DdREnabYDdGZFIK2rjzrprpBWa
         YS0f+sfkjCau93+5N1gFV1Igw2tG5xsghsC5bbKIxBOiKFSY2pZtafqtXePxewdfc+
         VJ34n7rs3Mzjg==
Date:   Wed, 30 Dec 2020 17:06:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH/RFC v2 1/2] gpio: rcar: Optimize GPIO pin state read on
 R-Car Gen3
Message-ID: <20201230160617.GF23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
References: <20201030081522.2297074-1-geert+renesas@glider.be>
 <20201030081522.2297074-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hK8Uo4Yp55NZU70L"
Content-Disposition: inline
In-Reply-To: <20201030081522.2297074-2-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 09:15:21AM +0100, Geert Uytterhoeven wrote:
> Currently, the R-Car GPIO driver treats R-Car Gen2 and R-Car Gen3 GPIO
> controllers the same.  However, there exist small differences, like the
> behavior of the General Input Register (INDT):
>   - On R-Car Gen1, R-Car Gen2, and RZ/G1, INDT only reflects the state
>     of an input pin if the GPIO is configured for input,
>   - On R-Car Gen3 and RZ/G2, INDT always reflects the state of the input
>     pins.
> Hence to accommodate all variants, the driver does not use the INDT
> register to read the status of a GPIO line when configured for output,
> at the expense of doing 2 or 3 register reads instead of 1.
>=20
> Given register accesses are slow, change the .get() and .get_multiple()
> callbacks to always use INDT to read pin state on SoCs where this is
> supported.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hK8Uo4Yp55NZU70L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spXkACgkQFA3kzBSg
KbbPvQ/+OmuM/7ox5jMqe5PDd0hNb/00mFI9ViTcBDKexYwUfw60nl63JAXsXSw+
X4ovQmXbP8Fid6zmjwYoDn9IFNbOqX/WZLrLyijUXBleNsRRx7ol5+RI2KtNKhb8
DXWNoeOlhL8coOWnoCrhneOZ632feWEkRyl3adYs8yF/fnBWLPjOMzXDqyOxS6j9
qrTsnwqtUFgHhY4zT09V+gTvBrAicPtJgvq1wDzV4cJdUeCa6tkU1uPwxfg/t9+k
GH5s4/XdCoGaFVzude7zp1uY2rISVijLUPjKxx/i8gJ4Pho9HHwrk44TV+oQahVE
Hc5/BBSOCpCfTgtiBGOdn7UGbKxdSje+1Ugl+LjUa8CFpBL05lZkSjSWjHrQm5tO
P09jv6w6v6QSZkM58cch5/5MtAeFW59FiUmCytnd4wajiHG1XteWv0J66gXllPe/
QN+/FbmQESz+YcBJMbGNjpxskY2D2ttqp4/wLWCwJ4glFdyg2b5MD+Dgc/Iw4UHw
opyvGthFwSsLRHCVOBhueK5lI82F82p65Obfep6guQ6WxH19+p1NA83u3an4/UAw
4xshbJtQe7uD53jGZJZibrII8Z6i8nA3i0z8XTu3CMdMpMNzADm8oyNfF6ZibCzC
EL2dJkFISxOvY89E1oq1cjLkC6tNTlZeoQWIP3VFVDtgOPRTPG8=
=BtBU
-----END PGP SIGNATURE-----

--hK8Uo4Yp55NZU70L--
