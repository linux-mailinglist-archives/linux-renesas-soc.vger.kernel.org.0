Return-Path: <linux-renesas-soc+bounces-10443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0A9C3C51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 11:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B791C217D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 10:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9ED119B5A3;
	Mon, 11 Nov 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd6KM30N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402B19B586
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321673; cv=none; b=RfXGl7w+StTztY6sfnZbfGIXjQBrXvDzNgiiWfjQfjbSiejmqLrau0y2FyjqtJGqDCnTXNfAFF5laB8C3diDSusRVuQZdGyqyziEOkT3mV4zwNxHsB0AmbZVJTjEhHNUWR5rVhqNbIKaU6l4q/iTJq2+xhRKaN+hnOUKQaKJiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321673; c=relaxed/simple;
	bh=Cu2VkK0DAJmrT5qqHCeBeYjwq8lXdqT8DQAtRh/g0lc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=KNswghoDfyOntPje2C3OdtPwo9mC2Gpz5ysLj/PEXWADyU9apjbLVZvLCj854Swe9AYDg2Mb0nlyJetD07exLLv8ACwq2tYqV1BzHq7ygzlsmq1/LLmEl8lZCFFA4JXLN/d4nZ+XR8UPb8NIWGYrcRV8XY0ZqVFis7DGGU26/Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd6KM30N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B84C4CEED
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731321673;
	bh=Cu2VkK0DAJmrT5qqHCeBeYjwq8lXdqT8DQAtRh/g0lc=;
	h=Subject:From:Date:To:From;
	b=cd6KM30NbCtDUFdDls2eONtdUwG75uxKjJZ3RTA5F8Qui5Ic92RLLywhUgUjl5K8P
	 9i1MPm2+rpLLw54vlbl8JGV/l0s4gw33ZplGwbhrmH4Vf5OHz/9DBTSSSpTEq42wvj
	 uPDIX699iYDZ+ZACjJZFRdg/5OZVo9g7/OeDzSuxXiPdHD1fQUhi2B+FxLRYJvVhWD
	 9gVgfe1hF9IJJ5kDOJ7+QV+P6sj1W6h0nOR3iOKShjzqTzHLxM4hnROlDg8vkEu1cP
	 EUrYSgigE7m+kNFQ3pswN2hYAIK4K/mFhH4z2RoK2u9eDe0IKloBDb8heuJAg+wIB0
	 +3YNQcl/EuzBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 39DFE3809A80
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 10:41:24 +0000 (UTC)
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
 <173132168273.3983078.9762688739508103192.git-patchwork-summary@kernel.org>
Date: Mon, 11 Nov 2024 10:41:22 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v3] MAINTAINERS: Re-add cancelled Renesas driver sections
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=908330
  Lore link: https://lore.kernel.org/r/4b2105332edca277f07ffa195796975e9ddce994.1731319098.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



