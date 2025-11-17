Return-Path: <linux-renesas-soc+bounces-24691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423EC638E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39285383E81
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39033191D5;
	Mon, 17 Nov 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+W3/1A5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D202D6620
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374900; cv=none; b=XvamAcApasslfWNKZuBuEcxspUVat3u38aR4VUk/6741JljOhPEEWyFMcq6uHcKC6b8gCiQj8SNs2NGpQcnUrj8r+zfMJK0wmPwOVtdLNa6Jr4kYJinTus9AapltwPjV+vaShJOlUXFBpUw1XDoEY4peP0gGTMkQGzr7Hp7pLjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374900; c=relaxed/simple;
	bh=IN8AGLnaoG0ZTsVNvQX/5Y5BKSGuHCh7EVj8jyRytrw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=aK2Wa3Llj+IxPISjlRCFRdg7E7AZk6loWx1vamgOWZh1tqVVtE/MhudhM8mlYl78opO9sOkaJVvhiDanR2FvnbXPhj6C1Hs+ny7dCbbtEAUkttrz/F+BOF4TBJTzmFwRs5lprlTcnEWmBowkdJk/h5DxlTvnM1oEb5/iOYMg3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+W3/1A5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A325C4CEF5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374900;
	bh=IN8AGLnaoG0ZTsVNvQX/5Y5BKSGuHCh7EVj8jyRytrw=;
	h=Subject:From:Date:To:From;
	b=l+W3/1A5jenXqujqR25sNdMXWRs7Y95xLSU32oTJiqqirLfJvOD9VLLZBRGdizDD7
	 /qheHd97MR2km66zAkK0hp7nWkGwK6GFuVGsVcrskQ/jcczMu+cIK/tFR4L3Wg7P/z
	 eJNvw0X4ep+XIDlsHIgtPzGUvVWSbt6ohvIzJdQ5aWHtAeJaxttpfyv/vihenx6NNi
	 6TP+XBayMyBVYNyfFN1WMa0GGhw5VykcGFyO1MtxcM4vnrJU+XyfU3zDMytXjFdWM/
	 1vF8pOw0evNLtnHRUKGW8z7r4dAgVnyxcUeFXFkfluZxXtpYBrjQUhSlMfdUnIUJrw
	 0xYortHJr+QAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 392053A82561
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:21:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <176337486677.3281949.6785918699637219445.git-patchwork-summary@kernel.org>
Date: Mon, 17 Nov 2025 10:21:06 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()
  Submitter: Haotian Zhang <vulab@iscas.ac.cn>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1022334
  Lore link: https://lore.kernel.org/r/20251112065709.1522-1-vulab@iscas.ac.cn


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



