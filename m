Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA949663DFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 11:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjAJKWb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 05:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjAJKWO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 05:22:14 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F0234D62;
        Tue, 10 Jan 2023 02:21:08 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id fd15so550358qtb.9;
        Tue, 10 Jan 2023 02:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jghbERpQa8h66cF2UcKYjlnX4opVcLNKuMaBVyHnhOM=;
        b=oGbDVwdrsss5G37w3qKbCQh/Z3t5eN7wxq0dpU0EcTKJTRYGEnKVsz4OT63XrkD5qB
         qfP15vlHIIe9tGdBlTvDH5CY3dUdUkGeRCJmoUapUikC7vlAKuYJrkwaH/3q+MovTq7x
         Wp3GNTF97aIy9uc2QQGdaUfqLrgoeEiJB6jbxbLKT5LQaf9AQ8iSv9Jf6D3LOLFaW6MG
         i6OrKs/mSFKV5B0G5qNx3spBz/RlL779VxsgYAZkTHZ+tVn6TgEXErbUxe2b8eHxFqVD
         9hb4rYNkndrzxC2dValnu5Ee7t1eq64zokukTu/M+HpitILdEnPBRkAxRCWK1Nujo1qG
         N1jQ==
X-Gm-Message-State: AFqh2kpoq0YAbdnk4edZSqY4PKCOGl3Fxeq9Ja93eRzrp8ZPPC0yMTYM
        fnXgo2xjvOe0jRsmjMcrB+GxogGiKiQpTA==
X-Google-Smtp-Source: AMrXdXu1RCaRDRqXZsaaYU6qsHQJEZiHkL0mAWulWUZzXYdJ4TYgtlxIDZYC+PsJe+NDWygB7wUTRw==
X-Received: by 2002:ac8:4e44:0:b0:3a9:8842:5854 with SMTP id e4-20020ac84e44000000b003a988425854mr126140493qtw.52.1673346067747;
        Tue, 10 Jan 2023 02:21:07 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id c8-20020ac86608000000b003a4f435e381sm5810489qtp.18.2023.01.10.02.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:21:07 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4c7d35b37e2so91607867b3.2;
        Tue, 10 Jan 2023 02:21:06 -0800 (PST)
X-Received: by 2002:a81:17d5:0:b0:480:fa10:459e with SMTP id
 204-20020a8117d5000000b00480fa10459emr3972208ywx.283.1673346065413; Tue, 10
 Jan 2023 02:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org> <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
In-Reply-To: <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Jan 2023 11:20:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQ_vAgc0zpzDeMfncsj4hwS=FveeAy4mwpTnwt3uOw8w@mail.gmail.com>
Message-ID: <CAMuHMdVQ_vAgc0zpzDeMfncsj4hwS=FveeAy4mwpTnwt3uOw8w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement automatically
To:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 10, 2023 at 8:07 AM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> > On 09/01/2023 18:21, Laurentiu Palcu wrote:
> > > It looks like there are some issues with this patchset... :/ I just
> > > fetched the drm-tip and, with these patches included, the "Hot plug
> > > detection already enabled" warning is back for i.MX DCSS.
> >
> > Could you please provide a backtrace?
>
> Sure, see below:
>
> ------------[ cut here ]------------
> Hot plug detection already enabled
> WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
> Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
> CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
> Hardware name: NXP i.MX8MQ EVK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
> lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
> sp : ffff800009ef3740
> x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
> x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
> x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
> x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
> x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
> x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
> x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
> x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
> x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
> Call trace:
>  drm_bridge_hpd_enable+0x94/0x9c [drm]
>  drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
>  drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
>  drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
>  drm_client_modeset_probe+0x204/0x1190 [drm]
>  __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
>  drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
>  drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
>  drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
>  dcss_kms_attach+0x1c8/0x254 [imx_dcss]
>  dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
>  platform_probe+0x70/0xcc
>  really_probe+0xc4/0x2e0
>  __driver_probe_device+0x80/0xf0
>  driver_probe_device+0xe0/0x164
>  __device_attach_driver+0xc0/0x13c
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0xa4/0x1a0
>  device_initial_probe+0x1c/0x30
>  bus_probe_device+0xa4/0xb0
>  deferred_probe_work_func+0x90/0xd0
>  process_one_work+0x200/0x474
>  worker_thread+0x74/0x43c
>  kthread+0xfc/0x110
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---

I get a similar trace on R-Car Gen2 (Koelsch with R-Car M2-W) and
Gen3 (Salvator-XS with R-Car H3 ES2.0), and bisected it to commit
92d755d8f13b6791 ("drm/bridge_connector: rely on drm_kms_helper_poll_*
for HPD enablement") in drm-misc/for-linux-next.

As I do not have any displays connected, I do not know what is the
full impact.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
