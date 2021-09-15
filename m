Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629DA40C43D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 13:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237479AbhIOLSk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Sep 2021 07:18:40 -0400
Received: from www.zeus03.de ([194.117.254.33]:33352 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237151AbhIOLSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 07:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RzKBneV7IpljVAq6+09myD5Yn4Mj
        klWZg8DPzGqwAsM=; b=H3Z6p9CS86fs6c5T/MEfPoZMbA4YIFlBfPl8IV8yLaxV
        x6CDeYsh7YYjv8rVqiqIK/OyHxVsEmoK5KMlNHCs1cjXbNIqAl8yM3GEwmZNg6p2
        6XxzNYCpS24gzaBOklqGNwlhO43NhC6FG8uV8qfiwr0R1IKmc/qMHoch23BL67s=
Received: (qmail 785115 invoked from network); 15 Sep 2021 13:17:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2021 13:17:15 +0200
X-UD-Smtp-Session: l3s3148p1@PTgt1wbMpo4gAwDPXwzFAFG7/ghv85hq
Date:   Wed, 15 Sep 2021 13:17:15 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Christian =?utf-8?B?TMO2aGxl?= <CLoehle@hyperstone.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "doug.anderson@chromium.org" <doug.anderson@chromium.org>
Subject: Re: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Message-ID: <YUHWOwWQ/Q1I+u+O@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christian =?utf-8?B?TMO2aGxl?= <CLoehle@hyperstone.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "doug.anderson@chromium.org" <doug.anderson@chromium.org>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
 <bfe5e22fa30344f480b176f5e96afa66@hyperstone.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T6csxEbxl4efIuPU"
Content-Disposition: inline
In-Reply-To: <bfe5e22fa30344f480b176f5e96afa66@hyperstone.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--T6csxEbxl4efIuPU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 08:50:21AM +0000, Christian L=C3=B6hle wrote:
> I did not test the patch but want to make you aware of the comment in dw_=
mmc:
> /*
> * During UHS tuning sequence, sending the stop
> * command after the response CRC error would
> * throw the system into a confused state
> * causing all future tuning phases to report
> * failure.
> *
> * In such case controller will move into a data
> * transfer state after a response error or
> * response CRC error. Let's let that finish
> * before trying to send a stop, so we'll go to
> * STATE_SENDING_DATA.
> *
> * Although letting the data transfer take place
> * will waste a bit of time (we already know
> * the command was bad), it can't cause any
> * errors since it's possible it would have
> * taken place anyway if this tasklet got
> * delayed. Allowing the transfer to take place
> * avoids races and keeps things simple.
> */
> The message in 46d179525a1f6d16957dcb4624517bc04142b3e7
> does not mention which card was causing problem, unfortunately.

Thank you for the pointer! This is interesting, in deed.

As I understand, it is a limitation of the controller which always goes
into data transfer state even after CRC errors. However, because the
controller driver is not using mmc_send_abort_data(), it will not be
affected by my patch series. My patch series only extends the optional
MMC core helper to be used for SD cards, too, in addition to eMMC.

If I missed something else, please let me know.


--T6csxEbxl4efIuPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFB1jcACgkQFA3kzBSg
KbakCA/8CQuszu8PRcH5fjzhrWItGMM8zOsJKa83w0JfODnIvODXglIeobC5dZvu
KS2UNE4fNAEiyVlgvQ+2C08cWfrgOiFfmBEPjaXJrK+OPJlwx0XCCVVnLte8QGFR
jhLOOJvKzE0nBXU/UlEfgWqORpzszw2PFvPnjIqPHhqWB/6Y7ImuND55c1pmE5cF
dyXTcDadp6TTQHN/NCB7/EcqCbA3Xoi+J1dGF+mShETXqo/ohndKBtPpnovFV19U
yvO/iI7P1ShreZ/ZuZ1EW8IBo83fYHbNlkTRJvmskQF2/hQLESsfYjrjT/EZ4ju2
zoksFY8LYd0O903UDNSBRznTgrrTuwkF5SiPVzFM7PIxbtDQHA6VIsUnNLuK+uz4
EyZk03VfudSFR5P4I+tRowPwKjMARUybq+//pISUap0iDn5ypL4AKTgye/HfDlYy
KeYDIwsJpCT94ryLS7ub3vE950KW4ZEz8bUrobDArXIsdDvnri8BEE9CzKSI2Wj6
UyTzVIUVtbAHjIPHF8UJN9RT/HXWH1PW6IbRmmrMGHpNWBxefZbPvgdzKh91qARN
iOtkfKf5H5k6ZAWebQx6sQKwl1fy0V9z/cU7yO7Cj93hx0l4hjUiB78KSc94czai
kpND46fXq1lOZQeKMSqHkNmykgcG5CFiN1uN5zUq5c/H9H7ZtFI=
=rAry
-----END PGP SIGNATURE-----

--T6csxEbxl4efIuPU--
