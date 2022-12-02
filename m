Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB947640738
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 13:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbiLBMz6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 07:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiLBMzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 07:55:55 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CF2DE5C6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 04:55:50 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
        by laurent.telenet-ops.be with bizsmtp
        id rQvn2800M0ys3B701QvnFx; Fri, 02 Dec 2022 13:55:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p15Zz-002Iso-4R; Fri, 02 Dec 2022 13:55:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p15Zy-005gP8-Hi; Fri, 02 Dec 2022 13:55:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] dt-bindings: sound: ti,pcm3168a: json-schema conversion and fixes
Date:   Fri,  2 Dec 2022 13:55:42 +0100
Message-Id: <cover.1669980383.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series is an attempt to convert the existing DT binding
documentation for the Texas Instruments PCM3168A Audio Codec to
json-schema ("another one bites the dust" ;-).

It consists of two parts:
  1. The actual DT binding conversion,
  2. An RFC patch to fix the impedance mismatch between the bindings
     and the description in the Shimafuji Kingfisher board DTS.

I'm not super-familiar with the audio details, so I would be very
grateful to receive your comments.

Thanks!

Geert Uytterhoeven (2):
  dt-bindings: sound: ti,pcm3168a: Convert to json-schema
  [RFC] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio codec node

 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ----------
 .../bindings/sound/ti,pcm3168a.yaml           | 105 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   5 +-
 3 files changed, 107 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
