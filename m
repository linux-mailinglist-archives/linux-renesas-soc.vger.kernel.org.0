Return-Path: <linux-renesas-soc+bounces-24017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B21C2B1C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 11:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 517971888330
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 10:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133652F12A2;
	Mon,  3 Nov 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgPTHlE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26512E228D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166476; cv=none; b=TnSCY1CM2EmgzhbILhPnKiRVuGNhNo7YxyYl3DPA/uZvWcAnS3T93n+3QBul3SnxZNHDOU36+xgCKGUA2PbJLnwCKmMJ7cpvwgzzCp/fh+S2rGPYUa4VKGXF0IjtUpaHYoDAjDIi3xau6df4C8ka85ACvR3zbyiG0vyYsCA8GHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166476; c=relaxed/simple;
	bh=Atiu/wP7AzX9Gds0E6aSD6FIyJr2DSeAPjq8IWG87fg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=szaeSWuf6OULXyBWGidMDLqzSkWYRLRP5UYetEVd8LSiWXzvtMm9QgZWv3Ox8vfkJj/XE2VWXecsJk2nOr1Z9ChBlxhZQhrbRtE4U+gXbMaqSLnFlob9L8y+7yoInQttbKeMQT1Mf8pk05JWusBYZmjvVYs+v5PQ+MzZF+aJB5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgPTHlE6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F4EC4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762166475;
	bh=Atiu/wP7AzX9Gds0E6aSD6FIyJr2DSeAPjq8IWG87fg=;
	h=Subject:From:Date:To:From;
	b=pgPTHlE6If8uwgEseuZgIOtaREiCPF9T0YygkqLQVQ1NetNmcnyWnUtEGr0GTVcjh
	 tsD/oShY/pRpLt/llI4yQGbw8eCWUkAIdaS1qyru0O2mFlD3/uP3BoBLKfzQu4uRkm
	 eJ0MjX20xrlLyJFJW6bmPPDZG5WIE5asHTAs9ukEsEZRx97pqwGEKwR0G5V/k44vT6
	 Rcm979YT8Dy1BvJLEQ9eIEVB6dine63qxW7YVQQWEoIr66DkOcRjisBVCM7JAh0wG0
	 ZVhX5wXGalqtozTUYQLHPuzh6+x1pZPBbA12E78iy+7oawcO0xSfhTgnoUZX2iMs1v
	 RrOlib1lgIhtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 378283809A33
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 10:40:51 +0000 (UTC)
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
 <176216644968.1991517.7040692159988231214.git-patchwork-summary@kernel.org>
Date: Mon, 03 Nov 2025 10:40:49 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [net,v2] net: phy: dp83869: fix STRAP_OPMODE bitmask
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016302
  Lore link: https://lore.kernel.org/r/20251027140320.8996-1-marek.vasut+renesas@mailbox.org

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable GPIO reset controller support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1018082
  Lore link: https://lore.kernel.org/r/3d14309943541d370d92768e8448a6a6ac2e0985.1761901540.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



