Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D940F17B8D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 10:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgCFJA5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 04:00:57 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:44246 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgCFJA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 04:00:56 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id Ax0r2200w5USYZQ01x0rkv; Fri, 06 Mar 2020 10:00:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8qh-0002iv-Ov; Fri, 06 Mar 2020 10:00:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8qh-0002K9-LH; Fri, 06 Mar 2020 10:00:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sean Wang <sean.wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] dt-bindings: serial: Convert generic and slave bindings to json-schema
Date:   Fri,  6 Mar 2020 10:00:44 +0100
Message-Id: <20200306090046.8890-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Rob, Greg,

This patch series converts the generic serial interface and slave-device
Device Tree bindings to json-schema.

Changes compared to v1[1]:
  - Update references to serial.txt and slave-device.txt,
  - Fix nodename pattern,
  - Add missing maxItems to *-gpios,
  - Express that uart-has-rtscts and [cr]ts-gpios are
    mutually-exclusive,
  - Drop examples,
  - Allow any child node names,
  - Typo s/connnected/connected/.

This is a dependency for converting more serial DT bindings that will
refer to properties defined in serial.yaml.

This patch is based on next-20200306, which has a recent change to
nextqualcomm-bluetooth.txt.

Thanks!

[1] https://lore.kernel.org/linux-devicetree/20200303134351.22270-1-geert+renesas@glider.be/

Geert Uytterhoeven (2):
  dt-bindings: serial: Convert generic bindings to json-schema
  dt-bindings: serial: Convert slave-device bindings to json-schema

 .../devicetree/bindings/gnss/gnss.txt         |   2 +-
 .../bindings/net/broadcom-bluetooth.txt       |   2 +-
 .../bindings/net/mediatek-bluetooth.txt       |   2 +-
 .../devicetree/bindings/net/qca,qca7000.txt   |   2 +-
 .../bindings/net/qualcomm-bluetooth.txt       |   2 +-
 .../devicetree/bindings/net/ti-bluetooth.txt  |   3 +-
 .../bindings/serial/fsl-imx-uart.txt          |   2 +-
 .../bindings/serial/renesas,sci-serial.txt    |   4 +-
 .../devicetree/bindings/serial/serial.txt     |  56 --------
 .../devicetree/bindings/serial/serial.yaml    | 127 ++++++++++++++++++
 .../bindings/serial/slave-device.txt          |  45 -------
 MAINTAINERS                                   |   2 +-
 12 files changed, 137 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/serial.txt
 create mode 100644 Documentation/devicetree/bindings/serial/serial.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/slave-device.txt

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
