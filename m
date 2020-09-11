Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D96265C59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 11:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgIKJUc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 05:20:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgIKJUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 05:20:31 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599816030;
        bh=POSNF514W8yJBikwda/nw1kW2E64wdZMlJfzJ6xAsF0=;
        h=Subject:From:Date:To:From;
        b=kPbQuw20912iRPQ2BCrUKAeWGZqrtQ4gncjT4687PfZsEp9uIqlFqT8pDnOrUlyVb
         A9veZ654idrFFdnkMIcHUpjwPpjH5VYahdQX1IDx+PadmsZmc7+B9CVxdrELG4KPIu
         JZ8DWkHE75pf7u/H7jTi5YNzfYI2Rtk5CoAHcRAs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159981603075.8325.5198552482943352475.git-patchwork-summary@kernel.org>
Date:   Fri, 11 Sep 2020 09:20:30 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: Fix pin controller node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=336507
  Link: <20200821112433.5652-1-geert+renesas@glider.be>

Patch: ARM: dts: renesas: Fix pin controller node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=336515
  Link: <20200821112351.5518-1-geert+renesas@glider.be>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
