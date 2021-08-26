Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2633F8C45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Aug 2021 18:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243057AbhHZQfU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Aug 2021 12:35:20 -0400
Received: from www.zeus03.de ([194.117.254.33]:47390 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhHZQfS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Aug 2021 12:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=BHiPuXeyL0xAZNQKaNWMrUW44mN7
        nIHtIGoLojQRzE4=; b=DFuwSIV58YcgYLPa0IUTglbfySlu6EZcYP2O3ucnGdK/
        dkbcSEu+kzHLrAY/NV3ccsnmRUp2HtmgyK3NSeKBWnLFl9ccr1wbeST84bMlYTEm
        MrreSCQWtJSVOs6sq3L24E7o4CEGhbaY6aYjcDyWEa7hNb90oRv8hlGyDuHwI/0=
Received: (qmail 1064187 invoked from network); 26 Aug 2021 18:34:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2021 18:34:29 +0200
X-UD-Smtp-Session: l3s3148p1@r0mx8HjK8J0gAwDPXwuzACaVFs5Tkn2O
Date:   Thu, 26 Aug 2021 18:34:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Message-ID: <YSfCkq4XnkY/9cGb@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7YYEbxoxSFniGb6z"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--7YYEbxoxSFniGb6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Also:

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>


--7YYEbxoxSFniGb6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEnwo4ACgkQFA3kzBSg
KbZnCg//ZzKq9TDUeCwj8cRCUdsh8WOdHXX5F3ivyOxs0NUw2I/oui2yoFzyUR1I
iMLa1XOFz/H6NEuHnwNfoDPdJ/FFmUN8UbrfcRXa8rbqXST8VLRNxbBhd19fc9q+
RX4PXOyIaE8ta6zvat9/0jy1uH/5/nwkSNNESl8bXnmqRp6Y772xsdhnc6zHiyNp
Di1TZdIcPg4xRbRCvlC63t+NmBemfg3jOdAuBdjNb9+3eR3Uz/QTJ+xUkXxH5G3N
Kew2WP5p9jRnjiy8KIxZQWPtePOmL2TLSyUAvbnHMFXCWV6RR+jFQC4w+foURB8v
N7tpNUrXL5O8I3TelY57eElMTEFJgwyuLnWleeKqiKrJotrZNHHn27XAaRiXEN5U
8ne3KKJydUkrP/poszgaewVNuH9WbtaX/qijlCSKREY52aqBxJQamBAolhNl3lOj
71mx4eiWuTdrewGp81sQIZnK7zapPkcvZcF5QAsEiZf4P2HbYK+YI3Hdj5BPi3vU
zb5bSC0IXhw9unJBiMgAnCyMCCWAgzRt76unuQQYxNsUpJegDyojlRpLdXA2Nm7e
QrTtsT869Mhs6CPdfjNwz3XuxSmDnTsiGY2yliRpQ1L4sZzD6Iao7LxsO+iUHSTt
mKQRCwPs2OX0s53SZ0yCoZBUsClLDJYM6ofuy2Vc4r+mrjXt/pA=
=yjIJ
-----END PGP SIGNATURE-----

--7YYEbxoxSFniGb6z--
