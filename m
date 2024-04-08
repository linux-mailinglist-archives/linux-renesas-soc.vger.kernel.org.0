Return-Path: <linux-renesas-soc+bounces-4380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF089BC7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 12:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08635282904
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB986524BB;
	Mon,  8 Apr 2024 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmdbUgzi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C04C634
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712570456; cv=none; b=InAqEHBcxV9mdlK057Sbr6WSk+UggNxNQ7BcFX2pRaMl8B3UBdBmdbZSMkJLvKX638rvHlnw6F5ger6AexGhYEpNbVbhpPR2TprFfYEyEtpFeYHNOQ6oiN50IADR1SZp5M0Zhm2l1wbWnAGvuoQOOb9WfiPaYr2QQi2e/hv6p7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712570456; c=relaxed/simple;
	bh=1UBElAaq5QA4BSAp0dcJ8clW/CowDhPBjWwF16hkFTk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=UXNCPw1/bMb0/wk+Ckd86v4/ycbnKutEaGu6RBWTL7ezKsVVtDaXR/HWvQ80E4xlFw9ZeTmn40moh1Xg4vciYrz9pvWxPXxNPXQSEbX6hk4qyisHMpYOYoopYI8fulQhLavJSngIG+YC2Fwy+htbLZ/dO/x6n1KF/N8yYhinQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmdbUgzi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 622F0C433C7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712570456;
	bh=1UBElAaq5QA4BSAp0dcJ8clW/CowDhPBjWwF16hkFTk=;
	h=Subject:From:Date:To:From;
	b=bmdbUgzi0xjYiGDqHKQSkt6RJjVTvQAmweqmd6NanVAsr2SwM3v31mGZ77bK9kdab
	 KglwcJ7lHfFlAJnSmPWcN6WjY2Xy7sOGhT2oNwKKUuiPHEyebM3QWtl6FZd5BbHaJd
	 obGnu4qYycTJ+96hlhhiB1QFE+R+hIQZo5EtQNyvwGtVBQPB2pouIm/eG0Zrabki1n
	 tsRnUQjL173FLFrUBHlDzbyzdEQQlqioeHtR5YE9OfSnDS+CKpglChj7peiry6nJ8N
	 hnN61QB36y0eZ4bHZFwfutM53n/3HAVB96XvxJsgLuoYK+R2TNEmhNolh4nSoWIUPR
	 Kkuvyj5Ho3bbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55C41C54BD4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 10:00:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <171257045628.21896.4366221912390684455.git-patchwork-summary@kernel.org>
Date: Mon, 08 Apr 2024 10:00:56 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: gray-hawk-single: Enable nfsroot
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=840666
  Lore link: https://lore.kernel.org/r/0c291919071350674648317f8cf3efbd1ca4475f.1712068442.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v6.9-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=840553
  Lore link: https://lore.kernel.org/r/b2e6306a58e18136c05668dbbe9e839efdbe463e.1712053238.git.geert+renesas@glider.be

Series: arm64: renesas: defconfig: Updates
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=840554
  Lore link: https://lore.kernel.org/r/cover.1712053450.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/2] arm64: renesas: defconfig: Revive kexec
             [PATCH/LOCAL,2/2] arm64: renesas: defconfig: Refresh for v6.9-rc1

Patch: ARM: dts: renesas: r9a06g032: Remove duplicate interrupt-parent
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=840647
  Lore link: https://lore.kernel.org/r/7ac440ec923f5d781a93c4344d6fedf280c3fa72.1712064816.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779h0: Add CMT and TMU timer nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=840675
  Lore link: https://lore.kernel.org/r/cover.1712068688.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add CMT nodes
             [2/2] arm64: dts: renesas: r8a779h0: Add TMU nodes

Series: [v2,1/2] net: ravb: Always process TX descriptor ring
  Submitter: Paul Barker <paul.barker.ct@bp.renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=840681
  Lore link: https://lore.kernel.org/r/20240402145305.82148-1-paul.barker.ct@bp.renesas.com
    Patches: [v2,1/2] net: ravb: Always process TX descriptor ring
             [v2,2/2] net: ravb: Always update error counters


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



