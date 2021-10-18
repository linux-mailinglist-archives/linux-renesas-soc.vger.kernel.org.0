Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08238431330
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Oct 2021 11:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhJRJWm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Oct 2021 05:22:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231149AbhJRJWm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 05:22:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1A43B610E7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Oct 2021 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634548831;
        bh=PpxlXdrQhSxqUdj1PlZCuxepsiGrTjNueW0xNj5jA0o=;
        h=Subject:From:Date:To:From;
        b=RvVwYRncqDR/0lyWpvEK31fpkqAA1FJXlnA3abN+Bi4qOhzM7do2CRCR7MSebCiod
         FspoOcb1+h7IgQLXfsIHblYxbLOcecLr5Rp/2zGRrQP2KBAVmcNtCNjx+PJdP4/S3L
         IJmUwCto/NrdGOH+A0vc9kOyYQgdoRKZ4BnOpNC7C5sSOiDXHHS3I2S62FThHmYwsk
         oFCFYEn/Kr97r6q58VMT/uq5xmhbHDNk0VaqmfUunkbB8PC/iDmb61j5tv2pI6lqO9
         QtxA/2QlaLFLzf3K2auTYQNxBw7eGVBNXoWGuBstx4kgDlEfJQszfZvda6H6lfer74
         0hOxBAmH7gY/A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0995B60971
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Oct 2021 09:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163454883098.20070.16267294065319615677.git-patchwork-summary@kernel.org>
Date:   Mon, 18 Oct 2021 09:20:30 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: drm: rcar-du: Don't create encoder for unconnected LVDS outputs
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=535345
  Lore link: https://lore.kernel.org/r/20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com

Patch: [next] iio: adc: Fix -EBUSY timeout error return
  Submitter: Colin King <colin.king@canonical.com>
  Committer: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=532869
  Lore link: https://lore.kernel.org/r/20210817172111.495897-1-colin.king@canonical.com


Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


