Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E9B7D39E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 16:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbjJWOnT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 10:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbjJWOmv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 10:42:51 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375C92127
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 07:41:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:375d:2b56:c03f:d72d])
        by andre.telenet-ops.be with bizsmtp
        id 1Shd2B00U3CbNjd01ShdCU; Mon, 23 Oct 2023 16:41:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quw7W-007KKf-NH;
        Mon, 23 Oct 2023 16:41:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quw7d-007tac-Iq;
        Mon, 23 Oct 2023 16:41:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH dt-schema] schemas: gpio: gpio-consumer: Fix false positives on nodes named gpio
Date:   Mon, 23 Oct 2023 16:41:34 +0200
Message-Id: <20231023144134.1881973-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Just like for "gpio", nodes can be named "gpios" or
"<something>-gpio(s)", causing false positive failures.

See also commit 80120fccde170902 ("schemas: gpio: fix false positive
failures on nodes named 'gpio'").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen on Linux, e.g.:

    arch/arm/boot/dts/renesas/r8a7779-marzen.dtb: /: keyboard-gpio: {'compa=
tible': ['gpio-keys-polled'], 'poll-interval': [[50]], 'pinctrl-0': [[29]],=
 'pinctrl-names': ['default'], 'key-3': {'gpios': [[28, 19, 1]], 'linux,cod=
e': [[4]], 'label': ['SW1-3'], 'debounce-interval': [[20]]}, 'key-4': {'gpi=
os': [[28, 20, 1]], 'linux,code': [[5]], 'label': ['SW1-4'], 'debounce-inte=
rval': [[20]]}} is not of type 'array'
	    from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
    arch/arm/boot/dts/renesas/r8a7779-marzen.dtb: pinctrl@fffc0000: keyboar=
d-gpio: {'pins': ['GP_0_19', 'GP_0_20'], 'bias-pull-up': True, 'phandle': [=
[29]]} is not of type 'array'
	    from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

    arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /: gpios: {'compatible=
': ['gpio'], 'status': ['okay'], 'rf_on': {'label': ['rf on'], 'gpio': [[38=
, 83, 0]], 'output': True, 'init-low': True}, 'wifi_on': {'label': ['wifi o=
n'], 'gpio': [[38, 84, 0]], 'output': True, 'init-low': True}, 'zbe_test_ra=
dio': {'label': ['zbe test radio'], 'gpio': [[38, 53, 0]], 'output': True, =
'init-low': True}, 'zbe_rst': {'label': ['zbe rst'], 'gpio': [[38, 57, 0]],=
 'output': True, 'init-low': True}, 'io_reset': {'label': ['io reset'], 'gp=
io': [[38, 62, 0]], 'output': True, 'init-low': True}, 'io_test_radio': {'l=
abel': ['io test radio'], 'gpio': [[38, 73, 0]], 'output': True, 'init-low'=
: True}, 'io_boot_0': {'label': ['io boot 0'], 'gpio': [[38, 75, 0]], 'outp=
ut': True, 'init-low': True}, 'io_boot_1': {'label': ['io boot 1'], 'gpio':=
 [[38, 81, 0]], 'output': True, 'init-low': True}, 'verbose_bootloader': {'=
label': ['verbose bootloader'], 'gpio': [[38, 43, 0]], 'input': True}, 'nai=
l_bed_detection': {'label': ['nail bed detection'], 'gpio': [[38, 44, 0]], =
'input': True}, 'id_usba': {'label': ['id usba'], 'gpio': [[38, 64, 1]], 'i=
nput': True}} is not of type 'array'
	    from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

For marzen, the alternative fix would be to
s/keyboard-gpio/keyboard-polled/g.
---
 dtschema/schemas/gpio/gpio-consumer.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/dtschema/schemas/gpio/gpio-consumer.yaml b/dtschema/schemas/gp=
io/gpio-consumer.yaml
index 1ac35244de7317bc..9572a9cd0febef19 100644
--- a/dtschema/schemas/gpio/gpio-consumer.yaml
+++ b/dtschema/schemas/gpio/gpio-consumer.yaml
@@ -17,7 +17,10 @@ select:
=20
 properties:
   gpios:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+    # 'gpios' can appear as a property or node name
+    oneOf:
+      - type: object
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
=20
   gpio:
     # 'gpio' can appear as a property or node name
@@ -28,6 +31,9 @@ properties:
=20
 patternProperties:
   "(?<!,nr)-gpios?$":
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+    # these can appear as properties or node names
+    oneOf:
+      - type: object
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
=20
 additionalProperties: true
--=20
2.34.1

