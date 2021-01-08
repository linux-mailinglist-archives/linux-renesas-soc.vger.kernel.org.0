Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FB72EF0AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 11:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbhAHKba (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 05:31:30 -0500
Received: from www.zeus03.de ([194.117.254.33]:33246 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbhAHKba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 05:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=7lDOE+YYRVtoU2hI1M02tDYk/jNH
        RaolH2luiK4CdEs=; b=0EG+aTzy2omE4/OwApdtDOoIgfq1P9yPbCWQmGIKVhTL
        /ydqKZKkPf0pQRxIM2ALY518qM++e228ba8wicL4QhlGs7XmZwj4vMPkMHPKLUDh
        /i91xIiVhZwTDQpJgAmrX9sKVDMtcyO2x4pnLiVd0kS4+1qViW6SsVCgpfVGxUc=
Received: (qmail 1065085 invoked from network); 8 Jan 2021 11:30:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jan 2021 11:30:47 +0100
X-UD-Smtp-Session: l3s3148p1@0JiuDGG4tMEgAwDPXyX1ACWcscxtZ2TX
Date:   Fri, 8 Jan 2021 11:30:47 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add GPIO nodes
Message-ID: <20210108103047.GD1223@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210108102854.2025261-1-geert+renesas@glider.be>
 <20210108102854.2025261-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline
In-Reply-To: <20210108102854.2025261-3-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 11:28:54AM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the General Purpose Input/Output (GPIO) block on
> the Renesas R-Car V3U (r8a779a0) SoC.
>=20
> As there is no node for the PFC yet, all "gpio-ranges" properties are
> commented out.

This paragraph is obsolete by now.

>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v2:
>   - Add Tested-by,
>   - Fix "V3u" typo in patch description,
>   - Uncomment "gpio-ranges" properties,
>   - Verified resets values.

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/4NFMACgkQFA3kzBSg
KbYwfA/+OxtvulfpQzSiTnC89r2WqJDk42egb326hCZz7WIZOgBF+FbWO0WKFvQY
64SVKRi0m7GVWt3gwJvuIIOHHuiLLBsXcA6SIIsvVwB9ZKiyxI35SGUgJxY9S44v
FQZLZFcDVN4Ka8ORXicVJYsMUsFvURWGTVCfJad7Wb6azXxRs++GMRGZ5ZbUmWwO
oD6feVO3EPpqIz/h1MyRNGYvyTBz3UHB0nbg/HZeWSzBUuXLXlY1SPdOLxIVXdvC
gZHkhg6MsYYAJquJDVNmFuZ/hWdyncsfNPYuwIqtaLApjgJkWzEBgaxa1SEjAEgB
9baHcrFWOzb3KL8q4oeJyhH2/il2CPr80gksOAW1LcSVMDwPko9m6hTcX/mwVbHa
KdCcg3rOxTBzIORfJgV0iJWN7ZyBzngxidSDZ8gODC8LiBuKp4o7HCavn4tT2wkt
W62b4fjIUwmBBgc87ZI3VJUZhw4ewEgYtvDoPTRt5syDyULHQd+5k+mEcFzRg0oq
RVuEww0OuXf/HpdiunCxC4hGZM+mPJ3mBLucWfCba63qLlHV+R4Jzyulb2nCPFSE
7Lw/fmVuY20hp6xWNDK10QvawokiWNOcYXZSq87OCJU9Jd1oo4gWiVnfYG7HI7gy
uMMY435X8f55sj24/zx/2wfpgjOkbfAHtfylN6BlWZ/hyFk0WLk=
=R0Ga
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
