Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41BBD61876B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 19:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbiKCSX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 14:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbiKCSXr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 14:23:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8912F1C116
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 11:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=YTMdzCl+VniYAFmv+fLmkLhOzsDt
        k7frOQfxeO6odMQ=; b=b0FQo6cJq/nSS8cFNVhkkavj03khgKD2zpn6WrZEeFV/
        vsnqg3fesNoshHDrQaR+KzBpaVXVqkIm4SqWeaMaQ1DU2O0OsHw+HBbf/5UB3VWQ
        z98hM8q0j9vSWhUV2bnxiE87a7ZR3PORZUqLfzqmJ808WpwRLRLV3TL+4BRa2CY=
Received: (qmail 2742567 invoked from network); 3 Nov 2022 19:23:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2022 19:23:40 +0100
X-UD-Smtp-Session: l3s3148p1@lqFQDpXs+NEujns0
Date:   Thu, 3 Nov 2022 19:23:37 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
Message-ID: <Y2QHKcgNOTA8d6aV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com>
 <Y2LBiOqomYJ2E/Gd@shikoro>
 <CAPDyKFr1UR3QX4X45TmShADDpOEuxnadcvyTGaXLhcxKrAxbow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yalh/r68Da0bXdef"
Content-Disposition: inline
In-Reply-To: <CAPDyKFr1UR3QX4X45TmShADDpOEuxnadcvyTGaXLhcxKrAxbow@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--yalh/r68Da0bXdef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sure, I am fine with applying this. I just wanted to point out my long
> term thoughts around using the tasklets.

Yes, I made an action item for that.

> Do you intend to send a new version to drop the RFC? Or can I apply as is?

It should have actually been named RFT. I'd like the BSP team to test it
if they have time. I will ping them.

Thanks, Ulf!


--yalh/r68Da0bXdef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNkByYACgkQFA3kzBSg
KbaTWQ//ZuESIuDHtMogPYaqPQeYLMC3+k7EXIRUyhDhnT3NipTz+N05QSWZbqdl
P75eMq49/bLEgTuj/UFmP9hKPRa58cfiUWmmoVaKW5PCVSwpuhGR0UQYeV4O7EZM
IGSq8Coq4ZZLN/IT+sET4PtPdk8QS/i76yOOfnD5Buhgg9cs815srIysvtAjP/ti
kYZjHaqMRfOKzBN2vsPL75U0swpJu5+1LnyJUt90OoigJ7HsuvpN0JlwM1IBJiEO
JltTAYwW4I5EuF70Cff3eIOSxAdWSkEyGIQnHqOlqQZ5Frx2WaItXk/w6OkraUmB
47El+yLO6w4+hvxQwK7U0jqN4NfmKBNTxmpYrSCvMXAXIYdiMGANONaeCDK+uaoa
gtvKqlfA+Zee68i5VGmQWOKpwvbP84TzFW82KKFZXN9ZIq6lr3tgc41DlqCui/Jc
FGYjuK0ElsRfLB/a5rODxW55dMmwFw9gX3Usc5CAbLqtM24cXmBwC6RpMl7+oChs
fh2Iu7bn6e2SM/DxoLbvj//fZsqzuRu59VeCMkggw1vIcqqsTQWv65M7laCx0ENT
NKUEjxGANFlJC1yC229yC4i+5BdY4zglvOzjRggmeVH4FNJMYM/6pQrlhr88klKB
6vvvRCdPOkqxZXNE+REZYYCVXNXgEwx50I88gvQ88rxxxK8uyrU=
=OgHt
-----END PGP SIGNATURE-----

--yalh/r68Da0bXdef--
