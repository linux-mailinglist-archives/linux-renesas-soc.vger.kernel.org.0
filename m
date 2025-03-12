Return-Path: <linux-renesas-soc+bounces-14305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC76A5D834
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 09:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDAC23A28B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B615CD74;
	Wed, 12 Mar 2025 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fI27ctok"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4862817BB6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768198; cv=none; b=QOMmAhm6Ig3Yu96u0K6duo4DlPmq3oXQzIWGmaqKfE5GVSusOH61B4Db9D6eOlipA8b3oVy+XVt/p855LCHLPymuqwaeojBJYwnRKPfAL8UgNQoeDQL+2AX+37A910GAi+jEeveL1tawU4Sn8n5eP7bLOyA+YzllW+8ZScKYw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768198; c=relaxed/simple;
	bh=nCRiHIzkqPkcaK0mXZJO2dQLhKMlBE3UY6TuRTv0wKA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=UbpIuP3/aL892hHvuAFdfNrK6BT3EJhX7kMGT/iB0J2i1cvgkF55712kj2+lznk793xdZLcvrMaHW74g1qO2yp0tMrs6jdtkRp1E1CUeQPx5OVCl7T/MM42Xf3K9ufUHtQFNcmn7dk2lJERuOPjSJasbXkKsPj0pExMYD9aCTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fI27ctok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFCAC4CEE3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741768197;
	bh=nCRiHIzkqPkcaK0mXZJO2dQLhKMlBE3UY6TuRTv0wKA=;
	h=Subject:From:Date:To:From;
	b=fI27ctok3J/TYvXJOT/c9FOvp4QoS1fWK2iaH1PLAXFKfK141KZ/Ovi4QJleLO3Hr
	 yh0uNzMyr6Jzv9W21kh8CIBF0yeQQX+nDZkTY9jyNv3kH0MLq0TFyeg6JD3C40b1uA
	 GN4c2GksSVObNR/voCl6SbXf8dRdrMM6AB6ZTVeXxhVHMnTbu/23NqUeNm48KGLsCU
	 rc5ShzG85VfnK6yj38D0TSHnw8y3Sm+fvEonfgcWSHMsgnd227dCG+yvjfH9A1uOBg
	 bJZuuzL8pomAZHI6DBORrVNF8HiKWZxt3NTJDmyGb8IEshhXpoOGmzzOySuWN0K907
	 uoTVXi0dZSZ3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B0923806647
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 08:30:33 +0000 (UTC)
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
 <174176823178.381553.12490479595926364251.git-patchwork-summary@kernel.org>
Date: Wed, 12 Mar 2025 08:30:31 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: shmobile: smp: Enforce shmobile_smp_* alignment
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=942273
  Lore link: https://lore.kernel.org/r/c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



