Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFFB48958D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 10:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243226AbiAJJry (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 04:47:54 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27099 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S243074AbiAJJru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 04:47:50 -0500
X-IronPort-AV: E=Sophos;i="5.88,276,1635174000"; 
   d="scan'208";a="106545246"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jan 2022 18:47:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 14D224238F18;
        Mon, 10 Jan 2022 18:47:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
Date:   Mon, 10 Jan 2022 09:47:06 +0000
Message-Id: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series does code cleanup and fixes to the rz-ssi driver.

Cheers,
Prabhakar

Lad Prabhakar (5):
  ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
  ASoC: sh: rz-ssi: Make the data structures available before
    registering the handlers
  ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
  ASoC: sh: rz-ssi: Make return type of rz_ssi_stream_is_valid() to bool
  ASoC: sh: rz-ssi: Add functions to get/set substream pointer

 sound/soc/sh/rz-ssi.c | 147 ++++++++++++++++++++++++------------------
 1 file changed, 86 insertions(+), 61 deletions(-)

-- 
2.17.1

