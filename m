Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238634018FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241357AbhIFJjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 05:39:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:59838 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240914AbhIFJjd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 05:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=binw7HCsxpr297ATKQfRgoCf4IAW
        2+vPEUSlXhAohyo=; b=ya/YGLYPos0ek+t8chLnDbctKCjKRkFTIQYiG1Jaqa6E
        m2927CTiDLz6dgGdKLeQ4okZqCjj4rw1+1Hcvkl8jswIVgFuAGMrhvCPpXtP82Dr
        tFSSAgcS+S62Wt6R1qIneDiqPGJSIVXlF0m8trFAOWLnuK1ACwaKLRaW/rw+5EE=
Received: (qmail 418431 invoked from network); 6 Sep 2021 11:38:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2021 11:38:27 +0200
X-UD-Smtp-Session: l3s3148p1@PVRCaVDLBqMgARa4Ra5MAc3ZBYWvSFq1
Date:   Mon, 6 Sep 2021 11:38:27 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add TPU device node
Message-ID: <YTXhkx0xRF99jtMq@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210827073819.29992-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdU2f3xZ1zgjCk-6JkkzdLVYjScBSooNNZvsNzc2tFZPXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jMi2lO/mWfgoUtHY"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2f3xZ1zgjCk-6JkkzdLVYjScBSooNNZvsNzc2tFZPXg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jMi2lO/mWfgoUtHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Any chance you can send a DT binding update? TIA!

Sure, will do! Thanks for the pointer.


--jMi2lO/mWfgoUtHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE14YwACgkQFA3kzBSg
KbZ5NhAAqdHn5QdREd6vvjELW5Tz9QPTb7RaR+FbqCgQad0MLx2nbB0XEWzPMqpT
M5UYyZaHdi1D0bujn5UANlWKkNu4xfpj8UDmDTcmW1Zvc9wxx/fo4mYmjtYB/303
h90BwlR6KYhcA4JlMWvGHoEOQ5DlHgwfDFHOEnJUca2z7oZBeglylsEmVDkwi1tY
Y/IcO6dzx5OgneiQafANFeAXrGbmzchn1AxpbbHmT2Ep8NMtBEPpr0Mp9C9sF8M7
w8aqizVyNduuIbSvIKKDwvqt00PEI/OwyaLifFOgXsahlrp3PfiCxBIX2cdKldJP
C3IikXBBF9/W/fSkK+GjbZo15xZ9Lzb1nvYlVohxTYgwd8iTahUpUgCw/oS45iO7
TZG/cNFdeltqT6CeQt+ymalyydM7wtiHTp5bCMI8Z+WV+mltW8eg9xc4KTiRFCzR
6S+UJBJqhDSmIPQ5nevezVc1LFf5LCJsJcHwpJOIIT6ZeWF5Nvkkof5K3DRC2lhN
9rmlYHOhA+hbHuKhuIvL9PUwZwNuULHBG9fpfwzYtmq7fs0XPuFceKRYf6chsGYS
S4wuTwgD6IayN/iVG4Po1HIC97uz+kW8j/iAT0LTsfLCKtE4J3U+tlwx47eLinjr
/1vHiA+/UfjjS3YSrQ+YXWGJlmjksDs0dKEqvj0o1yBpJJnJN/w=
=46ef
-----END PGP SIGNATURE-----

--jMi2lO/mWfgoUtHY--
