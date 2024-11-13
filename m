Return-Path: <linux-renesas-soc+bounces-10479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F509C674F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 03:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D3021F24048
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF06F13CA93;
	Wed, 13 Nov 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feOhwpX2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E7138490;
	Wed, 13 Nov 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465021; cv=none; b=HHmpLhvn+thFV5fCEV6ecRSB1u8ejohyvX2h5gaDsrFS6zKR/JCFMqPyOYdYUqSH7ebEEWnf9WoZUKMb7H8QHGW2FMWF3YJjXnX9dxeWRAMBU9q+5STMWfXPoPIuDwn0kcX0mZ2wiXRj350qfIxuXIZs3u+if0FcSTfFYw+dc6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465021; c=relaxed/simple;
	bh=v6OQIy9Hl1pwKmQg3qf6IxbnJp06j/iW9BVgDYe9rrU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hLot9v9P7DARGLY1wylY6PGjfYjVy0qsYChmGfAocwoFPzzZJt+5kYjCVC/P4/S8RTT+2W2JAyyMu1IA/1gnEk15LD30OIZz/hSdzoOZbBlE/V7bJ4Hy69eufGgTkGdre5lW456d3latcxJPSkM4AvPReUYSsQs9Mx3N2Hk+2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feOhwpX2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75435C4CED4;
	Wed, 13 Nov 2024 02:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731465021;
	bh=v6OQIy9Hl1pwKmQg3qf6IxbnJp06j/iW9BVgDYe9rrU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=feOhwpX290G5stkY6INCBhbBjRetwysewjLmlZvWyfXIJyudi8Mc8GRhbLqHhiTxo
	 UzHVtQdZ/jXB4yNpyZ3zF8EXrmGfA7kuVcCeLtZSyMKuJK8XjZiAsyF+GWDfbMwXmU
	 eC09Klvq9Sq53XneR2Y8JYasFMwd2P+bJN0DM+m12cN+FuhZlGDpGN0ZZV9rCPS8LL
	 JG2C5jXsj6Ep+jMLxFopx1zFXcDjPHEVrEloXPxvjOqEZGh3c4pYwiIETmz4MZDfe0
	 PoR8vLMk/r/FcrLUNVeK+iaQkFV08o3QrpETCrPDH+YUfd0StRQmCWHYueevr5JFut
	 0DMpKIQI+t/eQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB8193809A80;
	Wed, 13 Nov 2024 02:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] MAINTAINERS: Re-add cancelled Renesas driver sections
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173146503153.759199.11051453348644644535.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 02:30:31 +0000
References: <4b2105332edca277f07ffa195796975e9ddce994.1731319098.git.geert+renesas@glider.be>
In-Reply-To: <4b2105332edca277f07ffa195796975e9ddce994.1731319098.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: gregkh@linuxfoundation.org, paul.barker.ct@bp.renesas.com,
 niklas.soderlund@ragnatech.se, claudiu.beznea.uj@bp.renesas.com,
 yoshihiro.shimoda.uh@renesas.com, James.Bottomley@hansenpartnership.com,
 arnd@arndb.de, sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, cassel@kernel.org,
 niklas.soderlund+renesas@ragnatech.se

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 11 Nov 2024 11:03:21 +0100 you wrote:
> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
> SuperH Ethernet drivers.  Add people who volunteered to maintain these
> drivers (thanks a lot!), and mark all of them as supported.
> 
> [...]

Here is the summary with links:
  - [v3] MAINTAINERS: Re-add cancelled Renesas driver sections
    https://git.kernel.org/netdev/net/c/2b99b2532593

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



