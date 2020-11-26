Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C562C5A81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391688AbgKZR1K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:27:10 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:14203 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391687AbgKZR1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411629;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Q4/YfvB/uc+4ydaLVE7Yv1Yo0G8rM2s+nZ8w7n8utCc=;
        b=LDcur+Cnbb1RNhdxCY8bMmKkpZZUjRnmZVJqvN+EpAp1QMrFDfxuwE2Mrgj9dN5ZjY
        Iw8xx1jTMwSYEqowSbJpJWcEQS3oI6RuG8ALzKa5etICmZcr2wRC3/TNBm2DdJ6TfpA+
        OGIsSgUM+P6ysYz/4A6+V7hC5aC6JTqnExLRNcTUm9jPSqwFGDf7P2HQgrXV3WngxFq7
        wxzwBm46KMAh8vCtcxzKKc2E19sUC8cNmx8BGBMUHUxwT9RdMK57Z7jPQWjNMMFFHl5t
        9bPpXIL9qZ7Nl3XtACXNw0pX58hf743ajzwG8BV/v3nAre5wm93la8HWSFFBv0UivLtq
        8NkQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHL2MpL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:21:02 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 0/3] pinctrl: renesas: basic R8A779A0 (V3U) support
Date:   Thu, 26 Nov 2020 18:20:55 +0100
Message-Id: <20201126172058.25275-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series provides basic V3U pin control support, up to and including the
SCIF pins.

The driver has been ported from the BSP. I have done compile and unit tests,
but have not tried it on actual hardware yet.

CU
Uli


Ulrich Hecht (3):
  pinctrl: renesas: implement unlock register masks
  pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
  pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions

 drivers/pinctrl/renesas/Kconfig        |    5 +
 drivers/pinctrl/renesas/Makefile       |    1 +
 drivers/pinctrl/renesas/core.c         |   34 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 2672 ++++++++++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h       |    1 +
 5 files changed, 2703 insertions(+), 10 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c

-- 
2.20.1

