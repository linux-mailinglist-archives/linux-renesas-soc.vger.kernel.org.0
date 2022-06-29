Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3FC5604E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbiF2PsU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbiF2PsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:48:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0A612096
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:48:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8379F3D7;
        Wed, 29 Jun 2022 17:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517696;
        bh=o30DqtEy0yZY34DgRb7TRpFKHO19YcAqAvW0uzj8pNA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dnw8hvgXILKKYxTz8cMhnVjq21ozU+4En4UPT2fUHe4EjTDxdIuzMf1fjO5h2RUJn
         S0Oy1ggZg3QBJ647GBpssTYV93lw5qJOaw17QvbkAORT20XwH+b9ilrmBCY2AVdLvR
         Buy7oq5Dg61PZDeMYFoKy3tWuV7AqlCAnXWQo7U4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-8-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-8-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 07/10] tests: Add plane alpha test
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:48:13 +0100
Message-ID: <165651769367.2049236.8755466287514105816@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:28)
> Add a test that enables multiple planes with different alpha values.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kms-test-plane-alpha.py | 97 +++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100755 tests/kms-test-plane-alpha.py
>=20
> diff --git a/tests/kms-test-plane-alpha.py b/tests/kms-test-plane-alpha.py
> new file mode 100755
> index 000000000000..8802bfeae40c
> --- /dev/null
> +++ b/tests/kms-test-plane-alpha.py
> @@ -0,0 +1,97 @@
> +#!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Renesas Electronics Corporation
> +
> +import kmstest
> +import pykms
> +
> +class PlaneAlphaTest(kmstest.KMSTest):
> +    """Test composition with multiple planes and alpha channels."""
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
> +        self.start('composition with alpha control')
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
> +        # Set the mode with a primary plane
> +        ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
> +        if ret < 0:
> +            self.fail(f'atomic mode set failed with {ret}')
> +            return
> +
> +        req =3D kmstest.AtomicRequest(self)
> +        req.add(crtc.primary_plane, 'alpha', '50%')

Nice. That's better than having to identify the range and set it
explicitly.


> +        ret =3D req.commit_sync(True)
> +        if ret < 0:
> +            self.fail(f'failed to set alpha for primary plane: {ret}')
> +            return
> +
> +        self.run(3)
> +
> +        # Add all other planes one by one
> +        alpha =3D 20
> +        offset =3D 100
> +        for plane in planes:
> +            source =3D kmstest.Rect(0, 0, fb.width, fb.height)
> +            destination =3D kmstest.Rect(offset, offset, fb.width, fb.he=
ight)
> +            ret =3D self.atomic_plane_set(plane, crtc, source, destinati=
on, fb, alpha=3Df'{alpha}%')
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
> +            alpha =3D min(alpha + 20, 100)

Curious to see this. I'll have to spin up a board and display.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +            offset +=3D 50
> +
> +        else:
> +            self.success()
> +
> +        self.atomic_crtc_disable(crtc)
> +
> +PlaneAlphaTest().execute()
> --=20
> Regards,
>=20
> Laurent Pinchart
>
