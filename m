Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A3E2EB002
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 17:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbhAEQ1z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 11:27:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:36366 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbhAEQ1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 11:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ItCqiLHQl9A4Ym1BH/ajMtYAHSq0
        U0IE+c+ElmC9zT4=; b=ao0skGe6I0CoQ6Q+jg/ry3yvCr0rMFK96RGUIS94b2lR
        jhoVwKHTULh6gctCFaacUhhPpj6QXDSjw6UgagdpH6KoCsT7F1neZdvp7wgpdR45
        I8lVk7ub/gqvVaUegHaBf2SaAWFxU/rVFjjIF+ekxqhrDQUM14/iaKcSiFnwfI4=
Received: (qmail 121856 invoked from network); 5 Jan 2021 17:27:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 17:27:13 +0100
X-UD-Smtp-Session: l3s3148p1@M9HVrSm4zuUgAwDPXyX1AEdA8SGgn5QT
Date:   Tue, 5 Jan 2021 17:27:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: falcon: Add Ethernet-AVB support
Message-ID: <20210105162713.GH1842@ninjato>
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
 <20201227130407.10991-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSZ7Fw2fX6aYhqavDDV01qkYJmXrAUWv8Rud9hKVEBZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSZ7Fw2fX6aYhqavDDV01qkYJmXrAUWv8Rud9hKVEBZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

thank you for the reviews!

> breakout-board, while AVB1-5 are wired to 88Q2110 PHYs connected to a
> 5port MATEnet connector on the Ethernet sub board.  So all PHYs are
> present?

I was under the assumption that we don't have the ethernet sub board in
the lab. Sorry if I was wrong. Then I was probably just missing the
correct Marvell driver for the phys when I tried to fire the interface
up. I will retry (with your other suggestions, too).


--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0k10ACgkQFA3kzBSg
Kbaggw/+KsCF8MM60YIdpFFEwPseBHo8giyrpaPyVr7YL58wbfBHZIhT8UieP7CE
V7XV79AgAhucfaajRifa9A2PcfdHiGWXVx6TdjgEfTtoIRfVoZKFfiUJSzitQJH9
cckmDhzMUhULJf9C2LwOqx97c1KTYrUpjzgW/w4IjsPUOqo/IDkDkJDQFElne+nI
0CuJuDscuo6UcLeMbYIvO+jrNfzeNsmh9FMdYDx1veFXQtlcXGCLjPGSOuRVRCk2
NmO65oiS7uS7ZMwaHUcWHQZgTip/UOpgj+QVnDOba2zTsOe6qNBlZtGNnyxdpGiU
5qxI23fSnwtS8HcqQQVRIe79aNDN4ccgv4abWWZMvvhl3RnBYibdbP9t9dq+raci
+g0VteK/eY9wh23auP8qwx+KWKYIidjqguD9ogG1T5c+a8mGMyUtum4fBbDgQvz0
y+2wiQtM+hgOJ0pZRs3e4eHLZh4mxm2MC0ZEwwc9bIGVs/wdzevnCGJR2vtdbjrv
MhfgeMQ94KyljL5aTGity7o69g2Z/yR0yGbMK4q4SoEIpLDhqbos5+JlEzuEAEs0
PIBrc4nnuG+0uQP8jeIpVCD87enVwOnSKFVjYNz2BuD1Xst2BqEtcWVrLScYvybD
WPIC+WoMVZhQQv5jJUAxfkAiNnP2qxQOrUqbWF8hWwc0puK/kvA=
=D7lI
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
