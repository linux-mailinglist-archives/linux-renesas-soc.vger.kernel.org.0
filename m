Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258DA8854B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 23:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfHIVv7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 17:51:59 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41658 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfHIVv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 17:51:59 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 98D6F25AEE2;
        Sat, 10 Aug 2019 07:51:56 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 6A8DCE21E01; Fri,  9 Aug 2019 23:51:53 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: ata: sata_rcar: Rename bindings documentation file
Date:   Fri,  9 Aug 2019 14:51:31 -0700
Message-Id: <20190809215131.877-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename the bindings documentation file for Renesas SATA controller
from sata_rcar.txt to renesas,rcar-sata.txt

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 .../devicetree/bindings/ata/{sata_rcar.txt => renesas,rcar-sata.txt}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/ata/{sata_rcar.txt => renesas,rcar-sata.txt} (100%)

diff --git a/Documentation/devicetree/bindings/ata/sata_rcar.txt b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ata/sata_rcar.txt
rename to Documentation/devicetree/bindings/ata/renesas,rcar-sata.txt
-- 
2.11.0

