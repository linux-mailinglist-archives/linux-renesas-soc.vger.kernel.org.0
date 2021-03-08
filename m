Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2BC330ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 11:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhCHKAW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 05:00:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:56240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230165AbhCHKAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 05:00:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C0EA364E92
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615197619;
        bh=1BGABEqTY+gEq9N43lATy93EB2MkyIvTHu3p/Ugxg2Q=;
        h=Subject:From:Date:To:From;
        b=MLaHvMA5VmZIibLGXqYC+i1MXdEsahA/5lYg6YmpHSDd1MhOpAzzr+icyrZ3KhHUO
         4LgLQHgnBpiKpINmOGZKw+BVw22sAngWxX6U0guFqHnqOpUo8+zdyZfBys+RXKgz/o
         3QbbJgOROnKc9TmVWsKBsHIK06hub7Yrg0ohhkhWjiziWY07MpFtZ0qgBZOy577hhD
         UepOtUr3ihpgnRl3LmtS9nH+8fxNTndf2TtCnale6BsU47b9sqo2Ocbo0lpGIaO99x
         FSHlJhLvY3jDQIvF92V6fwNWgXKlK7p8JDOLJ+ZXpKKIECtqAY5484GVIf0J8oTusM
         F26sLEkag+1BQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AF4856098E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 10:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161519761965.3691.9689998614340121271.git-patchwork-summary@kernel.org>
Date:   Mon, 08 Mar 2021 10:00:19 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [v2] dts: remove c6x dts link
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=439885
  Lore link: https://lore.kernel.org/r/20210301113920.3042-1-wsa+renesas@sang-engineering.com
Patch: [v4] arm64: dts: renesas: Add mmc aliases into board dts files
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=439861
  Lore link: https://lore.kernel.org/r/1614596786-22326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


