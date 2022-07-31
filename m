Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8107458606A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 20:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbiGaSun (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 14:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237648AbiGaSul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 14:50:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF96DF10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 11:50:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2B66415;
        Sun, 31 Jul 2022 20:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659293437;
        bh=2yGjLB/7zHIPdA4OW3N1Ke0sh5jsshbphs3ZdiL+sGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IgOFL3HzFyRY0kuj5oXGOdffEq10CgJhNU0Fmw1muY6y5W9v9THHfbZsVRQmlm1UC
         4bZaTpk2bJLzGtWx3FJVLB/IeIfKWmVJC/6vIfhkQYrUTTkunUXidjhtg/7nRPBCxB
         RzYHNNpAU8iz3EZCf9cYeB1E/NTODFDvLvMvnwnM=
Date:   Sun, 31 Jul 2022 21:50:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 3/3] tests: Add pixel blend mode test
Message-ID: <YubO+TZkrR8bz2DB@pendragon.ideasonboard.com>
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-4-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704025632.3911253-4-taki@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hayama-san,

Thank you for the patch.

On Mon, Jul 04, 2022 at 11:56:32AM +0900, Takanari Hayama wrote:
> Add a test that blends a plane with different pixel blend modes.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  tests/kms-test-plane-blendmode.py | 100 ++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100755 tests/kms-test-plane-blendmode.py
> 
> diff --git a/tests/kms-test-plane-blendmode.py b/tests/kms-test-plane-blendmode.py
> new file mode 100755
> index 000000000000..a9c009b74a8c
> --- /dev/null
> +++ b/tests/kms-test-plane-blendmode.py
> @@ -0,0 +1,100 @@
> +#!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Renesas Electronics Corporation
> +
> +import kmstest
> +import pykms
> +
> +class PlaneBlendModeTest(kmstest.KMSTest):
> +    """Test composition in different blend modes."""
> +
> +    def handle_page_flip(self, frame, time):
> +        self.logger.log('Page flip complete')
> +
> +    def find_pipeline(self):
> +        # Find a CRTC that has multiple planes with a connected connector
> +        for connector in self.output_connectors():
> +            # Skip disconnected connectors
> +            if not connector.connected():
> +                continue
> +
> +            # Add the connector to the map
> +            for crtc in connector.get_possible_crtcs():
> +                planes = []
> +                for plane in self.card.planes:
> +                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
> +                        planes.append(plane)
> +
> +                if len(planes):
> +                    return crtc, connector, planes
> +
> +        return None, None, None
> +
> +    def main(self):
> +        self.start('composition with blend modes')
> +
> +        crtc, connector, planes = self.find_pipeline()
> +        if crtc is None:
> +            self.skip('no suitable pipeline')
> +            return
> +
> +        # Get the default mode
> +        try:
> +            mode = connector.get_default_mode()
> +        except KeyError:
> +            self.skip('no mode available')
> +            return
> +
> +        self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
> +                        f'mode {mode.name} with {len(planes)} planes '
> +                        f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
> +
> +        # Create a primary plane

This only creates a framebuffer, not a plane, so I'd write

	# Create a frame buffer for the primary plane

and name the variable fb_primary.

> +        primary = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
> +        pykms.draw_test_pattern(primary)
> +        #pykms.draw_rect(primary, 0, 0, mode.hdisplay, mode.vdisplay, pykms.RGB(0, 0, 255))

This line can be dropped.

> +
> +        # Set the mode with a primary plane
> +        ret = self.atomic_crtc_mode_set(crtc, connector, mode, primary)
> +        if ret < 0:
> +            self.fail(f'atomic mode set failed with {ret}')
> +            return
> +
> +	# Create a overlay plane (half of the screen size)

Small indentation issue, this should use spaces instead of tabs. As
above, I'd write

	# Create a frame buffer for the overlay planes (half of the screen size)

and name the variable fb_overlay.

I would also create both frame buffers before setting the mode.

> +        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay // 2, mode.vdisplay, 'AR24')
> +        self.logger.log(f'Create fb: {fb} ({fb.width}x{fb.height})')
> +        width = mode.hdisplay // 4
> +        height = mode.vdisplay // 5
> +        for n in range(0, 5):
> +            v = 255 - 63 * n
> +            pykms.draw_rect(fb, 0, height * n, width, height, pykms.RGB(v, 255, 255, 255))
> +            pykms.draw_rect(fb, width, height * n, width, height, pykms.RGB(v, v, v, v))
> +
> +        self.run(3)
> +
> +        # Add all other planes one by one

You're only adding a second plane, so

        # Add the overlay plane, testing all blend modes sequentially

> +        source = kmstest.Rect(0, 0, fb.width, fb.height)
> +        destination = kmstest.Rect(fb.width, 0, fb.width, fb.height)
> +        alpha = '50%'
> +        for blendmode in ('Pre-multiplied', 'Coverage', 'None'):
> +            pykms.draw_text(fb, 10, 10, f'alpha={alpha}, mode={blendmode}          ', pykms.white)
> +            ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, alpha=alpha, blendmode=blendmode)

A bit of line wrap would be nice.

I'll fix thse small issues when applying the patches.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +            if ret < 0:
> +                self.fail(f'atomic plane set failed with {ret}')
> +                break
> +
> +            self.logger.log(f'Adding plane {planes[1].id} with blendmode {blendmode}')
> +            self.run(1)
> +
> +            if self.flips == 0:
> +                self.fail('No page flip registered')
> +                break
> +
> +            self.run(3)
> +
> +        else:
> +            self.success()
> +
> +        self.atomic_crtc_disable(crtc)
> +
> +PlaneBlendModeTest().execute()

-- 
Regards,

Laurent Pinchart
