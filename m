Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C694775A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238405AbhLPPSq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:18:46 -0500
Received: from www.zeus03.de ([194.117.254.33]:48676 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238395AbhLPPSq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=WmZovi9XfxSxemOmxhKe5Wuie6y0
        9Z5RWTgZmz/RaNw=; b=pmnawwHGHKYi65tpBcsEgQc4t9ogrU8ivNDrB5wxVud1
        mj6wiIZ6CXmh/s+7vIG8ovjizCXqDw4Sesy6J9b3GriV2SAEPX7WjlLJgmHeHVXE
        jn4Y/HbLQWAqWcqNYKvQiZXYgOWFfLBoY8VM8uAR8VEnFnABhOfCAo2cJYyWjCc=
Received: (qmail 3752495 invoked from network); 16 Dec 2021 16:18:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Dec 2021 16:18:45 +0100
X-UD-Smtp-Session: l3s3148p1@KPs08ETT9pkgAQnoAGshAMNCcCooTOTk
Date:   Thu, 16 Dec 2021 16:18:44 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH 2/3] serial: sh-sci: Use dev_err_probe()
Message-ID: <YbtY1B+CPlPNCwwm@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
References: <cover.1639663832.git.geert+renesas@glider.be>
 <5c4dd8df1f8d0d14786f26ee80b77f3eb8e06cd5.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KUgrjd1BoDAnS/TS"
Content-Disposition: inline
In-Reply-To: <5c4dd8df1f8d0d14786f26ee80b77f3eb8e06cd5.1639663832.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--KUgrjd1BoDAnS/TS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 03:17:33PM +0100, Geert Uytterhoeven wrote:
> Use the dev_err_probe() helper to streamline error handling.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--KUgrjd1BoDAnS/TS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7WNQACgkQFA3kzBSg
KbZiYQ/+NQRsipkqFr/pFpuDnS4hx9zD2lO4elItMM/S8a3LAYwTZPmco7ju4alg
vnDLkuRECBbQuhNYasj6cmuqPYMsTfxy3QKlOeOCXWGIkp9tiDP7DlcLxIrMV8fB
M9WhgR+8XUvhFqRXyld8jCIv7nzCKaVQaHIeJvy2+dqoK4n9hMjpAZ4vhvl3GqzB
wk8UT5oviOmiT4pWNrno+Ymr7mK60JNqGJ4i1EeZkHkuyZToX3UUVG3FGW5nu9vg
FzlNronXiQy/y4Yj/mK4Q0qrspiUXkmz76Nx8vMK8HAlA7KP7SfqirCMp3/AdC/E
okjFOtNVspKbRdikvXFaMQo0iCQIa4SBnFmrfhTyUr1ea/l0Gex4KL7iJcu9oUoJ
jZsBs58bziOOm+tyrSTZVPgdaoQN7ed2uCGcjmT2SI8kcocaBxMUMsht7AtJvvwG
a4FUBXwJAjftyDJn5THmL0b8BDJtSgqeSlMrJhCuD9QH+sQ5mqSHekWhmg4niqGx
ZDv9VGNfDQ7ZCoXhMIwzU9a62Oe18+s2LBYnkSqvCnazvfSifg+1r2Cq/VEe9csM
J/dxd9KcvY56CSRP5RfJ3yHz2UyZprgeA2bX34t8Doav/w/M9O1kDlff0mOz1Uxw
h0YcdxaAEgFZPyYPd6RspQHaiyBdG/IK1tA/uTA/ET9Ba9p79b4=
=Lpup
-----END PGP SIGNATURE-----

--KUgrjd1BoDAnS/TS--
