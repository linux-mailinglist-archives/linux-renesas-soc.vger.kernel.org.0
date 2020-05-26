Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE18C1E1D24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 10:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgEZIU1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 04:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgEZIU1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 04:20:27 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590481227;
        bh=+4333Nk8tPGxJB/V5byMwlxOC3bRnNNVAFuoy1LOXuA=;
        h=Subject:From:Date:To:From;
        b=yO4D1B7oLheJRMh2i7HB4/6SCssLXZnu9mT2EJ9J39GLjh3GxofcTLnT+u+Fvviln
         JkOqh/bgzL0Jp08QrVNqYoyF9yBXehy5DPQbeg02nkpeOK0yyDQgsJwOyRALqKKWHW
         Ox3WbGwpIAS5fNsK7S7OcA9kmesxar/1YJMPktlA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159048122713.23212.18356338560184840050.git-patchwork-summary@kernel.org>
Date:   Tue, 26 May 2020 08:20:27 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Series: iW-RainboW-G21D-Qseven Enable SCIFB2, SDHI2, AVB and RWDT
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=293237
  Link: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
    Patches: [1/4] ARM: dts: r8a7742-iwg21d-q7: Enable scifb2 node
             [2/4] ARM: dts: r8a7742-iwg21d-q7: Enable SDHI2 controller
             [3/4] ARM: dts: r8a7742-iwg21d-q7: Enable Ethernet avb
             [4/4] ARM: dts: r8a7742-iwg21d-q7: Add RWDT support

Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
