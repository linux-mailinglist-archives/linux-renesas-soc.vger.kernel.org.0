Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08AF34C8E42
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Mar 2022 15:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiCAOvN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Mar 2022 09:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234265AbiCAOvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Mar 2022 09:51:12 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890D59D4E7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Mar 2022 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=LwmHWS3KY+5jPXVxII4Z2Zx8C54Z
        VmnqqoLSjb4+hfA=; b=0nYkWssaFALNdNb61Jnxp1X3kmk/HF9bilr1tSQTHx0G
        ZpeLY8r0fiBewvTv2Vc32R0ikQb60/wAruSihkW9cfy0cTWfX3cGf6X5bR5Z+c2Q
        UvK6Y32SIwMyUeUB3Y+tup6D1wb86Peg4ZKR1J2IrHNyuwrqBL0kbYrawJQWcPM=
Received: (qmail 3899662 invoked from network); 1 Mar 2022 15:50:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2022 15:50:29 +0100
X-UD-Smtp-Session: l3s3148p1@AQU+SSnZ6NQgAQnoAGI9AP6D0HJXVmR3
Date:   Tue, 1 Mar 2022 15:50:29 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Simplify multiplication/shift logic
Message-ID: <Yh4ytfelBIbUyip7@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <118d62e167f6cf5e98bdf9a738634b4590ea8d09.1645460901.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SF+PDfvhQIF5ffB/"
Content-Disposition: inline
In-Reply-To: <118d62e167f6cf5e98bdf9a738634b4590ea8d09.1645460901.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SF+PDfvhQIF5ffB/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 05:29:25PM +0100, Geert Uytterhoeven wrote:
> "a * (1 << b)" =3D=3D "a << b".
>=20
> No change in generated code.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--SF+PDfvhQIF5ffB/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeMrUACgkQFA3kzBSg
KbZmSA/+OzlzsXds23t0Z82jdO0es7tz2/zXkdHwlyvFSC15bjfTWu52nGzTBBYL
mkq90P18VfA0F+QmYnm/BX/f0fCjBzL1tsNu9+PjNn0UhE8Qj+6luu0MiBiDPq+h
bEoATnRHbkUgvuGsgzXW4aQ06GepKWm1mdYQxwKVLLFjKFoxxiWGFeOSqyHSYRVV
SSVHR7phQdIqIJXgNVPMDJ/8DBTS2xbvTUg0cg72a3c1BaiMUk6aMafvL0vUGifl
XlQEXtRgMuyPbyPdZJIXY/JOvhsbIzhVk5UXF+9Q6Fal6sW3cunc43QeiHr3P7aw
NUgQKrRSZOAKKG7WfAA851xCJhMfn3q+EJGd+Uofy7Y10Er26RLOF8Gg8nPsXWbO
gXSB8UfDX/L7ePxKwXZmvUjkJNalLZRFQmB2HBTQMErlB3IJ12rDSAX1EOxKAbso
fqi325w58mWarVFdrjrnWIQpiKYR/ri2MhKqTBkxqxKz6gHmPJSRp+48eHYmvKMN
BUEpRpdHDBfRSFwJhk5QGMYEtrBDGbXIizmKtRN6HCArcvkaoPfh4CiZzJ8ZAeaW
nwJH41S0rgH8CTbTAS0pECsKz+xUsrvZz99URHhXPry4h06JhuWHNXTDiKPZ8SBv
0O8YjD5IHV9FECkwCcyi6cV4dnLGSDBhcJ8FU4FvZeFdNbYdQRw=
=fZKF
-----END PGP SIGNATURE-----

--SF+PDfvhQIF5ffB/--
