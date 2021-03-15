Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832B133AE38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 10:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhCOJKj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 05:10:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229520AbhCOJK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 05:10:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 606AD64EB1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615799426;
        bh=/CWh+9wuwi78BS7QJTMq3iL1F/vZXi1P2t+4H+Wxlps=;
        h=Subject:From:Date:To:From;
        b=ALtX23vn5cIrFXWVa7n/ylFX4MwKOAbDjnEFZc1aJLkFpdv6ek7vfnhPOspfcyOl2
         hDR0JEKPorJKOBB4ib+FKQbMXR1eld/5gDjiiIM3PmoT4SZtvTXvgTgMo5dJI6Ub+s
         vNzxMlVDUQsgF4d8xbUylHxPKNuHD3xGiyzsyeaVrEbE7NtZFOFB0e5Fxg7Inxj9YU
         t8fXYn5FxerzcdlUv1ouUkUBBBZVRB8bleldktBfCmi7806CSAyXY+RM1aUQU2BtRh
         Is38DfxXNMR6oY1qVPKqTz/qp3IA3x0PqJajhwYg/EUTEppdRQtSFiJ20PsofRgD1j
         Du81tClb2mOCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5226660A4C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 09:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161579942627.25509.13335447230357888476.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Mar 2021 09:10:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: VSP trivial enhancements
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=439911
  Lore link: https://lore.kernel.org/r/20210301120828.6945-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] media: v4l: vsp1: Fix bru null pointer access
             [2/2] media: v4l: vsp1: Fix uif null pointer access

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


