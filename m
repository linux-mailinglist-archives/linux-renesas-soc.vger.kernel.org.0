Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7255FCB31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 20:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiJLS6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 14:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJLS6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 14:58:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB0F11833
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=iXxWX1jm67EMz6tye/twTwFcWz5J
        vmtwQNCoIWN9kDY=; b=pxtw1KojqLc1Z/Ym/pzrZfG46tYp0ZSp8CdjaHhsQrNS
        NwXXtTYCzKpwghdD6wT5FuePfq/CHIVlC+qy3LOnBg2V6KJ6RlpWlKGX44vVhi81
        m8mPdszpq5R51USMGfH5gPwrqTamZEHjTkXvOC6P0Ptf4rUCiyBUIhWmRu4O580=
Received: (qmail 815062 invoked from network); 12 Oct 2022 20:58:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 20:58:30 +0200
X-UD-Smtp-Session: l3s3148p1@zHJ/+trqlK8gAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 20:58:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a779g0/white-hawk: Add
 SDHI/eMMC support
Message-ID: <Y0cOVQlZAViR1gY5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1665558371.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lwv3KQsEg/tz3SUO"
Content-Disposition: inline
In-Reply-To: <cover.1665558371.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lwv3KQsEg/tz3SUO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The White Hawk CPU board also has a =C2=B5SD-slot, which is mutually
> exclusive with the eMMC, and obstructed by a pin header on the BreakOut
> Board.  Hence accessing it requires removing the CPU board, which is a
> task I haven't undertaken.

This sounds pretty similar to the uSD slot on the Spider board.
Shimoda-san and I have decided there to only upstream eMMC support. I
think the same can easily be argued for WhiteHawk, so your series looks
fine as is regarding upstream, I'd say.


--lwv3KQsEg/tz3SUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHDlUACgkQFA3kzBSg
KbZ0Ug/+LLWajJAgv2wwFxRjB+inAFf9xmUzaXaVE+4sos7yJUOcNfyOWegAryD0
+IEgFHmP9iaz9UnQDDp1mIoncSYDJM2i3WH7ypIXcSwrMbyukpN4aZk/PlnUQu8m
IcnhcJLweNljKZkvwgr960hTmcMT1RdjWFsnFCcaAPqg3K0vOf/R8hf+CAV43mSV
cJA1qKmBOy2rDvQsa1aPVPa4YB6t2WxMeV3fI51+nDeCUNsm5AIFAaL8/1Zzi5N2
M1cQwrx9ang5ZgMiHN2SjxYDWvkFpM97D0TrZy5geHeWTSzVzFpM0WwOqTYw3+EP
5C7IJjMZn7zD4E26BBurMMSCa+FIwkNTe99AWzIqhIA07WZTx817v0DsiZStW/ok
fB2bpJhy/Fs1zPO9ZrGwdKIExs9UKxkG9LImrq1HAfOYBqJttyy4lb3jnnqwBec1
T6kCixlK2PjZ2vR4MeHcAjfNaiwOscGByTzPFttwlsw2OaOhE1Wh4uBuqG7glvua
Na6zuM/Xl+lxztnHyIf4El0s2TBm32a84/wxJ3H78XVZbfm/gVO9qDZzq7AnRGVJ
WlJ9eOgO43NZd24e8DOeu0ZLL/ClBMcL3/PU1W4p86kJ9lPp9ND6qVrVDta8jbjJ
+tH18XLi1j4kqqe7fCCDms7x8lCrmcWbowsDI0KSJadsHOl42lk=
=JiKc
-----END PGP SIGNATURE-----

--lwv3KQsEg/tz3SUO--
