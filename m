Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF21728DE17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 11:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgJNJ6N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 05:58:13 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:37900 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgJNJ5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:57:25 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 3928A3B70C2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 09:41:11 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5A6BB1C000F;
        Wed, 14 Oct 2020 09:40:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] r8a779a0: Add CSI and VIN
Date:   Wed, 14 Oct 2020 11:44:37 +0200
Message-Id: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds the CPG clock definitions, device node entries, and compatible
strings for the CSI-2 receivers and VIN instances on R8A779A0 R-Car V3U SoC.

A few quircks in the per-patches commit messages.

Compile tested only.

Jacopo Mondi (6):
  clk: renesas: r8a779a0: Add CSI4[0-3] clocks
  dt-bindings: media: renesas,csi2: Add V3U support
  arm64: dts: renesas: r8a779a0: Add CSI-2 nodes
  clk: renesas: r8a779a0: Add VIN[00-31] clocks
  dt-bindings: media: renesas,vin: Add V3U support
  arm64: dts: r8a779a0: Add VIN nodes

 .../bindings/media/renesas,csi2.yaml          |   1 +
 .../bindings/media/renesas,vin.yaml           |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 361 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  36 ++
 4 files changed, 399 insertions(+)

--
2.28.0

