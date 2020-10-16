Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D69C290158
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 11:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405280AbgJPJNg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 05:13:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:36731 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405954AbgJPJMW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 05:12:22 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 634CA20010;
        Fri, 16 Oct 2020 09:12:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] r8a779a0: Add CSI and VIN
Date:   Fri, 16 Oct 2020 13:11:52 +0200
Message-Id: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds the CPG clock definitions, device node entries, and compatible
strings for the CSI-2 receivers and VIN instances on R8A779A0 R-Car V3U SoC.

The last 2 patches are under discussion, as the right way forward to support
the V3U VIN version has not yet been clarified.

Compile tested only.


Jacopo Mondi (6):
  clk: renesas: r8a779a0: Add CSI4[0-3] clocks
  dt-bindings: media: renesas,csi2: Add V3U support
  arm64: dts: renesas: r8a779a0: Add CSI-2 nodes
  clk: renesas: r8a779a0: Add VIN clocks
  dt-bindings: media: renesas,vin: Add V3U support
  arm64: dts: r8a779a0: Add VIN nodes

 .../bindings/media/renesas,csi2.yaml          |   1 +
 .../bindings/media/renesas,vin.yaml           |   3 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 500 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  36 ++
 4 files changed, 539 insertions(+), 1 deletion(-)

--
2.28.0

