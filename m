Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81775F7516
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 10:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiJGINc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 04:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiJGINc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 04:13:32 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9D9F252C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=AfQtRL0u3+ClRas3Z9+Ok9bPbZLF
        SsHu6u5QQ8by2kE=; b=zZpqu1umqxjBhwORSq/uH78Y2hCzS0tvJOc3sL0bmjPz
        OWUFWeMysmgzKTutKFaN5dad9AalXBoUcWBf4xvea7OxXWtGJuxuVcPNNz+2fKrg
        VCOyINMDUrTE64qvFpS3HljFNWvzdrD6XykkYpuyQNrQKE6y58B7DfoNj0Dshqs=
Received: (qmail 1672010 invoked from network); 7 Oct 2022 10:13:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2022 10:13:26 +0200
X-UD-Smtp-Session: l3s3148p1@DYw1Ym3qq4YucraB
Date:   Fri, 7 Oct 2022 10:13:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 5/6] mmc: renesas_sdhi: take DMA end interrupts into
 account
Message-ID: <Yz/fo4gxZwLUXQeR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
 <20221006190452.5316-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdVAP4k=O1+e5n9puRCSCr3zsA0EecQrJ7FkqQiLP4C39g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A2s9TjACl4vDZ/Os"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVAP4k=O1+e5n9puRCSCr3zsA0EecQrJ7FkqQiLP4C39g@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--A2s9TjACl4vDZ/Os
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +       u32 dma_irqs =3D INFO1_DTRANEND0 |
> > +                       (priv->quirks && priv->quirks->old_info1_layout=
 ?
> > +                       INFO1_DTRANEND1_OLD : INFO1_DTRANEND1);
>=20
> Perhaps it makes sense to store the dma_irqs mask in priv->quirks,
> or even in priv, to simplify this code (repeated below)?

I tried that, yet didn't find it prettier. I am not strict here, though,
so can change if desired.

Thanks for the review!

   Wolfram

--A2s9TjACl4vDZ/Os
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM/358ACgkQFA3kzBSg
KbbXmxAAizG57T8U+hBa5AJ4S0rGplWwukxovu8IOcDKNqDNOI2yMzreYw+vGy2t
jTQpKUkXasSKsn9bu0M35V24l6XSk2fN+5CAiydW4oqdlgIgH4Y0jfs5hUmuvW4T
7AL0xUMj7D0tgUFUQsqIOJdNXiIGUv/WCE2hmDWo5/WKr1Fo++jUEdqfVT+CUnND
ZFX0FQzRWp/EPNyCXr2UQwr/1IF50hkAakjktwddqdtGF+SUx7aaDwJAXArPQowP
DB4G+jrhKMh+gplBe+PL40rTiyW77TE8XCQarpG8B1RBhl3t8hpgjuKA7ImvRkAY
MR6dNo9GQbMIjKqsB6sdVo6X+zGUY1B6Bwdg3G1gtffnB0MRnQEP+iSj8XbN1Z8+
ruOft9nyr+jff0ZU/hcqKz9TwRotoNy94dszVgfqP0TcskoGnM8s0xgtjofHq2zy
K03D+jr0mWejq6pGrGmPEGNRUjE2gguxr/itQROVtHR2WlAGQEhKarilB2mJC04m
W4X5ADCd13mQrNN3m+hXqJ7o2LYCHYNBRZECjavOznu8CWkBnOMt7zIT/bwX68KX
3DpL8JDrboaHpi73qQJ7Fv9DhVYnYL70QCg4BiA9RMpaD+Mp5dxCaFSgktHufKbd
kuGZbNptBnzWeSSGI166dnAbbi6jL1UUhHAWXeJUTgoy1gnwI1I=
=x3rW
-----END PGP SIGNATURE-----

--A2s9TjACl4vDZ/Os--
