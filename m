Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55307453A26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 20:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239921AbhKPTaP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 14:30:15 -0500
Received: from www.zeus03.de ([194.117.254.33]:41990 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhKPTaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 14:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=KqYnMDA+rPf68ZnvQaONoLWqJL3I
        3Pgwef0pH4uM9t8=; b=BcjGeHSAIl/+jqVR9x2AhBj25ErtAMBhw323ya5H9lUI
        3twJ70SAqocLHK8xWaOEG3XJUa4QWxv4ZiqrlNMxBUGl3tWTvv6dZnVZpBmf9SoK
        YZjg8OqO1jcoLr+357oJ81fh9axSS5ZOjH8Nhkq26TyVDEbeSSNtRvFlXu8Gobw=
Received: (qmail 2848732 invoked from network); 16 Nov 2021 20:27:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2021 20:27:14 +0100
X-UD-Smtp-Session: l3s3148p1@Ihem6ezQBpQgAwDPXw8LABHxMEpbPi3w
Date:   Tue, 16 Nov 2021 20:27:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Use devm_clk_get_optional() to obtain
 CD clock
Message-ID: <YZQGEfz43rkUf7AF@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <540d803d31bf9aa1d0f78f431cae0ccd05387edc.1637069733.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2AcDv5UJRus9xcTD"
Content-Disposition: inline
In-Reply-To: <540d803d31bf9aa1d0f78f431cae0ccd05387edc.1637069733.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2AcDv5UJRus9xcTD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 02:36:07PM +0100, Geert Uytterhoeven wrote:
> Use the existing devm_clk_get_optional() helper to obtain the optional
> Card Detect clock, instead of open-coding the same operation.
> a side effect, real errors will now be handled correctly instead of
> being ignored.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, Geert!


--2AcDv5UJRus9xcTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGUBgwACgkQFA3kzBSg
KbZu9RAApRP4HwvCV+sQb6HBvMbovLrZB7TM3OETuC3kV0az0BhDSjZwNYj2v2q8
OnsJ9pvfkDQ6P3NCK63Gl5HRjWRiZmEv7GQ7K23JZek+ah9N1DduCb2V0Ln1o7Hc
pXy+Zy6S2QiqCWpdHX7Xhs06MKbbM2W3ayHtMjSn52nP18Uarn66t+V/ESXLrt4U
SWiyvTjnYz0xbHb68MjFQl9C5mj8uE6HbJbNtzeKBZbUYRsbnH6O/66kgLLqYCgb
kyck6uzSJUhir2m5DgBDdkgTJos7ShwV2Xz/ERgeh2YuAUA/oDH4555iDdc/aCxX
t43NNIERzTzvFe0g6wGLbqHZQ9ZSiEaLOUJnmjCVpihX0u9dHRQeioIJ5sQk+rSN
SuUCXlxUCRB1XriYLV6eDVJI++76QQLe0L3TST6wUO4dFp2OItWrCjJNjka0a1WN
dQxsKK+yew9aQaAsJVfWEDzgJ3B1xU/c/daERupe/OdhVQiNlmloJO6dFAHw61IQ
iaNFCInBeLoJ7FHMg5kPPM8fmz4Tf2S+7TTPURxt9SCWxaCSU8aUlQwG7EYieFBg
ag4Y/giKkr0xYTuw5oDdIZdJyMuj255GX0y87PvpNTrCh/NqS07xSvZU0skl83oW
uhEA9r6Lys9dfjx3bKrrpW1iE+hLEElq0hT6jU8ARSAJ69HarIU=
=OjTg
-----END PGP SIGNATURE-----

--2AcDv5UJRus9xcTD--
