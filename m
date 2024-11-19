Return-Path: <linux-renesas-soc+bounces-10574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4689D1E6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 03:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50571282557
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 02:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FB714600F;
	Tue, 19 Nov 2024 02:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Emp8av/E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DEB145A09;
	Tue, 19 Nov 2024 02:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731984634; cv=none; b=i5jB3QVloMCPz7EPWkustI9uuoFNoYC8VbjGj7vGj/yA0N0Vwn/j3CBG9Uedc4F7o/LQqM3a+1RG+KC4n0MrE0rZURT69LouvfcY+TJopiyF/I9ViUu4YZgVAUJ60srz2Lf+kqessCpQ9jSUwBAskKlLiLdgDDXsv3wCWkiJ0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731984634; c=relaxed/simple;
	bh=M3fYILgUzXtiT5uDZ8DGwwy3CEaH6jcV/j5fu0aDaeA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pvQawvm/8tXfkt/DJ99vzVyiOBLBn1quLYTaATpH9PthUhOaTpV8Q7o+KPJjVUoFaEFF4X0u0SgPKO2Xg8WEaENT71k/b7BcYehwnrtjwmjktI5s06gSBrh2nZomZSeMHgWgR/gi/0ZNAc3vNkuB1R3iniFswUFPzC2eEKc3qfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Emp8av/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46449C4CED9;
	Tue, 19 Nov 2024 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731984634;
	bh=M3fYILgUzXtiT5uDZ8DGwwy3CEaH6jcV/j5fu0aDaeA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Emp8av/EWyHDx9FV9kgfUZtQsP9ubjNv7OvgAGv54wGxzXif+x7WEwWGQnqR/RKZc
	 j2Ninuo53DFxg6CJN1QLNMIvu/gfjPGHE6bl4B4J4K0gBpcuyQ5ikKqNetKfl1Aa55
	 EKY7UkwlUYPZHl/SG1JvM1rkA7x0OmCKMEmSIKzKb1WVvp3Qh0wI/hShKoIYRoTmCW
	 D3Eb912EEfj+o5ucZXLZXo0iH6rkm31F1rbFr8/STwnFT7lCoYOpU4sMLPG6/ls0Xm
	 0+YUOzs67Ms2CzzYAxNrBP7HFOWT44SyYmpap/36+RYudRU5FKKAtoiViXIW0JIzB9
	 DrOwp4H2XpFSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA93809A80;
	Tue, 19 Nov 2024 02:50:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,ether: Drop undocumented
 "micrel,led-mode"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173198464577.82509.11524804173445644255.git-patchwork-notify@kernel.org>
Date: Tue, 19 Nov 2024 02:50:45 +0000
References: <20241113225742.1784723-2-robh@kernel.org>
In-Reply-To: <20241113225742.1784723-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, sergei.shtylyov@gmail.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 13 Nov 2024 16:57:42 -0600 you wrote:
> "micrel,led-mode" is not yet documented by a schema. It's irrelevant to
> the example, so just drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/renesas,ether.yaml | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [net-next] dt-bindings: net: renesas,ether: Drop undocumented "micrel,led-mode"
    https://git.kernel.org/netdev/net-next/c/5bf99baefb3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



