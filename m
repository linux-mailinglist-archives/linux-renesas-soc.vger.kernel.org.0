Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE8A5608B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 20:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiF2SIb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 14:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiF2SI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 14:08:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9808C11A28
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:08:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD3C33D7;
        Wed, 29 Jun 2022 20:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656526107;
        bh=AG4hZp5mWe+uR+MDkUIANs8MbtlW+Ma1uD0DvzFcbXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KfIgvMFWLz3WiFpcrlNoGzMy80jy1ewdFhyo9mOWlhw9fVqZ/D9gNIfC+i7WvHb8L
         /QTLdYDXQtHPMQeF+XEHiSlm/93pCMYxk6eXWrCZzJAe0e/oGCqfj5aUealWVG6iIV
         kzx2ucuDj4U/k/qAYnxi76o2CgiYNhBvEZNgRbV0=
Date:   Wed, 29 Jun 2022 21:08:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [kms-test] [PATCH 09/10] tests: Add plane zpos test
Message-ID: <YryVBwNB5tS3JKog@pendragon.ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
 <20220609234031.14803-10-laurent.pinchart@ideasonboard.com>
 <165651793098.2049236.2538448937224001374@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165651793098.2049236.2538448937224001374@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 29, 2022 at 04:52:10PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-06-10 00:40:30)
> > Add a test that enables multiple planes with different zpos values.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  tests/kms-test-plane-zpos.py | 102 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100755 tests/kms-test-plane-zpos.py
> > 
> > diff --git a/tests/kms-test-plane-zpos.py b/tests/kms-test-plane-zpos.py
> > new file mode 100755
> > index 000000000000..052eea542ec0
> > --- /dev/null
> > +++ b/tests/kms-test-plane-zpos.py
> > @@ -0,0 +1,102 @@
> > +#!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Renesas Electronics Corporation
> > +
> > +import kmstest
> > +import pykms
> > +
> > +class PlaneZPosTest(kmstest.KMSTest):
> > +    """Test composition with multiple planes and custom z-pos."""
> > +
> > +    def handle_page_flip(self, frame, time):
> > +        self.logger.log('Page flip complete')
> > +
> > +    def find_pipeline(self):
> > +        # Find a CRTC that has multiple planes with a connected connector
> > +        for connector in self.output_connectors():
> > +            # Skip disconnected connectors
> > +            if not connector.connected():
> > +                continue
> > +
> > +            # Add the connector to the map
> > +            for crtc in connector.get_possible_crtcs():
> > +                planes = []
> > +                for plane in self.card.planes:
> > +                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
> > +                        planes.append(plane)
> > +
> > +                if len(planes):
> > +                    return crtc, connector, planes
> > +
> > +        return None, None, None
> > +
> > +    def main(self):
> > +        self.start('composition with z-pos control')
> > +
> > +        crtc, connector, planes = self.find_pipeline()
> > +        if crtc is None:
> > +            self.skip('no suitable pipeline')
> > +            return
> > +
> > +        # Get the default mode
> > +        try:
> > +            mode = connector.get_default_mode()
> > +        except KeyError:
> > +            self.skip('no mode available')
> > +            return
> > +
> > +        self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
> > +                        f'mode {mode.name} with {len(planes)} planes '
> > +                        f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
> > +
> > +        # Create a frame buffer
> > +        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
> > +        pykms.draw_test_pattern(fb)
> > +
> > +        # Set the mode with a primary plane, and position it on top of the
> > +        # stack. Make it transparent to visualize the overlay planes that will
> 
> How handy that there's now transparency ;-)
> 
> > +        # be positioned underneath.
> > +        zpos = len(planes)
> > +        ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
> > +        if ret < 0:
> > +            self.fail(f'atomic mode set failed with {ret}')
> > +            return
> > +
> > +        req = kmstest.AtomicRequest(self)
> > +        req.add(crtc.primary_plane, 'alpha', '50%')
> > +        req.add(crtc.primary_plane, 'zpos', zpos)
> 
> Not that it matters, but those could both be added in a single statement
> right?

Yes, that's right.

> (not needed, just understanding the API of .add() )
> 
> > +        ret = req.commit_sync(True)
> > +        if ret < 0:
> > +            self.fail(f'failed to set properties for primary plane: {ret}')
> > +            return
> > +
> > +        self.run(3)
> > +
> > +        # Add all other planes one by one
> > +        offset = 100 + 50 * (len(planes) - 1)
> > +
> > +        for plane in planes:
> > +            zpos -= 1
> > +
> > +            source = kmstest.Rect(0, 0, fb.width, fb.height)
> > +            destination = kmstest.Rect(offset, offset, fb.width, fb.height)
> > +            ret = self.atomic_plane_set(plane, crtc, source, destination, fb, alpha='100%', zpos=zpos)
> 
> Seems pretty good to me.
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> > +            if ret < 0:
> > +                self.fail(f'atomic plane set failed with {ret}')
> > +                break
> > +
> > +            self.logger.log(f'Adding plane {plane.id}')
> > +            self.run(1)
> > +
> > +            if self.flips == 0:
> > +                self.fail('No page flip registered')
> > +                break
> > +
> > +            offset -= 50
> > +
> > +        else:
> > +            self.success()
> > +
> > +        self.atomic_crtc_disable(crtc)
> > +
> > +PlaneZPosTest().execute()

-- 
Regards,

Laurent Pinchart
