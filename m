Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB85078AEDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbjH1L3e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjH1L3R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:29:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF6EF4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:29:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90E004E6;
        Mon, 28 Aug 2023 13:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693222070;
        bh=Z2yGqZnWmLRCLstxt4PFV4RmzJjPF4lqtqgp9OWLgFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HAcQqvKrMafzD5Ty19d4NOXGtaVkvI6zyhMIVTdLrRoRPd35eTodKu2gM3QlEk02H
         n0MPGm6g1Q3exE/VCb/CiF3Ihb8awF/TK5yWyMJsyZaS3afCCye0srf7jNtVvI69ar
         HqaabJjg9rss8n/Ur6giJvmY67+N9wfpXMTNd4+c=
Date:   Mon, 28 Aug 2023 14:29:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Message-ID: <20230828112921.GJ14596@pendragon.ideasonboard.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
 <ZOyCLijP4fb6zxKn@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZOyCLijP4fb6zxKn@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 28, 2023 at 02:17:02PM +0300, Andy Shevchenko wrote:
> On Sat, Aug 26, 2023 at 08:19:01AM +0100, Biju Das wrote:
> > Having conditional around the of_node pointers turns out to make driver
> > code use ugly #ifdef and #if blocks. So drop the conditionals.
> 
> ...
> 
> > -#ifdef CONFIG_OF
> >  	/** @of_node: device node pointer to the bridge */
> >  	struct device_node *of_node;
> > -#endif
> 
> This simply has to be struct fwnode_handle to begin with.
> Can you convert the driver to use it?

While that's possibly a good idea, it will require touching all the
bridge drivers that set this field, so I think it could be done
separately.

-- 
Regards,

Laurent Pinchart
