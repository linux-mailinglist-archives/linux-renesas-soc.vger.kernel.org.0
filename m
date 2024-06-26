Return-Path: <linux-renesas-soc+bounces-6769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439E917529
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 02:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D503D2827AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 00:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E641D38D;
	Wed, 26 Jun 2024 00:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQVhDv9U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB202367;
	Wed, 26 Jun 2024 00:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719360632; cv=none; b=EywK/d4ZCHRRTrc3QG8EUYkFyNT4X02nuzDBmCFEKn5Q2GN5hk66+uSgitdcDBZ288jcvoBGDQJSyqEqv2O9xemfIUQo49AROq6hOucWbA51lA3J5PqcQfURRZg7BzRIvdwsk4/bbjbL/BZW8E5aK36qkloTFQSNdmgUZh5YIAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719360632; c=relaxed/simple;
	bh=iQC+t5OWFH1nWbUiOAQskeyvHgCJcHTv36M4suW3gxk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D+ev8TaV2e8VpYSflE3w8gzHl8n7/PoIOoUsPnsRkQ5jnrmcBUD88wLiZIX59Hi5q1dkLlLmNrA428CGT2hBG3HXtUl25zltPyUEjCk6LByxSy7lpn02TK97+tIUS9Y3FILBF2ZmgW+9K5MLIvLQC6mJxi9QABrRbECLrEU26Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQVhDv9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4297AC4AF07;
	Wed, 26 Jun 2024 00:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719360632;
	bh=iQC+t5OWFH1nWbUiOAQskeyvHgCJcHTv36M4suW3gxk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jQVhDv9UkEbE+IF66P0Q++hYV43g6YFYmgxeZkpS6SQgf21NPxtTgRtsprqk8/wj9
	 w24ysdcIr1eSBFXBdWr1DIqN2yKh6ydlTdYqEKXYN9rq5iqbUulg5J1YnoDs+xT5pG
	 NSbjFk1BFxq9nnt5gaeqcUvPR3eq01KKrqkU+tQz7jDLxz5d/WMSjEZFZVUpKIZ2XA
	 ogWCYNcFQG9M4enk5f9OARUCrTeUHN86bpMq5FtPp5G7LUdD0YomcTXV8pH/U6vPpj
	 VJeT9DhhKPdd+i6DoqIeGtkPFpA8WPQnJCnK9qjOlTu4nA7Up9VTPGMQoAMtbq9J4H
	 QSW0OtdlFgHKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2978EDE8DF3;
	Wed, 26 Jun 2024 00:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] ravb: Add MII support for R-Car V4M
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171936063216.7804.5192841232929823409.git-patchwork-notify@kernel.org>
Date: Wed, 26 Jun 2024 00:10:32 +0000
References: <cover.1719234830.git.geert+renesas@glider.be>
In-Reply-To: <cover.1719234830.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: s.shtylyov@omp.ru, paul.barker.ct@bp.renesas.com,
 niklas.soderlund+renesas@ragnatech.se, claudiu.beznea.uj@bp.renesas.com,
 biju.das.jz@bp.renesas.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Jun 2024 15:25:23 +0200 you wrote:
> Hi all,
> 
> All EtherAVB instances on R-Car Gen3/Gen4 SoCs support the RGMII
> interface.  In addition, the first two EtherAVB instances on R-Car V4M
> also support the MII interface, but this is not yet supported by the
> driver.  This patch series adds support for MII on R-Car Gen4, after the
> customary cleanup.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] ravb: Improve ravb_hw_info instance order
    https://git.kernel.org/netdev/net-next/c/8d653d26ffc7
  - [net-next,v2,2/2] ravb: Add MII support for R-Car V4M
    https://git.kernel.org/netdev/net-next/c/6e0713cc8206

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



