Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57308616D9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 20:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiKBTOp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 15:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiKBTOU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 15:14:20 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0422659
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=j/iq0QtUYNHP1h4+LRkV7VnSW18q
        KgMi4W0H89H0yRM=; b=WqHu+zCF9rUlRE+gH5ScrWx0fm+mZtzLRK2FnyRJxpI6
        MiYtHj9Q0XqC0QuWZhKG7XvucfFnxUIqUGwzWtEIDlGMJmEI52fktLKkZs9p2PBu
        alPyJZ/WCBS20CStBPUYceAhJ0W574pO6UoLpXC4yfmB9yOF/Junfc54o2YTUcc=
Received: (qmail 2326098 invoked from network); 2 Nov 2022 20:14:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2022 20:14:17 +0100
X-UD-Smtp-Session: l3s3148p1@4sKapYHsHIEujns0
Date:   Wed, 2 Nov 2022 20:14:16 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
Message-ID: <Y2LBiOqomYJ2E/Gd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WkhtYUCAWva6MiIv"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--WkhtYUCAWva6MiIv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

> The tmio/sdhi core still relies on using tasklets. I think we should
> strive to move away from tasklets for all mmc host drivers and to use
> threaded irqs instead.

Ooookay, noted. I'll put it on my todo-list. But frankly, I can't give
this priority for a while :/ SDHI is used on a lot of platforms, even on
different architectures. Regression testing will be a big one here.

> That said, I am worried that it might be harder to move away from
> tasklets beyond $subject series, for tmio/sdhi, but I might be wrong?
> So, I am wondering if it perhaps would be better to make that
> modernization/conversion as the first step instead?

As said above, I can't do this in the foreseeable future. However, this
series fixes an issue we see. So, my vote goes for applying this now.
Even if it costs some extra cycles on the tasklet-removal-work.

D'accord?

   Wolfram


--WkhtYUCAWva6MiIv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNiwYgACgkQFA3kzBSg
KbYD8g/8DGghD+TELPrqvEjTAyeP0tC/tDc3HxMxEO8LUhLZHM4dvSjXtIa7uFTB
jZQC7SKvpB7bcWUWqw93KeFJdTqrX4qHiXInbyV/84rACHK5IlGVa+2AUjkVwKiY
aYkwrJxXdXdYm4XujD/bDa+vdTGbhQpKQrPIFVoxkAZPA0gdKL0yaJmlIhnUDYQ5
VitGNWu1lOU0pt2UY/Sek4sUr6AZz1caP2JoqUJymA7ntINBntO7cfsPhAQDa7Sq
CiTcl99nXLiiRb6IskJIfTAVeNOUBMXAaO2ZC7X21xZ9sf8emVQG+CQujHTgLKbK
ftkUqEF5ghqBZkbYqqcz/D7IJ+j0QRubjfAmNwu7o0jYarnDvJ2chnt0h/O4EiD6
dhatz85CkFOHRDq4b/bFzjbTeaYauryd1gwqv3pRWjK0TDBpRiycTL0K4wSF6ULz
o06g6gIqIBoWqlZtzFZEbW1IVbGCJ+D1MgAE0UXbZE9sg8O3TqM4El1+tXnuSpsp
fSwN04nfpNckHsWzZwRZVFgiToNcFdc+FdubiP+MIy2omFLt66hqwJxrTJdQG76h
8tIsGnYl2gu9ufEBsaYhgnlLVDhkjAU6RwNTTTVkLFXuL8AzsusdbACBhUEa5lq1
jYM/010K3lqX69Pm00SYgjRJKMdWjqGS5icq8fEiVpc9Vbw1IC8=
=4Ojp
-----END PGP SIGNATURE-----

--WkhtYUCAWva6MiIv--
