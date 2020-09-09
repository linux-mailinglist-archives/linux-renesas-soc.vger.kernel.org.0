Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68B52626FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 08:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgIIGAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 02:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIGAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 02:00:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599631247;
        bh=Dta82sFVyPQ0sal8DVkbjwTN0sHph0s7uY+XDI+8/NU=;
        h=Subject:From:Date:To:From;
        b=IVRCp64gI0DQL6xj/sfa58TMBZdZ0MdM5LkQ1qgkv3MOTpbkYl2AlXvztdlhwClvg
         MDs3U/ZwkeBcmjAxb9tPyexRX9zZ5oDnb/u/5LcPC6RRcJzW/M1OOcIn/3I3vjRBMb
         xUxgnm/c8fLplv4h3UTm8Fai/AakzLKBH/m3Z9n0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159963124703.29008.15132689370986755035.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 09 Sep 2020 06:00:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] net: phy: call phy_disable_interrupts() in phy_attach_direct() instead (2020-09-09T05:43:14)
  Superseding: [v2] net: phy: call phy_disable_interrupts() in phy_attach_direct() instead (2020-09-08T23:55:38):
    [v2] net: phy: call phy_disable_interrupts() in phy_attach_direct() instead


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
