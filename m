Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410F3265D42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 12:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgIKKAs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 06:00:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:56564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgIKKAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 06:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599818445;
        bh=aGNhQOAUuGKbHE1Lg3PUcZHKM6/oTxbJCtqm9TcSw10=;
        h=Subject:From:Date:To:From;
        b=Pcq3k6Nhg/M+sp6J/DETmsPySZv79Wjr23076y35rQzzRmaeecLCLJY1UrpnRWRp9
         2V7HbI/NKuS0piYfBNAAJLua5vSfqupDa06zd6AoVmnlzJ8jNcwzIleINROmRSAFHE
         VldgRNYuFT+BpgDpPE5MPUXKyWgYnILOsGYwp+tE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159981844560.6982.3444380430709278627.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 11 Sep 2020 10:00:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dmaengine: Kconfig: Update description for RCAR_DMAC config (2020-09-11T09:57:34)
  Superseding: [v1] dmaengine: Kconfig: Update description for RCAR_DMAC config (2020-09-08T11:06:40):
    dmaengine: Kconfig: Update description for RCAR_DMAC config


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
