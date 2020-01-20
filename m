Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B7E1428AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 12:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgATLAb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 06:00:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:56664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726775AbgATLAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 06:00:30 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579518030;
        bh=0Hqu7kjxAbISfh2UwXWOMzt9SLqiMdGy4Utm/OEzx3U=;
        h=Subject:From:Date:References:To:From;
        b=0ZtJ++UKBVsdhyIza5NYsx+8vhYR+pK8UOhz/GwzoQBSa1CaIKeNJz34Mi1zV0k0T
         v2l2xDWaOA302PYgvLOW5GIaoBu9FlLn6dIxclWwR61u16j7B+ldC0PdYDhXx9jCfi
         kaXK3ZZD2VlEF8QXVr0mZmKPjcS8uLTK7yMo08Hg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157951803017.14986.18184816727585219822.git-patchwork-summary@kernel.org>
Date:   Mon, 20 Jan 2020 11:00:30 +0000
References: <5f03e777-6838-f70d-31bc-2046d253c11a@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [net] sh_eth: check sh_eth_cpu_data::dual_port when dumping registers
  Submitter: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=225633

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
