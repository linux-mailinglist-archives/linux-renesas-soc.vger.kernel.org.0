Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4DD2DC2F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 16:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgLPPUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 10:20:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42104 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgLPPUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 10:20:23 -0500
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A20C52CF;
        Wed, 16 Dec 2020 16:19:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608131981;
        bh=puqGc6l1gMEZrDCZK7XfxsTzRYfb1lvbfHm83JHmGew=;
        h=From:To:Cc:Subject:Date:From;
        b=ppiTrWPqTBB2uT9c6UVDnKLDd5j57selME+pkc1Riga0UXJamSVoVuT/gUVPOkkiN
         m1fm2jlBfzZ4tTpFcUmm6IjciusH1aPuTMi2QFFZtRhc/SFVkA+gWm0m48JKGz8XTU
         g6i4FVMmOtjctdpm1BhT/Mhjqdw8O+/e5A1fBXJQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/3] clk: renesas: r8a779a0: Add FCP and VSP support
Date:   Wed, 16 Dec 2020 15:19:28 +0000
Message-Id: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide clocks for the FCP and VSP-{X,D} modules on the V3U.

There are also corresponding FCPvX for fcpvx{0,1,2,3} in register 11;
however I have not been able to ascertain the clock domains for those so
they are not included in this series.


Kieran Bingham (3):
  clk: renesas: r8a779a0: Add FCPVD clock support
  clk: renesas: r8a779a0: Add VSPD clock support
  clk: renesas: r8a779a0: Add VSPX clock support

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.25.1

