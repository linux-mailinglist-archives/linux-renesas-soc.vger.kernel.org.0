Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAED360941
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 14:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhDOMZ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 08:25:56 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58343 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhDOMZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 08:25:54 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C31521C0010;
        Thu, 15 Apr 2021 12:25:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] arm64: dts: renesas: Enable GMSL on R8A77970 V3M Eagle
Date:   Thu, 15 Apr 2021 14:25:55 +0200
Message-Id: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Following the recent v3, this new version:

- Two new patches (minor fixes)
- Address Laurent's comments on gpio-poc bindings and implementation.
  Naming might still be discussed
- Address Laurent's comments on DTS patches
- Last patch not for inclusion

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

 .../bindings/media/i2c/maxim,max9286.yaml     | 279 +++++++++++-------
 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi   | 178 +++++++++++
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 114 +++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi     |   4 +
 drivers/media/i2c/max9286.c                   | 119 ++++++--
 5 files changed, 563 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi

--
2.31.1

