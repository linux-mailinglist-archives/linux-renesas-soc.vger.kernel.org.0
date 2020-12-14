Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25C92D9B7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 16:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439036AbgLNPvI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 10:51:08 -0500
Received: from www.zeus03.de ([194.117.254.33]:57826 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439348AbgLNPu6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 10:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=NyLHvPPkq2melxnmjnoWAzSgyk6o
        Yx3/u9C2FjSi+9k=; b=Gesoolf7BAcynKOqyE7JFBJCFaOkpd7pqmT3iGw1tplt
        ovYtcVLUpMvnyegoPF3Lh0uYC3Izkqnba8FL/sGm2evhDNnhStZso+pO9d+5j9r3
        4yOqgNVnzX5f4HrlnZ2FqEf5PuSmscvjJZ/7Iwsm4hM34f4bUnQSqa9c1kP5hko=
Received: (qmail 2467516 invoked from network); 14 Dec 2020 16:50:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2020 16:50:11 +0100
X-UD-Smtp-Session: l3s3148p1@oGJMmG620q1UhsJO
Date:   Mon, 14 Dec 2020 16:50:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and
 post_req support
Message-ID: <20201214155001.GA950@ninjato>
References: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Fri, Dec 04, 2020 at 10:17:33PM +0900, Yoshihiro Shimoda wrote:
> Add pre_req and post_req support to improve performance.
>=20
> Inspired by a patch in the BSP by Masaharu Hayakawa.

Thank you for upporting this!

>  /*
>   * Specification of this driver:
>   * - host->chan_{rx,tx} will be used as a flag of enabling/disabling the=
 dma
> @@ -172,6 +178,47 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_m=
mc_host *host) {
>  	tasklet_schedule(&priv->dma_priv.dma_complete);
>  }
> =20
> +/* Should not use host->sg_ptr/sg_len in the following function */

Maybe a short explanation why we shouldn't use the functions?

> +static void
> +renesas_sdhi_internal_dmac_unmap(struct tmio_mmc_host *host,
> +				 struct mmc_data *data,
> +				 enum renesas_sdhi_dma_cookie cookie,
> +				 bool expected_unmatch)

Can we maybe skip "expected_unmatch"? It is always true for
COOKIE_UNMAPPED and always false for the COOKIE_*MAPPED values, or?

> +{
> +	bool unmap =3D expected_unmatch ? (data->host_cookie !=3D cookie) :
> +					(data->host_cookie =3D=3D cookie);

Then, we could do:
 +	bool unmap =3D cookie =3D=3D COOKIE_UNMAPPED ? (data->host_cookie !=3D c=
ookie) :
 +					(data->host_cookie =3D=3D cookie);

> +
> +	if (unmap) {
> +		dma_unmap_sg(&host->pdev->dev, data->sg, data->sg_len,
> +			     mmc_get_dma_dir(data));
> +		data->host_cookie =3D COOKIE_UNMAPPED;
> +	}

Is it maybe worth a warning if the expected condition was not found?

Rest looks good!

All the best,

   Wolfram


--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/XiaUACgkQFA3kzBSg
KbaySxAAgC+jxNcOwMQJrajJ46vkQDu1MV98i1rlmCppSlotui20wL0swP8GIpSy
OwFawE2Byn/i56xqfVpKV+anus/G6b7bcFwrqwBRNUrnTbQ62itg+Rbwpt3P/Cj5
InWSvcyGFCGO+wYOHykzMrIbQ/naE33lULmwQHOUxS0oZAFfnSYTmfZ+0l7m1xU+
/IebS0DtjiRJesT7BDjiUrglzuCvcCQ+IJIRc6j6uZ/sNCoofXCEdoqd7tbeP6LI
Cb5bCMwvfnluRM4AOa0MWX5VEuS8b4A+uS3MxmVolks5i5Y0QPxZXEp0hTkNmOzS
Le5+cRVhuKX/0D6zbgemNQKRa3j9XBycIBt9NaGbJy2+mjrljdcurf9zbnUM1y/C
6buRnxSHXh0XtKagEsp8YsZ+Cpwo6Dh/+4de7JHCCtNuyLvV33jIAQ9o6t4xA+w7
eUpgVPPxd+LwZoIxy3xgOLH4UXl+Asa/1jw3k6VpvI1or7Lnhp4A5zQ86JYlxmAo
6ZWxW2Tc6LrFIORr/iba4ohQzlvsdPSCD7bnnJ5qfdy2SgcZvOcjLRuSCslqOl10
rI8OcenzWzGmRBcHIBbdEk65HednCDtcmVShlho0wzbTL994kQ8wDiNVaRd41Oj0
EpRLmiZiVe6ZRyS0qlyjV4abOxfu+bwsGktTEUS3ZBcvVClJ5b8=
=oPa6
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
