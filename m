Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06F52DFE6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgLUQ6o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:44 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:18071 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgLUQ6n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569750;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=lsmtXkwFurg421VTbWyrxoDF2x/6fGXvAr+PJ173nng=;
        b=dMI6wOK+0eoR3J5cOcJ+7sFCE9gYfToVwKflnPHv6JeYGtRe3M9EsjUHox16XAkGzv
        ZzZyaj0B9Lfsx34SYq+kD0FJDH2sTCWrFwEjEeTKNbFPxeL4CanbwYE2nqPlsDCR9q5V
        W0xgiaNAeXn1/FV0v+mWGHwNCUcFOEmhlPTtJ1yIsfySaudiSMN5BxGdN6qeH8KHwwLJ
        K0nzRu9J/wEr9aDpjrNm9Kaj27K1ft13wA8Hjy7KUnal9n0YNx/aiL/RttMSf6tYCJA7
        SGlaRqfjeyYRWIYCpam12jW5VzkZfC68IjXVwUyECRm8G40UZhQHl5bqAgfp/wQUOIbN
        tEvg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGtj0KN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:45 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 00/12] pinctrl: renesas: R8A779A0 (V3U) device support
Date:   Mon, 21 Dec 2020 17:55:29 +0100
Message-Id: <20201221165541.27679-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU. It depends on the "pinctrl:
renesas: basic R8A779A0 (V3U) support" series posted earlier.

This revision includes fixes for the issues found by Geert in his review;
see below for details.

CU
Uli


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

