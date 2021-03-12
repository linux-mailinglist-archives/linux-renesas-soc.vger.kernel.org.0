Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0AF338421
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 03:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhCLCyk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 21:54:40 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:28562 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231776AbhCLCyd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 21:54:33 -0500
X-IronPort-AV: E=Sophos;i="5.81,241,1610377200"; 
   d="scan'208";a="74923381"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Mar 2021 11:54:31 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C44E64189CCF;
        Fri, 12 Mar 2021 11:54:31 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] treewide: Add CAN support for r8a77961
Date:   Fri, 12 Mar 2021 11:54:18 +0900
Message-Id: <20210312025420.529339-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-drivers-2021-02-16-v5.11 tag.
And, Goda-san tested this patch series on R-Car M3-W+ StarterKit board
with Kingfisher. (Thank you Goda-san!)

Yoshihiro Shimoda (2):
  dt-bindings: net: can: rcar_can: Document r8a77961 support
  arm64: dts: renesas: r8a77961: Add CAN nodes

 .../devicetree/bindings/net/can/rcar_can.txt  |  1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 26 +++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.25.1

