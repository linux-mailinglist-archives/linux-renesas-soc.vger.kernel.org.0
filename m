Return-Path: <linux-renesas-soc+bounces-19710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BBB1396A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 13:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0A0E3B6A31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 11:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D39A1F949;
	Mon, 28 Jul 2025 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5xUqYzE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28830A93D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jul 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700445; cv=none; b=NQDovs6Zhf7n7qscgAq3PtUmshPOon3xEg9llrHZ9wgn0EeHHXfPQjgKnW2NnkbXZ9e8FfI0JvDQ5rHGmKHynbywiMm6Xa7wtJ+JZgr1vcEyKGxsp7kbzYsaZ1hAcJnVfsvtIjw7s2PRH2/ir2TBkWPhJAfFOGoiF0sFkqBUvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700445; c=relaxed/simple;
	bh=xdkP9MZi02KQX0hVYp4tgOmwFNXoZxEYDPk94M+gYNc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=tC3rCFpzL5DlWmPGrr0h09mHN8Kgv8FikNS7DC9k93f73smBKcfS8WS4VJBSL4JFxmyRq6RoyEzZUvCZRGyjIWkLgoljOp9rsPuOkquVtpIMCvN11hnNst+ZJu+QeesOVc5C4I3qrtj3n23p1hNP2xhKpx3eEMDPzM6729pWpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5xUqYzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAA8C4CEF6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jul 2025 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753700443;
	bh=xdkP9MZi02KQX0hVYp4tgOmwFNXoZxEYDPk94M+gYNc=;
	h=Subject:From:Date:To:From;
	b=J5xUqYzEZfI+1ffcJKc5yQxcw5DsHYj1VQnp5JM+fbyaVFSlDdXbRGts+f81m3k0x
	 not3J/jcyTD04ZQDZ2JhYSJ1tqmBbk4i0SwrbPzHMLVD8ZkhiwysS0PeV5zROKvmjc
	 jQxmzuOhkmvp3GCuu4Kw0wUCYMvX3xH8ugLJcaCZVkMaKZnvOFwdhJ3eAXS305stA8
	 KZ3soOxP3kfdmQPbg69Tx7/4Y3MtAIIyqz7zJX9dHyzW/4ciY1r+cm/UBmn/9KnUjg
	 QHJYHk5jArgMzemuw6Vzp7DE2O2eRPrNpf20dl6imbfLVwzUOshK1pwibij/ITv54E
	 jt22bTOr1YAWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74A92383BF5F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jul 2025 11:01:01 +0000 (UTC)
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
 <175370046004.660504.12227696319855679803.git-patchwork-summary@kernel.org>
Date: Mon, 28 Jul 2025 11:01:00 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] net: ethernet: rtsn: Fix a null pointer dereference in rtsn_probe()
  Submitter: Haoxiang Li <haoxiang_li2024@163.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=978552
  Lore link: https://lore.kernel.org/r/20250703100109.2541018-1-haoxiang_li2024@163.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



