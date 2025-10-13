Return-Path: <linux-renesas-soc+bounces-22945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE64BD3810
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 94AF74F919F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47DD19F13F;
	Mon, 13 Oct 2025 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFmM9BBW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFDC18D636
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365231; cv=none; b=e9Dx+dKH8Rh6SyBBq+dEvU7HkB3oHxojN/0AKIlWPIGecDAAbEfjIYXHGwXH3Vb4lHYT3bCfByyR0udGl5Bybao8IT1KLLAqdUfObly+1peztuvhaVIrm+oOytkSKzNips9H6X6fwjp2Kq05OBTTJgHwPi0pXsKK2HZQXqRlkcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365231; c=relaxed/simple;
	bh=VO/owp76S0fxkIL7AhFSx88oIpYyUSc36/06NZyaB74=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=RawlCT5E0KqL1y+mq1ymn5PmCGXdDybrt/cqcQiRojVw1tXg46W76IkUwoyuKQMNQ6IdL0v4F16uNlIhCfZRSQ9gUhbzC97p49j/9J8lnQfvJfc99guo783daAazZkJs99QW5vbH1vNHz+CPclvxQhkpeS4ShWxgC0uFqab8GH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFmM9BBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0A7C4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760365230;
	bh=VO/owp76S0fxkIL7AhFSx88oIpYyUSc36/06NZyaB74=;
	h=Subject:From:Date:To:From;
	b=dFmM9BBWD5dQ6kx/Z7quHuC+ShWe5A5hxHlm1fJOV8lI/9d8quNSCFpf5iOm1gWju
	 v9TiKaZY+Fi7PVksT3IHmr43HubQWXeSYx03YBMz1TZS9FP831E6N8buUXnnmmlmru
	 UAOH7BEMh+1fKZsi6akQvLFWigL8NZNthimhVof5AepMR3u+SS8nUG6r8mOUGVIIXS
	 vvqPh3DbK5Rry/jFL4ZwB15lHXBP7L16j0hmBrLSKc3/lMX8bpf46kbvOvdRBm8Cwv
	 F6jM6Ij0X4nsmhIfZtbJwoQtKF2MMDwjN2b8822ql+eYX3sJV16SW9na1lZCLtsTzu
	 PgcIY1NrfjuBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CA4D0380A94C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:20:17 +0000 (UTC)
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
 <176036521657.2988430.1959201268000820598.git-patchwork-summary@kernel.org>
Date: Mon, 13 Oct 2025 14:20:16 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Series: Renesas SoC updates for v6.18 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1001728
  Lore link: https://lore.kernel.org/r/cover.1757669912.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.18 (take two)
             [GIT,PULL,2/3] Renesas DT binding updates for v6.18
             [GIT,PULL,3/3] Renesas DTS updates for v6.18 (take two)


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



