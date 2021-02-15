Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4E731C079
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 18:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhBOR0L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 12:26:11 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35533 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhBORZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 12:25:22 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E96911C000D;
        Mon, 15 Feb 2021 17:24:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: renesas: Enable GMSL on R8A77970 V3M Eagle
Date:   Mon, 15 Feb 2021 18:24:43 +0100
Message-Id: <20210215172447.2026514-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
   this series adds a .dtsi fragment that allow to describe and
enable GMSL cameras on the V3M Eagle board.

The .dtsi supports connecting the RDACM20 and RDACM21 cameras to the
FAKRA connectors installed on the board.

Tested on V3M Eagle with RDACM20 and RDACM21 (a series is pending submission
for the RDACM20 camera module to support operations on the Eagle board)

Thanks
   j

Jacopo Mondi (1):
  dt-bindings: media: max9286: Describe gpio-hog

Kieran Bingham (3):
  arm64: dts: renesas: eagle: Enable MAX9286
  arm64: dts: renesas: eagle: Add GMSL .dtsi
  arm64: dts: renesas: eagle: Include eagle-gmsl

 .../bindings/media/i2c/maxim,max9286.yaml     |   9 +
 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi   | 186 ++++++++++++++++++
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 135 +++++++++++++
 3 files changed, 330 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi

--
2.30.0

