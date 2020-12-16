Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6B42DC1E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 15:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgLPOMO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 09:12:14 -0500
Received: from www.zeus03.de ([194.117.254.33]:58172 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726468AbgLPOMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 09:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=G7dpwjFR/zXbY0GDg/WRDwyaGprP
        5ZP0uCi2LqjpQTQ=; b=M0VepTeTOl7FM0TGE7Rebmv9SFflcE9QrhHUun4C2Bcy
        AjNrv8236rgw+RcZT3tcqsnBGPmC6KbBNUw+aqj1p+N85pPLlBTsn4jpBdZ5LLdb
        Mcdsi/a1o4EPXAwrRkkosuMpFEmoeVS29M9xzoI+BiircjHu4+ZJfpkUuk28KW0=
Received: (qmail 3132002 invoked from network); 16 Dec 2020 15:11:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Dec 2020 15:11:31 +0100
X-UD-Smtp-Session: l3s3148p1@Uoa2c5W25NdUhsJO
Date:   Wed, 16 Dec 2020 15:11:31 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: renesas_internal_dmac: add pre_req and
 post_req support
Message-ID: <20201216141131.GA4563@ninjato>
References: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608114572-1892-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <1608114572-1892-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 07:29:32PM +0900, Yoshihiro Shimoda wrote:
> Add pre_req and post_req support to improve performance.
>=20
> Inspired by a patch in the BSP by Masaharu Hayakawa.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

So, I tested this on H3 ES2.0 and M3-N with interesting results. H3
ES2.0 has a significant speedup:

with: 254MB/s, without 207MB/s

M3-N speedup is smaller but general throughput is much better:

with: 262MB/s, without 250MB/s

Same kernel, both systems idle otherwise. I don't think it has to do
with the number of CPU cores, but more that the SDHI revision is a tad
newer maybe?

Patch looks good, too:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/aFY8ACgkQFA3kzBSg
KbZrIA/+PdG+e8E/M2RrWO5MNcXmvoNFN8IE8sRLCbQaZ/CG3Mlr/rCbkKjmlwgL
QCi8OKZl4TNvs0zRM3V8D+wl2ILqQ7/bNvVE0oVEetKFrdauMzs4woJy5caRkv9G
Wm3q77qQVTnjBfoWCjc8B65fOdoSVHUcxZ8ClRVq65NhpX81sfH4P+C35rkQxjHI
5I7t5oAYt2RL4TQJ8sTIyOwV6yp2uGOIbYjwRUaU1+ZwSy+DajVvIN87uAfFq5jj
MGGNxbNwMU0vGUvQHTetWoF/QKxj7B1Uo5d+LbQ9QMKl0t9XFflTVrr5Yzr6rbda
gvPpjlCSVauYV8NILzv9JmNzVDEZE22MfNh5AInOWq8lW1CJnTsqg4sd4/pU98Mh
AiPjRpmCIEmQhvFneTpDdSsKHXMtMgLYsW8ndsyM1B1/jr9aNTCM7ZCTy/FAR0TH
AY4vYyupOZ9H8koutwhV2uyTSgcIoVQ/JkMjdhDKE7Wod6nash1xWugvjozIX7vB
9pocV76ih6GfyQFStw5g59TK4SGs62VX82R4j5xsNd5l38YFEnCaOowo4Wl79gah
EOeDL6YzMrGDwl2InVswSWslekgK2p42ACRq8fwrGTgfxnJLlqljgdipyoTcqTH9
Kezz1Lmv1E/Z9tc1BGaBY750Tn+OuMjxn0AdSwKoEgb6Hlo21ro=
=xlZp
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
