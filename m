Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7166E68D407
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Feb 2023 11:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjBGKZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Feb 2023 05:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjBGKZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 05:25:44 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5B616AF7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Feb 2023 02:25:42 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5f4c:1e23:9c34:1a39])
        by baptiste.telenet-ops.be with bizsmtp
        id JARZ2900N3XDBUl01ARZZ0; Tue, 07 Feb 2023 11:25:40 +0100
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pPLAL-008G9Y-KD;
        Tue, 07 Feb 2023 11:25:33 +0100
Date:   Tue, 7 Feb 2023 11:25:33 +0100 (CET)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        intel-gfx@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        freedreno@lists.freedesktop.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/probe_helper: sort out poll_running
 vs poll_enabled
In-Reply-To: <20230124104548.3234554-2-dmitry.baryshkov@linaro.org>
Message-ID: <1b391ff-5675-fb41-ae53-436e5693a1ce@linux-m68k.org>
References: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org> <20230124104548.3234554-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 	Hi Dmitry,

On Tue, 24 Jan 2023, Dmitry Baryshkov wrote:
> There are two flags attemting to guard connector polling:
> poll_enabled and poll_running. While poll_enabled semantics is clearly
> defined and fully adhered (mark that drm_kms_helper_poll_init() was
> called and not finalized by the _fini() call), the poll_running flag
> doesn't have such clearliness.
>
> This flag is used only in drm_helper_probe_single_connector_modes() to
> guard calling of drm_kms_helper_poll_enable, it doesn't guard the
> drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
> is actually running. Tie HPD enablement to this flag.
>
> This fixes the following warning reported after merging the HPD series:
>
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
> drm_bridge_hpd_enable+0x94/0x9c [drm]
> drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
> drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
> drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
> drm_client_modeset_probe+0x204/0x1190 [drm]
> __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
> drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
> drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
> drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
> dcss_kms_attach+0x1c8/0x254 [imx_dcss]
> dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
> platform_probe+0x70/0xcc
> really_probe+0xc4/0x2e0
> __driver_probe_device+0x80/0xf0
> driver_probe_device+0xe0/0x164
> __device_attach_driver+0xc0/0x13c
> bus_for_each_drv+0x84/0xe0
> __device_attach+0xa4/0x1a0
> device_initial_probe+0x1c/0x30
> bus_probe_device+0xa4/0xb0
> deferred_probe_work_func+0x90/0xd0
> process_one_work+0x200/0x474
> worker_thread+0x74/0x43c
> kthread+0xfc/0x110
> ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
>
> Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for your patch!
This gets rids of the warning splats on e.g. Renesas Koelsch and
Salvator-XS, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
