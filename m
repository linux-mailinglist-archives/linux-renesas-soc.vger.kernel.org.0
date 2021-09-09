Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381124054BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 15:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242975AbhIINDM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 09:03:12 -0400
Received: from www.zeus03.de ([194.117.254.33]:39126 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355173AbhIIM5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 08:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=MxucuO+OF4EIO9fKthYyVgp/RC4A
        aEbo2isabOQHXvE=; b=t9bj8hETgXv1EbaLpMdMQItfjJudYYbOz1TSkTM3nxah
        IpdoSVSGZBPVB59z62TLX30ozDok/SYVT72paS2IXVG9e9UQJB9tcJA/oiL0HW1q
        b3iOeUMAVV98eXlng7a6ePKM1AS52Beq/EoIUjFnsa4Y+YqxC1NQKVsSz3wJOEk=
Received: (qmail 1570801 invoked from network); 9 Sep 2021 14:56:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2021 14:56:02 +0200
X-UD-Smtp-Session: l3s3148p1@flZphY/L6MkgARa4Rc+IAenyySDM4eeF
Date:   Thu, 9 Sep 2021 14:56:02 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Message-ID: <YToEYkJHj/fkOT88@shikoro>
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
        protocol="application/pgp-signature"; boundary="TjpFRUoUSmx+VWBg"
Content-Disposition: inline
In-Reply-To: <CAPDyKFp2Ut4UJoRXPD4t+k1+ZfmT-CQZ3obNA_iPF6OA-t+T7g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--TjpFRUoUSmx+VWBg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

> Apologize for the delay!

I seriously hope you have been on vacation :)

> I have applied it for fixes (v5.15) and added a stable tag, hope that's okay.

Sure, thanks a lot!

All the best,

   Wolfram


--TjpFRUoUSmx+VWBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE6BGIACgkQFA3kzBSg
KbbRzw/9FzuxTxzZTZGPY3Cl20yNEQwOB2MxfeAmmnhx990Stf0lggXkhh9ldjqJ
QcyEbSIebbALeUy4H+fiyhVde5tCp822adwPWYpQ/Lm4NusrVki4cGVuAdwuUGKy
doVgj/82gAW0gDlNhcpzciwN0CE07jRL81heW9PBbtCajRCD34XhUJCT1uQaaFZn
fIzN48jOAfvI1PI7nsBFVW6rFlVkhHQ2t09T5k973PTMLfHMTiJgdOz0eOVs4Z+H
e+4y4I4ap9SHRSYwEKNfmSvEJ+x+YveOwX0WgsYjRqklMhjam1REwEAqB/Vtsf3k
bK3CBU0tZTkcQWKE7STcMiwggL27xQgqvH9Pj4KyA86768+Mxu7LVju01VxcbBtd
OHU66bssxespI19xbj6cznqcBGQuV4t82P5VMRr608N5wZDXFxmDoUuZ34J0EP+w
3BBtznMLGufsU8SbC3hZRQN/2s5kh3S3Zwd+8MVd4AkvF/7xY18UgXKn1jhFT5Ih
Fne+SOZmlKsVRBuAFVNGB2WXWO4ilYpefF4IOGraXHXSsgGcvwG82p6zazx8qGap
oa1jgR4OZf5sOZf/hV8J6BS86WGx3R6HDEZLkb9LVRJAJPa84cDjuw8MOjMOBY07
AuY+46u5RQEuaiQDchMMUYbIOPG5/2B49HtegmI4/PL2HFZ2uoY=
=L3VF
-----END PGP SIGNATURE-----

--TjpFRUoUSmx+VWBg--
