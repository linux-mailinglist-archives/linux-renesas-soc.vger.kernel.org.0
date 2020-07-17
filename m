Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72594223661
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgGQIA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:00:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:47408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgGQIA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:00:26 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594972826;
        bh=Hz6sWIiL7XozF3DAvMuRIHsWC2aBHwufA/p0oyGU2Y4=;
        h=Subject:From:Date:To:From;
        b=oNNfbvNHqcFwmy87KXrFfrz6Eo3gnp3VEB0ZwCb90Ldnvg3Yai/cQCt6iehoYU3Yn
         R/zDrPWj+QguBGdqsaD93OA6ZyN/rwYTwUKbzb1gids/Wew56vj7OFcIBZeL7IZHpM
         TJUESXYM/4nU16s+eB9Drz9AXufYO2foQ+u/Zdbg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159497282661.2553.15782492833393723821.git-patchwork-summary@kernel.org>
Date:   Fri, 17 Jul 2020 08:00:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: sh73a0: Add missing clocks to sound node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=289995
  Link: <20200519075525.24742-1-geert+renesas@glider.be>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
