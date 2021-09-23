Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A294154F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 03:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbhIWBFj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 21:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbhIWBFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 21:05:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF1AC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Sep 2021 18:04:08 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D837E52;
        Thu, 23 Sep 2021 03:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632359046;
        bh=1MP6mqNObUMSFAxjTnN/BlcRMhT9mWRsl3Yau2lQlsQ=;
        h=From:To:Cc:Subject:Date:From;
        b=nvAKoCFfq5zF4YsueQAYdTa1Q4dUT97dUtzpmnDMducwOUO/OpUArdH8zAgyWuUDz
         H3y+F1Rf9NX3iVFNVSBQlWlW+jUAkIsZSocckFqa1bvSbg/6aCRBjFKBnaQMWJAOD0
         ldvg4dh7cjtg0lTmnR/NFdl8EWwuF0qkVhG9ryIo=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 0/3] arm64: dts: renesas: r8a779a0 DU support
Date:   Thu, 23 Sep 2021 02:03:59 +0100
Message-Id: <20210923010402.3418555-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide the DT nodes for the DU, and DSI found on the r8a779a0, and
extend the falcon-cpu board add on with the TI SN65DSI86 bridge which is
used to connect the DSI output to the mini display-port connector on the
Falcon CPU board.

Kieran Bingham (3):
  arm64: dts: renesas: r8a779a0: Add DU support
  arm64: dts: renesas: r8a779a0: Add DSI encoders
  arm64: dts: renesas: r8a779a0: falcon-cpu: Add DSI display output

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 79 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 94 +++++++++++++++++++
 2 files changed, 173 insertions(+)

-- 
2.30.2

