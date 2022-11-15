Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED6462914D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 05:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiKOExN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 23:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiKOExM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 23:53:12 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A89B842
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 20:53:11 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id o8so9159224qvw.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 20:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dE17wy+SeYs2xM9LBeuUvdStoy3eddyUrqKb9lN6yDo=;
        b=Fqc84XKgNKomtnYMDVsfBaOL3NX67s05OjZ/wsj6yurW/sMwc8o0fODxAlfiB9MQYi
         YBrRd6ecgpmXOaa4CYx/wSAVUdGBuBzQrTnt2lm346ZPlY8YEkL4egF29Vh7WhlvVFET
         qIHgMhCeh4MH0A9rYIsq1ee75icThcfJKq4zrpDKPiPY1qYWczBxi5B7iRMFEX77mMqs
         aAgQD5pbj+UTcHJSvglAUcwPvObhQDa4RbgkZS6Ejp4mD1T3zK9Q7Ah3UK0Z82iHuUAT
         zskLc9WNNpTu11tq4cX5tdTpJUSLJswfy2TQj5MaKuKBI2E4A60p1VZqO91Q9yZuvfW1
         kDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE17wy+SeYs2xM9LBeuUvdStoy3eddyUrqKb9lN6yDo=;
        b=R2K0X8/QC4p8lfFKsG+DHnZhj1fPrQQu9GJbSzcbVpoxFiPXcOEWgH94I/Rtz9b2cD
         OLBplJ3jXW9L9LdbVfGhomohFYZGnz0qWBrwTsXwA6jd212FwFmpVT3u72SP2Tll5KtN
         Hv/oAapn4Xmrt/T0trh4gRgisswbTJNpNwOiC2nABR/mDqlMHfCBRxsAKD+1vCxLrCzX
         2ZT17Q472F7TrRJ5hDaRrm504p703y4pygCx0C99jXwEjpbTBIAOeo9mBm6SUKyBE4P2
         dYJUKS3GarTzLufvKOO6V405+jaeWdunEss+q++L4XO4TEThaCA0l8fN3aN5UF2XAkDg
         pcXQ==
X-Gm-Message-State: ANoB5pkjnHYnEmLyJjZ4cfgsz8CB48IGcG6n5/oZIvTDT6bQ2tQa15qa
        Dy3auixRBU+ng7ysrV0dLsoskw==
X-Google-Smtp-Source: AA0mqf6/e7ldRDGoaFL9dYzYgnSFOk0uxJG0oyKaxtK0cI3qj4f/mFZUw2bwjKaPjCx1il8AUUpVtg==
X-Received: by 2002:a0c:fec3:0:b0:4bb:a904:7d51 with SMTP id z3-20020a0cfec3000000b004bba9047d51mr15271324qvs.14.1668487990928;
        Mon, 14 Nov 2022 20:53:10 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id bs13-20020a05620a470d00b006b61b2cb1d2sm7798445qkb.46.2022.11.14.20.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 20:53:09 -0800 (PST)
Date:   Mon, 14 Nov 2022 23:53:07 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 4/5] counter: Add Renesas RZ/G2L MTU3a counter driver
Message-ID: <Y3MbM0RtaAKUIyWM@fedora>
References: <20221113171545.282457-1-biju.das.jz@bp.renesas.com>
 <20221113171545.282457-5-biju.das.jz@bp.renesas.com>
 <Y3G6Qe0KMdo2PgaG@fedora>
 <OS0PR01MB5922B01D5E579426608BBA9386059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB59337BB8E20273468F38560E86059@TYCPR01MB5933.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o3Yo1PD6gJC8vbLW"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB59337BB8E20273468F38560E86059@TYCPR01MB5933.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--o3Yo1PD6gJC8vbLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 05:52:11PM +0000, Biju Das wrote:
> > > > +static int rz_mtu3_initialize_counter(struct counter_device
> > > > +*counter, int id) {
> > > > +	struct rz_mtu3_cnt *const priv =3D counter_priv(counter);
> > > > +	struct rz_mtu3_channel *ch1 =3D priv->ch;
> > > > +	struct rz_mtu3_channel *ch2 =3D ch1 + 1;
> > >
> > > No need to complicate this, just use priv->ch[0], priv->ch[1], and
> > > priv->ch[id]. Same advice applies to the other functions as well.
> >=20
> > I get below error when I use array susbscripts. "*ch1 =3D priv->ch[0];"
>=20
> > drivers/counter/rz-mtu3-cnt.c:291:32: error: incompatible types when
> > initialising type 'struct rz_mtu3_channel *' using type 'struct
> > rz_mtu3_channel'
> >   291 |  struct rz_mtu3_channel *ch1 =3D priv->ch[0];
> >=20
>=20
> I could use "*ch1 =3D &priv->ch[0];" please let me know is it ok?
>=20
> Cheers,
> Biju

Hi Biju,

I meant to use the array subscripts inline (e.g. priv->ch[id].function).
However, I can see the benefit of using the ch1 and ch2 local variables,
so perhaps something like this would be clearer to read:

    struct rz_mtu3_chanel *const ch =3D priv->ch;
    struct rz_mtu3_chanel *const ch1 =3D &ch[0];
    struct rz_mtu3_chanel *const ch2 =3D &ch[1];
    ...
    case RZ_MTU3_16_BIT_MTU1_CH:
    case RZ_MTU3_16_BIT_MTU2_CH:
            if (ch[id].function !=3D RZ_MTU3_NORMAL) {
    ...

William Breathitt Gray

--o3Yo1PD6gJC8vbLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY3MbMwAKCRC1SFbKvhIj
KzhIAQDQ4bmBcHzQIzO+vQBjfTenBivm9lKVWO49m20n55whsQD/ciUVMhrn+2Ng
eU4PmjjzcWy/3PXdyK/wS83FKf/QEAw=
=dbCG
-----END PGP SIGNATURE-----

--o3Yo1PD6gJC8vbLW--
