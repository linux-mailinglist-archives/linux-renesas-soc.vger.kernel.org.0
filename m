Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B403F3FE69D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 02:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhIAXyh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 19:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhIAXyg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 19:54:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A69CC061575
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Sep 2021 16:53:37 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E6F3340;
        Thu,  2 Sep 2021 01:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630540415;
        bh=EPoMYA6pbtvdCNQ5Au2lvenR+/JCZbv4uT+M6AicYew=;
        h=From:To:Cc:Subject:Date:From;
        b=tM1DXpVwUWJwLtzPG8W4sfbtMQI2CzRFGXZ6H+zijghISFqfjtJt6TTeZsRkWyONU
         JtqV5xGca3MFDYy9o+Ys7d3HNp2zHdDsl0iRoKMQzwCUM2RkdiM4GoQBj5PGbKj6GO
         Ey/+RZnZLF6bAxem/zhV0vAp5W1qnK+MIuVocNtQ=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/3] arm64: dts: renesas: r8a779a0 DU support
Date:   Thu,  2 Sep 2021 00:53:27 +0100
Message-Id: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
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
  arm64: dts: renesas: falcon-cpu: Add DSI display output

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 84 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 90 +++++++++++++++++++
 2 files changed, 174 insertions(+)

-- 
2.30.2

