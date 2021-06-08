Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5E039F950
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 16:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbhFHOkA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 10:40:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:60806 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233316AbhFHOj6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 10:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XJCuWfo5eAbDv5zgeZ7ERR+YZDez
        znIFc46PElab7T0=; b=TLrKYjHYEbxeHzIVPlpIZrkY0aMVB6YaJTVtXvPbC7mK
        wgmARkYjhf09wJJBXwf6h6xnuLEYkiqiZT2u60BeF+Rfw9t2YAve1EqdR1u0q6Fh
        qq5ZiEBkUHYv3dumc+9o3SFDzZYBbPsimZEQxfuf0WL2L8D801roZWvpoh3OC1E=
Received: (qmail 1141824 invoked from network); 8 Jun 2021 16:38:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2021 16:38:03 +0200
X-UD-Smtp-Session: l3s3148p1@hLMBG0LEzqJQT+F6
Date:   Tue, 8 Jun 2021 16:38:03 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: abort tuning when timeout detected
Message-ID: <YL+Ayx4krpiNN66y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210602073435.5955-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFo0jP-0yZd-89J7v4xdcBnH5H5yGa_s4a-hw=mkHxOrxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oWVskFD63TrM1JJz"
Content-Disposition: inline
In-Reply-To: <CAPDyKFo0jP-0yZd-89J7v4xdcBnH5H5yGa_s4a-hw=mkHxOrxg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--oWVskFD63TrM1JJz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Ulf, I'd think that mmc_abort_tuning() should be named
> > mmc_abort_tuning_cmd() instead. Because we don't actually abort the
> > tuning as a whole in this function. What do you think? I can prepare a
> > patch if you agree.
>=20
> Good point.
>=20
> I have no strong opinion, but perhaps mmc_send_abort_tuning() is more
> consistent with other function names?

Ack. I will prepare it!


--oWVskFD63TrM1JJz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC/gMcACgkQFA3kzBSg
Kbb5XA//RoiPTiyZfCWDQcN2Ub63y9hdyFZL0ktASXW7fEAm/9pC7PHqipwU9uov
Mlf6z2fAjPG/JXrGDr75vpW5hxLgojQH9rCZ6kViD/4WtvhVSS7EkVyd/bb0lRCS
ZyqK6zFAg/9OrNNcqQuZ9jFJ22zSwbqtI/G514i8KtScRkiTYe+hgNB2Xbl4CH7Z
rZk6hx/LUjDEs4V0xLiVTqBtlMkIsHgF27MMw6SfCATTq7GfWzPq669JwAfytKsJ
unnxQxxdx2MBsIwzGJB74lP2LDtYDo57gRuGC+t1KR1PdhoQeXgA+l+bvF22EbOo
JUJ6Qk4AKBcZFEytDparvbOMZuibpjOkkPdVLBw+wSwElnJ8FBmXepjePFM13xx5
HO1KIJoAUljyiLS+3PQGYpKtFv/+WWGSNuwSMLIHhkoQCtV1XnRATflHR8g+3t+k
qSpO3CCAEBVj+K/fntp3v+Oj+bQH4EMmpZvjMrDPTg4KKkLiyX6lH4wpyJjfnmPh
0POaQZuZ8nM08sN0g7XkY/Jj+36T6RfoWQmiIGjiy3QaxSVxCrlx7OiJR/tMqiK4
6Rplec+SQXxwJLPnx+bNfjIgy2VPV4u+erFF6cXvI6H3EqRFqKzfQa8mxqhn1+/D
JWiA8aK1qZFkD2exTU0yEciq74x7PyWn+5kDLijrq1aoJNRresw=
=/aoN
-----END PGP SIGNATURE-----

--oWVskFD63TrM1JJz--
