Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7033510010C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 10:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRJUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 04:20:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:33358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbfKRJUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 04:20:33 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574068833;
        bh=+iZOfGnZ7vYp21kvfcHutjetgYhHeZVjzxUMsYg9J6I=;
        h=Subject:From:Date:References:To:From;
        b=HOm0PSUh5+8s9l5I8ChR8dsPoZww3udeZGirDZrmuqzTcLVuV9cxjfBPlBvSZ1mhj
         c8ZYbKBSq5B9V7HnFBM8BSTt0+2onMPSZykctWjSXwmg68OYtPKMp4OE9zrKcgCa/3
         Jdgar7tSJys7lVGCB0ue2a6u9XU7yyyW5yACxXQM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157406883311.20815.10308160276046066269.git-patchwork-summary@kernel.org>
Date:   Mon, 18 Nov 2019 09:20:33 +0000
References: <20191016143003.28561-1-geert+renesas@glider.be>,
 <20191114014949.31057-1-uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: clocksource/drivers/sh_mtu2: Do not loop using platform_get_irq_by_name()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=188637

Patch: [v4] ravb: implement MTU change while device is up
  Submitter: Ulrich Hecht <uli+renesas@fpond.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=202751

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
