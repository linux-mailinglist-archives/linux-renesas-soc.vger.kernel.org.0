Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FAD45EAF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376565AbhKZKFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376708AbhKZKDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:03:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD5DC061375
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 01:54:50 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5B3DE2C;
        Fri, 26 Nov 2021 10:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637920489;
        bh=TkM/qrUat4A8RJEClwFvcIPc77AgEITQhIQ91THF/4c=;
        h=From:To:Cc:Subject:Date:From;
        b=CGlao/bjc3pUUqWNb7J4mgw3P5ZdsBM8auTpgt5ma2m2LiDMWuyn1THheSAwPQkZS
         CGo0nXv/Pi+sLXe82eI71aFzWefBl/R2xZEwAvHwT2Sq4Gj7CKRmI0D/5xZc9zSDHI
         t+7VktJpwpEYew99u5Npe8T/hSeM/a8H74l2tzzE=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 0/4] arm64: dts: renesas: r8a779a0 DU support
Date:   Fri, 26 Nov 2021 09:54:41 +0000
Message-Id: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
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

This has been successfully tested on a Falcon-V3U with patches to the
rcar_du and sn65dsi86 which will be sent separately.

Patch 4 could be expected to be merged with patch 2, but I have kept it
separate for specific review. It can stay separate or be squashed if the
change itself is approved.

Kieran Bingham (4):
  arm64: dts: renesas: r8a779a0: Add DU support
  arm64: dts: renesas: r8a779a0: Add DSI encoders
  arm64: dts: renesas: r8a779a0: falcon-cpu: Add DSI display output
  arm64: dts: renesas: r8a779a0: Provide default DSI data-lanes

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 79 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 99 +++++++++++++++++++
 2 files changed, 178 insertions(+)

-- 
2.30.2

