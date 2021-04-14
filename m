Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F4935F590
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 16:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349105AbhDNNvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 09:51:21 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54239 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349084AbhDNNvV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 09:51:21 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E265A60010;
        Wed, 14 Apr 2021 13:50:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] arm64: dts: renesas: Enable GMSL on R8A77970 V3M Eagle
Date:   Wed, 14 Apr 2021 15:51:23 +0200
Message-Id: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
   this series follows
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=448427
but implements a different way of handling the regulator-gpio_controller
circular dependency which is hunting us.

As suggested during review of v2 by Laurent, instead of using a gpio-hog to
force the MAX9286 gpio line that controls the remote cameras power, this series
introduces a new vendor property that allows to declare that the camera power
is controlled by the MAX9286 chip, instead than relying on a canonical supply,
which is impossible to establish as consumer of the gpio controller registered
by the driver.

The series introduces the new property and add support for parsing it in the
driver.

The DTS changes that follow are identical to v2, and comments there have not
been addressed waiting for a validation of patches 1 and 2.

Thanks
   j

Jacopo Mondi (2):
  dt-bindings: media: max9286: Define 'maxim,gpio-poc'
  media: i2c: max9286: Use "maxim,gpio-poc" property

Kieran Bingham (3):
  arm64: dts: renesas: eagle: Enable MAX9286
  arm64: dts: renesas: eagle: Add GMSL .dtsi
  arm64: dts: renesas: eagle: Include eagle-gmsl

 .../bindings/media/i2c/maxim,max9286.yaml     |  53 ++++-
 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi   | 186 ++++++++++++++++++
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 122 ++++++++++++
 drivers/media/i2c/max9286.c                   | 125 +++++++++---
 4 files changed, 456 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi

--
2.31.1

