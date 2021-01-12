Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C16B2F366D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391023AbhALRCe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:34 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:32867 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391149AbhALRCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470781;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=+e23qDx0e6JU1CewXgN+XEgCB//3ri+88cO0bEUM+vg=;
        b=Uj45r0klGOodyyJIS30FEkRklfGnGxhmqOmXEO3yno9o08+t7FvjUUDUWQelKhrCal
        DzrTqj2Zog/p0jXjNlHMWpQ4/WZDfKUXCoYOzs8bAG/53fbeQmCe1+I4F1S0VBPAUxjS
        jJG3sxumPL618mfx8Uje9nnOeKurmk3wKrbYbRvnL5vwnnTbH5iQJkqyK1FXerjEz8ZJ
        zZVP6UTDqn4q6JDRvCj+LjoCbDTKzLY1BLewh6ryBe10j8H8QP+CgW64Y5oDzbedeINO
        u87+dC2uEQyCrxUlg3JHChkOJN1ZJF0j9UBlhKjXPQ5kJmywJsmnzIq8N+bZIGd/1ILI
        9uxQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxaNUO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:36 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 00/12] pinctrl: renesas: R8A779A0 (V3U) device support
Date:   Tue, 12 Jan 2021 17:59:17 +0100
Message-Id: <20210112165929.31002-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU. It depends on the "pinctrl:
renesas: basic R8A779A0 (V3U) support" v3 series posted earlier.

This revision includes one commit message fix as suggested by Geert and
adds a bunch of Reviewed-by and Tested-by tags.

Thanks to Geert and Wolfram for review and testing!

CU
Uli


Changes since v2:
- CAN: fix commit message
- add Reviewed-by/Tested-by tags where applicable

Changes since v1:
- add missing I2C patch
- CAN: rename canfd_clk to can_clk to stay consistent with other SoCs
- DU: add du_sync group
- DU: remove redundant du_cde, du_disp groups
- TMU: add B groups
- MSIOF: add missing msiof{4,5} groups
- add Reviewed-Bys where applicable


Ulrich Hecht (12):
  pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
  pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
  pinctrl: renesas: r8a779a0: Add CANFD pins, groups and functions
  pinctrl: renesas: r8a779a0: Add DU pins, groups and function
  pinctrl: renesas: r8a779a0: Add HSCIF pins, groups and functions
  pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
  pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
  pinctrl: renesas: r8a779a0: Add MSIOF pins, groups and functions
  pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
  pinctrl: renesas: r8a779a0: Add QSPI pins, groups, and functions
  pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
  pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions

 drivers/pinctrl/renesas/pfc-r8a779a0.c | 1788 ++++++++++++++++++++++++
 1 file changed, 1788 insertions(+)

-- 
2.20.1

