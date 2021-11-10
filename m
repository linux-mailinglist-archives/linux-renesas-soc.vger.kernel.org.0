Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A03944C468
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 16:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhKJPeh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 10:34:37 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:9794 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231408AbhKJPeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 10:34:37 -0500
X-IronPort-AV: E=Sophos;i="5.87,224,1631545200"; 
   d="scan'208";a="99810480"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 00:31:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 37F7F40065AE;
        Thu, 11 Nov 2021 00:31:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Add RZ/G2L OSTM support
Date:   Wed, 10 Nov 2021 15:31:39 +0000
Message-Id: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add Generic Timer Module (a.k.a OSTM) support
for RZ/G2L series.

OSTM modules needs to deassert the reset line before accessing
any registers.

v1->v2:
 * Added of_reset_control_get_optional_exclusive API
 * Updated dt-bindings to use renesas,ostm
 * Added reset handling in ostm_init

Biju Das (3):
  reset: Add of_reset_control_get_optional_exclusive()
  dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
  clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support

 .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++--
 drivers/clocksource/renesas-ostm.c            | 37 ++++++++++++++++++-
 include/linux/reset.h                         | 20 ++++++++++
 3 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.17.1

