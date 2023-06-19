Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A879A734B7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jun 2023 08:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjFSGCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jun 2023 02:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjFSGCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 02:02:54 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408A9A9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2023 23:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=De+hE92NkWN0DUN6bx9lnQQllZlE
        +OZa3n4a/8fajUw=; b=t9NDZaQAAeTPcUNRe99QzcCePTI9Xz1r1jZR9tz5pZ5g
        CWahLOr1FzSeIua77n6tbspw65nF5LzNbntuQubD+7vsQlbu2A7bTs2lXkH7GnCs
        PpDOS3kr+KZNGaX4S+71m9OvAwBhkX0pb1YdrimfD9BvhgkysX5D/hkZqVi/0r0=
Received: (qmail 115329 invoked from network); 19 Jun 2023 08:02:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2023 08:02:49 +0200
X-UD-Smtp-Session: l3s3148p1@z1DESHX+Moxehh9k
Date:   Mon, 19 Jun 2023 08:02:48 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
Message-ID: <ZI/viJ52TttqFveH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adam Ford <aford173@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
 <ZHeHx/rUE7ORf3V2@shikoro>
 <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="elkU6498MGZX5dRp"
Content-Disposition: inline
In-Reply-To: <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--elkU6498MGZX5dRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adam,

> > U-Boot has a 1ms delay. Could you increase the delay to 1ms, please?
>=20
> Sorry for the delay, but I increased this to  usleep_range(1000, 2500)
> and it still hangs.

Sigh, back to the drawing board... But still thanks for trying! I'll try
to come up with something better after EOSS in Prague (will you be there
by any chance?)

Happy hacking,

   Wolfram


--elkU6498MGZX5dRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSP74QACgkQFA3kzBSg
Kbbyhg/9HiYSS/xz0PvfeSyV56MWG/CCuGrp9r31AbEJsgS4XQL1UfCpWgMWpoe2
abQyGJCwuK7UvGlMj9ujeZtCjG0aeJIQIDCqydzEtnEG4wBnF54tkc3nPZ37T84G
GelQagpjEFgwzJMS3rt+MCEF6AqRXaTGpn8sCBMFEhIrZXc9tPQ5hFNASqEpTnFb
OYSHotc1GN1oQTKG6VCaVXZvbYsaT6If3we+vnJewIRB5xxl31zRPl7siuvNtcfn
hfPudhLQuawF3vhBguVK7zcZ6EK1Q1aWwNE0NSvTFaVn0VLjFVVhhvNId0lrAbV+
S08gRZcWQ8xPmPP+NPe55yDqco9zYmoYGUnHSYWh+NsmF2D8OivR2t+sMoaXml9v
cuoRdCOR8WKW42+tvZImQLb8FkGHA6EKfZEvrTZbjAOyxgBS16RQYJoI+LIJxfg4
ZOmx08ssz5LJQ3ZgJqbQJv7zbfJzgf+y3RIw34yvZRhgxKrL9PGa1CHOGwcraiSH
3dghlcOqpNRiSbLkvOwPtazhre5njGb1CeU4bkRFYrUK0G9rasKl+6dHkDcfWj5Z
HZVN5e0a/daY2jJV9dUOloHEB1Cz9IqIo8d/2mygjQAGSzGFOo01+R1DVGvSniIR
DjourzFidKPBQdc5kcC6e/rAJZGFyraEMbtukejd9fNVFfZpE7o=
=VO8E
-----END PGP SIGNATURE-----

--elkU6498MGZX5dRp--
