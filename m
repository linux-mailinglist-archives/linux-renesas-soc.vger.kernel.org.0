Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357E544E5DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 12:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhKLMAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 07:00:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:40844 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231231AbhKLMAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 07:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9FbbrQ30Kv4uYFI5orGJSx7ZZpDP
        cgBEXFvBN6vMBIU=; b=rVrsyFTE75AEHP/cQ7c0QV/krnvlqUPLl0gmsCBsEqGV
        uWevNsf0/E/hgHqk2u9tHUKX4rW+e6Y/0hkBYZgntRCjfLwARpJaQyQNPZPuB5Aq
        4hsydBDsf1e2eOeZlJCHzi3MsLjPLhTzKdWVssXXBnijGMB38J41Xb2iJlDQRgY=
Received: (qmail 1352931 invoked from network); 12 Nov 2021 12:57:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2021 12:57:46 +0100
X-UD-Smtp-Session: l3s3148p1@/NXhKpbQ2s0gAQnoAFqiAcAEyXqBia2a
Date:   Fri, 12 Nov 2021 12:57:46 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH v2 07/21] dt-bindings: mmc: renesas,sdhi: add
 optional SDnH clock
Message-ID: <YY5Wuvpo7ToqDy3e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
 <20211110191610.5664-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdVTUTTPYHWfzD+CN+c9HH+iCyd3xTvLsWV1=1Bva45AfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WLDdl9wRMeKSR3Ca"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTUTTPYHWfzD+CN+c9HH+iCyd3xTvLsWV1=1Bva45AfQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--WLDdl9wRMeKSR3Ca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> That can be simplified to:
>=20
>         clock-names:
>           minItems: 1
>           maxItems: 3
>           uniqueItems: true
>           items:
>             - const: core
>             - enum: [ clkh, cd ]
>             - const: cd

OK, nice.

> But shouldn't the clkh case be restricted to "renesas,rcar-gen3-sdhi"?

I don't think so because I assume all following generations will have
clkh as well.

All the best,

   Wolfram


--WLDdl9wRMeKSR3Ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGOVroACgkQFA3kzBSg
KbZuGBAAhfsiGGifZfRpHWDo8H6pmaxtfhBprf4fuSTg7ZKsph/fpslLmJnuFLyc
VeU6LiBu34V+aeUDhAI4ee+Qk+7CJlPKJsqm6Sxq4MG3CGOe8ztIiU+fBpxkfO6C
vjKfr6KgIGGbcXOV6QKUDorGte2WD6bWnboz7qTu1YXu6ZEcmKcdWuzUaXsotepq
RCOlQx/ZUvU4jK3VmeUB3ZHHLUqlUEWMiKIye8NBzpos7KMQHsj/LrMPRlg0+nde
STQVuwjWyM/jQ2vLCc3XY3SUklSNRHIvAuSZ5Xb4wOVHAJ7irsj11DeihRCIvpl1
A7KqaJnxiZuSMrsLUI2gnhz/SrEEDu7xW3axXuA808/Y0tC1/CJkFSpx+O/IitEX
faOg+M0aOBUphrR3JgPKJ0PN+TaSWXD6Q70NyecyRudy9G9B6620wqL0ZTjoDRbu
VOebXVqRvwNm2EM9AiTsmuippsTQgBIo9+W9wP/zXYoxrDRXpP5Sv5s6Qk3ClYPu
2tWP8ntn+yoyhbS1NbIfKoqclaXjjepsj7TnvRKQWJzRXOfOwoYlQwlb67QzpXHA
5zBz5yNRRSJjl8MGtht6UrPWLyL8v2i4kja1xCceV6vr89prMt7D9KBkGXt9Qp6f
pvTbT24MvOyY4AavdN3GYssKbwgm8sPhfoewv8TGstj5js3as5w=
=NFjA
-----END PGP SIGNATURE-----

--WLDdl9wRMeKSR3Ca--
