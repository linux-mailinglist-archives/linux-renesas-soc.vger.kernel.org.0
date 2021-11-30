Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD78C463C10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 17:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238257AbhK3Qqg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 11:46:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44234 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhK3Qqf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 11:46:35 -0500
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5FA68F0;
        Tue, 30 Nov 2021 17:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638290595;
        bh=z+LMhuJyOl8XHS0H27olkHCBfyz5TIWRovjEH5gs5MI=;
        h=From:To:Cc:Subject:Date:From;
        b=TYfN4JFFSWcFHch25cbgCI7yBywqY0ZXW/qYw91DQ1D3DxCltYJ7szXDbss0daSIQ
         CwWMgM0bpMTgGyI4WeH6G2SDPd+mR5sdm5boWxhU/8GN+YEV8WpB4sKO69XAY4sbL1
         SAmHtBFQNT2I5PFJEOUZEvnzz24kn79dq6jRHp88=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v5 0/2] arm64: dts: renesas: r8a779a0 DU support
Date:   Tue, 30 Nov 2021 16:43:09 +0000
Message-Id: <20211130164311.2909616-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide the DT nodes for the DSI found on the r8a779a0, and extend the
falcon-cpu board add on with the TI SN65DSI86 bridge which is used to
connect the DSI output to the mini display-port connector on the Falcon
CPU board.

This has been successfully tested on a Falcon-V3U with patches to the
rcar_du and sn65dsi86 which will be sent separately.

Since the previous version, the core "r8a779a0: Add DU support" has
already been accepted into the renesas-drivers tree, and the "r8a779a0:
Provide default DSI data-lanes" patch has been dropped in favour of a
better construction in the two patches supplied here.

Kieran Bingham (2):
  arm64: dts: renesas: r8a779a0: Add DSI encoders
  arm64: dts: renesas: r8a779a0: falcon-cpu: Add DSI display output

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 79 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 60 ++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.30.2

