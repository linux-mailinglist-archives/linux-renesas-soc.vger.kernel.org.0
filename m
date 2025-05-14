Return-Path: <linux-renesas-soc+bounces-17096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2011EAB6A60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363263ACDB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F09F272E7A;
	Wed, 14 May 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sK0QNaCy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC01F875A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222794; cv=none; b=D0bB9ZSNzT8eA+kFzjRB2kIB0mrwJYhhVNOy2O5XCOqaPaUupZQyOYtdke2ON4YZPphS9ewJTus8lNT/kt6HuVuwd5RylaY6ZHPUZKb4POBfPo8r+fpicFSi2QDAd+9xV3iIj/EZVjyPDGWJ2+vK8K+xeTPwbi2H2BXmKDd5Sv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222794; c=relaxed/simple;
	bh=VhaRuw8JXxy6ohRqDPmZDq6f50f8UedKQsLEpYD0ri0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=h+wu1z/rdlii6Hdko43vZ3W8K20LdHYDWec4JyuzcZZ0P2uzW4YdQO+i+UFWZ9TeIbNxrMhNEXX8R+RLzFoA8RlG4/JPaxUdKiwAFZDYk8M62Y9e+ZsHTxn6j8TERMh5ARb6Jwr/vvTHCweIER880fGxXGyj8Q6Y2amjAzvQJbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sK0QNaCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0922C4CEF0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222794;
	bh=VhaRuw8JXxy6ohRqDPmZDq6f50f8UedKQsLEpYD0ri0=;
	h=Subject:From:Date:To:From;
	b=sK0QNaCyC09ql8zrlhfKIhbuuS/xmlQqllrtqEna1BMDJijScuopUxLbgIaGc0+dr
	 afw4hVnV7l0i4Y8F3cEbQaqI6hgoTxxFJYpBXg7wAFqVeYK7CjGp6DFis7PKqM8pNe
	 P254ON0kxZJrFheCyIzJgK9MsgoSV6EjiJ93tcaeFHqtTK9aXZInmC8rxjlMq4FdzS
	 blZgM5bc2DYd500WrgyFSKyKV/67ghAjDXddWxflpjnPlIFB3yzajY7Z3QuZ8WKGoA
	 oT2GwYr1t2/CMutwK+YIpqS9w8hXHXozCclOHgffr1C7+qH3vP6eWnEUROs64H2aK/
	 86ETBxf5BYOsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 748B3380AA66
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 11:40:32 +0000 (UTC)
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
 <174722283099.2330703.10875616236463832972.git-patchwork-summary@kernel.org>
Date: Wed, 14 May 2025 11:40:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: sparrow-hawk: Disable dtc spi_bus_bridge check
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=961912
  Lore link: https://lore.kernel.org/r/fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399.git.geert+renesas@glider.be

Series: Add specific RZ/Five cache compatible
  Submitter: Conor Dooley <conor@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962055
  Lore link: https://lore.kernel.org/r/20250512-daily-saga-36a3a017dd42@spud
    Patches: [v2,1/2] dt-bindings: cache: add specific RZ/Five compatible to ax45mp
             [v2,2/2] riscv: dts: renesas: add specific RZ/Five cache compatible


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



