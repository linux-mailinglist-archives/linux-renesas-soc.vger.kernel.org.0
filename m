Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA4D750A0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jul 2023 15:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbjGLNxJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jul 2023 09:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjGLNxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2023 09:53:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0F7B4;
        Wed, 12 Jul 2023 06:53:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BEE4C617DF;
        Wed, 12 Jul 2023 13:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A345AC433C7;
        Wed, 12 Jul 2023 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689169984;
        bh=0sbyIiczIJDnx26Ch8e9l+qxXeZZ0rwKcMQ0zWjPG2E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hjUTKto8Ioz8iKBRqNaRabBf11Oc7eHOlmTK9M/ZTt8ltDoWCX6CFOzjIGxRlGFY3
         Gx5jqcVwy1TF/krIPVc4UMyuHZxNLbDekq6CNc/YFW9XZuZPgy9H7AxolbKkWLgnAi
         r9fpm9kzzSwMYN6Psfg7TVfTW8n0B+mvlh2FTRcCYAZ0ciN3u0JY7dyza48kXnOA9n
         WMci9hbcuhVOWKEEdS8SZtYhWg6pK+ZLR69YBjxKaOmTAGDWdtxl6Adlqjo21243Qn
         XbsKfbvDJLN7WkAM0aaNNMoLWVYfSKf0LdY3uyS6mKtDCMS2NYJoRkpPzq+x8hypZP
         ozEduvqpUbjZw==
Date:   Wed, 12 Jul 2023 15:53:00 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
        dri-devel@lists.freedesktop.org,
        Vandita Kulkarni <vandita.kulkarni@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arun R Murthy <arun.r.murthy@intel.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Liu Shixin <liushixin2@huawei.com>,
        linux-samsung-soc@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>,
        Matt Roper <matthew.d.roper@intel.com>,
        Wenjing Liu <wenjing.liu@amd.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        spice-devel@lists.freedesktop.org,
        Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
        linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
        Tim Huang <Tim.Huang@amd.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Yifan Zhang <yifan1.zhang@amd.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
        Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Zack Rusin <zackr@vmware.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
        =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
        virtualization@lists.linux-foundation.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Fei Yang <fei.yang@intel.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        David Lechner <david@lechnology.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        David Francis <David.Francis@amd.com>,
        Aaron Liu <aaron.liu@amd.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-rockchip@lists.infradead.org,
        Fangzhi Zuo <jerry.zuo@amd.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        VMware Graphics Reviewers 
        <linux-graphics-maintainer@vmware.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
        Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org,
        Animesh Manna <animesh.manna@intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Swati Sharma <swati2.sharma@intel.com>,
        John Stultz <jstultz@google.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Drew Davenport <ddavenport@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Anusha Srivatsa <anusha.srivatsa@intel.com>,
        Dan Carpenter <error27@gmail.com>,
        Karol Herbst <kherbst@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Melissa Wen <melissa.srw@gmail.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
        Luca Coelho <luciano.coelho@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alan Liu <haoping.liu@amd.com>,
        Philip Yang <Philip.Yang@amd.com>,
        Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
        Alison Wang <alison.wang@nxp.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Gustavo Sousa <gustavo.sousa@intel.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Khaled Almahallawy <khaled.almahallawy@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Imre Deak <imre.deak@intel.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Roman Li <roman.li@amd.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Clark <robdclark@gmail.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Russell King <linux@armlinux.org.uk>,
        Leo Li <sunpeng.li@amd.com>,
        Uma Shankar <uma.shankar@intel.com>,
        Mika Kahola <mika.kahola@intel.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Vinod Govindapillai <vinod.govindapillai@intel.com>,
        linux-tegra@vger.kernel.org,
        Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Melissa Wen <mwen@igalia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-mediatek@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        David Tadokoro <davidbtadokoro@usp.br>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        amd-gfx@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Message-ID: <a7h7uovevwdsuuwdqh7g36qgfyq3bt5sx3eba2npyduoyu2icc@pwygetstxdp3>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <o3dc4q27ap6rajsvpfwfvs3z3afekkwbhnclvswkaietciy2kc@unjf67gz5tur>
 <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jyn7gwdek3zlokhs"
Content-Disposition: inline
In-Reply-To: <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jyn7gwdek3zlokhs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 03:38:03PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Maxime,
>=20
> On Wed, Jul 12, 2023 at 02:52:38PM +0200, Maxime Ripard wrote:
> > On Wed, Jul 12, 2023 at 01:02:53PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > Background is that this makes merge conflicts easier to handle and =
detect.
> > >=20
> > > Really?
> >=20
> > FWIW, I agree with Christian here.
> >=20
> > > Each file (apart from include/drm/drm_crtc.h) is only touched once. So
> > > unless I'm missing something you don't get less or easier conflicts by
> > > doing it all in a single patch. But you gain the freedom to drop a
> > > patch for one driver without having to drop the rest with it.
> >=20
> > Not really, because the last patch removed the union anyway. So you have
> > to revert both the last patch, plus that driver one. And then you need
> > to add a TODO to remove that union eventually.
>=20
> Yes, with a single patch you have only one revert (but 194 files changed,
> 1264 insertions(+), 1296 deletions(-)) instead of two (one of them: 1
> file changed, 9 insertions(+), 1 deletion(-); the other maybe a bit
> bigger). (And maybe you get away with just reverting the last patch.)
>=20
> With a single patch the TODO after a revert is "redo it all again (and
> prepare for a different set of conflicts)" while with the split series
> it's only "fix that one driver that was forgotten/borked" + reapply that
> 10 line patch. As the one who gets that TODO, I prefer the latter.
>=20
> So in sum: If your metric is "small count of reverted commits", you're
> right. If however your metric is: Better get 95% of this series' change
> in than maybe 0%, the split series is the way to do it.

I guess that's where we disagree: I don't see the point of having 95% of
it, either 0 or 100.

> With me having spend ~3h on this series' changes, it's maybe
> understandable that I did it the way I did.

I'm sorry, but that's never been an argument? I'm sure you and I both
have had series that took much longer dropped because it wasn't the
right approach.

> FTR: This series was created on top of v6.5-rc1. If you apply it to
> drm-misc-next you get a (trivial) conflict in patch #2. If I consider to
> be the responsible maintainer who applies this series, I like being able
> to just do git am --skip then.=20

Or we can ask that the driver is based on drm-misc-next ...

> FTR#2: In drm-misc-next is a new driver
> (drivers/gpu/drm/loongson/lsdc_crtc.c) so skipping the last patch for
> now might indeed be a good idea.

=2E.. which is going to fix that one too.

Maxime

--jyn7gwdek3zlokhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZK6wPAAKCRDj7w1vZxhR
xY/cAP9MfcZQUQhgCUm7SZclTdLuVOlNrClVj1izsCv4zrFrtQD+JUUX9b9K3JdO
tDqchM2qQCmIMTRzt6ZwyV0l4KQkjgM=
=G8dy
-----END PGP SIGNATURE-----

--jyn7gwdek3zlokhs--
