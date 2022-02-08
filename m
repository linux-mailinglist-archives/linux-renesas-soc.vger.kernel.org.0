Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB1A4AD95E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 14:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241111AbiBHNPf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 08:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357873AbiBHMiX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 07:38:23 -0500
X-Greylist: delayed 168 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 04:38:20 PST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46904C03FECA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 04:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=mblPKvsTR+I38VBuTL3AMx3pOcg6
        Ef8IgRkhKBFuNgU=; b=qMBmciIXgm9mIqfnNnuy1GxVTBCm9tAO5J0INHCm1qRK
        ai5Am6gaNi2jpsyZoL7/l+u3C4p6vXaC1/hcsqzv2J7ywpwfbbKw5JPbPP8rA8VO
        2YUUZZ0kPN8raQwnbfrRuB3Rq5dlXQPBcS289NUEHWeL7p/+i9yzEIHoOeEAqCA=
Received: (qmail 251182 invoked from network); 8 Feb 2022 13:38:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 13:38:17 +0100
X-UD-Smtp-Session: l3s3148p1@0J7M/YDXYMkgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 13:38:17 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: renesas: r8a779f0: Add WDT clock
Message-ID: <YgJkOVpdZdMWj0m6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1642525158.git.geert+renesas@glider.be>
 <8d9b280065a663f2cf31db7b21a010aa781a0af1.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CuXxExDNR0gwWf+V"
Content-Disposition: inline
In-Reply-To: <8d9b280065a663f2cf31db7b21a010aa781a0af1.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--CuXxExDNR0gwWf+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 06:09:01PM +0100, Geert Uytterhoeven wrote:
> Add the module clock used by the RCLK Watchdog Timer (RWDT) on the
> Renesas R-Car S4-8 (r8a779f0) SoC.  Mark it as a critical clock, to
> ensure uninterrupted watchdog operation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--CuXxExDNR0gwWf+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICZDkACgkQFA3kzBSg
KbYRxQ//UzcAb6CurhSVTJgjpRYr3RCkJdwUUJ5icYWg8tinwKd2litbjZFFJgp4
+VCbypK2gK3a2hfdZZpelee9hCFGpd95sfFQUm12HPJ2wIsj+pBW0Feuem0lCQbT
JqYTt259nxMudemRt1JZz3oYKC4NUdYXuzIPF8Bm50p8AL+ANNJThbc4tEXjQbUc
txaP3dbbv4nNDlf2NCYPQQne+k6zyYnMqoi1a8UMD8wxZARnsnH/HwsyjF5Yg/a7
YhynhkpeaLDIo7VsFYZbEQCjGLY560lwVzzUo8a+suzKCqFGarb70z4vCIs589Bb
qHdRhCCTf3qWNRt2ziO1lxVWrRRpXA9MstfL+CP36WZqVSwqfFWn0tOwHaITweKD
wqN9Zcygz4kZDQzaSpoZTLnfcfYNjr/leXrgn+oX5pVM8J7axQDBe74uA9myPylE
IoUbtc+qRrRQ4FATKWVGW9tQFh9aBquawg0Sf75/P01f4us2RdnxXZhkHJQNs35P
QQhxjzkH5WU+S3vfecU/hyM6m4HL74xakN+un6vghWHAy514hd+f+9SQEKlBvGGc
rNHRNACIQdZUvxcBtPtJyqfYL/1GOjVSNlYl4/KhFM0TgsOwGZZSD9KrtsxyXTX7
9yZImUJf0r+7vEkwQQYiN3t22C4gk93u9AHhiZ8nSWftK/fIkwk=
=akA/
-----END PGP SIGNATURE-----

--CuXxExDNR0gwWf+V--
