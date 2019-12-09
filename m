Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95684116B1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 11:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfLIKdW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 05:33:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727444AbfLIKdW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 05:33:22 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575887602;
        bh=zxmWsMSjpbG5rvKjG8uM3dSKdp1RAhXwcecQ7LKcAEg=;
        h=Subject:From:Date:References:To:From;
        b=mB20b7NdrYi8NLl1SloHrKBDQIciJssyV3hDd8Hu4rKcI5RcH2XPdSCehk9WJ9NT5
         W2Ua9VHmj2G6GQCdtYJ1vjmDLP9SskQ/GdM8pTEjsB7UBoYEEn6/S0l4wqMjpk4i7B
         +4ff233Tbsr+Q07Reh3b8o504hnX+QzxeXCwCDzw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157588760215.6568.1930861062120792298.git-patchwork-summary@kernel.org>
Date:   Mon, 09 Dec 2019 10:33:22 +0000
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>,
 <1564571048-15029-1-git-send-email-lowry.li@arm.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: dt-bindings: timer: renesas: tmu: Document r8a774b1 bindings
  Submitter: Biju Das <biju.das@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=177599

Series: Free the writeback_job when it with an empty fb
  Submitter: Lowry Li (Arm Technology China) <lowry.li@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=153341
    Patches: [v1,1/2] drm: Free the writeback_job when it with an empty fb
             [v1,2/2] drm: Clear the fence pointer when writeback job signaled

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
