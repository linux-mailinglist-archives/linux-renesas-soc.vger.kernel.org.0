Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3108F14A5E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 15:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgA0OUe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 09:20:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:58686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbgA0OUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 09:20:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580134834;
        bh=m4ebqHwC4BktsONe0YAOSuJjVrzZqy5YQOXvsnAll4Y=;
        h=Subject:From:Date:To:From;
        b=JdpMeZeYnxB4rbTdsv0l75bt3ZOfRcO3U4I/zyan2xyqcQoaOypfieA+8ER87lQWo
         VVv1gva4kbNcbI1HP9Riwxl/TiqqodNbHY5OOeF4q0SncK8mrsjQTPOs96PvV7LUq5
         ffw1fmyJ57MgCYVZ6rRi/UaNo5caAJIAqBlTkRvE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158013483418.30685.9798034188865862172.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 27 Jan 2020 14:20:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ARM: boot: Obtain start of physical memory from DTB (2020-01-27T14:07:16)
  Superseding: [v1] ARM: boot: Obtain start of physical memory from DTB (2020-01-21T19:27:41):
    ARM: boot: Obtain start of physical memory from DTB


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
