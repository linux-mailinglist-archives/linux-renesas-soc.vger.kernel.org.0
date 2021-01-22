Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DFF3000A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbhAVKtU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:49:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:47672 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726670AbhAVKrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=f5EJglY+5c9ireIWj0dXRNwfIKam
        wdzk/aYyubiDpE0=; b=Sbh6DYNb+n+EJHu5NTkqLHhUuNYxEy/OSoGcihWvUZx3
        QwW4vzuw+GUb29QuJ3itMh/aqePEVYBboStwamvotLNMaktPL32QtbLe0SIHmgsg
        +l/IyU3O4qzPtBqZtAgM4eYYmOGqMxUbfdTBIkoqj1pyr4akmEh9307Yhh4qssg=
Received: (qmail 2306109 invoked from network); 22 Jan 2021 11:46:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2021 11:46:19 +0100
X-UD-Smtp-Session: l3s3148p1@HnsB5nq5juogAwDPXwqqAP3nWBA3ETDu
Date:   Fri, 22 Jan 2021 11:46:18 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V2 2/4] arm64: dts: renesas: Add I2C to R8A779A0
Message-ID: <20210122104618.GA29150@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
 <20210121095420.5023-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdU-QK2xLrOy-OsS=H7tN5da2wrc3TuVKiwZFy0N6ueDtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU-QK2xLrOy-OsS=H7tN5da2wrc3TuVKiwZFy0N6ueDtg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> "arm64: dts: renesas: r8a779a0: Add I2c nodes".

"I2C" please. Sorry for not prefxing it correctly!


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKrPYACgkQFA3kzBSg
KbbOqQ/3Yt6/Lf6mCTAHc3vy13bjaywtdXkwnhbs7xqTM4lppPOs8VHKyvj1vY86
kDQxUN2/qRThm4KC8uEqeY4Mfh5bCIeGDm7/dsh8rlJ66uxVRYKpAm85DgSFnAmh
pZK5Tu0QFpmmF7iIcf7vs/FxllT252pSK0sq4dMdqRWKKyfaRMrhmORZikSYIqBq
hMS2TCL5efpGjyevAlLhx/DxsBtBYzPoPNlqICOCCDjeZsIDI/JXRHPZtgLAN68j
Hup4vlCKBtd0+EzqBloW0fxz+bB8xQZ5XF3QON765/kNTzpO/xFjsRtwANGhexea
EnbzN8FPxcigEYVhU3wDLfHANSMGSh7QkBRq704yvBJzUaxkaeC/ceV2P4+DYL1B
Uw9pKnOSOc/NZK44wEaGFj5bF/LC8RS3RT3G4BHtwvUkhqDF+Z8S0OGnPhbNTlfF
87sr5/b/WBb2dyGRg3X220SsfHGM3+89XT2Vr14hWcVg/St6N3tGsi3GM8XQjHhp
225DNRcMYGfAJp3oYMqdGuKvRbBIQyhnHrLj4ONyTVgV4DpZGOAlcTsAGPMWi8KN
L2RaPfvZSv2/r7+lcZ3c21CJLF6EolahEVtZCPipWdqEZJsWjb8yEht7jvjOlaeT
bBzak0TcG2SfMdoaYl/lu/rIVlXorqWX9alJ0BmpZ7LB4D7/Aw==
=RG62
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
