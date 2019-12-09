Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928D7116B27
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 11:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfLIKgN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 05:36:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:51304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbfLIKgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 05:36:13 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575887773;
        bh=rgybZhYNo++bkqlcmB+5eaLOkA7yIu0oV1xL01m1wSQ=;
        h=Subject:From:Date:References:To:From;
        b=Gc04DZP74Ioibdlm3PQnMUdw1GJ3yqTg58PKyelHG58oKe/pguYWN/pd6m+Q4iW+t
         oiCf6oRQPNUsKMxstIgvMHLdhCAKWTM63tLO8/FGvZtcAKudncA+cP/Jb1TC3npCo6
         fNU41WJ90ebXzXHUnc+gx0MkweUPIKbI+VsV1MV0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157588777318.6568.11721295229201233140.git-patchwork-summary@kernel.org>
Date:   Mon, 09 Dec 2019 10:36:13 +0000
References: <20191209101327.26571-1-geert+renesas@glider.be>,
 <20191209101413.26686-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: ARM: shmobile: defconfig: Restore debugfs support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213533

Patch: [LOCAL] arm64: renesas_defconfig: Refresh for v5.5-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213537

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
