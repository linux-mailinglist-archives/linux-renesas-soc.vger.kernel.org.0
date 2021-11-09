Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919F844AD4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 13:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241857AbhKIMTh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 07:19:37 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:44278 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S241839AbhKIMTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 07:19:36 -0500
X-IronPort-AV: E=Sophos;i="5.87,220,1631545200"; 
   d="scan'208";a="99679481"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2021 21:16:49 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ACB5F4392862;
        Tue,  9 Nov 2021 21:16:46 +0900 (JST)
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
Subject: [PATCH v2 0/3] RZ/G2L SCI support and sh-sci driver update
Date:   Tue,  9 Nov 2021 12:16:28 +0000
Message-Id: <20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series updates binding doc to support RZ/G2L and
adds support to perform deassert/assert in sh-sci driver.

Cheers,
Prabhakar

v2:
* Fixed review comments pointed by Geert.

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (3):
  dt-bindings: serial: renesas,scif: Make resets as a required property
  dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
  serial: sh-sci: Add support to deassert/assert reset line

 .../bindings/serial/renesas,sci.yaml          | 44 ++++++++++++++---
 .../bindings/serial/renesas,scif.yaml         |  1 +
 drivers/tty/serial/sh-sci.c                   | 47 +++++++++++++++----
 3 files changed, 78 insertions(+), 14 deletions(-)

-- 
2.17.1

