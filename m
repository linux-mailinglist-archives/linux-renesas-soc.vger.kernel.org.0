Return-Path: <linux-renesas-soc+bounces-896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE880D2FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E6B1F21693
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076A54CDEB;
	Mon, 11 Dec 2023 16:57:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA8F3D8;
	Mon, 11 Dec 2023 08:57:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,268,1695654000"; 
   d="scan'208";a="189940373"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Dec 2023 01:57:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.141])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 01A95400A8A6;
	Tue, 12 Dec 2023 01:57:10 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] Add polling support for DA9063 onkey driver
Date: Mon, 11 Dec 2023 16:57:05 +0000
Message-Id: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
populated by default. This patch series aims to add polling support
by parsing the polling interval from device tree and then detect
short key press and long press key.

Biju Das (3):
  Input: da9063 - Simplify obtaining OF match data
  Input: da9063 - Use dev_err_probe()
  Input: da9063 - Add polling support

 drivers/input/misc/da9063_onkey.c | 153 ++++++++++++++++++------------
 1 file changed, 92 insertions(+), 61 deletions(-)

-- 
2.25.1


