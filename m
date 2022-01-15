Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71DA48F40E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jan 2022 02:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbiAOBXP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jan 2022 20:23:15 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:50400 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231298AbiAOBXP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 20:23:15 -0500
X-IronPort-AV: E=Sophos;i="5.88,290,1635174000"; 
   d="scan'208";a="106547795"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jan 2022 10:23:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D236417EAC6;
        Sat, 15 Jan 2022 10:23:12 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
Date:   Sat, 15 Jan 2022 01:22:58 +0000
Message-Id: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
  ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to
    bool
  ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function

 sound/soc/sh/rz-ssi.c | 107 +++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 53 deletions(-)

-- 
2.17.1

