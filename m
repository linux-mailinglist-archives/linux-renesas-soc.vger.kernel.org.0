Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF02A47D40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfFQIhZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:37:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35000 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFQIhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:37:25 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 68BBA25AED3;
        Mon, 17 Jun 2019 18:37:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 683DE94024A; Mon, 17 Jun 2019 10:37:21 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a7799[05]: Add cpg reset for LVDS Interface
Date:   Mon, 17 Jun 2019 10:37:02 +0200
Message-Id: <20190617083704.3941-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

this short series adds CPG reset for LVS interfaces of the
R-Car E3 (r8a77995) and D3 (r8a77990) SoCs.

Changes since v1
- only add one reset entry per group

Takeshi Kihara (1):
  arm64: dts: renesas: r8a77990: Add cpg reset for LVDS Interface

Yoshihiro Kaneko (1):
  arm64: dts: renesas: r8a77995: Add cpg reset for LVDS Interface

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.11.0

