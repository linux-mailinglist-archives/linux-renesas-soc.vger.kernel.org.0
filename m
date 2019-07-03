Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045365E00B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2019 10:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfGCIlk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jul 2019 04:41:40 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbfGCIlk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jul 2019 04:41:40 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 51E6125AEEC;
        Wed,  3 Jul 2019 18:41:38 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 64EAA9403B8; Wed,  3 Jul 2019 10:41:36 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: Rename file of DT bindings for Renesas memory controllers
Date:   Wed,  3 Jul 2019 10:41:06 +0200
Message-Id: <20190703084106.484-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas R-Mobile and SH-Mobile
memory controllers documentation file from renesas-memory-controllers.txt
to renesas,dbsc.txt.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../{renesas-memory-controllers.txt => renesas,dbsc.txt}                  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/memory-controllers/{renesas-memory-controllers.txt => renesas,dbsc.txt} (100%)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas-memory-controllers.txt b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/memory-controllers/renesas-memory-controllers.txt
rename to Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt
-- 
2.11.0

