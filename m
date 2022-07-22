Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF13D57E7D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jul 2022 22:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236747AbiGVUCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 16:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236761AbiGVUCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 16:02:24 -0400
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381A189A41
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=xRZ4/z785EVlZdg7+WQthXzuMmkFNeanc7s/O0nKQN8=;
        b=qHRnf0cWUkHUo+oOjjmqY2CD+N2Xd/aTesvn+UussxpUPFdXjCF9fOgGj3mwQjSWplF0zc7ThQ4QS
         q+CDUxWRgL01r5cw6a/e2AWnojcA9dA9TSMWqDI2ctJkRhv3ft6rUvUOwgVQH6fg4MhLsiwyFnKJtL
         y5ACwnTDvnN++7H51uojOwg/RnnfWv0fEy1vOHA8r4xT7+dCRRW2jUREY9U9R2W5gsqywDo6gOd34G
         t5AXsX5P+PuhEY1/570GeAJ0tJPLk5BzbDHshyHrfroDvCyhZBsOItg0QYYunoWb8MfMQ/F4S7cTfA
         npUKmwvyA7cE3Gi2RUCzoRIyn7M9lMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=xRZ4/z785EVlZdg7+WQthXzuMmkFNeanc7s/O0nKQN8=;
        b=ukD19qP7MQupFGaMbV2BqB6YugANbp+p5md4cXvFsmYwtH8Ehi/f/slFQ9ODoUIyBkP6vBSUA66US
         KyIh1MxBw==
X-HalOne-Cookie: 0e5c75ced090ed261a75055ef99751c50559f04c
X-HalOne-ID: 1760f781-09f9-11ed-a918-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 1760f781-09f9-11ed-a918-d0431ea8a290;
        Fri, 22 Jul 2022 20:01:36 +0000 (UTC)
Date:   Fri, 22 Jul 2022 22:01:34 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <YtsCHnJKfGvkJXpD@ravnborg.org>
References: <20220722191924.544869-1-biju.das.jz@bp.renesas.com>
 <20220722191924.544869-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722191924.544869-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

driver looks good - you can add my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>


I have one general question - that is not related to this driver, but is
directed to the bridge people on this mail.

> +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_bridge_state)
> +{
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;

It is relative often we see the need to access the new crtc_state in
the atomic_enable() operation. Could we add it as a parameter to
atomic_enable() and fish it out in the caller?
That would save some boilerplate code.

I once had a helper cooked up for the above and could dig it up
again - but the parameter idea seems better?!?

	Sam
