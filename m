Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B30A2F7DDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 15:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732870AbhAOOOn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 09:14:43 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55073 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731651AbhAOOOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 09:14:42 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id CDECC580732;
        Fri, 15 Jan 2021 09:13:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 15 Jan 2021 09:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=tj2SxXoSa96FfDtLrh9IpSrjSWA
        c9uYGz+Dn9iyVoAo=; b=B7b719RQYKeJsatdvoMfftPaZ7yza1XeB2tdCt+EfXJ
        lyEobF8ynRrdN7pxtUoPCNN3dfilyUknC7aTjyaF4oJihyfecKY12lq6IgiU5Cz1
        Vra/Uwe7W13TjbG6KqN24oHHPrC1/88iYYfOg2wCPjrXLB0GDaNS3PDyATP1pXej
        5HHLRWc0r29gZRdE1uLJv6pc5aMOPi8ZjLC6JAnQxX87d99PTR+kZ/k9Z6nQNm9V
        x0WGFJchuLQni4XDfFsGtGRZ9mYyCjTdEq5nOBG8T+RIbswMnhUDy8bhLPUdPJvI
        Ni7wAgdzO3zMr5uZO/F7sboexu5D3QU0T8Ed3vI5MfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tj2SxX
        oSa96FfDtLrh9IpSrjSWAc9uYGz+Dn9iyVoAo=; b=kkT3T4zeweqWXIX/CZ1B6z
        DqGsjahZcO/cZPAU9BLCMla6ymzdiSZ7ZJ35RgoZIA7tkknGLbm7K6HkmmyEtuM9
        m7U9NkEy3eA3CEOyqx8bRrsvRBhizLBqsv+hShK8YQ8uMeerxHTPnHWmrZT6W0es
        FCpGNCGdJWhmmOt1yxhfqpCXhhbQS7V+qp+UB1aKlqBuwhXYiNCI8VJ5DguNziG3
        sV4dimLDsXpkSnoUlQhIt7Z0//+muuUO0gvpOjviJZQXUhsCiK2Npriy+Aj61tE8
        4BgkQVmB0W+Y7dCtAftP+KRmtIM2szcqlPcQnNOYCpPvzfL+Flf5dJQZ2A0g6cMw
        ==
X-ME-Sender: <xms:H6MBYD0GSlkzCPJVYGpbR_ZNI06sWvUNPMDdZ6_eJm43rVMA2MrEXQ>
    <xme:H6MBYCGSUXTu3NWdcNYsemiQeKDPcqwh30OHx6Fp4t9vJ_J6k4zoRtURvSopDsY2K
    kZ4YOo4yGkimvhGq54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IKMBYD420Ru-_AznpbGVzQ0jU5qBuPPsrrNPdOFYs-JrU-4D9wCSAQ>
    <xmx:IKMBYI0429guPeHHyjc0jgU-OS7U10edc0et5onZ_6Las_n_TZYJYQ>
    <xmx:IKMBYGGGZe6Wkc688GCwHAOskyhRtgv4uvUdI5qJ4DXevueC4Uhobw>
    <xmx:I6MBYFbypYhb5YdRA0eaNNYJaUXLGsvZhXSUB8usLISCNOSUVzP1ug>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 869AA1080059;
        Fri, 15 Jan 2021 09:13:51 -0500 (EST)
Date:   Fri, 15 Jan 2021 15:13:49 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>, Eric Anholt <eric@anholt.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
Message-ID: <20210115141349.7oq5hwsj37qcpk5j@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
 <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pc7g53zcvckyysz5"
Content-Disposition: inline
In-Reply-To: <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--pc7g53zcvckyysz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 15, 2021 at 02:46:36PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.01.21 um 13:56 schrieb Maxime Ripard:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 8a4235d9d9f1..2cb09e9d9306 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -344,12 +344,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> It's not 'new_plane_state' ?

That function is using old_state for plane->state:

> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

Here ^

So it felt more natural to keep the convention in use in that driver

Maxime

--pc7g53zcvckyysz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAGjHQAKCRDj7w1vZxhR
xRyQAP9z6jgYoVLN5O08Gfa2bipU5kwBoAnOqoWm5tZt0atb8QEA9iY4poTgz6cv
u2lw2ErmnQLG6Rt10lvZcTmjIdOF5QI=
=AOj1
-----END PGP SIGNATURE-----

--pc7g53zcvckyysz5--
