Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A616640ABE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 12:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhINKnE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 06:43:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:40354 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231612AbhINKnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 06:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vpUDLeb3xbEacAs9tk0wEn9tgTYj
        R9+hLO0MahfO2Bg=; b=gsSZcLkWI7aBJT0R00tt08InXRdOtCz+Xh3EDhvRa40o
        S7tPdnCkebfP9Vq/PKpCkGRiyxWZ999bS7yWlnRmLOeWSZY5zUR2WARJS+Q7o5PE
        LmWHy2jQLBQY0s/EjtdeIADzsu92HK/1LbQIiLEEgvRjyN6pcWgLEzSP3DLOpGU=
Received: (qmail 359425 invoked from network); 14 Sep 2021 12:41:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2021 12:41:44 +0200
X-UD-Smtp-Session: l3s3148p1@f9xQOvLLLMggAwDPXxMyACCkRmvQydX8
Date:   Tue, 14 Sep 2021 12:41:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix i2c2 speed calcuation
Message-ID: <YUB8Z8ArmIbjI6i+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <20210825122757.91133-1-aford173@gmail.com>
 <CAMuHMdV1Cd23aaVKq1PyXHrc6W9FyikKOCpD0-PZqkgbVFbA5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g5VrGWIXPwwyL3HX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1Cd23aaVKq1PyXHrc6W9FyikKOCpD0-PZqkgbVFbA5Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--g5VrGWIXPwwyL3HX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 02:47:21PM +0200, Geert Uytterhoeven wrote:
> CC Wolfram
>=20
> On Wed, Aug 25, 2021 at 2:28 PM Adam Ford <aford173@gmail.com> wrote:
> > The desired i2c2 speed is 400KHz, but when measured on a scope, it
> > is incorrect.  The driver can use the i2c-scl-rising-time-ns to help
> > calculate the proper setting to get exactly 400KHz.

The question for me is: Has it been measured that SCL rising time is
really 50ns or has it been measured that the bus clock is now exactly
400kHz?


--g5VrGWIXPwwyL3HX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFAfGcACgkQFA3kzBSg
KbaSkQ/7BBYnAYh+wl5O9FA8ERSetX+nLjLgjb7A8Bl7oiYjZAthPyH2t/Ew2CZh
cIrSD4ACnZLxeElQcpLKCG3Qu5TlGxDdLJ5iMZOSWr58WlYzq1WgvXJhESC8pu1a
66K8DMAX9N8mnp3kw3+546ljteQjBFAeSSLz4bEJmNNmx0V3glWanVMpuaKtzHMF
LBq4Lp9WmsWWWfhDUqwGzFtXYwmVuvq/9ty+KV4tgJfUzBhxIyJMutMvDIiPVUBQ
7U31AujmqoDDMHqzwkGb3e+WhA0WRuigeQtCaq8o6WolU8v/KU4BaGyPVsTIt/J3
Yc36AHKzeWhimWdmFB6qNL0IUwT0KVIVCzMWUPWol//T3krDGIDlqLTNPzyRLuTg
2b5baEaAPM+Oj69iV9v8FuoZj1JDLEJnwDte5kFFSNhIJcNkE0ecwbGa7Y94z7ru
y/T0Wm+HbjXxporiZUJuwBGJH+E0eI9FzDyVQbCLm3UFtBuhmGHRQzCgG8YPhD+p
1egpkV77YkzDwqdrmMgw+tsJ5jiWZeqIkWglZj8ueG+cmjaNORzkV+7I+liarxry
kjSB3NOxXlQf7RNpvkxdSybrgWgJI29RXsNSQjuLcduJ8hxMppeB9B0ORzCyu1Lw
88GvnTbGDVCpBVdrbJVUDxj69TliNutgU1w5Gd4UpBmWWshPX4I=
=KkZi
-----END PGP SIGNATURE-----

--g5VrGWIXPwwyL3HX--
