Return-Path: <linux-renesas-soc+bounces-9795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1364499FE7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 03:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB79A284FC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 01:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E894C156225;
	Wed, 16 Oct 2024 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxEqZUPj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2264149C6A;
	Wed, 16 Oct 2024 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729043428; cv=none; b=BHoC2ZlkFAGwh4E68LUaU4pDCvWfuhljDzsfY2Ym9bdfXAJCD7rJRlzyoaXHNHuNghZ9bAlngaaCydEhTBGk4HswOclEDdbDStD10okK2ogHwQXHnTv9cBHt+OPUSmtz68zwoSssB+dpVYQTjcKsTZ+lhpgvEphybOR0/tH/6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729043428; c=relaxed/simple;
	bh=tCHzduriARMpDN7nm8uWez7oaq6V4Hu8l9AZv2isKZw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KJ0svJ8tJMVoiYquIPc/Zmf/i+Yg3n193Anq+TROs6LdHIt1ubI+SqCruau+AmtCPPHgFEdjOMhlP2jpOy2OZsupNP9n3wxMg4eziwT1pYo3mwg11PltBdAsW2+PnzY6wj63Bp5vAqpvW0u0vuZ+d9tyZjf1ga1PmQZj1aeD9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxEqZUPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44590C4CED1;
	Wed, 16 Oct 2024 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729043426;
	bh=tCHzduriARMpDN7nm8uWez7oaq6V4Hu8l9AZv2isKZw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XxEqZUPjR+9cy/S8L4+kG9HCtOwbcZVl0T/vS8SsjisD2lXt49An2XCqoS8dxUhc9
	 K0QGBba71WKTrzxy3RiDh3Gu2Q2ATCB7OUrXqz32ITGuW5Updtjf3dxwngmvM6ko/n
	 1RiMBZCcbWeTgR99otAnIQF3qkYrD962T8fTbpwx6NGO2HGA2HINX1+dutu0AhZdIJ
	 yKVoraRbouHQtbLk6iq3oLA1t9Y/uqHSnVugUVz348TMRt/DschfHP2lV6/uwwqzVn
	 k/pizfXgWeXZcutRdxaDXYmSpBjnEPvarCzJORgnWDXbqxn8oV+h9dXemvxUZIjb66
	 K7qET0TFPLfYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0C33809A8A;
	Wed, 16 Oct 2024 01:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2] net: ravb: Only advertise Rx/Tx timestamps if hardware
 supports it
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172904343125.1354363.4977835681788298756.git-patchwork-notify@kernel.org>
Date: Wed, 16 Oct 2024 01:50:31 +0000
References: <20241014124343.3875285-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241014124343.3875285-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, claudiu.beznea.uj@bp.renesas.com,
 paul.barker.ct@bp.renesas.com, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Oct 2024 14:43:43 +0200 you wrote:
> Recent work moving the reporting of Rx software timestamps to the core
> [1] highlighted an issue where hardware time stamping was advertised
> for the platforms where it is not supported.
> 
> Fix this by covering advertising support for hardware timestamps only if
> the hardware supports it. Due to the Tx implementation in RAVB software
> Tx timestamping is also only considered if the hardware supports
> hardware timestamps. This should be addressed in future, but this fix
> only reflects what the driver currently implements.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ravb: Only advertise Rx/Tx timestamps if hardware supports it
    https://git.kernel.org/netdev/net/c/126e799602f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



