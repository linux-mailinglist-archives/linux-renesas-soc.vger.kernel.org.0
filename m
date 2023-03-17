Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF256BE54F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjCQJRQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbjCQJRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:17:12 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8022B1A74
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Mar 2023 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yUcQ7iTdNbuZiTRPGrPRP92kNrXZ
        m+3pez0mRMCXWt8=; b=NPaMhUqiV52v6h/Y4xGQ/2f/athwbGM9/pAy5skEjpLW
        wf8z84t1nC5jivmcjbGIoJaHsPDoxm1zYNt+jmrX6t5t/5cNkJP1gbr43ZzWx9Ro
        mTpXxD+wm+nG7cGmYdIXz/jtNmitOcOxZ3z5TZp8EgGl3z7M0bqlynLFSRQoGW0=
Received: (qmail 4173330 invoked from network); 17 Mar 2023 10:16:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2023 10:16:44 +0100
X-UD-Smtp-Session: l3s3148p1@/WwvCRX39JUujnvb
Date:   Fri, 17 Mar 2023 10:16:43 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Message-ID: <ZBQv+3Jn0/7+sINl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <TYCPR01MB5933865E5D673865B7C4A85586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <ZBQtzwCDDbIYM+yv@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ofdShbqNtG+wFMG+"
Content-Disposition: inline
In-Reply-To: <ZBQtzwCDDbIYM+yv@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ofdShbqNtG+wFMG+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This is all for a Fixes: tag, or? Is it that important?

Reading the other thread: yes, it is important!


--ofdShbqNtG+wFMG+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQUL/sACgkQFA3kzBSg
KbZJRRAAkyfT6w5yEDXhHiYevJv1o3s0XD69HO+jSB5oGO7Ey49UXBWZGQlVeTFR
scLEppL6HeiXyDzfgCpiSGXctPgE/admd2pF/SJwZTLcq79/wZ3P/A3DfqxZ/Alk
hW/oIjLoSgHDM+JFXwnN8yHDCTB5F92o4U1umNRTGPttnG7Ke8qF8zsVUEPyApV7
kklwQ4tzwcPjCumNeWocKZc8ALCn7HHIps3ybSGKDo+YBtIPXVANreu/q3L9RwVw
nhpPP7zYDugj1GY8xjME8J5LYeaCTMZfu6ScAbsPqr5lIdhK/Bbq2t9NZZQl1U9L
p0YWsYEn5LwE24mGH8+aYPRbipf/Pa+VNfK2WD5rI1bmlRdx4hcyG0SOYO1/dHwK
26B5oq6uHVTbLJDN7xAFdvZvCzs18CvsPxs83zABiMnttjMNihQTKxzMiC+2GES6
usope3PSSNPDO4tHs+qOSqzsKHTLpGkI6//lLAkRHU1LGGDjCNFpUvTazEeIZWPW
XnofQBXSW2wfnibPka4mq7oEJs4cUYt+TIV+Hw7YOzUUBVGp0AuDoU22PEN8PoMA
Z8VUTEBD9xQoVDKGy+lWXQatJWNWfbF0xrjmZkMbAm0HPKbBbnnfxi7mkMr22hqI
W6kGqws+hXvP4pU09gGVwAzRB1Kxncfj9AFDeTgs9WVkgbQGWvA=
=uwMV
-----END PGP SIGNATURE-----

--ofdShbqNtG+wFMG+--
