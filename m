Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6853A5F3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 11:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhFNJmO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 05:42:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232528AbhFNJmM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 05:42:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 11B6061283
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623663610;
        bh=KtnoVdG2hXNHcwt0XLYMiOcW/oO/Bdk2V0+yFgQNJSo=;
        h=Subject:From:Date:To:From;
        b=kbve2x4GibuSpii+871PSARfa3Ijnx99qxSGz/kUnO8MoknqZCMDfySQBkaDqS6U5
         gjSzzfgcSt3jQoGproLBDxDPF+8vIHAs3UQgq9nAFOBmauGr6D/FAP/fq8oO3bjUGb
         R9Evg2TFCnYNPIjSberzZ2lBF5HfTbG7+nRw9o5IrjON42jYjDrez/H019ZRCTjI8/
         xO3P000t6ORgff9tgedKM6HU0z/q71waQ+SVlO2NPqVQxa2z6wTxtYmINjDynuVG1F
         DcfysA8bdt0O4YZB7JFIGIVOFtZxYUoXGDl8SuUcPc+Dx/ExwBcSpIggymMHG/f+YP
         TVZoyd45xTPdA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EEE0B609CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 09:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162366360992.6813.13995988801894952282.git-patchwork-summary@kernel.org>
Date:   Mon, 14 Jun 2021 09:40:09 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: media: dt-bindings: media: renesas,drif: Fix fck definition
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=463711
  Lore link: https://lore.kernel.org/r/20210408202436.3706-1-fabrizio.castro.jz@renesas.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


