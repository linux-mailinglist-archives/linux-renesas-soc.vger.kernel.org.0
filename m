Return-Path: <linux-renesas-soc+bounces-16236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9CA97CA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 04:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FCDB7ACA21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 02:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1A4264FB2;
	Wed, 23 Apr 2025 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/wAahrW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD255264FA8;
	Wed, 23 Apr 2025 02:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374205; cv=none; b=TIcZUtfW66MQgE85qcH0HVWjuCVswVZL+YshXk8c1PrHQFU3UEYJz4Dn5dmudnLiUPiwtW7VqIsQok6/Hir7T5tc8Kf4y0fGnQCc9Unz/bP9kz0lO2XvbmVavGtF4KFCDMD6wRbMiq4oq4/rI0trNgO5g6+E1UlC++pL3djGNII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374205; c=relaxed/simple;
	bh=8zl1Mfsui/XiOfNoncLXUpVlJRx5cQPmSBdy0E0QCWg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KsDSFcvlh+cO9mghqWyvNBw+I+98xB1XdUpPBc6Or3nGihHL8XKGlR1n1IKD6MRQKrM4FSLUDfrguVVyREerbHpFWYb9LvqrgseteWvEupFZYxaGLvklYSOpttuHDc7Y5ZL1/RtfpVkgtnWh5ydtyURxwOL/Le+Ku9mkJeadwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/wAahrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421A3C4CEEC;
	Wed, 23 Apr 2025 02:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374204;
	bh=8zl1Mfsui/XiOfNoncLXUpVlJRx5cQPmSBdy0E0QCWg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j/wAahrW/XiUw1TaEvIbHU9xexbzMDhOpav3+YAWzTM7nqTomVu3aUPUPTxMTMDgL
	 7Pm2z/GfJeruOsIGexbIEY8MJueOn69880uNd/5eFbgHcPZPepa/RdVKm4DqtbpCyp
	 CXFTyFyqcWYX9SXKhMM2AluNC/o9hr/UTLzov6QR+z1V3ntyuIJszJ4jmj7tOUrZwD
	 ZcGM3eqNcj2QKykiZv5lU6h+hD7tCeij9jBZkeMjFRPnLb/EIN8bqxuLI6T9arX9oU
	 l2oIG9F74Qaor4V5/i3XSHEexXiNp/afSekZLISsH04doH6gm0TNzhjaJGljSTAi4H
	 sTcamPZn/HeNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD53380CEF4;
	Wed, 23 Apr 2025 02:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next][V2] net: dsa: rzn1_a5psw: Make the read-only array
 offsets static const
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174537424249.2115098.3889586347418035096.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:10:42 +0000
References: <20250417161353.490219-1-colin.i.king@gmail.com>
In-Reply-To: <20250417161353.490219-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Apr 2025 17:13:52 +0100 you wrote:
> Don't populate the read-only array offsets on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> 
> V2: Fix commit message
> 
> [...]

Here is the summary with links:
  - [next,V2] net: dsa: rzn1_a5psw: Make the read-only array offsets static const
    https://git.kernel.org/netdev/net-next/c/f7ca612018cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



