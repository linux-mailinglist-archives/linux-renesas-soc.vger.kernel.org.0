Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7697CA3B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 11:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbjJPJNV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 05:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbjJPJNQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 05:13:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4509FF9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:13:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C8FC433CB;
        Mon, 16 Oct 2023 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697447587;
        bh=j761xarSLCNPEyfkRFS6qQSw7YrKA9macjPqSUOVD7I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n16rmH6n2lZkMK6AFtZKJxaYnArQ5Zw8uPeXgKhU/IKNFBGe03FI+7cws4IcAu1KN
         BZUdeDeGMG5O1YiOCARf3vwbjMr2LBjuJqPD+lciNNErClmkfIefHzV/NU70we0zs6
         QmK4jCLZk0zqD+PU5V43JKyRbxvASdRQSGZ8sSv/s4MCDKql8I6Frx/ibfW7dCwwD0
         MwEHr3SAFx615qbWfv8NOxsP5K2lamZKCuFknyVcxkPDOiRWOPDiMXR4UOTcKIfQHU
         nsnDRuuxzG2H70RCSNuYH09+eamIlhtRqDHleeGBLm+WqzPTZOdM+nEUQvw29pq4Et
         YJVDKfn2fSXRA==
From:   Robert Foss <rfoss@kernel.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@gmail.com>
Cc:     Robert Foss <rfoss@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Adam Ford <aford173@gmail.com>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2 0/8] ADV7511 driver enhancements
Date:   Mon, 16 Oct 2023 11:12:57 +0200
Message-ID: <169744753889.562442.4612949090009224880.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Aug 2023 15:23:50 +0100, Biju Das wrote:
> This patch series aims to improve ADV7511 driver by adding
> feature bits and data instead of comparing enum adv7511_type for
> various hardware differences between ADV7511, ADV7533 and ADV7535.
> 
> This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
> ADV7535.
> 
> [...]

I aplogize for the delay in merging this very neat series.

Applied, thanks!

[1/8] drm: adv7511: Add struct adv7511_chip_info and use i2c_get_match_data()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=19e77c7aef57
[2/8] drm: adv7511: Add max_mode_clock_khz variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=11ae4e406dd9
[3/8] drm: adv7511: Add max_lane_freq_khz variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=399562fc02d8
[4/8] drm: adv7511: Add supply_names and num_supplies variables to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ac196fb9a17
[5/8] drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8d6cf5719011
[6/8] drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c75551214858
[7/8] drm: adv7511: Add link_config variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7618aa3ab38e
[8/8] drm: adv7511: Add hpd_override_enable variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e12c4703cec0



Rob

