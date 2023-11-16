Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591B07EE648
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 18:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345425AbjKPR6g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 12:58:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345421AbjKPR6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 12:58:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5F5D52
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2023 09:58:31 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFC6C433C7;
        Thu, 16 Nov 2023 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700157510;
        bh=NjZTWXhX6tYOsHS9g+R+JRPWbqHvVjLp4SgC77GdIxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p555UH18g6sDDJjACITrbyiY0nDmXqCmx1ke7jvceBy3ZSFpDYGLMA7RFLY/WVZfj
         BTmGw38amtDapGnFvHtmKE3jk6/LBsO+spr61d6XCUpxnYdQn/hca+kWeoK6w+uqY8
         hVv/rcB8ICh+2iD1vUmjLaVFUJiNcsESGYgOy3qNn0xnfn6jsgfR3YfQ5Q6RW+e3EL
         3VY3cxr0kD/XBBC1V24C0ezHYqAJZlj22/e1UgOQJEAkKLYGRZag7xXq6oBrUoURfw
         wEXclue7LPHJqgFECBuZgwJ/rBvWsfcmY0bNtuAmAIinkpx14XebNgx4B8Wd6ugj6Z
         IN+eOa0FtVYgQ==
Date:   Thu, 16 Nov 2023 18:58:27 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Message-ID: <gqbxdb2un7s2hqttzb4ryhcwpwvsxj244ubaifzpugryioj6bg@6dleflere7oo>
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
 <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
 <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xs47cj4uibzuyjcu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xs47cj4uibzuyjcu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 16, 2023 at 05:04:03PM +0100, Geert Uytterhoeven wrote:
> On Thu, Nov 16, 2023 at 4:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> > > Create entry for Renesas RZ DRM drivers and add my self as a maintain=
er.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > > ---
> > > v13->v14:
> > >  * Now SHMOBILE has maintainer entries. So dropped updating
> > >    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
> > >  * Updated comment header and description.
> > >  * The above changes are trivial, so kept the Rb tag from Laurent.
>=20
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7154,6 +7154,14 @@ F:     Documentation/devicetree/bindings/displ=
ay/renesas,shmobile-lcdc.yaml
> > >  F:   drivers/gpu/drm/renesas/shmobile/
> > >  F:   include/linux/platform_data/shmob_drm.h
> > >
> > > +DRM DRIVERS FOR RENESAS RZ
> > > +M:   Biju Das <biju.das.jz@bp.renesas.com>
> > > +L:   dri-devel@lists.freedesktop.org
> > > +L:   linux-renesas-soc@vger.kernel.org
> > > +S:   Maintained
> > > +F:   Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +F:   drivers/gpu/drm/renesas/rz-du/
> >
> > Any particular reason you want to opt-out of drm-misc?
>=20
> IIRC, you opted all Renesas drivers out in commit 5a44d50f00725f31
> ("MAINTAINERS: Update drm-misc entry to match all drivers")?

That's not exactly what happened. I excluded it from that list because
rcar-du has never been maintained in drm-misc.

> Probably that should be restricted to drivers/gpu/drm/renesas/rcar-du/?

Sure, either within that patch if there's a new version, or as a follow-up

Maxime

--xs47cj4uibzuyjcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVZYQwAKCRDj7w1vZxhR
xWsYAP9UUkc8Nei2d8KODGDqiL1dG2G4LJdfiNGFO4nuDJ/EkAD/aUPdE/HGNi23
OsmdYERv5LFe4hTjpl3UV37vrQYbrg8=
=VH9i
-----END PGP SIGNATURE-----

--xs47cj4uibzuyjcu--
