Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE4440C1C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 10:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236721AbhIOId1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Sep 2021 04:33:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:35760 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231672AbhIOId0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 04:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=CFaxKRIe6h2bLPQOVSBLSKVu4F9t
        ENBE0oc4PgyoD0s=; b=s9z40YJGkW9UCRVUjglTJ06tdnIZO6dzxWmzR0m4P09F
        +72sqVANcAP2utw9VMuaInLGX0JRezn/hJ5VnC8ypozDm97lmPcdNsxpt6ak+CJL
        JxJjk5SxX4FZLO4QDrjqBNoWbZgcB3Gil2Ykh4BERZlL4bLfD5SoWMCN9GJY1XQ=
Received: (qmail 728735 invoked from network); 15 Sep 2021 10:32:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2021 10:32:06 +0200
X-UD-Smtp-Session: l3s3148p1@fyKJiATM7owgAwDPXwzFAFG7/ghv85hq
Date:   Wed, 15 Sep 2021 10:32:06 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Message-ID: <YUGvhj4RXDDGPNtR@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWGwncmt0V4V6mXtpU1jSb2VO4Bfe5yMsyiN+=KCkEuNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="joWh6AcLXmBwzSKx"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWGwncmt0V4V6mXtpU1jSb2VO4Bfe5yMsyiN+=KCkEuNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--joWh6AcLXmBwzSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I gave this a quick boot test on the Gose and ALT in Magnus' farm, but
> the issues are still there.

Pity :( It doesn't fix all cards, but it fixes the SanDisk cards which
the BSP team and I have.


--joWh6AcLXmBwzSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFBr4IACgkQFA3kzBSg
Kbbajw//SEBINvlPtwPvxR/D9w/GLtO9oHd3k+p81IQYIvFjenY09yo3HGEHu1PM
05ZVMiFWLkvo1BF4+14b/MdRpCpBJC86k1ozlig7SFMiDJiKw4xBhkCgxJDbjYUv
IVFHYE8w2foHPgWO7VULmyVA48xlIJrjwTyW04Ldz8+8V0n1wi15+90pdaS+RlmZ
fZgHXjOXwCvWghUfmTEg/T8ilPEPYbuBdaqEDQiE+C1uM6KGh8tvFRLNo+0fSFKF
z5KT13NmhTdcxnDlGDVsnfaaLDnw5eRvV0KwHXtxO7nsYazS8ChH4Ykgmes6IX3C
UY+7/gs5BzLlP0vDyEUHU0eo3JU3yY9iFutNWcBXfM2zwR/ge0zrE2mWtlDb/a4P
JUHZxa+W80PPs91TmN2YBwHENDbcl7vbUDgdF/R4UWWaBfK46OmnDhbhow+nuZqU
A06ZL1Rc+nX1/rtDyPBcw1LPKLZ1Lk0+f3lrUU7xXikXvyW0SzX+47g8E72JMkBH
3nNazoiZVDfG2c1DejQqZei3nLxnWbRBE9YFM7hP8PvYpftP9H/RCDJImsQotL3M
wf6ecY3VFaeMhOQafc73Bq4aiJPBoIopYXLgxdHEpq9giDR2K/7+OcQ8Lzw4O2A/
YZkYyX5V3jv4kxmAITGfXq40c/22MlSMAOcvvcWGMBOUdSwINk4=
=3i8d
-----END PGP SIGNATURE-----

--joWh6AcLXmBwzSKx--
