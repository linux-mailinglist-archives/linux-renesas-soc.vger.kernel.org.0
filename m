Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234EE49B492
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 14:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356677AbiAYND4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 08:03:56 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:55557 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1574882AbiAYNA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 08:00:28 -0500
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; 
   d="scan'208";a="107604728"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2022 22:00:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 600934001DDD;
        Tue, 25 Jan 2022 22:00:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Date:   Tue, 25 Jan 2022 22:00:19 +0900
Message-Id: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-drivers-2022-01-11-v5.16.
And, the following patch series which I have submitted today is required to use.

 [PATCH 0/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add IPMMU nodes
  arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

-- 
2.25.1

