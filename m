Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480A546306A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 11:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240558AbhK3KEZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 05:04:25 -0500
Received: from mail.iot.bzh ([51.75.236.24]:33577 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234861AbhK3KEZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 05:04:25 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id DDFC224982;
        Tue, 30 Nov 2021 11:01:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=JHO1
        lZ0pAl3DmcG1j61QPKX4tllB3u5k6C8rwVBufO8=; b=k/OhOFriwvs0bpfkkb2f
        p4YopnOfTxuCpQB8MDUMhd64UZlFhPS8OB+1tg/ZCoMaM7aeQtaXW1RxepZfQI76
        +R3yTQ8afg6EnkulpP/PTi0AYtPa3JvVG/Bgpa2wOTo7JFLGXDkuZKCXMIe6VYhR
        IC32iBwPuiJLJ3HssrV7162DdfsX44XzMCZDHgItrJHwbM+Ph8Y57nkxm8+XMAM6
        Y3YSXLa3CcGUlxG00ED7bFQwemI1fHyKBPvR6exUtDCcFV3WS9Zy1UesBeGcu7uM
        uBwHalL0tLW19ABf7FIT7eWh7xhMSjqHuoq7O1zcHWGzRNm3IlLmzQpsKeBaWJeH
        Bg==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v2 0/2] Initial Renesas R-Car remoteproc support
Date:   Tue, 30 Nov 2021 11:00:47 +0100
Message-Id: <20211130100049.129418-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.33.1
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

One of the way to test this driver is to use the zephyr upstream support
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

Patch 1/2 adds the dt-bindings

Patch 2/2 is a small driver to cover basic remoteproc
usage: loading firmware from filesystem, starting and stopping the
Cortex-r7 processor.

Device tree modifications have been dropped in this patchset version.
Reason is that memory range used by the Cortex-R7 depends on
design choice.
One thing we could do in the future is to add CR7 node
in the different Gen3 SoCs dtsi files such as r8a77951.dtsi, r8a77990.dtsi,
r8a77961.dtsi.. 

Julien Massot (2):
  dt-bindings: remoteproc: Add Renesas R-Car
  remoteproc: Add Renesas rcar driver

 .../remoteproc/renesas,rcar-rproc.yaml        |  65 +++++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/rcar_rproc.c               | 226 ++++++++++++++++++
 4 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
 create mode 100644 drivers/remoteproc/rcar_rproc.c

-- 
2.33.1


