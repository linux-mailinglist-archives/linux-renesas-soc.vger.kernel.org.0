Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2661344D4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 18:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhCVR3z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 13:29:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhCVR3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 13:29:25 -0400
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FCDFAD6;
        Mon, 22 Mar 2021 18:29:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616434163;
        bh=ZMr/2Ebu49zq3g//ZjV8Uumh3N4owt/WaBHIU9soE1E=;
        h=From:To:Cc:Subject:Date:From;
        b=MWGL+KRwgQeVEgkfor9H8gWHO79g7JsbsraRLzUVywTZUtzgZKIaijzSgxnp8McR4
         IMJd2HP7M0afdO7NT1zeqsPNBFjN70XpMbBjn4WaKIWI8CDrT4ajDOX4oEcNWMF/O0
         6TV2Bzkxrjz5lkogxEtbFJncylV1tSPFtuHO0E/U=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a779a0: Add VSP support
Date:   Mon, 22 Mar 2021 17:29:17 +0000
Message-Id: <20210322172919.1154686-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide the FCPVD and VSPD for the V3U platform.

Kieran Bingham (2):
  arm64: dts: renesas: r8a779a0: Add FCPVD support
  arm64: dts: renesas: r8a779a0: Add VSPD support

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
2.25.1

