Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE04FF40B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2019 17:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbfKPQsp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 16 Nov 2019 11:48:45 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60713 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfKPQso (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Nov 2019 11:48:44 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 547ACE0008;
        Sat, 16 Nov 2019 16:48:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFT 0/4] GMSL Refresh (would be v6)
Date:   Sat, 16 Nov 2019 17:50:30 +0100
Message-Id: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello this is refersh of our GMSL work.

Current situation is the following:
- Kieran sent a full v4 with multiplexed stream support and has a v5 branch in
  his repository with v4 review comment fixes on top

	I rebased the multiplexed stream's series on latest media-master
	https://jmondi.org/cgit/linux/log/?h=v4l2-mux/media-master/v6

	On top of that I took Kieran's v5 and re-applied on top:
	https://jmondi.org/cgit/linux/log/?h=jmondi/gmsl/kieran/v6

- Niklas sent a v1 (which sould have been a v5) which removes multiplexed
  streams and only support one camera and was meant for inclusion but is still
  floating around in linux-media, mostly because some of the comments on
  Kieran's v4 still applied there, if I'm not mistaken.

	I took Niklas' single stream max9286 and replaced the original
	bindings with a json-schema version
	https://jmondi.org/cgit/linux/log/?h=jmondi/gmsl/niklas/v6

I bumped all versions to v6 to avoid further confusion.

Not having a working GMSL setup I would ask to Kieran or Niklas to test this
version so that we can try re-send the single stream max9286 version with new
yaml bindings for inclusion.

(I kept linux-media e devicetree out as I would like to test the patches before
expanding the receivers list)

Thanks
   j

Jacopo Mondi (2):
  arm64: dts: renesas: Add Maxim GMSL expansion board
  arm64: dts: renesas: r8a7796=salvator-x: Include GMSL

Laurent Pinchart (1):
  dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286

Niklas Söderlund (1):
  max9286: Add MAX9286 driver

 .../bindings/media/i2c/maxim,max9286.yaml     |  286 +++++
 MAINTAINERS                                   |   10 +
 .../boot/dts/renesas/r8a7795-salvator-x.dts   |    1 +
 .../boot/dts/renesas/salvator-x-max9286.dtsi  |  394 ++++++
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/max9286.c                   | 1081 +++++++++++++++++
 7 files changed, 1784 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
 create mode 100644 drivers/media/i2c/max9286.c

--
2.23.0

