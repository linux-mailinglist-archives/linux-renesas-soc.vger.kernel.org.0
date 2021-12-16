Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9B44775CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhLPPXH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:23:07 -0500
Received: from www.zeus03.de ([194.117.254.33]:49474 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238454AbhLPPXH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=bqT/2v0Y0gGJNljxFf/7hjqDQDdF
        UhJP2wubjAG1znU=; b=N8OaIImovB7kO1H352IiJ9kQr4ZbmTX2DRM0NNjXZpu4
        l2f0ofVyy1C8PtciUnjcyA70ubxybXAYQsycweYNsnMtlpaQXyhw8YNC+jpLuVy2
        Up/eHGF00TGYBZcNmIo2palVY8RKlge5S4C1SlSZpkAHUV3Rwg+CR4q/V9jlqmI=
Received: (qmail 3753951 invoked from network); 16 Dec 2021 16:23:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Dec 2021 16:23:05 +0100
X-UD-Smtp-Session: l3s3148p1@e065/0TT+JkgAQnoAGshAMNCcCooTOTk
Date:   Thu, 16 Dec 2021 16:23:03 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH 3/3] serial: sh-sci: Use devm_clk_get_optional()
Message-ID: <YbtZ18XzusXJgKio@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
References: <cover.1639663832.git.geert+renesas@glider.be>
 <bce27288cb570952dd96b441e1af8768ad8b4870.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l877d+C3upxS7ffu"
Content-Disposition: inline
In-Reply-To: <bce27288cb570952dd96b441e1af8768ad8b4870.1639663832.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--l877d+C3upxS7ffu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 03:17:34PM +0100, Geert Uytterhoeven wrote:
> The sh-sci driver supports up to four input clocks, of which only the
> first one is mandatory.
>=20
> Replace devm_clk_get() and custom error checking by
> devm_clk_get_optional(), to simplify the code and to catch all real
> errors.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yeah, much better. Great cleanup!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--l877d+C3upxS7ffu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7WdcACgkQFA3kzBSg
KbZLwA/+LG8gt9+7ltg5w67QhoWEvIbrEHHqOdA541WSHy3PQWTR9/d/H2KiiUur
d2/TMyEBje29THcS+9JZR+OECHDufb/g2Va+W37znt8DdK4rta7f5zNo39amBzLo
sn1DKAhztZKMUdL1dPQoZY1zSJsBD/kpSiidrBmHTxoJo1UAUJNLjE+DyhnBh8iQ
WEUV2rnRLPpgOmBuHr3omaZxibm0QI2z9yZ89Ou4tVWfx4nL34oweRe1lKwvC3Bw
7ck1K6xO38eTFinGCU7RQCEO2ppg/18UhVp2o1qEiXWUQ+HffyfKJrv2I6YH100y
LGDobSGxY4PUXGv6m3H/MdNtwHpJan38UG+XlfZxNwJRjamOAA1rErV+Qk7qwZx/
pVTInh1Z5EXP8l3OXclHZXhS522jt9s8Rk/xxwBDeBiybJHceIHdAIGYTLovItlu
YtZflOBEa96fx3MfNCqjavefYKe+KEBgWvmwK7XV6/FHnCTw+43TWWFbrGB2tL1R
GVLMnvIBESp6lSyv6wnjRn9fF5iSHxxOktjiM0AZo8CaYSIJFf+pcq/Kc/0+xi0q
favIg8rDaB8im7DXvis9NKLTCmjT0ywCTuutdiKz3x7TMdi7WeokwOaev9Nt4JN9
k5TJL00vg+2tdxUe2RkhvQFjZxXUrKOozt+qW9aszm9hwGckUcw=
=qfKt
-----END PGP SIGNATURE-----

--l877d+C3upxS7ffu--
