Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27587B1688
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 10:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjI1IzO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 04:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbjI1IzN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 04:55:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F236AC;
        Thu, 28 Sep 2023 01:55:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE99C433C9;
        Thu, 28 Sep 2023 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695891312;
        bh=xa6vvaBHlOk8UEtDQ/qumgt8/oG5MrDN6yqv+rveHfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p1PY+GG3b6sYjxjelG0+JL215yj4GYrBZPKDacGZ255ZosUUSwRanMycZXmoWf5+r
         o/QT+rpcWQyCJd+2tM5SXTt2P0tR+isIoHJeYw998upipUShznj+Bf5ZNmXBNGnNyW
         PRWqvWmlVWJ1kZtdyoWK9LP6X/2v7rlnkYeLQH+8f9POG7z9vkFtI/M7qLC+kJtxNn
         mA0W4el2g7aDWARx7SYohHOC7GZZxenwH0uyicTA4gBrNT7Rlfpq+IPa52sr0hXNIu
         2LTEwa6Kq3W7p1HiXer3jXIa8s7naOGsxBWwrZ5GYk90jPjb5KGwbHlog1TYOgLtRs
         bYIWbKRFLC9ww==
Date:   Thu, 28 Sep 2023 10:55:09 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Russell King <linux@armlinux.org.uk>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Update drm-misc entry to match all
 drivers
Message-ID: <2f5o6om7zcs5zndhxlmxp5bjdvemwijriewm4of3ktouuwsrtt@h2w6m3uzcvya>
References: <20230921105743.2611263-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="usopfd3hfhg2tjuk"
Content-Disposition: inline
In-Reply-To: <20230921105743.2611263-1-mripard@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--usopfd3hfhg2tjuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 21, 2023 at 12:57:43PM +0200, Maxime Ripard wrote:
> We've had a number of times when a patch slipped through and we couldn't
> pick them up either because our MAINTAINERS entry only covers the
> framework and thus we weren't Cc'd.
>=20
> Let's take another approach where we match everything, and remove all
> the drivers that are not maintained through drm-misc.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Applied with Dave's Acked-by given on IRC.

This was conflicting with
https://lore.kernel.org/r/20230925154929.1.I3287e895ce8e68d41b458494a49a1b5=
ec5c71013@changeid

So I removed the imx exclusion from that list while applying.

Maxime

--usopfd3hfhg2tjuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRU/bQAKCRDj7w1vZxhR
xe83APwN1o0Jh3tdI+KSLA0NHED3fMGIHdyRsqt2aHdCbHIyBQD7B49jUKpcY4K8
lWNF/Y+Q5bEHNDXGZCGyRairFyB/mwY=
=lA7w
-----END PGP SIGNATURE-----

--usopfd3hfhg2tjuk--
