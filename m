Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA582688D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 11:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgINJx5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 05:53:57 -0400
Received: from www.zeus03.de ([194.117.254.33]:49104 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgINJx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 05:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fXUJ5XrONh8vOCCNUuB2z8BMlfPq
        hb1bOhFt/4k7jA4=; b=3k2dP4R8ITpJB8/JKqdgdgKYYBhyFgPkWvbzZPPSmbcg
        t3ZIxMp+8DWFhzcY0kQP6YNmlwUZ9vXeazzqx8m4N9Oj1ZXbSeL7zTYO+r3OFjvs
        VFRHk8F7+mCD9GBTSxN7K0Ic2k2NV8K1kY8MnkZw1Rabcw6W6U0gsrk8Jui5nMo=
Received: (qmail 1815418 invoked from network); 14 Sep 2020 11:53:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2020 11:53:54 +0200
X-UD-Smtp-Session: l3s3148p1@nHsuA0OvOuIgAwDPXwXYAPlEQEA0NVnc
Date:   Mon, 14 Sep 2020 11:53:54 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] clk: renesas: rcar-gen3: remove stp_ck handling for
 SDHI
Message-ID: <20200914095354.GB8570@ninjato>
References: <20200914090426.16022-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXCQ3LQDWWwOUndkXv15USfX9YFnWtw9JvUcqNyJ7-gBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCQ3LQDWWwOUndkXv15USfX9YFnWtw9JvUcqNyJ7-gBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 11:35:07AM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Mon, Sep 14, 2020 at 11:04 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > There is no case (and none forseen) where we would need to disable the
>=20
> foreseen

Oops, yes.

>=20
> > SDn clock. So, for simplicity, remove its handling.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > One paradigm is to stay minimal and remove unneeded things. Another one
> > is to not change working code unnecessarily. I favor the first one a bit
> > more, but would understand arguing with the second one.
>=20
> Indeed.
>=20
> Does this make the code rely on bootloader setup or reset state?

Before, we wrote '0' or '1' to that bit depending on 'stp_ck'. After
removing 'stp_ck', we unconditionally write 0. So, I think we are safe.


--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9fPa4ACgkQFA3kzBSg
KbZR6BAApy5h87MLSbou15R+YabtVtILEz1ZLr+XmSCXQtQrC/1P8P9LB2U7kNaL
k+R26rYwF1aapqgHLNX3tuR4kzCoyrd6vUNEkn+x0ylKmVA1rGVBWdxT32b3W0Zq
2yDFK3FSonAaPMcr953HtJmpY4Sr/aJXgRFOI1txp7UjPSr6/kAtSXr0eq6apeoy
/M9f5A8n37Fj+GTQzhOhVvNg/1IMnZythQobjqOqLhBIeBXglbbn7nZ11rRNa3YJ
IbGt03mfNrEXELgvebM92S8LFSWWhNJb6JV0X6GRzOGrY0u9lwdJUv0Wu5+CQtiI
foNx7bZTaNnJ09bDPY8WupKmU7CJkAg4Amaq/nSV0umrXVfTtiBgYcWusFwbzxNl
6Z+RLqkN7fyUGFdHdlmHdSqDJhAnEQSQOjiSiFFj5T928Yc+maBjzd/ULyhKzdmO
g0sP3EOoh/kUv9SQGq7Jakma7W2f2P4juIXYcWGssBYaTDwE5GZtoDes+QF6Dmrt
YUcafMkaCIUwGd2h8OZe3Fy5iOnknlw6wFNS2L7sSvOwVknBRpVWCHPWuLqcJAMW
LDsa+z/m/yOGIJ8meYbqEAmcpryEn6+JTv1CZMItRET51BNKSXYW8JkP91l9b2Ez
RthmEungVOxymtcdSf2ObHNGTY0VqlIxOa5OmrLmqZOv7ce02pE=
=iPTZ
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
