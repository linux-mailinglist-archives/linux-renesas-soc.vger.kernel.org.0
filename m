Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67A64193CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 14:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhI0ME0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 08:04:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:48738 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234087AbhI0MEZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 08:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=87761o7VILD8UMZI4tzHiRt1yP7F
        BtneFUwFcJdS7kY=; b=xAD6aVLSEf1w4KptB7BX7XEPN6CUFnII1qtBzY7sVPFV
        H5+pMY/8S8kybQh8SGSYcV2XrrIy/RbDjum27gE4uRBZVaukpb1JAC3kxPayFXIk
        gYbTZUKaTASqbNqkWVBXkE/h8BoIa26gFzJ/tmb6eD69B/VnkfVnTaUPmaAXVuQ=
Received: (qmail 842639 invoked from network); 27 Sep 2021 14:02:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2021 14:02:46 +0200
X-UD-Smtp-Session: l3s3148p1@0DkH4PjM8sMgARa4RUvHAbZgIYagrKBM
Date:   Mon, 27 Sep 2021 14:02:45 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Message-ID: <YVGy5R89xycRoLP5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
 <YSelsjPyswWCr7Nu@shikoro>
 <CAPDyKFp2Ut4UJoRXPD4t+k1+ZfmT-CQZ3obNA_iPF6OA-t+T7g@mail.gmail.com>
 <YVF5ZskkvlI40pkg@shikoro>
 <CAPDyKFqBWGgsVb8r_n-rR4WSStpEkpExVi_Lizds_S724zGiYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZBNTQTtPRCz93PiT"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqBWGgsVb8r_n-rR4WSStpEkpExVi_Lizds_S724zGiYw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ZBNTQTtPRCz93PiT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Your 'fixes' branch is still in -next only. Could you send it to Linus,
> > please?
>=20
> Yes, it was busy last week. I will send a pull request later today/evenin=
g.

Thanks, Ulf! Much appreciated.


--ZBNTQTtPRCz93PiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFRsuIACgkQFA3kzBSg
Kbaz3hAAjB78E58n2UT8NpQEdk7SXzlIISnl7l05TbEqZQJ83GQnocED5s67me6Z
lLW5tsglUo5D4ZcIZmO2avM7G/esUy96AYkvUYOLwYXnV/b475Ob9fIHU0zyp+j8
7VZbC/ZE4cDE+iFHkb6AVhSnF63FXNscAKVUeq5gOYxcigPdBNODBY19SUHcOYcm
P1yfgOb5Gp666YzS0KQZ3VT/zU17iN5t9UwtlulmEvQP53aUD20meebS7B5Lu5lz
iuXSMO/sO/+sOKpYJWmeacXh7/UfNxGRnjntf8ie2QXXZ3tInP5Yqec8TY9P5GIw
jdooLyhivd3FXEd4G2PPTir2QJcD0PwGd24Jg4YzISXz7uA7sD6FopqJst7PcZFv
2f3qPJIBGn/hhJNwR5vuwX1lvilg0tX9XrvEAquj7/8fllBbP7AO4hVmBChTtwbR
y+e0WKRXNnJvtyzK8ODZgrjaLZzOMx386NUKxbSim+8ug/AgOawgC4wzPUGMTn8w
ySvVQAldXIXdb8pfer1JM7cGF7YAlaiKAy2i5A9pplugraZtenJzsPl91Ps2sEPt
O0UQ1VQMnhqj9rHxg0OAl/NpN7stbReICFZNseaI+24Yx/+bQKWXmgJbLzDA/OlQ
1HfMRDPB14lDtzOQTs8oWJ70pdO3/de3xAfcda7DVe0q/adGJLc=
=mplP
-----END PGP SIGNATURE-----

--ZBNTQTtPRCz93PiT--
