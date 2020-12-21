Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058032DFE74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgLUQ6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:55 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:29559 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgLUQ6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569699;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=J3cO+SzezzHTrkCcPtODGN/EseonW9QlaHLpG9SV0OE=;
        b=snuEw/97LQrsOT/te0qIX9cITRiXjtIHbeICI0vvgohJvjKldJd5vHDbWgB0Y4WjRm
        0iJUHANE/hMLpXk7l2AZEQU2Ovkkya1BMN6QR3Qw2/BaU9SywzKvADGvHqBzW1UWvT4b
        GIrKRx50wg0AP4R7++MembQMOaUWeIn05SIwe4ypJZQdJ/hlgWGDR8hYmnyqTlpOPub2
        ptMJ1dJ1owBiPBhmmfziyRs2cGkiweN6eImtVqW9SfEXDHKhC6+J09HUv+z6vo773XgF
        9vkMY/K54HRd2xGvv+XpIo+DPdSVrG/PJp9Phyk8hnnEWfABErdzK65O9tD2tqTmRvLV
        TirA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGss0K6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:54:54 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 0/5] pinctrl: renesas: basic R8A779A0 (V3U) support
Date:   Mon, 21 Dec 2020 17:54:43 +0100
Message-Id: <20201221165448.27312-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series provides basic V3U pin control support, up to and including the
SCIF pins.

This revision includes fixes for numerous issues found by Geert in his
review; see below for details.

CU
Uli


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


Ulrich Hecht (5):
  pinctrl: renesas: implement unlock register masks
  pinctrl: renesas: add I/O voltage level flag
  pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
  pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
  pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions

 drivers/pinctrl/renesas/Kconfig        |    5 +
 drivers/pinctrl/renesas/Makefile       |    1 +
 drivers/pinctrl/renesas/core.c         |   34 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 2683 ++++++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl.c      |   16 +-
 drivers/pinctrl/renesas/sh_pfc.h       |   23 +-
 6 files changed, 2748 insertions(+), 14 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c

-- 
2.20.1

