Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C5343C3E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Oct 2021 09:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237061AbhJ0HdD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Oct 2021 03:33:03 -0400
Received: from mail.iot.bzh ([51.75.236.24]:37114 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231849AbhJ0HdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 03:33:02 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 286D0250A1;
        Wed, 27 Oct 2021 09:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=MAp0
        l2HWMMP31KeLsWzxS72hJnPPDcJhxwGANiTLv28=; b=YdE8vC2pI12NoJTflYM1
        jFUjtt3lHQaZvw2fLhmhgS/zg5cP1vgCJ5WWXL6sKVXzLvm/LcOS778abYKbqmtw
        C4uskdpvZ2JXb5C+BS0+4AAgjOerd15pznqKu41TwBqxELCVqusoMg5DF7dhbL9t
        0+1dQHuwX6ikzGoAo7uhnLvznPiZVuZLwMyT3SJandWJI8cV8ktzS0JhswUGmuB8
        GJpIBn0Eq2e/FYS+tKyWybEl5f48Cd98Nlq2BFYMjoDDjOowDdRLAKPTinrKgbvG
        iX2uSqHfUq/WRHd4kzPn6/vFPUyndJyOHhZDFCb7be5C+yvfPennTxYnkGtE03pD
        Kw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [RFC PATCH 0/3] Initial Renesas R-Car remoteproc support
Date:   Wed, 27 Oct 2021 09:30:17 +0200
Message-Id: <20211027073020.17055-1-julien.massot@iot.bzh>
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
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts |  16 ++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   7 +
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/rcar_rproc.c               | 229 ++++++++++++++++++
 6 files changed, 330 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
 create mode 100644 drivers/remoteproc/rcar_rproc.c

-- 
2.31.1


