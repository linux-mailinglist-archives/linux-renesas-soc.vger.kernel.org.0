Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8D13AE7A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 12:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFUKyd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 06:54:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:42328 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhFUKyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 06:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=uWDD7xbRO6Kqze37DNeKpPkUb4ab
        JIX7qGhxZkJR048=; b=Z2a7vE/sFn/TiCO0zwL0UhdvyWw/PdWmY4z7HxN5d5g5
        P5qfT8P0jGQSDL9E/Q2c3qbw2VBfHS0j7GKrh3ypFQoXQXqVfX1peZjz+oGXoqK2
        xsPQc+Z99UOroDZQZFC3oP4ii2Eit/eChZ1MGRmc8iQ6IKveV1Uo6YrVnm4t7cQ=
Received: (qmail 1739759 invoked from network); 21 Jun 2021 12:52:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2021 12:52:16 +0200
X-UD-Smtp-Session: l3s3148p1@0qM1d0TFytIgAwDPXw3kAHnQA53/oBwK
Date:   Mon, 21 Jun 2021 12:52:11 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] mmc: renesas_sdhi: sys_dmac: abort DMA synced to avoid
 timeouts
Message-ID: <YNBvWxZTqgnAjKo9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdULBPfd97xqDaFOTmj-B2pBA=wSKz3iep6ujx47j1zyPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SULLAeE6PawYWeNX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdULBPfd97xqDaFOTmj-B2pBA=wSKz3iep6ujx47j1zyPg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SULLAeE6PawYWeNX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Geert, this fixes the issue you have seen on your Koelsch board on my
> > Lager board. Can you test again with this patch please?
>=20
> Unfortunately it does not fix the issue with my SanDisk Extreme 32GB
> A1 microSD card in the microSD adapter that came with the card
> (Conrad 1553726):

Pity. Interestingly, unlike yesterday, my card works fine with
SDHI0/SDR104 now even without my patch. It fails on SDHI2/SDR50 with a
timeout, despite no tuning. Back to the drawing board, I guess...


--SULLAeE6PawYWeNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDQb1cACgkQFA3kzBSg
KbavUA/9FhI801mlD+CJTMDvAIB0dXCGzo9zjxSfeelEgGxB0Nl85r87YUDu99wV
Rh82iYETbKNBDx7iiVz+f+SXU1R/ZX123MXr+EWLjf5jOSjeV4yLUclq/V5uKtD5
Rln3P8Zgm1GRpR10/IIaPT8FpkQAoTT0uUYbcHsBFetZMRmUqfp4uHDmj7CgmxuY
2c8xKRntzKbTmv+zf30KTDsIx/zQaF/WxSub3KBuL3+z8o24avHv8/gN+cpycoJp
LJW3JjeGADKV4ifAcp8LqXZuKKSNF6c5435SnpLdRilLgSG2wtEJFkRizygwLAUE
8p8SV9CY4Ff4ZdsGhPEEptz6EuvsfNxi1cvs34856RuX2yNYyuw20aJ5ZGIoaDT7
iUHTRNqOJacJ6qRtH7QumP24s3nr6dofAXUImgSVYjTsLqAM0gUb1OqEE0H2ynUS
LGm5JzFI8Ila6UvX+19qaWC1HI9MpBkLkaMazOG7OqDMMK+tGMfX/PpP+S4OJAHL
NX73azrgR7bqFH1xrEjFLPQPhOzYsAmGWZcxqmEa2VHqR6NsmOlPUKPNSTqnB354
XeFBjwSB0byfttZKmVp+hyyQFDrKnTqW9usNJ13izA0NNT93hPKRQelWNtU+Q8dW
fzG99Z2LR/JUPH4uUlApwSQqZNr5vCrbyWGKVP3mu28S3wa9TIM=
=tyAX
-----END PGP SIGNATURE-----

--SULLAeE6PawYWeNX--
