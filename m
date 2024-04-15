Return-Path: <linux-renesas-soc+bounces-4612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB88A4D85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 13:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB941F22855
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 11:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0365D8EB;
	Mon, 15 Apr 2024 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEPuQsQp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10D5D756
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713180050; cv=none; b=tQPD98ylU5wjhckCQQMsFGn5ShHfTn5KBJlq3c7AmkiNqBjdDaUrb4b6LAr1oz7N3hT+GE57eXkVMSmOJ/y4biG+dYH8a8Tscjlq5pzjO9oRiC4McKIAS6AXz7SJ7SmHBneuKBxrWZ5P811ypo2JTDutW1YX2boo3eTG0TXzQFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713180050; c=relaxed/simple;
	bh=n+R8/gk0fIh+23mUT7wZeQ1o1Rrfx85B9ngJPNl9s6o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=ulgFC8kei5c3OFQ0yvXHnqOr8yfYgGzdg2ScHSR72QseCWePWA8eH38KMcvc61qAt1MJnoM+jny/ogCaNe8KYocmmqutqI0oKdtEk0HTXeYlg5Pq145ncfleWqpTb45DGDtn98uDyMzvhXU41BQ9oZM/0KC4pBAFr9NYE9mCXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEPuQsQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9F12C113CC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713180049;
	bh=n+R8/gk0fIh+23mUT7wZeQ1o1Rrfx85B9ngJPNl9s6o=;
	h=Subject:From:Date:To:From;
	b=mEPuQsQpu7wug4oTu8dDjHkRNaqTMowGl2IsKsVyULs6cx8T6ndi9PNO8Rczjv0bs
	 vgfcJ0cv/Ju9M9XaxBhea9YNH7b3IxnIDo2kWbktHz+v7eeaZcBwOL15p+nfZjBciD
	 bEDdHsyY0Gexgp0yGyimNqou+boIEAgJVhXqxoO50IHLd9XQi7tAhEuD+iGWe/t33K
	 syNnQSwVepQHQLBHpvcawcQxiv8ab6DoRpdjl6ECAiqy3bWrBxeD+9MklN+v7trTze
	 NeAzHVOHtNQ+DeuD9gIzDPZ1iUS/LD5dvTztUtaNhdXC7+fXiOkaU864dM+6wXz0Rl
	 f9wZZZyv34M5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9D5CC433F2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2024 11:20:49 +0000 (UTC)
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
 <171318004969.5779.18025260086936631336.git-patchwork-summary@kernel.org>
Date: Mon, 15 Apr 2024 11:20:49 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: s4sk: Fix ethernet0 alias
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=842686
  Lore link: https://lore.kernel.org/r/2f62c29e4222387a95ebadc65ba90a0cdea9b78c.1712647914.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



