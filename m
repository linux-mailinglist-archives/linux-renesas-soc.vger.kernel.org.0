Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A375FD1C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 02:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbiJMArv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 20:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbiJMArg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 20:47:36 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F260F14D8DC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 17:40:45 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-136b5dd6655so642480fac.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKk00GZ788naBGTxoT5GM72rM2lKT+rrPq0Zst2EeZk=;
        b=R0vTmFqSXzH7GlHiD/WdG8Fg/fzkiLCENmLCoeZIFYsFDCg9qNK6UZyeufN9Enm5tK
         VtJ+DY0v0kKovOyZ1Y9u4o8RAkHjijLbeLmP+o3NHj8x6krSZ9Bv5RfK016Hz9XWK2ol
         0hipL9pepUV7SO7rzMd41iECRnTZLJfT8sohvCy/Irt+8bTFCVFWYaxidnr0xQwEoFbT
         NY7QZvdGGs7a6J3csxQEd71LZuCzvGIy9vtIiTUQG/CkK1N1aq+UG9vicUr9BV6HIYZX
         ZFMI0hV+U+b1iymFxpleXGNpyD7MmiBUJONQao5MR9JhUpq4iMM8HY9kkUFAhIwre6kV
         fJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKk00GZ788naBGTxoT5GM72rM2lKT+rrPq0Zst2EeZk=;
        b=qitRiQqZs/S1/mvJiqqjz3xDJqL4TiAEzEDp5fGajtHd9GZE7EkijKy3rni1SH3nUr
         QTmdZa7Z8tANk9yDGEJO8angslTXNeb5VJkO/mGRVPPlbGgPetYvWt6ZWaHWYg62OVH+
         h6eaKnS7yyewcb9oeoFFIlFzGLC49xmaYF0A/WXqZ881KjyRCpMY6tZk5C/ixnF8udO3
         yitkMWWABt03URJW+JgmZR4HofdJnmx2VLGbFVNjjSfcqCSHNz6RmCSTDmDW2X/pQoNe
         vUdz5HpDM2CuIkrAfbkLljiv3LyKj8aLzJ1gm5Oh9mFZOQM8NiFfMn75zTMZ9J624Uot
         eClg==
X-Gm-Message-State: ACrzQf3toCT+GTOLZGABRfhAunobfYqTfqdvGKIxKCExG3czg6Bj8JLc
        8GHEQuHy9dFenPvNRHYF4vz4CQPxgjvl7A==
X-Google-Smtp-Source: AMsMyM6r0jgBppwpsnKdoP6avayVNk2JuobRx5dg9qTljduaWYK6GJTGUF6rtzxoZoRHc39ZOFdNKQ==
X-Received: by 2002:a05:6808:ec4:b0:354:475a:c101 with SMTP id q4-20020a0568080ec400b00354475ac101mr3425156oiv.56.1665620643659;
        Wed, 12 Oct 2022 17:24:03 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id r4-20020a05683001c400b00661946468c6sm4975880ota.31.2022.10.12.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 17:24:03 -0700 (PDT)
Date:   Wed, 12 Oct 2022 20:24:00 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] counter: Add RZ/G2L MTU3 counter driver
Message-ID: <Y0daoGTQJM7mo1/U@fedora>
References: <20221006135717.1748560-1-biju.das.jz@bp.renesas.com>
 <20221006135717.1748560-5-biju.das.jz@bp.renesas.com>
 <Y0DUQTMd2TpFTnZS@fedora>
 <OS0PR01MB5922B6980F38873D494B3937865E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y0VsWdrpoAhM2jK3@fedora>
 <OS0PR01MB592280D15AF243C0A5FA93CD86239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922DDC46213E925988C2C9686239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SqBc1oHt8iHqXeCa"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922DDC46213E925988C2C9686239@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SqBc1oHt8iHqXeCa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 05:55:50PM +0000, Biju Das wrote:
> > > > > Looks like something different is done when ceiling is set to 0.
> > > > > Would you explain what's happening in this case and why it's
> > > > > different that then else case below; in other words, what's the
> > > > > difference between RZ_MTU3_TCR_CCLR_NONE and
> > > RZ_MTU3_TCR_CCLR_TGRA?
> > > >
> > > > RZ_MTU3_TCR_CCLR_TGRA --> for triggering counter count using Z-
> > Phase
> > > signal.
> > > > RZ_MTU3_TCR_CCLR_NONE --> No clearing.
> > >
> > > Does the Z-Phase signal trigger a reset of the counter count back to
> > > the ceiling value?
> >=20
> > No, It resets to 0.
>=20
> It reset to 0 for forward counting
> and resets to U16_MAX or U32_MAX for backword counting

So when counting backwards, will the value reset to the ceiling value
when it passes 0?

William Breathitt Gray

--SqBc1oHt8iHqXeCa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY0daoAAKCRC1SFbKvhIj
Kw+6AQD8Olun4md/v+SivFJKnHrGwUlm2lGVYLpvgzcUSvjLBgD9FEOJYC9CnFSg
92ucwlWAtepEnfFNv8/uFnwBPDPvGgU=
=VZzI
-----END PGP SIGNATURE-----

--SqBc1oHt8iHqXeCa--
