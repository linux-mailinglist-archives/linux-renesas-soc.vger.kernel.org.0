Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D9E121AC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 21:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfLPUUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 15:20:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:42254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727016AbfLPUUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 15:20:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576527637;
        bh=CkhGeRQxgLsvI7ODR2bAjRiL5eSVvqvnLQSWFAWjX/c=;
        h=Subject:From:Date:To:From;
        b=Ss9on7yLb1Mtxy5cc4EmKX+Z4v4K5vNNTcfw/NHBxLprdhXv3JrSR9BkyxnDWp963
         +7VkJOO6JJTnlOPKfL3bR40fwkoeIalBfkKOf81NAX6SI7r3SauQXN1UEDc0V9Se4N
         TNCsB8TzSjBbKDVDpmnz2BvqWwgAaHSjV3r3NYfo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157652763790.5806.16198189904407449609.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 16 Dec 2019 20:20:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] Add dual-LVDS panel support to EK874 (2019-12-16T20:12:28)
  Superseding: [v4] Add dual-LVDS panel support to EK874 (2019-12-06T16:32:47):
    [v4,1/7] drm: of: Add drm_of_lvds_get_dual_link_pixel_order
    [v4,2/7] drm: rcar-du: lvds: Improve identification of panels
    [v4,3/7] drm: rcar-du: lvds: Get dual link configuration from DT
    [v4,4/7] drm: rcar-du: lvds: Allow for even and odd pixels swap
    [v4,5/7] drm: rcar-du: lvds: Fix mode for companion encoder
    [v4,6/7] dt-bindings: display: Add idk-2121wr binding
    [v4,7/7] arm64: dts: renesas: Add EK874 board with idk-2121wr display support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
