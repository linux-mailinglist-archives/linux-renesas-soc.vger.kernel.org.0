Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEB041AC18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 11:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239993AbhI1Jld (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 05:41:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:57428 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239844AbhI1Jld (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 05:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xz4sb7f+c+E1o/+/9TyBuOF+ph5U
        8UoTdD+nJQGOYgA=; b=SP4lkF0Q3peAF18S9D32eIDNQA6efldAW1t/aNOxJJyc
        Zy6Rxl/pqTyGFBseEfx7Lz4sDZD2JiH2ZLq4n7hshlHifwUhO/M5TzmXlyNPjI0j
        h2hN1Swag1JVVaGkzLd0QdaanY0+Px37v/BbMD/mQQT3vLH+Cc95Cs1TtSVP0gc=
Received: (qmail 1184783 invoked from network); 28 Sep 2021 11:39:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 11:39:52 +0200
X-UD-Smtp-Session: l3s3148p1@w1/M/grNDOUgARa4Rac9ATot9flkfyHw
Date:   Tue, 28 Sep 2021 11:39:51 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash
 via RPC
Message-ID: <YVLi5/QgUhuE6ls0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
 <20210913065317.2297-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdWf0KpbNsFJqL81o6-Cpu1nn5ZFDEVdy7iPLkrMuXjGNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NYcAVPRptJPKyfbX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWf0KpbNsFJqL81o6-Cpu1nn5ZFDEVdy7iPLkrMuXjGNw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--NYcAVPRptJPKyfbX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Warning (unit_address_format):
> /soc/spi@ee200000/flash@0/partitions/user@00c40000: unit name should
> not have leading 0s

Oh, sorry! Shall I resend or send a fix?


--NYcAVPRptJPKyfbX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFS4uQACgkQFA3kzBSg
KbZKng/9Fw6Q0yZ+e3OMXT+fh4nit+7Qx8QpfavRFLUaMc78aXowfKmrLqSZN6o0
3zFJveu+BKLfA4w2cvtUWJXMOMXsPIYK1IALe9knB5mtSfb/E9OReoMAP3C5CpvK
SMSW/d/GTsYjRgmBLcBrpTQYuuq3Er6uBiquM/41v6UF3rjXF0TOch2JLYcvi3OZ
xKvp1/nTCf4g6DuY+29CAuhXFm/eHiU8RDwFubXH0X/TWASdBnNPN5Q1WB8tLJ2W
pH6tjsUOiK2PepAIwkHh65l18FMKqrRoroPnunthf58OvtX5pjxQv0aN4Bc5oKMJ
ZAZIxrkoOH1oNZLZ7AkWRV32+iQA1Yyqb4EeGZf8eGMJCswDjtRypK4oLfguSsE6
ssOgBLrI/nTGQ+mZZb3rrNvvnyMAljVjlYs0LoDuKIPmhxqTwvkFF6xd2cu4OpnX
KZJJ4lCL+DakwU4Zxaw4v3DJLT//JfbjTHuTuBi3fDLBvCD4mr6oCTKjkjqlGNtp
rPlOYRJ7vjEVVa55y4vqle+FBvKdCg1Q/UxdrlPXToegIOGODgpN2zJfK1OFDO0N
SdA6b9ogjIMBN7+xy7RGmlaG2dMgZvOf5l04F3gj7uRxDNEmC8hViwUSMJj30TmG
V4JS9DVN+uOY8oxUZNqeoj+wDdETj6y+CwL9MvD5W6Y4aHinZcQ=
=kMNX
-----END PGP SIGNATURE-----

--NYcAVPRptJPKyfbX--
