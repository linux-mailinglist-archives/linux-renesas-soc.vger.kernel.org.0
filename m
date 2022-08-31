Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 774925A7B81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Aug 2022 12:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiHaKki (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Aug 2022 06:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiHaKkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2022 06:40:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28318BFE8C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 03:40:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B63EDB81FF8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 10:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08026C433C1;
        Wed, 31 Aug 2022 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661942432;
        bh=cqon7c+RhWc02d4Mn6ibpvpsraaLbG4ZyLePH3sY+aQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tOSpuV9SPf6fsyE2yI1RU/BFLM6Gb4S86wcd/VVZuAYxQqDyTPAXdoe6FBj1ZLA7t
         MohSWx9o3raQVGZXa7Mw5+YlYMHO2rq1GMi4vr7x1H0t+qQAWkeb1fwQqd/TMObCT8
         caIrima2V4k8LXs2UIei0s0XBHlsBkLcLsezckvf3ISH14hb+7NR+WQ0U3P02VgEpq
         4ko4OwDTo3nbGK/dmleJiGMZjmTknT6eEWaYf3iKVNcJ7D8erVij4EAaZKmURoiEVm
         Q7qFVH+LDVB0XFFHpQCL/7BCoOAfoTYzM2FyOCq1CE5ZETY7hnF3oqb0X2evKNvkUg
         yLSEuAwSMmQgg==
Date:   Wed, 31 Aug 2022 12:40:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Merge ARM/Renesas ARM64 and
 ARM/SH-Mobile ARM architectures
Message-ID: <Yw86nLLCOrrkWOGG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <a869b8afdc47aa637ebeefcc1ca7bc61244f34b9.1660898008.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BvPBoVnlrm9Cl6f4"
Content-Disposition: inline
In-Reply-To: <a869b8afdc47aa637ebeefcc1ca7bc61244f34b9.1660898008.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--BvPBoVnlrm9Cl6f4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 10:36:22AM +0200, Geert Uytterhoeven wrote:
> There is not much point in having separate entries for the ARM/Renesas
> ARM64 and ARM/SH-Mobile ARM architectures, as they have the same
> maintainers, use the same development collaboration infrastructure, and
> share many files.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--BvPBoVnlrm9Cl6f4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMPOpwACgkQFA3kzBSg
KbYxxg/+J2cnQqzh4ZTKijA+yPQylwrvVZoPIAlDgNSdvaaVmExT2VOK13S3/BDA
oTwas0eQqW2T73yJ+axIZpT9fX5hOIf9vcvewece/nx5qO6GrTmUHe5/0Cxvr0uV
aWHIYNAXWVYYM9qs3mKOM+TemWN8KtdnPhsPEE7jAg8PEmxMpN4+9PsLvLYfyQaI
0+ciaX8Bdn2yW6Ee5c1bTwA4AcuJQMXsfVCxsiyfm7IiE63zpoZZaRFuwi4OrULW
AEfzPJut8Ufj5mRXzuZ1AOcdnBp3WmwSnbdHqEJeMubrD/ctDk0Q7xZWLDhQR+8n
1hcRSCwtL46dtlxOv21T4FfFBbHG/G5byMLW8DZK256mRNtK3RAzUYFOvYtRU36l
qBihAlS6SL72MyW8BAM8mBDA+eAZwXkb5+MLPZwLmJM3bscZRv87bUzO+1tfToim
Vb/f1ddoBLvnwp6NHjQPw/FllLFU4xHGL7vA2hruZo18ceZMyUNa1U1ZPB/OAgYZ
eym8is810ujedFpNmimuy8SDJJyTePiDyQsm/zXGvXgKwnv9fXTPMhLN4s564Co2
pc0PL5F8kDUbsl0C3MML6eHVCw4CkzLFbtAmaMC+siZUa8qL1f+W3MbiR9OWijtL
CelEQna/ojWt3skJ7/oNerRNA6UiNuKAj9gMMrK7hClHGF66x9o=
=Fuu5
-----END PGP SIGNATURE-----

--BvPBoVnlrm9Cl6f4--
