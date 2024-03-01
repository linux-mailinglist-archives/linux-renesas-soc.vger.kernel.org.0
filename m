Return-Path: <linux-renesas-soc+bounces-3362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8D86DD3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 09:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B21E4289DD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 08:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C8669DE0;
	Fri,  1 Mar 2024 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fY3dUfgT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274B69E08;
	Fri,  1 Mar 2024 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709282428; cv=none; b=tk+z0PkeKwn8TvnRyJfD9agQRzgvZwDWFuU8Gs6EJcYPAU0QeqgZUjz7gs7XwkBxHQSfeS3TqvL4SJPciyTU2snfVPv4vO41waNMYO0AoA5MixzuyycnRhqluprZDkPEMuwcwuxiwFk4loYEIwubOxv+x+9XerIT2RcH5/nUtUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709282428; c=relaxed/simple;
	bh=g3W9bfD1bp+3K2t6lLCQEeN+YO5gTJflaVUumBmw9Xk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NzNg1qzdAitXPGXlXeATw9ZZxUP9aE7NSBlJ6TgqqPshgvoKPh+KAqknHxjswO6EKvPqsmq5y4fuKvBCs+IUm1j/ZJWf6SGStxADqOoQPtiR8xvw/4HYIDL1MV1OAD8HUCX12pe6qC7LHym0y7N1Er0szxCF/qYMTb/5dNjmp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fY3dUfgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3542DC433A6;
	Fri,  1 Mar 2024 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709282428;
	bh=g3W9bfD1bp+3K2t6lLCQEeN+YO5gTJflaVUumBmw9Xk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fY3dUfgTB1Wsw1zAP6moTZn4vXqTRfGmvfguTSFv3X57i5YZupgFiC88NffI9+NKE
	 WEtT2XXCC6kNHufM/k4moVvBqLj1wbQsc8saxwVlLrjeXHAssiNDrzCRrUyuWYSRku
	 2WIFzqLDTpKTVlcRS/NRigK2/VLitC2mBpcJMmykN106mZLtmbC/qwV9XIkGOqd7Sh
	 tWu/O+HnySmc1Ryt4Rq4XjD7KxVAFIJvjAN8pikUTTuzdUqIpbZqfY7Qv0ZZtsScqU
	 bKI2RJ68Llqv+/4Smzb6MxEfkxNoOaiMoNWL7VWNhT76+yKnkOVv/vaxGRtUzox3Ps
	 LNAQGOmasXiTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13529C595C4;
	Fri,  1 Mar 2024 08:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Document default for
 delays
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170928242807.14717.8003548879509335278.git-patchwork-notify@kernel.org>
Date: Fri, 01 Mar 2024 08:40:28 +0000
References: <20240223195526.1161232-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240223195526.1161232-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, geert@linux-m68k.org, devicetree@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 23 Feb 2024 20:55:26 +0100 you wrote:
> The internal delay properties are not mandatory and should have a
> documented default value. The device only supports either no delay or a
> fixed delay and the device reset default is no delay, document the
> default as no delay.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: renesas,ethertsn: Document default for delays
    https://git.kernel.org/netdev/net/c/7be40883b1cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



