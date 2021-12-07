Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F6346C127
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 17:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239689AbhLGRCT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 12:02:19 -0500
Received: from mail.iot.bzh ([51.75.236.24]:30667 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhLGRCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 12:02:19 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 0985F45603;
        Tue,  7 Dec 2021 17:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=J//L
        RnmrEV9XzQJLWe6jbFb/lrFqth3Hxb1+UlGEHl8=; b=SjVMf6wPHeFnE87V6NR3
        GhDTjLuaCJa8ecjcTepQrdQyEsESqyr0o/ElifQPwNutIzmBRmsfRynikZQ39rHj
        N1L1aS+m391DdeGHO3Ihjo6FYnrbIRw+LqUqwOOfq9wVSCR9aQ01UXcJqTtGKvJQ
        FpoXSgg9qUQC3+pNxCxMSg8cV6ecCiXguW04IYCYA4pOhH5q2zXFuKRI7QzX1k0v
        YMdh5L2MZZwxRvpLicu9/MFJ3YYn5VZ65L/cXGIAW9fBbVJzgCBYKZLc4erdjj3F
        3tkfgn3nLPh/ZK+RMiqp/paHpSxTSRYbdTGzuctklyjTvkAOq7lXiVdGkcNz6XBx
        Bw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v3 0/2] Initial Renesas R-Car remoteproc support
Date:   Tue,  7 Dec 2021 17:58:27 +0100
Message-Id: <20211207165829.195537-1-julien.massot@iot.bzh>
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

Julien Massot (2):
  dt-bindings: remoteproc: Add Renesas R-Car
  remoteproc: Add Renesas rcar driver

 .../remoteproc/renesas,rcar-rproc.yaml        |  65 +++++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/rcar_rproc.c               | 223 ++++++++++++++++++
 4 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
 create mode 100644 drivers/remoteproc/rcar_rproc.c

-- 
2.33.1


