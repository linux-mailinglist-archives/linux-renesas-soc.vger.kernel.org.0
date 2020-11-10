Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501142AD717
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 14:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgKJNHT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 08:07:19 -0500
Received: from www.zeus03.de ([194.117.254.33]:36838 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728478AbgKJNHT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 08:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=HsG2YGsb6weLKN04H7QT0AcccjNx
        mev8ZvkgzEmG9O8=; b=uItAbpEdNMNPrvzqm4PE8hkQ/fIcHcIsjZXDdnmkl4po
        yWpLOFdrB65S2Mr1EJq1/JGzqHApan0tVx87XW5fR0fQskYVkRp8Qt3kO00vy2XE
        I5tS0RWyv9sO6G3u/Dzj9lvmJLfZqLOIGKet8G92qhJrPsmq0xqy4ETP/mcBnOU=
Received: (qmail 2175720 invoked from network); 10 Nov 2020 14:07:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 14:07:17 +0100
X-UD-Smtp-Session: l3s3148p1@KPG4W8CzpMkgAwDPXxAvAEQD26z+TKuA
Date:   Tue, 10 Nov 2020 14:07:17 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
Message-ID: <20201110130717.GB3612@ninjato>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFpGX0HOQr4z4LEH9FLiqeRJzNiUpBLpCNquJGJnZNFycg@mail.gmail.com>
 <20201110124018.GA3612@ninjato>
 <CAPDyKFqT0Yz=aKku_OFj3=dDaBpK6kdvAPOOV9_xAvQ_yt+1bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqT0Yz=aKku_OFj3=dDaBpK6kdvAPOOV9_xAvQ_yt+1bg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Can we have this in 5.10, too?
>=20
> Of course, thanks for the reminder! I have moved these to my fixes branch.

Thanks for your support, as always, Ulf!


--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+qkIUACgkQFA3kzBSg
KbaWCxAAo7Di6r+Im9GbwTsJWPYf/F9W7A6MrZxX2TKC1hv1geho0pivw+ZMuNPl
j7wIegeDZKdDELqlDhds3zA8zOBTbzzu0MfnRr3B27Y72KnvDsmFpikS082D+r27
H4PiZjUuv5LeZBEgT8NUPqsrVYKFgErw8cpKJeI+/rx9ksszhM7wwg/kwWd/EM1d
GSoVKXMbxwiXT4H846zPU0yTN5BN2kzGQhefQqWUvg369ldF7bB4C4V7CINNU7Tu
R4p8JxtBmtruYyvzvSb+FdTsqT+R1vvIHbmMFBfGA1pFO2CrGyyF6GiWEMkdZnXL
niL4XJJhu9yJSD1eBc6mZQIdA0R5VWLl+0vrc97v7bDPonSFX48HKWVyB/3W5MHy
TbwOiORekNzoxj+KOuJqVkZzCVk6Ts3RPtdKLFGEHIfw/RjG1BGyUBPZDSnmmcAq
+i/hLegvZ5nGDoYJyd1uhTRAoDcYaPHlGmv8wvYr8p6gYi6RyckXmgfiSM5yMhmQ
i8iJfCNhBKNccvyLWmzqrFQxEp3hcvxovIhFCpXGhmJJz5ctjQkTdorzI+JTYmpg
QaHuksn76saGRQhelyMgOL5CCBxD11rQsXCmjrrgTfY0UcwApbsY6dbWbgMVaIYt
f7544lzNApdBLbG0AIgyYetWcaoVrNQPm7lx8oHJsnPKFp5f6Jo=
=pjin
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
