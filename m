Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EAA450601
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhKONyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:54:08 -0500
Received: from mail.iot.bzh ([51.75.236.24]:19975 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231890AbhKONx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:53:56 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 536611B86E;
        Mon, 15 Nov 2021 14:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=hrKr
        EUYrzQgN3KGQcYb9/M4bwCULK+r7SkxMN+yd1u0=; b=HR4C7W9fLE/R3OScreHA
        H4/PSO09mIRI0Zu/GfYQVZ23cJbrre4AmmGKYxDVSSN0GeVEzutOZS/Mu0QPnADE
        8dC3ay7xpkYhnBasosF84mFp5IiRQ+xu1Jfx5nG543xQFiyaU8x9vnBdONd4hyr9
        O8dib+S5AMqZMowwGUgTZaFcaoSoKWhqPwB01MBk4rR+efvJJxSg/TsQptHAFDJq
        3f5+A97KysxLdTFGs1GtSrMrBlK98RfooeW8E0C5qlGq8/F4N8kL0ktxHwwRHxsr
        gpApJN8Dd4Ua54s16q7+ucX3QsVX+dhDG9H2Rrj632LjeiNjKiv+bYsiXtJ3ZbAX
        5Q==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v1 0/3] Initial Renesas R-Car remoteproc support
Date:   Mon, 15 Nov 2021 14:50:29 +0100
Message-Id: <20211115135032.129227-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Most of the SoCs in the R-Car gen3 SoC series such as
H3,M3 and E3 have an 'Arm Realtime Core'.
This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
This series adds initial support to load a firmware and start
this remote processor through the remoteproc subsystem.

This series depends on
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
to be able to set the Cortex-R7 boot address.

One of the way to test this driver is to  use the zephyr upstream support
for h3ulcb board 'blinky' demo is my favorite testing firmware.

To generate a firmware with the zephyr project.

follow this starting guide
https://docs.zephyrproject.org/2.7.0/getting_started/index.html

Then compile your zephyr demo
west build -b rcar_h3ulcb_cr7 zephyr/samples/basic/blinky \
    -DCONFIG_KERNEL_ENTRY=\"_vector_table\" \
    --build-dir h3-blinky

Then you can use h3-blinky/zephyr/zephyr.elf as a testing
firmware.

Patch 1/3 adds the dt-bindings

Patch 2/3 adds entries into the dts/dtsi files for r8a77951,
my testing platform. This driver has also been tested on E3 and M3,
but lacks proper zephyr support at the moment.

Modifications to r8a77951-ulcb.dts are given as usage example
and may be dropped in future patchset since it use some memory
range that may be reserved for other usage.

Patch 3/3 is a small driver to cover basic remoteproc
usage: loading firmware from filesystem, starting and stopping the
Cortex-r7 processor.

Julien Massot (3):
  dt-bindings: remoteproc: Add Renesas R-Car
  arm64: dts: renesas: r8a77951: Add CR7 realtime processor
  remoteproc: Add Renesas rcar driver

 .../remoteproc/renesas,rcar-rproc.yaml        |  66 +++++
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts |  15 ++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   7 +
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/rcar_rproc.c               | 226 ++++++++++++++++++
 6 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
 create mode 100644 drivers/remoteproc/rcar_rproc.c

-- 
2.31.1


