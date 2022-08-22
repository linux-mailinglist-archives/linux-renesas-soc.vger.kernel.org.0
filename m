Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDF459BD75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 12:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbiHVKRq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 06:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbiHVKRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 06:17:44 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785821900B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=p/3m1RENY0wEfuDWtTgs8bWO8nYt
        MJlYqWQ3Im9V8gE=; b=S6iDa+GXpoQk16XCZ46qbPtoeztqUvPOZWpOC4JLDPgx
        Ctcr0khkhUkwas4hDC7IPRUTZg/sJYP21ohvV1nZZ8MIjQa20geNO39XUHmrQeqI
        GuAVk3ZIwSIcjQG7xJSuWqkjbO3/C/iBD/N1MYT9Jyi0qaBcWsr6OWrXn6JuVN8=
Received: (qmail 1245393 invoked from network); 22 Aug 2022 12:17:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Aug 2022 12:17:39 +0200
X-UD-Smtp-Session: l3s3148p1@9c/gwdHmSosgAwDPXxw3AFlguiwjsjwa
Date:   Mon, 22 Aug 2022 12:17:38 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add TMU nodes
Message-ID: <YwNXwuhDM6wESmo4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220726210110.1444-1-wsa+renesas@sang-engineering.com>
 <20220726210110.1444-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdXBiM_=V0XueJGcc4fVf1EkOjLVNqyhHZv0XXe0ox-Ekg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DL1S/z20yBzPsoNC"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXBiM_=V0XueJGcc4fVf1EkOjLVNqyhHZv0XXe0ox-Ekg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DL1S/z20yBzPsoNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +                       interrupts =3D <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
>=20
> We really should update the DT bindings so we can describe the fourth
> interrupt on TMU instances that support input capture.

Yes, but I also think this should be a separate series then.

> I don't think we need a new compatible value, as we can just look at
> the presence of the fourth (actually renesas-channels + 1) interrupt
> to enable the feature (if the driver ever gains support).

Good approach. But then, we should also switch to interrupt names to be
future proof, or? Who knows what other interrupts might be added later.

> As the above matches how TMU is handled on other SoCs:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.1.

Thanks!

Happy hacking,

   Wolfram


--DL1S/z20yBzPsoNC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMDV74ACgkQFA3kzBSg
KbZK5g//bUXp8xwLLLNuCI+8TnXGEf4fUaB0GP+cSKksOVGO6Ah5Y4uKmlhf1oMf
r1C3oFMFihQLgO5eeGhTnMinZiaS/drdBPG4/ABZm0ls8owEJvkBhQRjs0l2zkuO
fZ6gpH5Na2cqcd70rxfN9UVeWQ7b135WYmfThr/EPcrh8cwvsv7A1oi7Jch9r0Dv
z9P3A3KAk+/nMvzXDC2SU3tHRc+jEE+58o3h5y+srwaHEZ10iYFy0+p4vH9vCt12
oetVBlyNkkOZ7jGzkjJB4bR3NN6l4fO9gAfLp2fEH9HSmfcVmpgkltMl9UgaYNqK
lbYXuhSQVjEQFfSNvIOa5ZF4GBKB4PgEqHi4Tez8mbIr5RvuDz7xLfmjKebFVm9k
1NTAXFwZcjXIpNzQFDQvhHd9Qy7jPPwtHYnE8X1tMOLwuO4Y2gajQVgJkjBq8wja
bIMwh8sO+2H/V5JdqygkBjOxPmn4Pzp6O00TNczk+lrH5tvQYOkbtxf4CDG6EatR
3CM0Ieub32iakbWVpIYsu+HT+LvsEaJtWkmn3bcBkR2SF+1zYPQhYXiJGRKZZnaC
BIUrakAhLxQ99nzpRhZ51i3ypCvKr59HCALRlClcANioh+H1jT2kINfF99MvetBB
plopDYL65S4d8Bj2Y4PEcxm6PJdOj0F2pYpWHL0k4v2oph9ZOro=
=hAI9
-----END PGP SIGNATURE-----

--DL1S/z20yBzPsoNC--
