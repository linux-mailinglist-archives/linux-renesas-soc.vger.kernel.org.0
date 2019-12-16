Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02C0121172
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfLPROO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:14 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54295 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLPROO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:14 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7BE054000E;
        Mon, 16 Dec 2019 17:14:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 00/11] GMSL: Initial RDACM21 support
Date:   Mon, 16 Dec 2019 18:16:09 +0100
Message-Id: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Renesas multimedia,
   this series provides an initial support for RDACM21 camera modules,
which like the RDACM20 includes a MAX9271 serializer together with an OV490 ISP
chip and an OV10640 imager.

The series is based on the latest development from Kieran (gmsl/dev tag on
Kieran's kernel.org remote).

The series includes
- 4 fixes to be applied on top of Kieran's branch. Almost all of them have been
  reported by the dt schema validator.
- 05/11 which converts the proposed RDACM20 bindings to yaml
- 06/11 which breaks out MAX9271 handling from RDACM20 driver
- 07->09 which modified the max9286 driver to support remote communications
  with RDACM21 as well as RDACM20
- 10/11 which is an initial attempt to verify communication with RDACM21 by
  reading the ISP chip ID.
  At this stage, I augmented the RDACM20 driver to support both RDACM20 and 21.
  This defeats the purpose of 06/11 but I'm not sure which direction is better
  here, hence the RFC and the request for feedback.
  One driver per camera module, or a single driver with multiple compatibles?
  Please note that, as per RDACM20, the initial support for video capture
  operations will be limited to 1 resolution and one format, as the ISP+imager
  are configured by reading an on-chip EEPROM.
- Finally, enable RDACM21 in the Eagle DTS to test the example.

I'm very much interested in feedbacks on how to advance development for the
RDACM21 module.

Thanks
   j

Jacopo Mondi (11):
  fixup! DNI: Debug
  fixup! arm64: dts: renesas: salvator-x: Add MAX9286 expansion board
  fixup! arm64: dts: renesas: eagle: Provide Eagle FAKRA dynamic overlay
  fixup! arm64: dts: renesas: eagle: Provide MAX9286 GMSL deserialiser
  fixup! dt-bindings: media: i2c: Add bindings for IMI RDACM20
  media: i2c: Break out max9271 from rdacm20 driver
  media: i2c: max9286: Move notifiers operations
  media: i2c: max9286: Move link setup to completion
  media: i2c: max9286: Expand reverse chanenl amplitude
  WIP: media: i2c: rdacm20: Add RDACM21 support
  arm64: boot: dts: Eagle: Enable RDACM21

 .../bindings/media/i2c/imi,rdacm20.txt        |  66 ---
 .../bindings/media/i2c/imi,rdacm20.yaml       | 116 +++++
 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi  |  12 +-
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts |   3 -
 .../boot/dts/renesas/salvator-x-max9286.dtsi  |  16 +-
 drivers/media/i2c/Makefile                    |   3 +-
 drivers/media/i2c/max9271.c                   | 212 +++++++++
 drivers/media/i2c/max9271.h                   |  84 ++++
 drivers/media/i2c/max9286.c                   | 168 ++++---
 drivers/media/i2c/rdacm20.c                   | 433 +++++++-----------
 10 files changed, 693 insertions(+), 420 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm20.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm20.yaml
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h

--
2.24.0

