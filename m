Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688337EE4DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 16:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjKPP6T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 10:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjKPP6S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 10:58:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC842193
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2023 07:58:15 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36831C433C8;
        Thu, 16 Nov 2023 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700150295;
        bh=qjPCYaBA8/IUh3/zH+wJB4HYv8bpOynQzXs9Y1jF654=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a8QDYMBTgArH0HBA/rV4I+Ir63N/bJcJFy5hCdTrQE1h1H0k5njERnhxkpLrdy94H
         W94aBt4Xs+hEEk7AbAfxy4K7s2tPcnNxfmfB6OZdo5p/pGcNxjJyAjGe0mXZzzL88U
         dBuKoNBXLBNIuc9PFcGkcgA6Zj3QdxAeGFgp7idmRSJTG07f8f+Pj89uj/Fr3PEFEt
         QIvBTY7h0Bs4PIgyefcmUHpegM4sCa4271tlrfhBaTnH3M7Bb3MyGkgmAnh5apwBo4
         OO+4SHN4s4hT6p8SQPMQ5WJyIDDb3LjDOx5C3JFabesbT6UAtlUxR/dAw1tmFyLpfx
         qJyiNGkFLVrRQ==
Date:   Thu, 16 Nov 2023 16:58:12 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Message-ID: <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hq4btskxfnn24xgh"
Content-Disposition: inline
In-Reply-To: <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hq4btskxfnn24xgh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> Create entry for Renesas RZ DRM drivers and add my self as a maintainer.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v13->v14:
>  * Now SHMOBILE has maintainer entries. So dropped updating
>    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
>  * Updated comment header and description.
>  * The above changes are trivial, so kept the Rb tag from Laurent.
> v12->v13:
>  * No change.
> v11->v12:
>  * No change.
> v10->v11:
>  * No change.
> v9->v10:
>  * No change.
> v8->v9:
>  * Added Rb tag from Laurent.
>  * Updated entries for common parts(Makefile and Kconfig).
> v8:
>  * New patch
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a70be8f08ee..d4e21fe54fe0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7154,6 +7154,14 @@ F:	Documentation/devicetree/bindings/display/renes=
as,shmobile-lcdc.yaml
>  F:	drivers/gpu/drm/renesas/shmobile/
>  F:	include/linux/platform_data/shmob_drm.h
> =20
> +DRM DRIVERS FOR RENESAS RZ
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +F:	drivers/gpu/drm/renesas/rz-du/

Any particular reason you want to opt-out of drm-misc?

Maxime

--hq4btskxfnn24xgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVY8FAAKCRDj7w1vZxhR
xbpdAP9/LacrlhGa6pJCGA6gqnkOZC5BCnKotC4dBUiaygTycAD9HpwzTjOXqi/i
jRvrPq8ZUEHdx+AQQEkWDpSSUm9SSwY=
=ZAo4
-----END PGP SIGNATURE-----

--hq4btskxfnn24xgh--
