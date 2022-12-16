Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25AA64F021
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Dec 2022 18:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbiLPROI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Dec 2022 12:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiLPROB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Dec 2022 12:14:01 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AEB6F4AE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Dec 2022 09:13:55 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id a16so3165148qtw.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Dec 2022 09:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn6nQOPb+oVNXd1yyHtAyNN6pc0sHAclEkAmVe1z0tE=;
        b=ZAaXbItLNrv6nCxuiBpaj23vPP9O4JeCxjaEqLkzEbaPt8nLxAh3J6ftdDpLHiu7Cd
         rHXW6d9VhdzC0gKztT1M3CZgRvGwnVkPUKBlB6H0b+jauRzqxQkKC45UGF/Nd9AxktNE
         1bKZ1xJq+swMEftxRhcDqanOQ20tMw9hUDhJBbUpMYml7Dw1hamdODTpH+/UFdTv+zon
         dfTCefnDMqTnyCnTm+6sOOy8bOcxONkZo8LAVnn9F098MjRDK49g2NNcGIpNcyxa91/s
         u+lJ76drd/a31yP1//yQ9gNfZWL8lOHTgU8moId32RpOpyDY1dLQAALeSvgvL7aGrjxy
         SUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xn6nQOPb+oVNXd1yyHtAyNN6pc0sHAclEkAmVe1z0tE=;
        b=GAhPg7UqdfqWnanlzXJlFChkPeiu7DWb6WuHxMIkEg+tS7j4BX67KEiaXjFO1YdNEL
         D/BbbB1igwMtsBWTJnVZ//JCuRMjHk7YrKYAYxy/gyhgumWkSO7RbjrrGq0sP4eqE4Q9
         0+WvJ99qBQ0Qwo78z0RYTJY1V0PQYL6AZ+UyCF4Uy3OJNzRLLQH+L1cdttLUHcQ6BevB
         LWmmsATa9iHAHS8cCY1eh8u/bXpTkdf11KTaooBgeM5Oh/Be/DzGuRBQZngwv0yvxoYi
         uMtOccitZmkFjalmcj1LnJE8zuPiF/eIqwmHtaWpmbfElErO0eQSwR8sr2CBmXBcaHfM
         Ko+Q==
X-Gm-Message-State: ANoB5pkqkc45WxfBCa9daNVeF32bXIkLcdYgnSnwFkFiyc3v3fknS2X2
        6RuO7LLxTStIkmAtSQVkxZa97A==
X-Google-Smtp-Source: AA0mqf4/ez32PGifIOgLGbacT58KpDr2eLAPSV9DYTKBHbh/Rf4nUz2d8mCLnvJp6kohDKTa7Cs1Eg==
X-Received: by 2002:ac8:73d0:0:b0:3a6:a750:7295 with SMTP id v16-20020ac873d0000000b003a6a7507295mr42344384qtp.4.1671210834293;
        Fri, 16 Dec 2022 09:13:54 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id ch6-20020a05622a40c600b003a81029654csm1594204qtb.31.2022.12.16.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 09:13:53 -0800 (PST)
Date:   Fri, 16 Dec 2022 12:13:51 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v9 4/5] counter: Add Renesas RZ/G2L MTU3a counter driver
Message-ID: <Y5ynT6h/cZwXcMxz@fedora>
References: <20221214103136.2493474-1-biju.das.jz@bp.renesas.com>
 <20221214103136.2493474-5-biju.das.jz@bp.renesas.com>
 <Y5yWdiAsMIUn9ehm@fedora>
 <OS0PR01MB5922FB904619669BE9DD85A086E69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uDrOmVuFMq05R4DG"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922FB904619669BE9DD85A086E69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--uDrOmVuFMq05R4DG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 05:00:30PM +0000, Biju Das wrote:
> > Hello Biju,
> >=20
> > Do you need to take the ch->lock before checking ch->is_busy to ensure =
it
> > does not change?
>=20
> priv->count_is_enabled[count->id]-> true means channel is held by counter.
> So pwm won't be able to change the state ch->is_busy.
>=20
> priv->count_is_enabled[count->id]-> false and if there is contention for =
ch->busy
> whoever is first calling rz_mtu3_request_channel() will get the channel.
> among pwm_request and counter_enable.
>=20
> So I think it is safe here. Please correct me if I am missing something.
>=20
> static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
> {
> 	bool is_idle;
>=20
> 	mutex_lock(&ch->lock);
> 	is_idle =3D !ch->is_busy;
> 	if (is_idle)
> 		ch->is_busy =3D true;
> 	mutex_unlock(&ch->lock);
>=20
> 	return is_idle;
> }

Okay seems safe then. If the respective count_is_enabled will only be
true when the respective channel is held by the counter, is there a need
to check ch->is_busy, or would checking count_is_enabled alone suffice?

William Breathitt Gray

--uDrOmVuFMq05R4DG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY5ynTwAKCRC1SFbKvhIj
K2LUAQDYqtg42H6ol6f/mFGJZ912kN2WUgUXzkcFVoc8KTYaLQD/ebvkO1uir/4a
HBiJpHNUsEig+ZyFrhmOooGjgppTRAY=
=69Lg
-----END PGP SIGNATURE-----

--uDrOmVuFMq05R4DG--
