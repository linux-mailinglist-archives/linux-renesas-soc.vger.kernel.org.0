Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2FF6649608
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Dec 2022 20:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiLKTgd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 11 Dec 2022 14:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiLKTgc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 11 Dec 2022 14:36:32 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956A2DF12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Dec 2022 11:36:30 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id j16so7480008qtv.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Dec 2022 11:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QwDlLGe8yKrtK8dq5kh7aoZ4Y3fpeibEJxA9aTBJkc=;
        b=pg0flFXl3DYTkREc/zOE74UKK0Z5KC2Ml7AYCxadAmqunWYienRupLVEUB9+ApMhEK
         sfapvZvObpplk9oXN2+VPKCmNyy+atSgY58q5gGfgU2dlBYoZrvypJiwKADiIN61U/lk
         EkNJoiFmKbljMOebUJ6uzVqFM677orclXteqVeuNgin79qD0PAXLAZgx2O/WbX68FgFM
         MJm0OSaPfK8V+Pzom9WRE3xWPwTW7IZL28XbUb1uMNnz6LIH4X32PNR+kbf80zf50phh
         e0QN4y3ZwaQrAGGKLvhhR1kNb6NBIPE4vdZFDFyeGxEeJqpD8NS4QLSjaf1Bzqp42kIP
         aJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QwDlLGe8yKrtK8dq5kh7aoZ4Y3fpeibEJxA9aTBJkc=;
        b=2rXIwIxQB4vbqBrtV5hFCfxlbkS/8aKpKmuMxdmKckaatdrd2h9/S7n9UvrQkRgrM3
         Pl9UV1s5SzY29fuMDlHUVXHqwxmnFrHsIJe5ZqPeYUaOY4XUD7taM6vlw2AWZ8GwDfxq
         WjYM5QmFZz4XgG5rbvA0J2DGRh0erpQInsEPhgsTyrDFwAQRb82L+Bj/7t5WUA8Nzk29
         AJkNMbbSmETEI4U3/4PZWNxdruSGxo2z1J3RkhFhLLLD4/e9C0JJAa/cHYADiI83spcE
         aKwmSLIYb7m1uXRyqcq53IVQcpyyEHpjRoISrERPni9hTsGHVyA4y/S0AfbysaQJ/n/B
         66Yg==
X-Gm-Message-State: ANoB5pkKyyLgZ1cLq6Y4yb6IvIzVTMtFK/gmWi3Nx47fTt3Fzq47ROGO
        QW13fC9FTZRneNAmKTOfzCTbdA==
X-Google-Smtp-Source: AA0mqf4Lg8XEaWi5AigUiAV6ghHkcajb0T2ygPm4nhPzVIafEhdacQu+ravFQRuMmKqRxkTZgCEMLg==
X-Received: by 2002:a05:622a:4ccd:b0:3a5:ad81:8aff with SMTP id fa13-20020a05622a4ccd00b003a5ad818affmr20256078qtb.55.1670787389634;
        Sun, 11 Dec 2022 11:36:29 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id c3-20020a05620a268300b006fa9d101775sm4517640qkp.33.2022.12.11.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 11:36:28 -0800 (PST)
Date:   Sun, 11 Dec 2022 10:46:04 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v8 3/5] Documentation: ABI: sysfs-bus-counter: add
 cascade_counts_enable and external_input_phase_clock_select
Message-ID: <Y5X7PMSuXBcQOIhR@fedora>
References: <20221210102110.443043-1-biju.das.jz@bp.renesas.com>
 <20221210102110.443043-4-biju.das.jz@bp.renesas.com>
 <Y5X4e+GVLhaTB97N@fedora>
 <OS0PR01MB5922FFBE0E3FEE50AEF1A5B6861E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W3m6LQdzAdvdmkuw"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922FFBE0E3FEE50AEF1A5B6861E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--W3m6LQdzAdvdmkuw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2022 at 04:12:51PM +0000, Biju Das wrote:
> Hi William Breathitt Gray,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v8 3/5] Documentation: ABI: sysfs-bus-counter: add
> > cascade_counts_enable and external_input_phase_clock_select
> >=20
> > On Sat, Dec 10, 2022 at 10:21:08AM +0000, Biju Das wrote:
> > > +What:
> > 	/sys/bus/counter/devices/counterX/external_input_phase_clock_select
> > > +KernelVersion:	6.3
> > > +Contact:	linux-iio@vger.kernel.org
> > > +Description:
> > > +		This attribute selects the external clock pin for phase
> > > +		counting mode of counter X.
> >=20
> > Hi Biju,
> >=20
> > Remove the "This attribute" from the description, and capitalize the wo=
rd
> > "counter": "Selects the external clock pin for phase counting mode of
> > Counter X."
> >=20
> > > +What:
> > 	/sys/bus/counter/devices/counterX/external_input_phase_clock_select_
> > available
> >=20
> > At some point in the future I should combine the *_available blocks, but
> > right now they're separated between Count and Signal configurations.
> > This external_input_phase_clock_select_available is a device-level
> > configuration so it'll need its own block as well, such as the followin=
g.
>=20
> Since it is device-level configuration, I will move the below 3 blocks
> to the top of file. I hope it is ok to you.

That's okay with me, so go ahead. I think at one point I was trying to
keep the attributes listed in alphabetical order, but I haven't really
minded lately as long as the information in this file is clear.

William Breathitt Gray

>=20
> +What:          /sys/bus/counter/devices/counterX/cascade_counts_enable
> +KernelVersion: 6.3
> +Contact:       linux-iio@vger.kernel.org
> +Description:
> +               Indicates the cascading of Counts on Counter X.
> +
> +               Valid attribute values are boolean.
> +
> +What:          /sys/bus/counter/devices/counterX/external_input_phase_cl=
ock_select
> +KernelVersion: 6.3
> +Contact:       linux-iio@vger.kernel.org
> +Description:
> +               Selects the external clock pin for phase counting mode of
> +               Counter X.
> +
> +               MTCLKA-MTCLKB:
> +                       MTCLKA and MTCLKB pins are selected for the exter=
nal
> +                       phase clock.
> +
> +               MTCLKC-MTCLKD:
> +                       MTCLKC and MTCLKD pins are selected for the exter=
nal
> +                       phase clock.
> +
> +What:          /sys/bus/counter/devices/counterX/external_input_phase_cl=
ock_select_available
> +KernelVersion:  6.3
> +Contact:        linux-iio@vger.kernel.org
> +Description:
> +                Discrete set of available values for the respective devi=
ce
> +                configuration are listed in this file.
>=20
> Cheers,
> Biju

--W3m6LQdzAdvdmkuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY5X7PAAKCRC1SFbKvhIj
K4urAP0RW9JiO8Gm3RgCrCv3SFp7BOm9Qw5iCmCzUNY2turI9AD/Zs1ONvGwfY3x
bIvCh1WlOeR5aT5vj57ymPQdWmlpGgU=
=PX+K
-----END PGP SIGNATURE-----

--W3m6LQdzAdvdmkuw--
