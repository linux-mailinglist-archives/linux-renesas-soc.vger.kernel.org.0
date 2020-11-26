Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6177E2C5A83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391670AbgKZR17 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:27:59 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:16693 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391347AbgKZR17 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411678;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=k5JOWTy3QxI7WVOocCw0MKMvftvz6NJfEFSIxUiwzds=;
        b=Z1K+GVL7jxsNuvyY8fjFzxyJQ17qPLf2yeK/5PPtDYwe2AcQ+k0gPSoSxNRSl1I5ie
        +V+OdqHCZEvCQmkBZF1J8OlnScpqYjZ2R25yXGOp9IAR3rsiEIEaYK/6nOoRBtJjil95
        wHn/izy3XrnSJXCxeoXzB3Y/kJakjqTo/MhEobw30z+44Evnif9AoJJ475xSA5GDns2s
        gXw5hRZa/rdxESFFIiZPS5B3Dfu3AbKpnhggxSEcPvLnzNHy6CPWtyF3Nrj3oEWpAiC8
        lUzXUSGvz4xiqFshobq+otyJXtFADXpAYPt3KDVsQnJsVGJ1K3qYPo29j8uuwLb5XavT
        kNoA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHLwMpd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:21:58 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 00/11] pinctrl: renesas: R8A779A0 (V3U) device support
Date:   Thu, 26 Nov 2020 18:21:43 +0100
Message-Id: <20201126172154.25625-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU.

It has been ported from the BSP and has been compile-tested only. It
depends on the "pinctrl: renesas: basic R8A779A0 (V3U) support" series
posted earlier.

CU
Uli


Ulrich Hecht (11):
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

 drivers/pinctrl/renesas/pfc-r8a779a0.c | 1641 ++++++++++++++++++++++++
 1 file changed, 1641 insertions(+)

-- 
2.20.1

