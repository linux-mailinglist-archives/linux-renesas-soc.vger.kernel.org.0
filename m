Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D41344E711
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhKLNKU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:10:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:57690 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234942AbhKLNKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TwbvoMVc6/+l27aLDbiYiDtidDr9
        722wkbITOnJJyGQ=; b=hJyYs4uS1TOiOSJcsevSCBEc+yDr3Cp5nr7Q555buaub
        dp1gxIlvCqXO7st6stQJJO0IuBQ2IPARyu1TNPpOWiwAVWV4dmoRM2ZY44cF+5Wn
        TgkKOeHWFpqoLkani1hBhJPOnsOpxmjFwUkzRds5yQ/iBYAXw1w+92gSuyyj2LI=
Received: (qmail 1376498 invoked from network); 12 Nov 2021 14:07:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2021 14:07:26 +0100
X-UD-Smtp-Session: l3s3148p1@OjQDJJfQRM8gAQnoAFqiAcAEyXqBia2a
Date:   Fri, 12 Nov 2021 14:07:26 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RFC PATCH v2 02/21] clk: renesas: rcar-gen3: add SDnH clock
Message-ID: <YY5nDgVrlTI0A5cW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
 <20211110191610.5664-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdXLNB3ycxFkXH6UHAbAHWk0qr4UnSq5VNnYTXsEqTBzHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UwoaDWHcmW31ehkG"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXLNB3ycxFkXH6UHAbAHWk0qr4UnSq5VNnYTXsEqTBzHQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UwoaDWHcmW31ehkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No need to resend, consider it done while queuing in renesas-clk-for-v5.17.

Thank you, Geert!


--UwoaDWHcmW31ehkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGOZwoACgkQFA3kzBSg
KbZ+VxAArYNBtF9ngjrpdX++MlpOcjoVTOQriKtyhU0AjX7abdF36uLOsAUlG4vM
k41O9hfdd/UMXjxcN/ZuaX8dCncEwF4+XSaVjRerU8rtSdiopfJRNcnJCW8ZaGO4
1SapXln1ERI4MebNBcoJgYyb01ruREeMoZkAvix9bUvJRZ9fvFLCxuTbdsBzN59M
Hui7cluCkOEKJYadKMmOR59NjXFpDgoRkDRHluo4PTJe+5NZjdNop2NqufAqcMYf
oOIpTboX2mRPRTRzJW+xAcJ7EC7XWCS1Vx9C3cVXM/rAdMig37qCIDEviAguwEQ4
x7nuxUNaHrC1IDMB9T8V//Xipj+Ai0h1a8OUGwpSz12/JGEXiA9lM3t7DdBHmOv2
7yw8BsBqAtCimH1xs28dqYnAIa5SAFwtYtjkZtfYjLtt3XhZ9IYASyNmdYq0QOgR
aS0DiIlNH4eLPybG9dy9GJ4BJkEMOVfxHGt9hIBIFIvaKUAUXCoZc4SrFnSCPBug
O/kdc4fFHqZVXjPzHl9ABeg1NfRmavRJHK/lgwmNFsVfUeHTJnbYXoSYSqPTkJsn
OEBUbwBm8Tw3vLuxFSQ6p9rekvQULvcqOC+sUvcNw+fpJRhRNt8pev0OOXifeKsv
6fgSy81HufhsmAshYaF1co/m4oRyXiaOyVqBOgcsZS7MfGIHXvw=
=QELM
-----END PGP SIGNATURE-----

--UwoaDWHcmW31ehkG--
