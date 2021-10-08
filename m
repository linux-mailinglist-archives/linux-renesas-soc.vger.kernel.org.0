Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B4A426BAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbhJHNcD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 09:32:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235301AbhJHNcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 09:32:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E60C60F90
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633699807;
        bh=xpqC7w4Pe46QFaSeY82jyK5P8YHO4BYFw0ymWmadoHY=;
        h=Subject:From:Date:To:From;
        b=J6w39h/jRIEnP8sq9xQ0fdOEBqmZOzNGYWsOui/y5Rs/wLeyMtopLC93NWJF7muTb
         DMi5podQJdCP8dKQ3oziCpImKatj7nm2fgAxdageenqJnsU6Gu9E7VjJhjcpkeV32b
         P7J3lrxybdBaTXkMx0COF0+3P1XrPJVM7n7OOv1G4wTQjNQPcu6Warrf7Xct9sjPW9
         e0P9mEhk5UEWPz9NeTDOt+aGiFYUNUz+NbUYZ9o/+1Q2WHrHZKIxoERckdKWsin2lF
         RDUMMwBRENlKFHU4kzZxHrBb8vUPpTMxO3gDT4Yje9yCaJXj+rk+hx+b9k7XH1xJ4E
         eNBwIbo2kA4jg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1F54D60A23
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 13:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163369980706.11717.7812786743963930294.git-patchwork-summary@kernel.org>
Date:   Fri, 08 Oct 2021 13:30:07 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r9a07g044: Add SPI Multi I/O Bus controller node
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=554327
  Lore link: https://lore.kernel.org/r/20210928155852.32569-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


