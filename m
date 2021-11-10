Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB8444CDD7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 00:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbhKJXcP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 18:32:15 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:7015 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233979AbhKJXcO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 18:32:14 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="99837075"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 08:29:25 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 05DED4143454;
        Thu, 11 Nov 2021 08:29:22 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] RZ/G2L SCI support and sh-sci driver update
Date:   Wed, 10 Nov 2021 23:29:17 +0000
Message-Id: <20211110232920.19198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series updates binding doc to support RZ/G2L and
adds support to perform deassert/assert in sh-sci driver.

Cheers,
Prabhakar

V3:
* Fixed review comments pointed by Geert.

v2:
* https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (3):
  dt-bindings: serial: renesas,scif: Make resets as a required property
  dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
  serial: sh-sci: Add support to deassert/assert reset line

 .../bindings/serial/renesas,sci.yaml          | 46 ++++++++++++++++---
 .../bindings/serial/renesas,scif.yaml         |  1 +
 drivers/tty/serial/sh-sci.c                   | 39 +++++++++++++---
 3 files changed, 73 insertions(+), 13 deletions(-)

-- 
2.17.1

