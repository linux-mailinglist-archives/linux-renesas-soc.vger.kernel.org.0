Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6204428DE25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 11:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgJNJ64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 05:58:56 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38504 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbgJNJ5l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:57:41 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BEC8D3B71A9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 09:41:23 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F162B1C001B;
        Wed, 14 Oct 2020 09:40:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: media: renesas,vin: Add V3U support
Date:   Wed, 14 Oct 2020 11:44:42 +0200
Message-Id: <20201014094443.11070-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add compatible string definition for R-Car V3U.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index ad2fe660364b..7b629a6ea035 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -51,6 +51,7 @@ properties:
               - renesas,vin-r8a77980 # R-Car V3H
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
+              - renesas,vin-r8a779a0 # R-Car V3U

   reg:
     maxItems: 1
--
2.28.0

