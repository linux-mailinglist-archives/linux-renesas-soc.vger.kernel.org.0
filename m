Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D919264BA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 19:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIJRlj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 13:41:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726957AbgIJRka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 13:40:30 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599759630;
        bh=ZWm0HRO+fKkToboNNLAeyiheCir18CQue/mmAWTUlWg=;
        h=Subject:From:Date:To:From;
        b=QfniQjwr0WMPjnAeIp6K+1QfZdZ+fcJkAzlljl1TYs0vFivXn3xIGEv92PShR5H0g
         F/hLTYkPFhqurZPn/AEeKNkcS8OH915icEGNo0jPGLwHcWWg81hqDjFqbo23jyTnsO
         YKJf/WSgF+gRocrZ7UmPApB138uj0VyXm594LFSQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159975963004.6616.8114355587917977770.git-patchwork-summary@kernel.org>
Date:   Thu, 10 Sep 2020 17:40:30 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: shmobile: rcar-gen2: Make rcar_gen2_{timer_init,reserve}() static
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=345095
  Link: <20200908074403.4379-1-geert+renesas@glider.be>

Patch: arm64: dts: renesas: r8a774e1-hihope-rzg2h-ex: Enable sata
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=344393
  Link: <20200907073214.13929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
