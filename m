Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A944742C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 13:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbhLNMkO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 07:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbhLNMkM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 07:40:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD38C06173F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 04:40:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72D24B8190A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 12:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D8BBC34605
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639485609;
        bh=Q1vyrEFt/DZV+j1+BkV39Sjp371OXbAla9LZngDZVeY=;
        h=Subject:From:Date:To:From;
        b=n6Uu5iaZL4LUpeSWNPD9loTk3VEliybIYxB4wouosAq67c24XKZRTS9SZp5wG4DGU
         yenJ0EkfFoVeKWqmcoXjDROG1QQRKXwDwGZy3YMCX7AkToPRBVMst7x3hkUGS+BpTz
         iKeoShkfh+51C77BhyB7dsHkl1Wc61kADDqulUEG7aF2FfnjSbxsHMDE+UyasaOPpT
         ODhtniv0GKCEZUjJm86jk6ozQDAeAi+lU1j7eMzLyyawZ0bQvn/YYskr57yvvSYi0m
         T0r8PK61kNacngGaMUwbGKiy5DGFvkXQkRHI+9qO5ZYYCKaFcf1tPSUhTsj0KmehZF
         52Rv8WiGR3xYQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1F35A609BA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 12:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163948560906.12013.16279257264345385886.git-patchwork-summary@kernel.org>
Date:   Tue, 14 Dec 2021 12:40:09 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Enable Thermal support for RZ/G2L
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=592337
  Lore link: https://lore.kernel.org/r/20211208142729.2456-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a07g044: Add TSU node
             [2/2] arm64: dts: renesas: r9a07g044: Create thermal zone to support IPA


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


