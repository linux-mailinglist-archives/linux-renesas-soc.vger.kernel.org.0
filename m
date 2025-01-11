Return-Path: <linux-renesas-soc+bounces-12052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEEDA0A048
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 03:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24BC016B17D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 02:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA68145A0B;
	Sat, 11 Jan 2025 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izupttVu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF8143722;
	Sat, 11 Jan 2025 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562015; cv=none; b=k2JLzmk5biBn7bJ6i3CBWVfc+dkDB5EctMVlZUs6ArvYryA/MkqpA+iV7wcYBDw1PDmjKHSC74QiePrAv2RbJaepDmsj7vhMPy7j2jZmXMZlDvNG9Lwcs9gDLhdYM2dnC6Ap/FQo0AOrLFV4Qfjq0gd8F4f9IKd7cmb4WaDNaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562015; c=relaxed/simple;
	bh=SdcLlLAJ34F60s5UAvsPUftPQso1nTbZ96t7PhIPdOU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=swQnUK76z3EK61chUf4CD2zUMKPI36nK6VEy/GHSiFfNuOlpIuQSQqHmuC0kn+JIsqrwE+cbrXvqOCaB9Jwqx40VwBdZ7sRUluKfaI0PbOnSMUuB56ctbynJwAV/suXzB81AVS5of0Fbs6rxG9wTAghiL8yV1yHK/yS0dW9eyh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izupttVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C3BC4CED6;
	Sat, 11 Jan 2025 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736562015;
	bh=SdcLlLAJ34F60s5UAvsPUftPQso1nTbZ96t7PhIPdOU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=izupttVuCaAKyRPkEjOtwSyiSWAZvd0slCW4VezrFfuySZSZflcZHlpBHSc+eB4RU
	 hxl/6JHGPu7Bd7zDCQ6DcejzaQmcuigXvSz7Fv/QmY1zsmazxkZdxa8cnPChbn1H6u
	 9WjlYtyBS5/EnxOyOwe8y3i2ajQPI/St9f91buLrvu9b/q5ovCDNPsZ0Zl+VbrMEyU
	 RieF9OVxgJTvjcMU5tS9Zc7Dk2T/C2gRHvz3yE/sW7eKMwk7yEh5dXOowxXOB0J3qY
	 JMGiTBc6g23R/iUQHS7dRP4FDoFMnkQtT1NBym1Vqi21vIkzZIk2d+wPubOkuG9FU+
	 McWjjmJ9B6iiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C10380AA57;
	Sat, 11 Jan 2025 02:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net PATCH] net: ravb: Fix max TX frame size for RZ/V2M
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173656203674.2269660.6351807708360268408.git-patchwork-notify@kernel.org>
Date: Sat, 11 Jan 2025 02:20:36 +0000
References: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, s.shtylyov@omp.ru,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 Jan 2025 11:37:06 +0000 you wrote:
> When tx_max_frame_size was added to struct ravb_hw_info, no value was
> set in ravb_rzv2m_hw_info so the default value of zero was used.
> 
> The maximum MTU is set by subtracting from tx_max_frame_size to allow
> space for headers and frame checksums. As ndev->max_mtu is unsigned,
> this subtraction wraps around leading to a ridiculously large positive
> value that is obviously incorrect.
> 
> [...]

Here is the summary with links:
  - [net] net: ravb: Fix max TX frame size for RZ/V2M
    https://git.kernel.org/netdev/net/c/e7e441a4100e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



