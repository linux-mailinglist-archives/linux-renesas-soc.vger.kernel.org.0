Return-Path: <linux-renesas-soc+bounces-11206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 747789EC316
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 04:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7111887F7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 03:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D59420C000;
	Wed, 11 Dec 2024 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkzZ/oVr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213AAF9E6;
	Wed, 11 Dec 2024 03:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733887217; cv=none; b=dTfXsDCJxidAmiHepKTi2hk46a9NwNShS+O82uJ7+P9+UjfSDV2mYx2O40GdKGdcJPco/P65+TA2VQ0jhquSZSbeT9VRTA0adKi/RdThu7bNCAwNO6QANHrylwXTI8Xk0/0UdZU6HZmURwn4DkvkV/5hhHfcbaSkM1Q2Qs5pfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733887217; c=relaxed/simple;
	bh=17Duc3CAKDXdm8/1QwlEBB9jroPiU4zGXbLKeH6fjBI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ga4z3twJJRobAzPdBaN7fziBVB1JLRbg51q7QI29jHbgYFnDvm9bI/pK95QG3lZ5jirZq8ArTNLW59h1S7nTokCWuM8H6bFwu2JHfIPgBZ/dP54E9k/UY7ksS564SkiK46scgfSvTVNrchgzGTfTW9N29sUu3/42Gxt/dC2fVG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkzZ/oVr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A87C4CED6;
	Wed, 11 Dec 2024 03:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733887216;
	bh=17Duc3CAKDXdm8/1QwlEBB9jroPiU4zGXbLKeH6fjBI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nkzZ/oVrlrHs/HrSESs/cs+T+hUiaoqnQ6zUsozfdEWuAO71obWuCvN8aBlZbh55N
	 Md3qL/ZK7vlN2M5ni3USt7wwMdkYOB8dJ6Zq2MDjr40tmoJFRXceXr5+cJ0ClRT3G+
	 xneFI1s0Yyw85tGFXHRDVUY/2l+L8BJAWGdjuCb8SEeGa1vqssM+44Ku7hfa0hoaDu
	 +JuASJ63qYeGEIsn93W9NL8hy/SzcFQPdNRYF8t70u+qpf/TUcnIOSiV1tZrH8E3C8
	 xCd1hM9jP7aSOsfhAAhLz/fuKMFqwMskrUAZ9mIuRSBa8wP7XPf0RNea72tuGcFscn
	 HfvLkGu8Fan6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF40380A954;
	Wed, 11 Dec 2024 03:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: renesas: rswitch: handle stop vs interrupt race
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173388723251.1105799.6013882460430110390.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 03:20:32 +0000
References: <20241209113204.175015-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241209113204.175015-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Dec 2024 16:32:04 +0500 you wrote:
> Currently the stop routine of rswitch driver does not immediately
> prevent hardware from continuing to update descriptors and requesting
> interrupts.
> 
> It can happen that when rswitch_stop() executes the masking of
> interrupts from the queues of the port being closed, napi poll for
> that port is already scheduled or running on a different CPU. When
> execution of this napi poll completes, it will unmask the interrupts.
> And unmasked interrupt can fire after rswitch_stop() returns from
> napi_disable() call. Then, the handler won't mask it, because
> napi_schedule_prep() will return false, and interrupt storm will
> happen.
> 
> [...]

Here is the summary with links:
  - [net] net: renesas: rswitch: handle stop vs interrupt race
    https://git.kernel.org/netdev/net/c/3dd002f20098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



