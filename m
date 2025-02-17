Return-Path: <linux-renesas-soc+bounces-13191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC81A37DCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC633A6551
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8F5190482;
	Mon, 17 Feb 2025 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oekQH8Az"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BF1547C3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782937; cv=none; b=r1e8v4B0xnJvucanyNhp2r8fWqFV8RfBaVUePo0ngDiYV0VI2SS5n2pO1noq9N/jLXblP4Qy5nJzA7gcaTm1YO1/9GNbvI5cz8PWE8qk0hRRRMqzvNWtvPgYDCpZ1jZYO7GGZEWxrE0l1Q7kzvHTVnjSxvnER1+JvkWrWCOxcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782937; c=relaxed/simple;
	bh=jtb8G7mxNhoq9BgxZfDGskSX+s787frOLUa+sTBqXts=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=h8HAcBjMxsGJUVHutnn/reEZ5V96H1vNR6IWlRe4xYrK70dHVwANK2cnJeeuxvQiCtgQgHlrElW8sS6Ji+vgsy3AOu5pPQxMywGyU/tUbkcaZUu9Wc0KJtx1Wr+rJnQqgyqbcY/lQZQEosmuMygF6LxjIK6wpJlV/3dLfhhJD3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oekQH8Az; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9081C4CED1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739782935;
	bh=jtb8G7mxNhoq9BgxZfDGskSX+s787frOLUa+sTBqXts=;
	h=Subject:From:Date:To:From;
	b=oekQH8AzoErDl7otOvA9RNYU3Kn69FoexGHp8cKXfU5HCsgpO+RjPiev6Nza1UbiB
	 c3KNQFtsWZcQsQOLDfWwWBYNM5SJL1aiPDTHbPGaDQzKQjTWDwqDCjsFo1ed46s4Kh
	 5CzZvVblptuwYAez3WBYc7T8drMc3+49KUI3aupQ5q16tIenViws6KmoL6hoe6XAsS
	 RrMkCOfa67Qm6WxvXlH6iTogIl5u/g57ve3b7BWrVR3TLhfLH+BmtHr/2shrLMl/eR
	 96vQ4FyuMBINBgZYmojX9m1aVN4CY8f0xQrHHMkZTSZEqSZ+CavA9IZX7LFWCnuWLv
	 An4j91UhGE47w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB514380AAD2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 09:02:46 +0000 (UTC)
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
 <173978296540.3343929.17145031879310701667.git-patchwork-summary@kernel.org>
Date: Mon, 17 Feb 2025 09:02:45 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode quirk
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=932026
  Lore link: https://lore.kernel.org/r/20250209145708.106914-1-marek.vasut+renesas@mailbox.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



