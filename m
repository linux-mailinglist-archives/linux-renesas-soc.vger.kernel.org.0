Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F8C2623C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 02:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgIIAAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 20:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:42560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgIIAAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 20:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599609645;
        bh=w3f/Itui8MCe/1xd8l0BrCyCW50Mou1aMLFYhs2li64=;
        h=Subject:From:Date:To:From;
        b=dyb7ls4v6l/lEf7KIWoI+rPzxsmVzkQvaQnu2Fcd2sFhvnM2Kne7bequuvz+JJoif
         Mi2YjJhrc9TqtBWj8OLupCtD5vtMZPBL88MNqOPHzLMHNQjNGbDhByy7L0J22pO7zK
         v1k9QhOYLghtDH9g9XUnqurp/Aa0NdV+lKcP/17I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159960964583.21547.1475051339842840514.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 09 Sep 2020 00:00:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] net: phy: call phy_disable_interrupts() in phy_attach_direct() instead (2020-09-08T23:55:38)
  Superseding: [v1] net: phy: call phy_disable_interrupts() in phy_attach_direct() instead (2020-09-08T11:27:20):
    net: phy: call phy_disable_interrupts() in phy_attach_direct() instead


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
