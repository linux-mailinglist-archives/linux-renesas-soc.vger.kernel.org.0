Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9684FDC6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380371AbiDLK0V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379653AbiDLKTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:46 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B80BB7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hGN3hbcr46V0pF/9JiBvXu2YhE7A
        2TWOogM7BL0HuyA=; b=zZhbEnUZq6eIR3HqnMZyFZLZhYZe/KzlIqyOxf6aQCdk
        Hs11Sb8YvbBxwvvYplrrM/RDYhINVCVBRe/bQ6iqFhoypJz6Ckhu7iV5MNdykHHU
        bl2pM46A0lShTtT54ipYBsddC88qRPZHoV8RRSYZQKgkgkhYT4ZF6OmR/Hw5J4c=
Received: (qmail 979298 invoked from network); 12 Apr 2022 11:23:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Apr 2022 11:23:00 +0200
X-UD-Smtp-Session: l3s3148p1@YeVem3HcAOcgAQnoAGZ4AFi7qjeMIP6q
Date:   Tue, 12 Apr 2022 11:22:59 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: sh_mmcif: move platform_data header to proper
 location
Message-ID: <YlVE8785QA4JjyTs@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220407063114.1433-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdV=_QBTzd=yzD0kwvi2gNOp+oj3VjRursynto-Nbt4cLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uCf1cxL/q58P0jnc"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=_QBTzd=yzD0kwvi2gNOp+oj3VjRursynto-Nbt4cLA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--uCf1cxL/q58P0jnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  #include <linux/platform_device.h>
> > +#include <linux/platform_data/sh_mmcif.h>
>=20
> Is this intended to be sorted? a < e.

Yes, can be argued. I was giving the subdirectory a priority, but
probably keeping the lexical sorting is better.


--uCf1cxL/q58P0jnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJVRPMACgkQFA3kzBSg
KbZw8Q//dc+SlqRHHEF3pRSFUsf9USM+Hbn2FtioP4KZeC2W2F9vxGfbnVdH1SUF
4jBHHR7EG62EDi0Dleb3cxP7FkOT2QFiVqUriqwy5blGKeuXIlmQ/mBVTaeibpGJ
D6eYP4YS0dJe6Uj/Zh5qBkH+fHYOoCn19LyTGpVAtQIjzotEouZXMWCyTgiyee2H
O6F8yOLKANx7HL2qmu9G02EcCSRW9/jLHm0NzCsa9s0CDPtduEA36EiH96+ZiHlY
gXVi2oB/DkLPi9AJ6yz9iUS6446DCI3Ypw/T+S1ky3qdeJ2nyC9/V4aSK2SGnbuX
BwUw2aDU84ENH6R7G76oJuTm/1njR0FXfgKiL6G7Z7+FNdlGyLUU0aTbqslMcVkw
+n4FEiRt3VXjGmNEPaoUSOBG5GyaO3LpP6Ox59wL1GNX3d/QlxByd+fw7XJcnxRp
mF4Awboumc5phDd4/hX90Jjc0U/lP4vTtMpeNVJ7soroBbF8wiJGT01yH+74lXQE
ExAl3upxJelMTzB24d47G++7Tzj7S2qKYCbBKV7D3IJGsD4qxW2I6WeUrsuW4VSZ
Il1HU0Eke1PpunOUCbOe33EJJ1xZbuqaVVjzy9w3HIErLHeqZA2EMvsrGhck7kQ5
owpgzGYbYjDxW5BWIFGJpw8DRzlJUPntEc1ztwHWD0hgnHQ7W7k=
=+juU
-----END PGP SIGNATURE-----

--uCf1cxL/q58P0jnc--
