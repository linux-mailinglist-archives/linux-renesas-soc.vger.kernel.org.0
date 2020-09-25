Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C332781CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Sep 2020 09:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgIYHk3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Sep 2020 03:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgIYHk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 03:40:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601019629;
        bh=Vq8zRwh2vXJOVfnz3XbV94nBa3Kor3xmttcMEg2cLBM=;
        h=Subject:From:Date:To:From;
        b=mOs/cISc0PdkP6/6x74Aps5Aa2pxxGCmEF3r9CbyuTeTazGiBdi84ES29gt2172Co
         IH09XUmkk5ymb+vDzwcHTJ952YEusGSxMtFez539aIhNg2kbpZX4brClqKfbIM8QQi
         syjy1TRw8RqKV97vxY4o+mblo11n/4sSb6ZIyFeo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160101962909.28293.5466159455215683184.git-patchwork-summary@kernel.org>
Date:   Fri, 25 Sep 2020 07:40:29 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=354693
  Link: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
