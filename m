Return-Path: <linux-renesas-soc+bounces-3527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51267874763
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 05:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C74A286B95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 04:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36FF1BC53;
	Thu,  7 Mar 2024 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSyFmpNc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7AD14F7F;
	Thu,  7 Mar 2024 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709786431; cv=none; b=XTjPsQA4XJbr8/FFlFSs/znC8d1mN3/KWjkDbpnVLv5uWGqRDuCHQ/fMvAHPN6FG7czT6SS7F7AfP4PSr7a4xY3eGoPNtGvbChAAefDCYJAzh96XSuHEj812VlgTwgGv4zGnsyTOueXjPHM+Cxqf44fIACfrGeEgX/S4z93VFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709786431; c=relaxed/simple;
	bh=EEYqOx9Zfjrv+CfUDIOl3n6VMgScQyeeuqGf9tFXIos=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n++Qw7KSbcai2B2Fnh//gLXeNb5excgzHutzxhHsLFZkga4pOmOyUTm44tCFc9tkNWD0oDEekPUTVmzmgFOju+MsaxOtbA4EgSQWKZ0ASbGFNH/fOd42Oc8xA2kVsGxBrceka389zxZnp7vraDndgX9xnb/XwGyaLy5JZM6QFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSyFmpNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31E19C32780;
	Thu,  7 Mar 2024 04:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709786431;
	bh=EEYqOx9Zfjrv+CfUDIOl3n6VMgScQyeeuqGf9tFXIos=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eSyFmpNcc8y0vx7LR+IVHns8tM9OaMrMmX0mw63chzsTbTQs1xmHVnoagr5zcQPfi
	 lRWsWwuvRnPf0OTiqq78/C9+SkudN/9eWmY7nNXgCt2rbLf+BZTshJ0dI0uPIOYFU+
	 RJwECIuJfVR6znnDDWUwVUEnGvRiwAl0XgWBI0v+HKBhk+uYaH0A7K2CfMrnjAnn40
	 Tz7LduaEnCPvH4BJ1lcCTsu11HDjiYA2oI+nBSU2OESLiHTyQX/afF9yS2mtOc1zc+
	 bu2gEQpEtiMFYQgg2fQVKOlqgGnjuuqcLXL4JzlbCHzW1OF7UK8/mopD22dbRMHiNe
	 S8gkHlL7tijew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C3AFD9A4BB;
	Thu,  7 Mar 2024 04:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,etheravb: Add support for
 R-Car V4M
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170978643104.7855.7910521326706587697.git-patchwork-notify@kernel.org>
Date: Thu, 07 Mar 2024 04:40:31 +0000
References: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>
In-Reply-To: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 sergei.shtylyov@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 thanh.quan.xn@renesas.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  5 Mar 2024 10:37:18 +0100 you wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Renesas Ethernet AVB (EtherAVB-IF) block in the
> Renesas R-Car V4M (R8A779H0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: renesas,etheravb: Add support for R-Car V4M
    https://git.kernel.org/netdev/net-next/c/d66206296176

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



