Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336773645F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Apr 2021 16:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239343AbhDSOXn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 10:23:43 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:62519 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbhDSOXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 10:23:43 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7BB1540007;
        Mon, 19 Apr 2021 14:23:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] arm64: dts: renesas: Enable GMSL on R8A77970 V3M Eagle
Date:   Mon, 19 Apr 2021 16:23:38 +0200
Message-Id: <20210419142345.53152-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello, small changes compared to v4:

- bindings:
  - Took in Rob's suggestions and used a more compact

	if:
	  required:
	    - maxim,gpio-poc
	then:
	  properties:
	    poc-supply: false
	    gpio-controller: false

    it's a shame we can't use 'properties' in the if: clause :)
    but this already looks better than the preceding version

- driver:
  - Backtrack on the set_gpio() function and share implementation with
    the gpiochip function

Tested on Eagle-V3M

Thanks
  j

Jacopo Mondi (4):
  dt-bindings: media: max9286: Re-indent example
  dt-bindings: media: max9286: Define 'maxim,gpio-poc'
  media: i2c: max9286: Use "maxim,gpio-poc" property
  arm64: dts: renesas: r8a77970: Add csi40 port@0

Kieran Bingham (3):
  arm64: dts: renesas: eagle: Enable MAX9286
  arm64: dts: renesas: eagle: Add GMSL .dtsi
  DNI: arm64: dts: renesas: eagle: Include eagle-gmsl

 .../bindings/media/i2c/maxim,max9286.yaml     | 275 +++++++++++-------
 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi   | 178 ++++++++++++
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 114 ++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi     |   4 +
 drivers/media/i2c/max9286.c                   | 125 ++++++--
 5 files changed, 560 insertions(+), 136 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi

--
2.31.1

