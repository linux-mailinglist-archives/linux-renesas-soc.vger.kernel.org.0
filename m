Return-Path: <linux-renesas-soc+bounces-25906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030CCCEEFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 09:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E249F305739B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 08:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9A32F7ACA;
	Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCqUoNwy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C222F6911;
	Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766132005; cv=none; b=XIAAYiUoZ0yTOr8FC3g45x9ba37arhShydPMcwnKDiswSeg5k6SdiNfaG43jR6CENpRJ+wCkB0+JQ0s5z8s5xm76xJ6iV5+dEzgTvARVfkU5AWd/591PHC17IdcJZ6lWqXcHK3vfVuRPFDNC1Gb9wYg2vvxxcVM2ZYxldOGYiq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766132005; c=relaxed/simple;
	bh=J3NfC8i9MKxrVgFTXBRYcoZRhSndcZg4ZT/YfzfylV4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e1PTUjqHd3I3FcfzNxiuhNZIo98Q90x2nmvPmLaU3HUwM++HkAerV/7KY759ypbBQZNJC88zbvjNIygsa18NWLIDhcozQt9P72+LbWK85IQreUhEbWUXL6wcfh3WY3IeMKoc/0w5UIF/BAWymiK69mL7hupDPoyNrIgBjjR40d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCqUoNwy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EEAC4CEF1;
	Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132005;
	bh=J3NfC8i9MKxrVgFTXBRYcoZRhSndcZg4ZT/YfzfylV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gCqUoNwyUIvDPMTLk/cPSJnRKgcaIRyAB6+da8V5IFd8z8q6B6SQnFxyU6BNrqk0u
	 /kAX1HWOAk9uyRNTkI1muPbgz/TYFKOmTEuOXj0gkyzw8dVrpg4Ijhe+697yaQiUZL
	 TSRVMcS53WPMn3cwMPxQO2qopW5d6usXXl79VHAkbOZE8Is44DyyTPyh4cSD/dKJ+4
	 0GW1nlaJfIAbbu6rqWw7nPndlvDoZgeW1z2oe1tnYAAkL+2zl46XXcgak9UBvjeIah
	 tEPRHstAZfPwPvQaHNVjnu1qir6eo59WSdxaOfOTy9PnLqdV4sf8w/23XGxZ8yHHat
	 tXGzx3UBh4Brw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C785380AA50;
	Fri, 19 Dec 2025 08:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613181379.3684357.14380947909185500489.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:13 +0000
References: 
 <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
In-Reply-To: 
 <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, saravanak@google.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel@sholland.org, maz@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Fri, 14 Nov 2025 11:47:54 +0100 you wrote:
> The Devicetree Specification states:
> 
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
> 
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:
> 
> [...]

Here is the summary with links:
  - [v2] of/irq: Ignore interrupt parent for nodes without interrupts
    https://git.kernel.org/riscv/c/1b1f04d8271e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



