Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C791BB8FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 10:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgD1Ik1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 04:40:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:55340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbgD1Ik0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 04:40:26 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588063226;
        bh=h+E8hXRAYMht7jnwr4sV5GHHpCdQfO8Vs5cO6IIqBsM=;
        h=Subject:From:Date:To:From;
        b=B9H80+EBL9F/WQMS94a0Hy3Atq/WDIbwjH8I8zBLpqAvtS6lex/MskCPglyoqLIvK
         Wk6+KvRf5/gOtQQVaY5Ls0c7t9gh+A1JjmggHGy6xB/bElL9VKcG1d0aqYOorFSZff
         LRPmz24+K7KsH9H8/UaUQkqoBFi892louFbuW1hM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158806322652.2370.11934620991784656372.git-patchwork-summary@kernel.org>
Date:   Tue, 28 Apr 2020 08:40:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: r7s9210: Remove bogus clock-names from OSTM nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=278199
  Link: <20200427192932.28967-1-geert+renesas@glider.be>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
