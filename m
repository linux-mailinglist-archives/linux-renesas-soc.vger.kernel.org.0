Return-Path: <linux-renesas-soc+bounces-4037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915788C016
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 12:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89EE5B232D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FD6125C9;
	Tue, 26 Mar 2024 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6FSVt5E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCFC101CA;
	Tue, 26 Mar 2024 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711450831; cv=none; b=HX8MoCiUfNzWE1fI9eKem1H9YQcPmoO++b7JW+bcD+h8MHYvyRkESbbpR2+aRwS4IZWqPFcuyyXdQRkOwDQAzfQ7UHTDC4WolXO3r34hl3vi6E1m/tKAYkpxxXV0YZLODGchYPhyN6PYXFvykhReXTymWmQfrCpi2gdQ2vei5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711450831; c=relaxed/simple;
	bh=lp0CaupFiM670ZBa2K+YQIyxgojpimS30JZ+Cv6uW7w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=knbGwrtMU2NYO81nujpnssQ/dWhl9KvApbkPgyrTNgXb1AttQOgdW62A7RCDN3ZQJ5RbXV2riSpTXAXCzHGc/7A/AovHexeldCiqL9b7k4/RKvice2AciKcNb/Z+CuQdD/KgSPIki4cycKRSHU8kJsxeMghATGklb60rkKTzL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6FSVt5E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B86BC433C7;
	Tue, 26 Mar 2024 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711450830;
	bh=lp0CaupFiM670ZBa2K+YQIyxgojpimS30JZ+Cv6uW7w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c6FSVt5ECaOUJaT+SA3u8/6h3VrfK2oYhrFCVmZ+Qrl2JBAhuIrWMO8VfWO7qNm6d
	 0jsjYEKVFnx1vVmQPhSEIOgk8AdzsKnRlmvgX1iqW63+90dXIXD3/1BB+YprLiv7A7
	 eLjjIEfKkJgICpa/J9j0mgbtGaBdatRANZBMPcDU+zUgc8SPsE112QF3BTThNohTPn
	 EV1oYFzVgZnP26Fka2XRR7kZ5+XticotNAJxvyNn7X2VAnMqaJCxXmnbZKylFGyW6/
	 Db6Jg8IdSSUX8sInZB//IT9oMZldUMZakNr/npluHe5hO9c+Ph3rJKhEQziSZnxk4z
	 m8Qesz6jZw+TA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59761D2D0E9;
	Tue, 26 Mar 2024 11:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] MAINTAINERS: split Renesas Ethernet drivers entry
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171145083036.11067.15525501492018844574.git-patchwork-notify@kernel.org>
Date: Tue, 26 Mar 2024 11:00:30 +0000
References: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
In-Reply-To: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yoshihiro.shimoda.uh@renesas.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 24 Mar 2024 23:40:09 +0300 you wrote:
> Since the Renesas Ethernet Switch driver was added by Yoshihiro Shimoda,
> I started receiving the patches to review for it -- which I was unable to
> do, as I don't know this hardware and don't even have the manuals for it.
> Fortunately, Shimoda-san has volunteered to be a reviewer for this new
> driver, thus let's now split the single entry into 3 per-driver entries,
> each with its own reviewer...
> 
> [...]

Here is the summary with links:
  - [net] MAINTAINERS: split Renesas Ethernet drivers entry
    https://git.kernel.org/netdev/net/c/8c05813df270

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



