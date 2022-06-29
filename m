Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B36560490
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbiF2P26 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiF2P26 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:28:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BF621E3C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:28:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 176263D7;
        Wed, 29 Jun 2022 17:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656516531;
        bh=VOTiSg/4g5uP9/u4ODoikAhjDbsR/UCFM9dT6iLZQII=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cuYxyJLWSOATUJxoIqyNMwO62s85Xgkk0n3gEhr8jQBWaVQZwagXMsVh8HWdMgSSu
         hkuuNR/nAM8Id8No4h3NvK5qe3gNDQwKhRSCinHY1eJeRROAePR9tInKFQrTjOR6qN
         r5P+F9nohYOSAA2fAz8uu6b1MPM4kn03NCuDhl1s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-3-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-3-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 02/10] tests: Convert to formatted string literals
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:28:48 +0100
Message-ID: <165651652832.2049236.15788789561247682133@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:23)
> Use formatted string literals to replace legacy printf-style string
> formatting.
>=20

This is nice. Putting the parameter directly in the place makes it much
easier to parse.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kms-test-allplanes.py      | 12 ++++++------
>  tests/kms-test-brxalloc.py       | 28 +++++++++++++---------------
>  tests/kms-test-connectors.py     |  2 +-
>  tests/kms-test-crc.py            | 21 ++++++++++-----------
>  tests/kms-test-formats.py        | 10 +++++-----
>  tests/kms-test-legacy-modeset.py | 10 +++++-----
>  tests/kms-test-modes.py          |  8 ++++----
>  tests/kms-test-modeset.py        |  8 ++++----
>  tests/kms-test-pageflip.py       | 18 +++++++++---------
>  tests/kms-test-planeposition.py  | 16 ++++++++--------
>  tests/kms-test-routing.py        | 10 +++++-----
>  tests/kmstest.py                 | 30 +++++++++++++++---------------
>  12 files changed, 85 insertions(+), 88 deletions(-)
>=20
> diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
> index 710ae660f0ff..0fe6cfab0a2d 100755
> --- a/tests/kms-test-allplanes.py
> +++ b/tests/kms-test-allplanes.py
> @@ -25,7 +25,7 @@ class AllPlanesTest(kmstest.KMSTest):
>                      connectors[crtc] =3D connector
> =20
>          for crtc in self.card.crtcs:
> -            self.start('composition on CRTC %u' % crtc.id)
> +            self.start(f'composition on CRTC {crtc.id}')
> =20
>              # Get the connector and default mode
>              try:
> @@ -45,8 +45,8 @@ class AllPlanesTest(kmstest.KMSTest):
>                  self.skip('no plane available for CRTC')
>                  continue
> =20
> -            self.logger.log('Testing connector %s, CRTC %u, mode %s with=
 %u planes' % \
> -                  (connector.fullname, crtc.id, mode.name, len(planes)))
> +            self.logger.log(f'Testing connector {connector.fullname}, CR=
TC {crtc.id}, '
> +                            f'mode {mode.name} with {len(planes)} planes=
')
> =20
>              # Create a frame buffer
>              fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.=
vdisplay, 'XR24')
> @@ -55,7 +55,7 @@ class AllPlanesTest(kmstest.KMSTest):
>              # Set the mode with a primary plane
>              ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>              if ret < 0:
> -                self.fail('atomic mode set failed with %d' % ret)
> +                self.fail(f'atomic mode set failed with {ret}')
>                  continue
> =20
>              self.run(3)
> @@ -67,10 +67,10 @@ class AllPlanesTest(kmstest.KMSTest):
>                  destination =3D kmstest.Rect(offset, offset, fb.width, f=
b.height)
>                  ret =3D self.atomic_plane_set(plane, crtc, source, desti=
nation, fb)
>                  if ret < 0:
> -                    self.fail('atomic plane set failed with %d' % ret)
> +                    self.fail(f'atomic plane set failed with {ret}')
>                      break
> =20
> -                self.logger.log('Adding plane %u' % plane.id)
> +                self.logger.log(f'Adding plane {plane.id}')
>                  self.run(1)
> =20
>                  if self.flips =3D=3D 0:
> diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
> index af6dd49f5c59..7170ee6c7708 100755
> --- a/tests/kms-test-brxalloc.py
> +++ b/tests/kms-test-brxalloc.py
> @@ -38,12 +38,11 @@ class BRxAllocTest(kmstest.KMSTest):
>          # Verify that the two CRTCs share the same planes
>          planes =3D outputs[0].crtc.possible_planes
>          if planes !=3D outputs[1].crtc.possible_planes:
> -            self.skip('Planes differ for CRTCs %u and %u' % \
> -                      (outputs[0].crtc.id, outputs[1].crtc.id))
> +            self.skip(f'Planes differ for CRTCs {outputs[0].crtc.id} and=
 {outputs[1].crtc.id}')
>              return
> =20
> -        self.logger.log('Found %u planes for CRTCs %u and %u' % \
> -                        (len(planes), outputs[0].crtc.id, outputs[1].crt=
c.id))
> +        self.logger.log(f'Found {len(planes)} planes for CRTCs {outputs[=
0].crtc.id} '
> +                        f'and {outputs[1].crtc.id}')
> =20
>          # Get one connector for each CRTC
>          for connector in self.output_connectors():
> @@ -58,12 +57,12 @@ class BRxAllocTest(kmstest.KMSTest):
>                      outputs[1].connector =3D connector
> =20
>          if not outputs[0].connector or not outputs[1].connector:
> -            self.skip('No connected connectors for CRTCs %u and %u ' % \
> -                      (outputs[0].crtc.id, outputs[1].crtc.id))
> +            self.skip(f'No connected connectors for CRTCs {outputs[0].cr=
tc.id} '
> +                      f'and {outputs[1].crtc.id}')
>              return
> =20
> -        self.start('Moving %u planes from %s to %s' % \
> -                   (len(planes), outputs[0].connector.fullname, outputs[=
1].connector.fullname))
> +        self.start(f'Moving {len(planes)} planes from {outputs[0].connec=
tor.fullname} '
> +                   f'to {outputs[0].connector.fullname}')
> =20
>          # Set the initial mode for both outputs and wait 5s for the moni=
tors to
>          # wake up.
> @@ -76,8 +75,7 @@ class BRxAllocTest(kmstest.KMSTest):
>              # Set the mode with no plane
>              ret =3D self.atomic_crtc_mode_set(output.crtc, output.connec=
tor, mode, sync=3DTrue)
>              if ret < 0:
> -                self.fail('atomic mode set on %s failed with %d' % \
> -                          (output.connector.fullname, ret))
> +                self.fail(f'atomic mode set on {output.connector.fullnam=
e} failed with {ret}')
>                  return
> =20
>          self.logger.log('Initial atomic mode set completed')
> @@ -88,13 +86,13 @@ class BRxAllocTest(kmstest.KMSTest):
>          output =3D outputs[0]
> =20
>          for plane in planes:
> -            self.logger.log('Adding plane %u to %s' % (plane.id, output.=
connector.fullname))
> +            self.logger.log(f'Adding plane {plane.id} to {output.connect=
or.fullname}')
> =20
>              source =3D kmstest.Rect(0, 0, output.fb.width, output.fb.hei=
ght)
>              destination =3D kmstest.Rect(offset, offset, output.fb.width=
, output.fb.height)
>              ret =3D self.atomic_plane_set(plane, output.crtc, source, de=
stination, output.fb, sync=3DTrue)
>              if ret < 0:
> -                self.fail('atomic plane set failed with %d' % ret)
> +                self.fail(f'atomic plane set failed with {ret}')
>                  return
> =20
>              offset +=3D 50
> @@ -106,20 +104,20 @@ class BRxAllocTest(kmstest.KMSTest):
>          output =3D outputs[1]
> =20
>          for plane in planes:
> -            self.logger.log('Moving plane %u to %s' % (plane.id, output.=
connector.fullname))
> +            self.logger.log(f'Moving plane {plane.id} to {output.connect=
or.fullname}')
> =20
>              # Switching CRTC directly is not supported by DRM, start by
>              # disabling the plane.
>              ret =3D self.atomic_plane_disable(plane)
>              if ret < 0:
> -                self.fail('atomic plane disable failed with %d' % ret)
> +                self.fail(f'atomic plane disable failed with {ret}')
>                  return
> =20
>              source =3D kmstest.Rect(0, 0, output.fb.width, output.fb.hei=
ght)
>              destination =3D kmstest.Rect(offset, offset, output.fb.width=
, output.fb.height)
>              ret =3D self.atomic_plane_set(plane, output.crtc, source, de=
stination, output.fb)
>              if ret < 0:
> -                self.fail('atomic plane set failed with %d' % ret)
> +                self.fail(f'atomic plane set failed with {ret}')
>                  return
> =20
>              self.run(1)
> diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
> index 54cc89ff308e..d2ca636eb2a0 100755
> --- a/tests/kms-test-connectors.py
> +++ b/tests/kms-test-connectors.py
> @@ -10,7 +10,7 @@ class ConnectorsTest(kmstest.KMSTest):
> =20
>      def main(self):
>          for connector in self.card.connectors:
> -            self.start('connector %s' % connector.fullname)
> +            self.start(f'connector {connector.fullname}')
> =20
>              # Every connector should have at least one suitable CRTC
>              crtcs =3D connector.get_possible_crtcs()
> diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
> index 5b8a679ffadc..efb3cf0dbe41 100755
> --- a/tests/kms-test-crc.py
> +++ b/tests/kms-test-crc.py
> @@ -121,7 +121,7 @@ class CRCTest(kmstest.KMSTest):
>                      connectors[crtc] =3D connector
> =20
>          for crtc in self.card.crtcs:
> -            self.start('CRC calculation on CRTC %u' % crtc.id)
> +            self.start(f'CRC calculation on CRTC {crtc.id}')
> =20
>              # Get the connector and default mode
>              try:
> @@ -141,8 +141,8 @@ class CRCTest(kmstest.KMSTest):
>                  self.skip('no plane available for CRTC')
>                  continue
> =20
> -            self.logger.log('Testing connector %s, CRTC %u, mode %s with=
 %u planes' % \
> -                  (connector.fullname, crtc.id, mode.name, len(planes)))
> +            self.logger.log(f'Testing connector {connector.fullname}, CR=
TC {crtc.id}, '
> +                            f'mode {mode.name} with {len(planes)} planes=
')
> =20
>              # Create a frame buffer and draw a test pattern.
>              fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.=
vdisplay, 'XR24')
> @@ -154,7 +154,7 @@ class CRCTest(kmstest.KMSTest):
>              # Set the mode and add all planes
>              ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, syn=
c=3DTrue)
>              if ret < 0:
> -                self.fail('atomic mode set failed with %d' % ret)
> +                self.fail(f'atomic mode set failed with {ret}')
>                  continue
> =20
>              req =3D kmstest.AtomicRequest(self)
> @@ -177,7 +177,7 @@ class CRCTest(kmstest.KMSTest):
> =20
>              ret =3D req.commit(0)
>              if ret < 0:
> -                self.fail('atomic plane set failed with %d' % ret)
> +                self.fail(f'atomic plane set failed with {ret}')
>                  continue
> =20
>              # Wait for one second and make sure the page flip has comple=
ted.
> @@ -191,9 +191,9 @@ class CRCTest(kmstest.KMSTest):
>                  if source =3D=3D crtc:
>                      crc_source =3D 'auto'
>                  else:
> -                    crc_source =3D 'plane%u' % source.id
> +                    crc_source =3D f'plane{source.id}'
> =20
> -                self.logger.log('Computing CRC from source %s' % crc_sou=
rce)
> +                self.logger.log(f'Computing CRC from source {crc_source}=
')
> =20
>                  # Set the CRC source and acquire 10 CRC values. Discard =
the
>                  # first value, as the device is running and the new sour=
ce
> @@ -204,7 +204,7 @@ class CRCTest(kmstest.KMSTest):
>                  crc_reader.stop()
> =20
>                  crcs =3D [c.crcs[0] for c in crcs[1:]]
> -                self.logger.log('CRC value[0] 0x%08x' % crcs[0])
> +                self.logger.log(f'CRC value[0] 0x{crcs[0]:08x}')
> =20
>                  failures =3D 0
>                  ref_crc =3D composer.crc(source)
> @@ -212,12 +212,11 @@ class CRCTest(kmstest.KMSTest):
>                  for i in range(len(crcs)):
>                      crc =3D crcs[i]
>                      if crc !=3D ref_crc:
> -                        self.logger.log('CRC value[%u] 0x%08x does not m=
atch reference 0x%08x'
> -                                        % (i, crc, ref_crc))
> +                        self.logger.log(f'CRC value[{i}] 0x{crc:08x} doe=
s not match reference 0x{ref_crc:08x}')
>                          failures +=3D 1
> =20
>                  if failures:
> -                    self.fail('Incorrect CRC values on source %s' % crc_=
source)
> +                    self.fail(f'Incorrect CRC values on source {crc_sour=
ce}')
>                      break
> =20
>              else:
> diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
> index ce849437b2fa..5c3bfd441a38 100755
> --- a/tests/kms-test-formats.py
> +++ b/tests/kms-test-formats.py
> @@ -37,8 +37,8 @@ class FormatsTest(kmstest.KMSTest):
>              self.skip('no CRTC available with connector')
>              return
> =20
> -        self.logger.log('Testing connector %s, CRTC %u, mode %s' % \
> -              (connector.fullname, crtc.id, mode.name))
> +        self.logger.log(f'Testing connector {connector.fullname}, '
> +                        f'CRTC {crtc.id}, mode {mode.name}')
> =20
>          failed =3D 0
> =20
> @@ -46,7 +46,7 @@ class FormatsTest(kmstest.KMSTest):
>          for i in range(num_formats):
>              format =3D crtc.primary_plane.formats[i]
> =20
> -            self.logger.log('Testing format %s' % format)
> +            self.logger.log(f'Testing format {format}')
>              self.progress(i+1, num_formats)
> =20
>              # Create a frame buffer
> @@ -62,7 +62,7 @@ class FormatsTest(kmstest.KMSTest):
>              # Set the mode with a primary plane
>              ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>              if ret < 0:
> -                self.logger.log('atomic mode set failed with %d' % ret)
> +                self.logger.log(f'atomic mode set failed with {ret}')
>                  failed +=3D 1
>                  continue
> =20
> @@ -71,7 +71,7 @@ class FormatsTest(kmstest.KMSTest):
>          self.atomic_crtc_disable(crtc)
> =20
>          if failed:
> -            self.fail('%s/%s formats failed' % (failed, num_formats))
> +            self.fail(f'{failed}/{num_formats} formats failed')
>          else:
>              self.success()
> =20
> diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-mod=
eset.py
> index f856178172c0..06eceade19c4 100755
> --- a/tests/kms-test-legacy-modeset.py
> +++ b/tests/kms-test-legacy-modeset.py
> @@ -13,7 +13,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
> =20
>      def main(self):
>          for connector in self.output_connectors():
> -            self.start('legacy mode set on connector %s' % connector.ful=
lname)
> +            self.start(f'legacy mode set on connector {connector.fullnam=
e}')
> =20
>              # Skip disconnected connectors
>              if not connector.connected():
> @@ -36,8 +36,8 @@ class LegacyModeSetTest(kmstest.KMSTest):
>                  self.skip('no mode available')
>                  continue
> =20
> -            self.logger.log('Testing connector %s on CRTC %u with mode %=
s' % \
> -                  (connector.fullname, crtc.id, mode.name))
> +            self.logger.log(f'Testing connector {connector.fullname} '
> +                            f'on CRTC {crtc.id} with mode {mode.name}')
> =20
>              # Create a frame buffer
>              fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.=
vdisplay, 'XR24')
> @@ -46,7 +46,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
>              # Perform a mode set
>              ret =3D crtc.set_mode(connector, fb, mode)
>              if ret < 0:
> -                self.fail('legacy mode set failed with %d' % ret)
> +                self.fail(f'legacy mode set failed with {ret}')
>                  continue
> =20
>              self.logger.log('Legacy mode set complete')
> @@ -54,7 +54,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
> =20
>              ret =3D crtc.disable_mode()
>              if ret < 0:
> -                self.fail('legacy mode set disable failed with %d' % ret)
> +                self.fail(f'legacy mode set disable failed with {ret}')
>                  continue
> =20
>              self.success()
> diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
> index 433bb0bdd157..c47848904ec4 100755
> --- a/tests/kms-test-modes.py
> +++ b/tests/kms-test-modes.py
> @@ -12,8 +12,8 @@ class ModesTest(kmstest.KMSTest):
>          self.logger.log('Page flip complete')
> =20
>      def test_mode(self, connector, crtc, mode):
> -        self.logger.log('Testing connector %s on CRTC %u with mode %s' %=
 \
> -              (connector.fullname, crtc.id, mode.name))
> +        self.logger.log(f'Testing connector {connector.fullname} '
> +                        f'on CRTC {crtc.id} with mode {mode.name}')
> =20
>          # Create a frame buffer
>          fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdis=
play, 'XR24')
> @@ -22,7 +22,7 @@ class ModesTest(kmstest.KMSTest):
>          # Perform the mode set
>          ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>          if ret < 0:
> -            raise RuntimeError('atomic mode set failed with %d' % ret)
> +            raise RuntimeError(f'atomic mode set failed with {ret}')
> =20
>          self.logger.log('Atomic mode set complete')
>          self.run(4)
> @@ -33,7 +33,7 @@ class ModesTest(kmstest.KMSTest):
> =20
>      def main(self):
>          for connector in self.output_connectors():
> -            self.start('modes on connector %s' % connector.fullname)
> +            self.start(f'modes on connector {connector.fullname}')
> =20
>              # Skip disconnected connectors
>              if not connector.connected():
> diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
> index a6ba61c920e5..e8b3d9ac37f9 100755
> --- a/tests/kms-test-modeset.py
> +++ b/tests/kms-test-modeset.py
> @@ -13,7 +13,7 @@ class ModeSetTest(kmstest.KMSTest):
> =20
>      def main(self):
>          for connector in self.output_connectors():
> -            self.start('atomic mode set on connector %s' % connector.ful=
lname)
> +            self.start(f'atomic mode set on connector {connector.fullnam=
e}')
> =20
>              # Skip disconnected connectors
>              if not connector.connected():
> @@ -36,8 +36,8 @@ class ModeSetTest(kmstest.KMSTest):
>                  self.skip('no mode available')
>                  continue
> =20
> -            self.logger.log('Testing connector %s on CRTC %u with mode %=
s' % \
> -                  (connector.fullname, crtc.id, mode.name))
> +            self.logger.log(f'Testing connector {connector.fullname} '
> +                            f'on CRTC {crtc.id} with mode {mode.name}')
> =20
>              # Create a frame buffer
>              fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.=
vdisplay, 'XR24')
> @@ -46,7 +46,7 @@ class ModeSetTest(kmstest.KMSTest):
>              # Perform a mode set
>              ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>              if ret < 0:
> -                self.fail('atomic mode set failed with %d' % ret)
> +                self.fail(f'atomic mode set failed with {ret}')
>                  continue
> =20
>              self.logger.log('Atomic mode set complete')
> diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
> index 15dae6a23ab3..14bea0a877a3 100755
> --- a/tests/kms-test-pageflip.py
> +++ b/tests/kms-test-pageflip.py
> @@ -13,12 +13,12 @@ class PageFlipTest(kmstest.KMSTest):
> =20
>      def handle_page_flip(self, frame, time):
>          if self.flips =3D=3D 1:
> -            self.logger.log('first page flip frame %u time %f' % (frame,=
 time))
> +            self.logger.log(f'first page flip frame {frame} time {time}')
>              self.frame_start =3D frame
>              self.time_start =3D time
> =20
>          if self.stop_requested:
> -            self.logger.log('last page flip frame %u time %f' % (frame, =
time))
> +            self.logger.log(f'last page flip frame {frame} time {time}')
>              self.frame_end =3D frame
>              self.time_end =3D time
>              self.loop.stop()
> @@ -43,7 +43,7 @@ class PageFlipTest(kmstest.KMSTest):
> =20
>      def main(self):
>          for connector in self.output_connectors():
> -            self.start('page flip on connector %s' % connector.fullname)
> +            self.start(f'page flip on connector {connector.fullname}')
> =20
>              # Skip disconnected connectors
>              if not connector.connected():
> @@ -67,7 +67,7 @@ class PageFlipTest(kmstest.KMSTest):
>                      self.plane =3D plane
>                      break
>              else:
> -                self.skip('no plane available for CRTC %u' % crtc.id)
> +                self.skip(f'no plane available for CRTC {crtc.id}')
>                  continue
> =20
>              # Get the default mode for the connector
> @@ -77,8 +77,8 @@ class PageFlipTest(kmstest.KMSTest):
>                  self.skip('no mode available')
>                  continue
> =20
> -            self.logger.log('Testing connector %s, CRTC %u, plane %u, mo=
de %s' % \
> -                  (connector.fullname, crtc.id, self.plane.id, mode.name=
))
> +            self.logger.log(f'Testing connector {connector.fullname}, CR=
TC {crtc.id}, '
> +                            f'plane {self.plane.id}, mode {mode.name}')
> =20
>              # Create two frame buffers
>              self.fbs =3D []
> @@ -88,7 +88,7 @@ class PageFlipTest(kmstest.KMSTest):
>              # Set the mode and perform the initial page flip
>              ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, sel=
f.fbs[0])
>              if ret < 0:
> -                self.fail('atomic mode set failed with %d' % ret)
> +                self.fail(f'atomic mode set failed with {ret}')
>                  continue
> =20
>              # Flip pages for 10s
> @@ -114,8 +114,8 @@ class PageFlipTest(kmstest.KMSTest):
> =20
>              frames =3D self.frame_end - self.frame_start + 1
>              interval =3D self.time_end - self.time_start
> -            self.logger.log('Frame rate: %f (%u/%u frames in %f s)' % \
> -                (frames / interval, self.flips, frames, interval))
> +            self.logger.log(f'Frame rate: {frames / interval} '
> +                            f'({self.flips}/{frames} frames in {interval=
} s)')
>              self.success()
> =20
>  PageFlipTest().execute()
> diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planepositi=
on.py
> index e843ae13c50c..aceb849950a1 100755
> --- a/tests/kms-test-planeposition.py
> +++ b/tests/kms-test-planeposition.py
> @@ -42,8 +42,8 @@ class PlanePositionTest(kmstest.KMSTest):
>              self.skip('no CRTC available with connector and at least two=
 planes')
>              return
> =20
> -        self.logger.log('Testing connector %s, CRTC %u, mode %s with %u =
planes' % \
> -              (connector.fullname, crtc.id, mode.name, len(planes)))
> +        self.logger.log(f'Testing connector {connector.fullname}, CRTC {=
crtc.id}, '
> +                        f'mode {mode.name} with {len(planes)} planes')
> =20
>          # Create a frame buffer
>          fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdis=
play, 'XR24')
> @@ -52,7 +52,7 @@ class PlanePositionTest(kmstest.KMSTest):
>          # Set the mode with no plane, wait 5s for the monitor to wake up
>          ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, sync=3D=
True)
>          if ret < 0:
> -            self.fail('atomic mode set failed with %d' % ret)
> +            self.fail(f'atomic mode set failed with {ret}')
>              return
> =20
>          self.logger.log('Initial atomic mode set completed')
> @@ -63,7 +63,7 @@ class PlanePositionTest(kmstest.KMSTest):
>          destination =3D kmstest.Rect(0, 0, fb.width // 2, fb.height)
>          ret =3D self.atomic_plane_set(planes[0], crtc, source, destinati=
on, fb, sync=3DTrue)
>          if ret < 0:
> -            self.fail('atomic plane set for first plane failed with %d' =
% ret)
> +            self.fail(f'atomic plane set for first plane failed with {re=
t}')
>              return
> =20
>          self.logger.log('Root plane enabled')
> @@ -79,10 +79,10 @@ class PlanePositionTest(kmstest.KMSTest):
> =20
>              ret =3D self.atomic_plane_set(planes[1], crtc, source, desti=
nation, fb, sync=3DTrue)
>              if ret < 0:
> -                self.fail('atomic plane set with offset %d,%d' % offset)
> +                self.fail(f'atomic plane set with offset {offset}')
>                  return
> =20
> -            self.logger.log('Moved overlay plane to %d,%d' % offset)
> +            self.logger.log(f'Moved overlay plane to {offset}')
>              time.sleep(3)
> =20
>          # Try to move the plane completely off-screen. The device is exp=
ected
> @@ -97,10 +97,10 @@ class PlanePositionTest(kmstest.KMSTest):
> =20
>              ret =3D self.atomic_plane_set(planes[1], crtc, source, desti=
nation, fb, sync=3DTrue)
>              if ret < 0:
> -                self.fail('atomic plane set with offset %d,%d' % offset)
> +                self.fail(f'atomic plane set with offset {offset}')
>                  return
> =20
> -            self.logger.log('Moved overlay plane to %d,%d' % offset)
> +            self.logger.log(f'Moved overlay plane to {offset}')
>              time.sleep(3)
> =20
>          # Disable and re-enable the plane when it is off-screen. The dev=
ice is
> diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
> index 69f8be127d2f..68aff9c11cff 100755
> --- a/tests/kms-test-routing.py
> +++ b/tests/kms-test-routing.py
> @@ -64,10 +64,10 @@ class RoutingTest(kmstest.KMSTest):
>          fb =3D pykms.DumbFramebuffer(self.card, max_hdisplay, max_vdispl=
ay, 'XR24')
>          pykms.draw_test_pattern(fb)
> =20
> -        self.start('Moving connector %s between CRTCs %s' % \
> -                   (shared_connector.fullname, [pipe.crtc.id for pipe in=
 pipes]))
> +        self.start(f'Moving connector {shared_connector.fullname} '
> +                   f'between CRTCs {[pipe.crtc.id for pipe in pipes]}')
> =20
> -        self.logger.log('Highest display resolution: %ux%u' % (max_hdisp=
lay, max_vdisplay))
> +        self.logger.log(f'Highest display resolution: {max_hdisplay}x{ma=
x_vdisplay}')
> =20
>          for master_pipe in pipes:
>              req =3D kmstest.AtomicRequest(self)
> @@ -97,13 +97,13 @@ class RoutingTest(kmstest.KMSTest):
>                              'CRTC_H': mode.vdisplay,
>                          })
> =20
> -                route.append('CRTC %u to connector %s' % (pipe.crtc.id, =
pipe.connector.fullname))
> +                route.append(f'CRTC {pipe.crtc.id} to connector {pipe.co=
nnector.fullname}')
> =20
>              self.logger.log('Routing ' + ', '.join(route))
> =20
>              ret =3D req.commit_sync(True)
>              if ret < 0:
> -                self.fail('atomic commit failed with %d' % ret)
> +                self.fail(f'atomic commit failed with {ret}')
>                  return
> =20
>              time.sleep(5)
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 708e6999d1f0..14e28cd47fbd 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -113,7 +113,7 @@ class KernelLogReader(object):
> =20
>  class Logger(object):
>      def __init__(self, name):
> -        self.logfile =3D open('%s.log' % name, 'w')
> +        self.logfile =3D open(f'{name}.log', 'w')
>          self._kmsg =3D KernelLogReader()
> =20
>      def __del__(self):
> @@ -129,7 +129,7 @@ class Logger(object):
>      def event(self):
>          kmsgs =3D self._kmsg.read()
>          for msg in kmsgs:
> -            self.logfile.write('K [%6f] %s\n' % (msg.timestamp, msg.msg))
> +            self.logfile.write(f'K [{msg.timestamp:6f} {msg.msg}\n')
>          self.logfile.flush()
> =20
>      @property
> @@ -146,7 +146,7 @@ class Logger(object):
>          self.event()
> =20
>          now =3D time.clock_gettime(time.CLOCK_MONOTONIC)
> -        self.logfile.write('U [%6f] %s\n' % (now, msg))
> +        self.logfile.write(f'U [{now:6f}] {msg}\n')
>          self.logfile.flush()
> =20
> =20
> @@ -171,7 +171,7 @@ class CRCReader(object):
> =20
>          # Hardcode the device minor to 0 as the KMSTest constructor open=
s the
>          # default card object.
> -        self.dir =3D os.open('/sys/kernel/debug/dri/0/crtc-%u/crc' % sel=
f.pipe, 0)
> +        self.dir =3D os.open('f/sys/kernel/debug/dri/0/crtc-{self.pipe}/=
crc', 0)
>          self.ctrl =3D os.open('control', os.O_WRONLY, dir_fd =3D self.di=
r)
>          self.data =3D -1
> =20
> @@ -211,7 +211,7 @@ class Dist(object):
>          self.y =3D y
> =20
>      def __repr__(self):
> -        return '(%d,%d)' % (self.x, self.y)
> +        return f'({self.x},{self.y})'
> =20
> =20
>  class Point(object):
> @@ -220,7 +220,7 @@ class Point(object):
>          self.y =3D y
> =20
>      def __repr__(self):
> -        return '(%d,%d)' % (self.x, self.y)
> +        return f'({self.x},{self.y})'
> =20
>      def move(self, distance):
>          self.x +=3D distance.x
> @@ -233,7 +233,7 @@ class Size(object):
>          self.height =3D height
> =20
>      def __repr__(self):
> -        return '%ux%u' % (self.width, self.height)
> +        return f'{self.width}x{self.height}'
> =20
> =20
>  class Rect(object):
> @@ -244,7 +244,7 @@ class Rect(object):
>          self.height =3D height
> =20
>      def __repr__(self):
> -        return '(%d,%d)/%ux%u' % (self.left, self.top, self.width, self.=
height)
> +        return f'({self.left},{self.top})/{self.width}x{self.height}'
> =20
>      def isEmpty(self):
>          """Check if the rectangle has a zero width or height"""
> @@ -462,24 +462,24 @@ class KMSTest(object):
>      def start(self, name):
>          """Start a test."""
>          self.test_name =3D name
> -        self.logger.log('Testing %s' % name)
> -        sys.stdout.write('Testing %s: ' % name)
> +        self.logger.log(f'Testing {name}')
> +        sys.stdout.write(f'Testing {name}: ')
>          sys.stdout.flush()
> =20
>      def progress(self, current, maximum):
> -        sys.stdout.write('\rTesting %s: %u/%u' % (self.test_name, curren=
t, maximum))
> +        sys.stdout.write(f'\rTesting {self.test_name}: {current}/{maximu=
m}')
>          sys.stdout.flush()
> =20
>      def fail(self, reason):
>          """Complete a test with failure."""
> -        self.logger.log('Test failed. Reason: %s' % reason)
> +        self.logger.log(f'Test failed. Reason: {reason}')
>          self.logger.flush()
> -        sys.stdout.write('\rTesting %s: FAIL\n' % self.test_name)
> +        sys.stdout.write(f'\rTesting {self.test_name}: FAIL\n')
>          sys.stdout.flush()
> =20
>      def skip(self, reason):
>          """Complete a test with skip."""
> -        self.logger.log('Test skipped. Reason: %s' % reason)
> +        self.logger.log(f'Test skipped. Reason: {reason}')
>          self.logger.flush()
>          sys.stdout.write('SKIP\n')
>          sys.stdout.flush()
> @@ -488,6 +488,6 @@ class KMSTest(object):
>          """Complete a test with success."""
>          self.logger.log('Test completed successfully')
>          self.logger.flush()
> -        sys.stdout.write('\rTesting %s: SUCCESS\n' % self.test_name)
> +        sys.stdout.write(f'\rTesting {self.test_name}: SUCCESS\n')
>          sys.stdout.flush()
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
