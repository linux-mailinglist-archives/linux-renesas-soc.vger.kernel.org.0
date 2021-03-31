Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F9035009B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Mar 2021 14:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhCaMqd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Mar 2021 08:46:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235434AbhCaMqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Mar 2021 08:46:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F0696198F;
        Wed, 31 Mar 2021 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617194764;
        bh=wcR7EVS00j3kLUJX293YavODkDh9p6za/Q/SMTCbKZM=;
        h=From:To:Cc:Subject:Date:From;
        b=DBjmqJBVZzae1CqFCfu9VV92wR5hz2a9nZOe+mbXGMf07rBzZWlQ0F7D2w4mWWO3y
         1G0FL7jGjNV7WztjHRn3B7NY1K8IyJS9GtMdr7cdpzilydgO7EMqleYb8boqWorPq0
         Nw88nkHAbDAQCTYwgwzJqjrY/B8MPByqGcdxCHhWRRZTcDbPf7XxaDDZT/WNZbvdmh
         9sMQJfIAK5A7EewZ+Te3KPnN2azXbGD3nrcYG4t+yjw89LAll4Hxo/cTBvpsU9862h
         t2942I+ms073LddIpIPPLioQzkaDDvL/kyXWHwDJzoGdrkuPV6GEERdwb/jlzIOq/l
         esweauDwzKikQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: add r8a779a0 TMU support
Date:   Wed, 31 Mar 2021 14:45:55 +0200
Message-Id: <20210331124555.2150-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v1:
* rebased to -next (other SoCs have been added meanwhile)
* added tags from Niklas and Geert (thanks!)

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index f0f0f121c355..c57169118b68 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -36,6 +36,7 @@ properties:
           - renesas,tmu-r8a77980 # R-Car V3H
           - renesas,tmu-r8a77990 # R-Car E3
           - renesas,tmu-r8a77995 # R-Car D3
+          - renesas,tmu-r8a779a0 # R-Car V3U
       - const: renesas,tmu
 
   reg:
-- 
2.30.0

