Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 565DE5604EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiF2PwQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbiF2PwP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:52:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C2623BCE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:52:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F24AC3D7;
        Wed, 29 Jun 2022 17:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517933;
        bh=mp2v77uPy+m1GPYYl1D/DbSNfP05c84u/xgC1xMjd2U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jQjEg5c5q0Zr0VxT370Ucg8g/WOFwpkiSvkh7Uad9Ga/Welcu5n5LfwZbzV0JcU0U
         QIBsjUse8u6ALEVYE8KbfcMCAcMcqtKBI/10etR79EAqjpdIGzxaEKKBF1/uZ1BxG6
         r6xD6ACWZEfnPg8U4BxIxD9qAMX++xZvn1820Q3M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-10-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-10-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 09/10] tests: Add plane zpos test
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:52:10 +0100
Message-ID: <165651793098.2049236.2538448937224001374@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:30)
> Add a test that enables multiple planes with different zpos values.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kms-test-plane-zpos.py | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100755 tests/kms-test-plane-zpos.py
>=20
> diff --git a/tests/kms-test-plane-zpos.py b/tests/kms-test-plane-zpos.py
> new file mode 100755
> index 000000000000..052eea542ec0
> --- /dev/null
> +++ b/tests/kms-test-plane-zpos.py
> @@ -0,0 +1,102 @@
> +#!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Renesas Electronics Corporation
> +
> +import kmstest
> +import pykms
> +
> +class PlaneZPosTest(kmstest.KMSTest):
> +    """Test composition with multiple planes and custom z-pos."""
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
> +                planes =3D []
> +                for plane in self.card.planes:
> +                    if plane.supports_crtc(crtc) and plane !=3D crtc.pri=
mary_plane:
> +                        planes.append(plane)
> +
> +                if len(planes):
> +                    return crtc, connector, planes
> +
> +        return None, None, None
> +
> +    def main(self):
> +        self.start('composition with z-pos control')
> +
> +        crtc, connector, planes =3D self.find_pipeline()
> +        if crtc is None:
> +            self.skip('no suitable pipeline')
> +            return
> +
> +        # Get the default mode
> +        try:
> +            mode =3D connector.get_default_mode()
> +        except KeyError:
> +            self.skip('no mode available')
> +            return
> +
> +        self.logger.log(f'Testing connector {connector.fullname}, CRTC {=
crtc.id}, '
> +                        f'mode {mode.name} with {len(planes)} planes '
> +                        f'(P: {crtc.primary_plane.id}, O: {[plane.id for=
 plane in planes]})')
> +
> +        # Create a frame buffer
> +        fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdis=
play, 'XR24')
> +        pykms.draw_test_pattern(fb)
> +
> +        # Set the mode with a primary plane, and position it on top of t=
he
> +        # stack. Make it transparent to visualize the overlay planes tha=
t will

How handy that there's now transparency ;-)

> +        # be positioned underneath.
> +        zpos =3D len(planes)
> +        ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
> +        if ret < 0:
> +            self.fail(f'atomic mode set failed with {ret}')
> +            return
> +
> +        req =3D kmstest.AtomicRequest(self)
> +        req.add(crtc.primary_plane, 'alpha', '50%')
> +        req.add(crtc.primary_plane, 'zpos', zpos)

Not that it matters, but those could both be added in a single statement
right?

(not needed, just understanding the API of .add() )


> +        ret =3D req.commit_sync(True)
> +        if ret < 0:
> +            self.fail(f'failed to set properties for primary plane: {ret=
}')
> +            return
> +
> +        self.run(3)
> +
> +        # Add all other planes one by one
> +        offset =3D 100 + 50 * (len(planes) - 1)
> +
> +        for plane in planes:
> +            zpos -=3D 1
> +
> +            source =3D kmstest.Rect(0, 0, fb.width, fb.height)
> +            destination =3D kmstest.Rect(offset, offset, fb.width, fb.he=
ight)
> +            ret =3D self.atomic_plane_set(plane, crtc, source, destinati=
on, fb, alpha=3D'100%', zpos=3Dzpos)

Seems pretty good to me.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +            if ret < 0:
> +                self.fail(f'atomic plane set failed with {ret}')
> +                break
> +
> +            self.logger.log(f'Adding plane {plane.id}')
> +            self.run(1)
> +
> +            if self.flips =3D=3D 0:
> +                self.fail('No page flip registered')
> +                break
> +
> +            offset -=3D 50
> +
> +        else:
> +            self.success()
> +
> +        self.atomic_crtc_disable(crtc)
> +
> +PlaneZPosTest().execute()
> --=20
> Regards,
>=20
> Laurent Pinchart
>
