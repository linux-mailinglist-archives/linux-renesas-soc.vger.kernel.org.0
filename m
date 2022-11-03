Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C12B617C0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 12:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiKCL7Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 07:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiKCL7W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 07:59:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5BB6396;
        Thu,  3 Nov 2022 04:59:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14B53589;
        Thu,  3 Nov 2022 12:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667476760;
        bh=yDrB2VkpU4kyJipoxlFvlid4/amRaP6+HLz0Wmutlsk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sgJkqbNmNR1i4K+9exxotK4hqHTTSHuTYuKR+n4osjEJUkNIEuZ5PujiOYlCOH8Lh
         vU2v8gP7Fy/Ttj6dUsiBqUpDH00W3rJRTHPnMYJ57X6xUBk+y1RfgkJGleel9P8YmQ
         M+D2xMt3poQgbI2hYlNq1Qk6p2cWE508xwOw+P3g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
References: <20221018181828.19528-1-rdunlap@infradead.org> <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org> <166747314442.3962897.9754510086268412956@Monstersaurus> <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on RCAR_MIPI_DSI
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Date:   Thu, 03 Nov 2022 11:59:17 +0000
Message-ID: <166747675705.15935.18102645792749937940@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Javier Martinez Canillas (2022-11-03 11:53:14)
> Hello Kieran,
>=20
> On 11/3/22 11:59, Kieran Bingham wrote:
> > Hi Randy,
> >=20
> > Quoting Randy Dunlap (2022-11-03 06:06:45)
> >> ping. I have verified (on linux-next-20221103) that this is still need=
ed.
> >> Thanks.
> >>
> >> On 10/18/22 11:18, Randy Dunlap wrote:
> >>> When CONFIG_DRM_RCAR_DU=3Dy and CONFIG_DRM_RCAR_MIPI_DSI=3Dm, calls
> >>> from the builtin driver to the mipi driver fail due to linker
> >>> errors.
> >>> Since the RCAR_MIPI_DSI driver is not always required, fix the
> >>> build error by making DRM_RCAR_DU optionally depend on the
> >>> RCAR_MIPI_DSI Kconfig symbol. This prevents the problematic
> >>> kconfig combination without requiring that RCAR_MIPI_DSI always
> >>> be enabled.
> >>>
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function=
 `rcar_du_crtc_atomic_enable':
> >>> rcar_du_crtc.c:(.text+0x3a18): undefined reference to `rcar_mipi_dsi_=
pclk_enable'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function=
 `rcar_du_crtc_atomic_disable':
> >>> rcar_du_crtc.c:(.text+0x47cc): undefined reference to `rcar_mipi_dsi_=
pclk_disable'
> >>>
> >>> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence=
")
> >>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> Cc: LUU HOAI <hoai.luu.ub@renesas.com>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: linux-renesas-soc@vger.kernel.org
> >>> Cc: David Airlie <airlied@gmail.com>
> >>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>> ---
> >>>  drivers/gpu/drm/rcar-du/Kconfig |    1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff -- a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/K=
config
> >>> --- a/drivers/gpu/drm/rcar-du/Kconfig
> >>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> >>> @@ -4,6 +4,7 @@ config DRM_RCAR_DU
> >>>       depends on DRM && OF
> >>>       depends on ARM || ARM64
> >>>       depends on ARCH_RENESAS || COMPILE_TEST
> >>> +     depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=3Dn
> >=20
> > Please forgive my ignorance, but I don't understand how this works.
> > Could you explain what this is doing please?
> >=20
> > I know you've explained above that it fixes it to optionally depend on
> > DRM_RCAR_MIPI_DSI ... but it's not making sense to me.
> >=20
> > To me - this is saying we depend on DRM_RCAR_MIPI_DSI being enabled, or
> > not being enabled ... ? Which is like saying if (0 || 1) ?
> >=20
> > I'm guessing I'm missing something obvious :-S
> >
>=20
> What this Kconfig expression is saying is that it depends on DRM_RCAR_MIP=
I_DSI=3Dy
> if DRM_RCAR_DU=3Dy and DRM_RCAR_MIPI_DSI=3Dm if DRM_RCAR_DU=3Dm. But that=
 the it can
> also be satisfied if is not set DRM_RCAR_MIPI_DSI.
>=20
> This is usually used to make sure that you don't end with a configuration=
 where
> DRM_RCAR_MIPI_DSI=3Dy and DRM_RCAR_DU=3Dm or DRM_RCAR_MIPI_DSI=3Dm and DR=
M_RCAR_DU=3Dy.
>=20
> Randy, I think that it's more idiomatic though to it express as following:
>=20
> depends on DRM_RCAR_MIPI_DSI || !DRM_RCAR_MIPI_DSI

Ok - thanks, so it's the module part that breaks. I never build modules,
always builtin - so it doesn't hit me ;-)

Anyway - it certainly makes sense now I think so either as posted, or
with the idiomatic proposal from Javier:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
