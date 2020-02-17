Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED63E1611ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 13:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgBQMUb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 07:20:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:59454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726932AbgBQMUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 07:20:31 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581942030;
        bh=k6WKVBLM0iyVPmAL34wCI3mF/CTsnxP9NaoTb/a4/js=;
        h=Subject:From:Date:References:To:From;
        b=p6LYbEGHdWJZUlZjLEeQ2Wku9ru9bVvQj/6oSRZxtJHT17+pHT2YKimQQGkq3O/RJ
         GoDCiIpiJTKFDtLOfLq0PS1HXWA2sStY1JRnWy4Ib0xTN9yn+JMcJE0exSkugDG/Cz
         cdvSUh7Rfe/D/j9R0/H23jrIldqN1VOeCDbxwfjo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158194203079.8066.9365416181236830289.git-patchwork-summary@kernel.org>
Date:   Mon, 17 Feb 2020 12:20:30 +0000
References: <20200118124856.GA3421@nishad>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: soc: renesas: rcar-sysc: Use the correct style for SPDX License Identifier
  Submitter: Nishad Kamdar <nishadkamdar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=230281

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
