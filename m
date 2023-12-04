Return-Path: <linux-renesas-soc+bounces-610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9878802DEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 10:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823A3280D06
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D321171B;
	Mon,  4 Dec 2023 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeV0eZad"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C654C8F9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 09:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD0F3C433C9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701681044;
	bh=+WxpRiAUSazKru6pIyLmJDlz9LLq7kjdBujgqwXGrBY=;
	h=Subject:From:Date:To:From;
	b=PeV0eZadUsBF/8rr2Uecbwukzh8U7uYEEpGuY5bLW0Es4GdfnPh7dh3aMMgcMw5Jf
	 ygtjPP9sffukqY1+GzqVpJ3LF/ZNQ6xURccy/CUzDcWfn99ibM0ysTbdn0+zzb/J4k
	 pMu0Yv8rUpu9GVwIfsA4FL7loZ8A5Dq+MWBE0vNRuA4DcVg/mS08BRAZQ4sBNSv+9Q
	 aYBWQyezYakYYF3nDeSnB9kKdZKkoxewXME89LyA7gXTjW9wwlfENASxdj5M0ASh/C
	 p/MIO22y6nEBpKBwIaakz6kpUq4wJENp2EtgvL7904t1NVm0q6F/GUl5cN0GRYW9rp
	 PZ/zdvqIbyZmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9DD57C41677
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 09:10:44 +0000 (UTC)
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
 <170168104459.26380.7779314004763659143.git-patchwork-summary@kernel.org>
Date: Mon, 04 Dec 2023 09:10:44 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: media: vsp1: Remove unbalanced .s_stream(0) calls
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=796036
  Lore link: https://lore.kernel.org/r/20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com

Series: net: ravb: Fixes for the ravb driver
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=804761
  Lore link: https://lore.kernel.org/r/20231128080439.852467-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v2,1/6] net: ravb: Check return value of reset_control_deassert()
             [v2,2/6] net: ravb: Use pm_runtime_resume_and_get()
             [v2,3/6] net: ravb: Make write access to CXR35 first before accessing other EMAC registers
             [v2,4/6] net: ravb: Start TX queues after HW initialization succeeded
             [v2,5/6] net: ravb: Stop DMA in case of failures on ravb_open()
             [v2,6/6] net: ravb: Keep reverse order of operations in ravb_remove()

Series: net: rswitch: Fix issues in rswitch_start_xmit()
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803110
  Lore link: https://lore.kernel.org/r/20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,v3,1/3] net: rswitch: Fix type of ret in rswitch_start_xmit()
             [net,v3,2/3] net: rswitch: Fix return value in rswitch_start_xmit()
             [net,v3,3/3] net: rswitch: Fix missing dev_kfree_skb_any() in error path

Patch: [net,v4] ravb: Fix races between ravb_tx_timeout_work() and net related ops
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=804482
  Lore link: https://lore.kernel.org/r/20231127122420.3706751-1-yoshihiro.shimoda.uh@renesas.com


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



