Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC15F3979
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfKGUUu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:57598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbfKGUUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:20:49 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573158049;
        bh=xOtvzl2oJcQXfueASU29sBzmm3kImw8gErMXrh+tHo4=;
        h=Subject:From:Date:To:From;
        b=J11n3xGF5JNE4rZBWzhdI6aRqlxHjiJ+7oPmY20XAfcX5MwDpmH/Ypk5Zbovp8Bit
         PX9/LAvOpK5Scph/gXKndapFoI6zD5XtTbKeA2pL2SGdno20/57SJ688VQt2pKtzWs
         oEwQzjIU4VXi2Zt1Wo8RnPJrudAdvvOSGx2FFMBI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157315804921.23440.15618578058573219731.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 07 Nov 2019 20:20:49 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] Add LCD panel support to iwg20d (2019-11-07T20:10:56)
  Superseding: [v2] Add LCD panel support to iwg20d (2019-11-04T16:57:59):
    [v2,1/4] drm/bridge: Repurpose lvds-encoder.c
    [v2,2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
    [v2,3/4] ARM: dts: iwg20d-q7-common: Add LCD support
    [v2,4/4] ARM: shmobile_defconfig: Enable support for panels from EDT


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
