Return-Path: <linux-renesas-soc+bounces-18942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F9AEEC20
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 03:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF5F3E03A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 01:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D3A1A073F;
	Tue,  1 Jul 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJBzXRUy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073019CD13;
	Tue,  1 Jul 2025 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751333986; cv=none; b=e8NEGlLy7P5bAcaPSg/r1xppqpkK7ARufJ4z/OqPx/sZ+M4Px0IvJD48fkyFzw47NACgzVFgtHeryga4bzWfX74W8bw+51hkqNfbys6A91rezuky4vq+bjP9Y2SqLbHdZOq/JYDdB8ivfLDr1GJptw7DPRqK4ymVW6e7DXoSYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751333986; c=relaxed/simple;
	bh=hNW7Z/hU4G5S0IRXdCYnRXl5RwKhn/46t5ucRp82Imw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Bs2b675VuOh8EgQ3Np9wGT3s1CZxf2pHHSwIffLO4vzA6WH/hYT7Pt/5xZR902EN57uw/sGzpKZybQsWJaczIXyiCc8NRj3w2KTcyiaczNsEb5ppxlC4GlagL3RYQGZFmkvD1j36XkJViO1Xf8ld9jIe0xmEkzLhPKyw7vHFSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJBzXRUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08D0C4CEF5;
	Tue,  1 Jul 2025 01:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751333985;
	bh=hNW7Z/hU4G5S0IRXdCYnRXl5RwKhn/46t5ucRp82Imw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oJBzXRUyDlh8xRMWoWy3U4atiU2VW45LGOeRpgVyJP6I+zATQq3dhjWCSY1BQS20l
	 juWLbqtuJyb+sgAqX2DeQ91SeiEv6pkSbyzpNzH28IqRYlkGzFlWV1QMsjJjzSWQbn
	 1tGKOVTPDs4cRUpTOLDrxGFIWzXF/lMt3xd7vSMEKVdkvrU1AdSl2JZ7wrYlWhuvPN
	 NR7WaRErlYY3wzp4gMySSW08Of0gIseWJV1KzLUrSId2FbP3/GO9iyu2zOW6HUCMfc
	 UkYzjhnuM6uk0qONBv2rE7rO5xK+j4jPDkpkvja767UWO6Bw7IJnvZyy/pIPL7o/US
	 GKgO0Cuk1lxOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFB438111CE;
	Tue,  1 Jul 2025 01:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: adjust file entry after renaming rzv2h-gbeth
 dtb
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175133401075.3632945.11017105407045410659.git-patchwork-notify@kernel.org>
Date: Tue, 01 Jul 2025 01:40:10 +0000
References: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@redhat.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 27 Jun 2025 15:44:53 +0200 you wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit d53320aeef18 ("dt-bindings: net: Rename
> renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
> renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
> adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
> DRIVER section in MAINTAINERS.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb
    https://git.kernel.org/netdev/net/c/3b2c45cb1b50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



