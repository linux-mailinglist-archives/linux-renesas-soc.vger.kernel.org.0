Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011852F3666
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390845AbhALRCR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:17 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:22740 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389112AbhALRCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470765;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=ARgC7NlSBFEIi8citwy5Pi4/u0Ucv9t5cPV51b2HEv0=;
        b=N61TVIa6nX6ebbfOioxxWJD4lIx++EjFY4qy3UmuskfjKIXVnOZgn6+vgSeh43/IoK
        0NOQuhL549bpy91Dg6p3a2HeQ1X8mT+aKPampdPWCNrMvkW5JFNC+nbmrdldU3XLRdke
        PC4cOd0s+LXAYLQKr4z6B0k4AgDgZJ5QhWm3IxzSSEF8LuObKfY5ttv7DDVcrgnx3L/f
        oUA1AWFFzw0fB4HF2smOWyf4Djh64ZAFJICGUC90tSsoJ4686mfpvGITOieUiLXUTF1c
        I8jXLQnnxyinSo50wxnxfvBPTpNsZC0qn9xCjhUbz4aJen1F1HVvbLqQdmESCu4tNkVm
        SEjw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxJNU9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:19 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 0/6] pinctrl: renesas: basic R8A779A0 (V3U) support
Date:   Tue, 12 Jan 2021 17:59:06 +0100
Message-Id: <20210112165912.30876-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series provides basic V3U pin control support, up to and including the
SCIF pins.

This revision includes yet more fixes for issues found by Geert in his
review. It also adds DT bindings and Reviewed-by/Tested-by tags where
appropriate; see below for details.

Thanks to Geert and Wolfram for review and testing!

CU
Uli


Changes since v2:
- pinctrl.c: fix signedness of lower_voltage
- use SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 where applicable
- sh_pfc.h: use PORT_GP_CFG_2 where appropriate
- sh_pfc.h: document changed unlock_reg behavior
- pfc-r8a779a0.c: fix table alignment issues
- pfc-r8a779a0.c: fix imprecise pin names in comments
- pfc-r8a779a0.c: remove redundant initializations
- add DT bindings (DT node sold separately)
- add Reviewed-by/Tested-by tags where applicable

Changes since v1:
- add support for different voltage levels
- add more PORT_GP_CFG_{2,31} macros
- add non-GP pins
- add A/B pins/groups for TCLK{1,2}, {RX,TX}1, FXR_TXDA, RXDA_EXTFXR
- add SEL_I2C*_0 to MOD_SEL2
- add PINMUX_PHYS, fix multiplexing of S{DA,CL}[0-6]
- add AVB{0,1}_{MAGIC,MDC,MDIO,TXREFCLK}
- remove undocumented POC3
- add human-readable pin names to pinmux_bias_regs[]
- use generic rcar_pinmux_{get,set}_bias() ops
- tweak coding style and commit messages
- add Reviewed-Bys where applicable

Ulrich Hecht (6):
  pinctrl: renesas: implement unlock register masks
  pinctrl: renesas: add I/O voltage level flag
  pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
  pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
  pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions
  dt-bindings: pinctrl: sh-pfc: Document r8a779a0 PFC support

 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |   34 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c        | 2672 +++++++++++++++++
 drivers/pinctrl/renesas/pinctrl.c             |   16 +-
 drivers/pinctrl/renesas/sh_pfc.h              |   28 +-
 7 files changed, 2740 insertions(+), 17 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c

-- 
2.20.1

