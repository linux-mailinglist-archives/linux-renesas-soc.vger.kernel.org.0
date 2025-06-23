Return-Path: <linux-renesas-soc+bounces-18628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEAAE4560
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 15:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A64A44229A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C7725392D;
	Mon, 23 Jun 2025 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tcho9F84"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B125392C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jun 2025 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686036; cv=none; b=AziN8avu6gavyDOV/IkVNi3veZjoAR69RQanK/B/d8v763HcHJdjA11DdZ+yDiBU5OvSgUB0eSE4EmooxymsryTzulKGyb5p3z+o/QYAfS8b1dNbYU6YvONzQ5wrQdLA3WaKb7ju5uUQ84DjQZUZPeDpDigT41qM8LxQuVbZJtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686036; c=relaxed/simple;
	bh=mPqfAlkH2V61NJXdF5Xb9yvfXqDJbcIODRUoNX8q2RQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=jLeukA8gk1nBcf/smk1h75xG4Zecelx3V8HzHOzLpg79Kp0CYALQAomUxxd5CQ6osduEx68FnP7TP0J32LPPo+cj/TAv+QpSfgUCJcXvF1omkhJEorbOymTtIFm7D/WZ3FIQ61+afb86xdhPY/rAq78D4azdqjm9SgCt0Ig3nC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tcho9F84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F10BC4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jun 2025 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750686036;
	bh=mPqfAlkH2V61NJXdF5Xb9yvfXqDJbcIODRUoNX8q2RQ=;
	h=Subject:From:Date:To:From;
	b=Tcho9F84tBmh0kJzYHidgIKU1cSeLSv2cl4Ltefd+aWygg0yfd0zilBXQfkQd5xZ1
	 Ex1A46EfvBz5uqNOXzi+cUJDxp5srtTcZo6QgMQgN6qELPiyV9B3iLpD/HVG7+CEyH
	 gANqxWhXU6jbgy8iP/3N39BKRv0ij+lQ643yoeEg/PPKVuczVhNyAW3eIUbCbh6IqM
	 Cfm428rS0IzK6WhY8ffp4TIBDBGOpRr/8yg59Zs/fkgOPqCH+CXmtJN+GcabDBULkf
	 EdTIIYqiqs75A5Aq8hia3nKIupeq/EVyuOm7kzX8p0ktjIMO+nQ1LMUYAWGQecoPgu
	 ORZZuoFJggJKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B199B38111DD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jun 2025 13:41:04 +0000 (UTC)
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
 <175068606332.3156304.6231665014523296182.git-patchwork-summary@kernel.org>
Date: Mon, 23 Jun 2025 13:41:03 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: i2c: use inclusive callbacks in struct i2c_algorithm
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=971207
  Lore link: https://lore.kernel.org/r/20250612081729.84329-1-wsa+renesas@sang-engineering.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



