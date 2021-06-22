Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD443B1090
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 01:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhFVX3d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 19:29:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55212 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhFVX3d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 19:29:33 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95564A66;
        Wed, 23 Jun 2021 01:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624404435;
        bh=qxeKyFDrDk0vRpyJBb/WTgyhmJ98KFXY4ZP9cDuOhEg=;
        h=From:To:Subject:Date:From;
        b=QEA5bu3w0G9XLnYVhgF2KtucELC5KSFw2e5/JxtvInq1Ul0v6XwxNIhUyq62IWwjj
         XJWrMhqbP8kEmCa0mKleN3YmbloETMfDozMDVpa4k4SPtQms5YXhRuNK6rmFOB4VvT
         ShiN1XZ0lIeLv2x6kSg3IvPI5zRCzT8nw9xRqXRw=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] clk: renesas: r8a779a0: V3U DU support
Date:   Wed, 23 Jun 2021 00:27:09 +0100
Message-Id: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the V3U DU by updating the required clock functionality.

Kieran Bingham (2):
  clk: renesas: r8a779a0: Add the DU clock
  clk: renesas: r8a779a0: Add the DSI clocks

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.30.2

