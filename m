Return-Path: <linux-renesas-soc+bounces-2521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D984EF39
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 04:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24E31F22D1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 03:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EF046BA;
	Fri,  9 Feb 2024 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcBxr1Dt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13154C6D;
	Fri,  9 Feb 2024 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707448268; cv=none; b=Xn2i3CjErDVLlj9lyxt2m5bMh9CRqN854v66WbJWtRFFJACi5utUzQv8LbHM37qSbodh+m7lwx49D9YjRFfxZ2QmNiigD/+sC4jJvwbQ515XtjHTr2GTYMviCHM+t+Pfq5f9BsRsqGbe89TAIvK+aiTKyA1aYIP7H++ieRirUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707448268; c=relaxed/simple;
	bh=nzoZEQhlUlFStvBk+M+EZikQknFSlDDltaxD1XSibWY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FvtvgMJYpisJkmG2wc37ss0fsN9WAOz23sEr0aUZStsQ52EUWsFLkVDRQGXpAJcTdZyGGo5Vc2ll73u1NxN7CQGtqkTFdvmYa0gUGiGomhqiIw6MxolZ6itN6Wudevf+YtMTFCfLDxMYsCWKW2/HQ38NOLN4i98Jda0PemDG0PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcBxr1Dt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C3D0C43394;
	Fri,  9 Feb 2024 03:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707448268;
	bh=nzoZEQhlUlFStvBk+M+EZikQknFSlDDltaxD1XSibWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BcBxr1DtEOW8uYPcKM6M593Mn3Hl+xiP7u/VwV0CglAt+i8SdPtHtxauL3iOKLGtG
	 XRsS71km5JmEmxtGWtxH20NRS29yOBpCzESUin2o16mFYFsWKVO3FdLvLVrO91RYAQ
	 /ouXQyil0+xB7SLRVVomfU6MSfHHAEgsAOOWwUvNwXqhcq/5IDXeFE6ZOBcrk42W5T
	 nF1IOEJ4DFPjY5OAo/TBk1WuHfUUVSeK/uIW4zczSUECb8ToCHGezRAl9acQCIo3aL
	 HYGkXeuVKNX005QB3vVWzfJexoAbSEekMZc0BXK66DEJf+nd3eNDbJfojTAhBiNI0/
	 cf/Okr+Kq5L+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26240C395F1;
	Fri,  9 Feb 2024 03:11:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 net-next 0/2] Add HW checksum offload support for RZ/G2L
 GbEthernet IP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170744826815.23533.13639002551479410283.git-patchwork-notify@kernel.org>
Date: Fri, 09 Feb 2024 03:11:08 +0000
References: <20240207092838.160627-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240207092838.160627-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, s.shtylyov@omp.ru, claudiu.beznea.uj@bp.renesas.com,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 nikita.yoush@cogentembedded.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.au@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  7 Feb 2024 09:28:36 +0000 you wrote:
> This patch series aims to add HW checksum offload supported by TOE module
> found on the RZ/G2L Gb ethernet IP.
> 
> TOE has hardware support for calculating IP header and TCP/UDP/ICMP
> checksum for both IPv4 and IPv6.
> 
> For Rx, the 4-byte result of checksum calculation is attached to the
> Ethernet frames.First 2-bytes is result of IPv4 header checksum and next
> 2-bytes is TCP/UDP/ICMP checksum.
> 
> [...]

Here is the summary with links:
  - [v5,net-next,1/2] ravb: Add Rx checksum offload support for GbEth
    https://git.kernel.org/netdev/net-next/c/c2da9408579d
  - [v5,net-next,2/2] ravb: Add Tx checksum offload support for GbEth
    https://git.kernel.org/netdev/net-next/c/6c8e2803ef36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



