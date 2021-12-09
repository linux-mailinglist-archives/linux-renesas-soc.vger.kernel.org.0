Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50ED946E2F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 08:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbhLIHL6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 02:11:58 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:54429 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233510AbhLIHL5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 02:11:57 -0500
X-IronPort-AV: E=Sophos;i="5.88,191,1635174000"; 
   d="scan'208";a="102895988"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Dec 2021 16:08:23 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E9AC641F8153;
        Thu,  9 Dec 2021 16:08:22 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     geert+renesas@glider.be, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] tty: serial: sh-sci: Add support for R-Car S4
Date:   Thu,  9 Dec 2021 16:08:15 +0900
Message-Id: <20211209070817.1223888-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the latest tty/tty-next branch.

Changes from v2:
 - Rebase this patch series on the latest tty/tty-next.
 - Submitted sh-sci related patches only.
 - Add Reviewed-by in the dt-bindings patch.

Yoshihiro Shimoda (2):
  dt-bindings: serial: renesas,scif: Document r8a779f0 bindings
  tty: serial: sh-sci: Add support for R-Car Gen4

 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 7 +++++++
 drivers/tty/serial/sh-sci.c                                | 3 +++
 2 files changed, 10 insertions(+)

-- 
2.25.1

