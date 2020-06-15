Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EE61F9661
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 14:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbgFOMQ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 08:16:27 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58031 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbgFOMQ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 08:16:26 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8526F10001B;
        Mon, 15 Jun 2020 12:16:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] scripts/boards.sh: Add support for M3-W+ SoC
Date:   Mon, 15 Jun 2020 14:19:34 +0200
Message-Id: <20200615121935.108142-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615121935.108142-1-jacopo@jmondi.org>
References: <20200615121935.108142-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Identify the M3-W+ R8A77961 SoC in scripts/boards.sh.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/boards.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 2069494..84361d9 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -14,6 +14,7 @@ case $info in
         csis="20 40 41"
         ;;
     "Renesas Salvator-X board based on r8a77960" | \
+        "Renesas Salvator-X 2nd version board based on r8a77961" | \
         "Renesas Salvator-X 2nd version board based on r8a77965")
         gen="gen3"
         vins="0 1 2 3 4 5 6 7"
-- 
2.27.0

