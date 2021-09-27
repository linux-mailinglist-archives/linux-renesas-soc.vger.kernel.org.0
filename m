Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F8641904A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 09:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhI0H7G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 03:59:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:52342 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233239AbhI0H7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 03:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0EVDa5QxvZYMFElrQTVC6S90Ul/L
        2VJCQVfcEe1ir3Q=; b=g2coNAtfZbos4swKzLPTRrsQMsDC0eajWbshFU7Rpklq
        EehvohT0v1jTV33GTHrP5+N2VlPen5Mxot04YpuWf1B/0vpqAK4Hp0n6M+eM6yVW
        u2g4qBmEU+9HK9Z+JSmDL/iKFi0eDEPPS/gbnfei+dWfFpUHM6B4+kxuWNeDrk8=
Received: (qmail 752711 invoked from network); 27 Sep 2021 09:57:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2021 09:57:27 +0200
X-UD-Smtp-Session: l3s3148p1@R9y0cvXMWsEgARa4RUvHAbZgIYagrKBM
Date:   Mon, 27 Sep 2021 09:57:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Message-ID: <YVF5ZskkvlI40pkg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
 <YSelsjPyswWCr7Nu@shikoro>
 <CAPDyKFp2Ut4UJoRXPD4t+k1+ZfmT-CQZ3obNA_iPF6OA-t+T7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sqIE+3Q7Xi3ZbRr/"
Content-Disposition: inline
In-Reply-To: <CAPDyKFp2Ut4UJoRXPD4t+k1+ZfmT-CQZ3obNA_iPF6OA-t+T7g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--sqIE+3Q7Xi3ZbRr/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I have applied it for fixes (v5.15) and added a stable tag, hope that's okay.

Your 'fixes' branch is still in -next only. Could you send it to Linus,
please?


--sqIE+3Q7Xi3ZbRr/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFReWIACgkQFA3kzBSg
KbabCBAAny2Cg1vNqRfSr6cuj1uQj7+A5Ej6qrSKfHbk1aJE5KXi/NNrPF8ocmEu
LyfmlxeBTkvSOHxFdVl+ofI3Rvl0maq3UFFqbFkOQQ8nB8GLTsXOIGLfcC2dtw+z
OPWvLbo7FfJ8vstpDVG2gtSPT2yAZUgAxHRE2m6sOpz92FwIQOIogb9UrfxuiKqm
Nydy7YPtEL4ffLf+e2TMO9mZUpsPkiemb8LWL0MHZm1mIaQEC4hv9ImzxUhDJtpc
RtxkA4M1WVCvjBpw8yr4urJHYPviHs8WKbiMHD0CByg2vh1wqrLMdpFpsOwkUTTC
UFh5GghjNJPlZHfH92yzLGSSls0gMTZ9JtXQOCQ+Y3kBlQdLhGcsGHYeUAaxdk7B
qTq8J6qwiuH6OXDf4+lPc8G9+Q6GBgLFrEwQx0w8NCd8VlBQwsxSsSBzWDeAxfHV
EUamOADqTcJK4VadmLnHu9hmP2pXOyCnGJr6JIyLYlbezsH8DZvA3lEgPnLF+bjn
OAv22QsB5GchCEIIOqJoDAV6qkjT19XU88BSqW4fkOMh8n6FuDSabwKz20SPlG9D
leb3jAP63k37QY8uxxoGPC+CPqlQlzUruwwYVMCGWkZ2vsmWTzRE5mCT/tzcjcmg
GPp5W1Wgir2vXvNM1Q2/lVH3lRCSbx4hBMfS8I05kQYyFqTbQ7w=
=FpLB
-----END PGP SIGNATURE-----

--sqIE+3Q7Xi3ZbRr/--
