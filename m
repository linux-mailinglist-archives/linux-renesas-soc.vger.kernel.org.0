Return-Path: <linux-renesas-soc+bounces-3052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2758C85E265
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 17:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39D31F249FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 16:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF1E823BF;
	Wed, 21 Feb 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeKP/fK+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4886281733
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531233; cv=none; b=jpdPuMkXyrNQzpsGEI7rrleKVqQwSo5GO7K4SVJuzHWcZhIz6U956McygVtpYIbTKDnI6bsRsfTdQDoAldmMn7okXE240AeBWoGn8921BuFEF7hthwLyIT3rhSdOdy5y/Dpk/ttKvkfANYq458cyVgnEdcIACTixHOZHqKuZt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531233; c=relaxed/simple;
	bh=nvbEPwgEUfEqlWGz/Uf7r3zk5UQ+i42ipsp1Z3fzkIs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=YY6r8n3y2RxVeP/q9XKhbKQ+SDluHp7HoyipZvDxrBi2n2RN6h1pTGS1a43aTNFKwNYKIJ+/KcmnWgxIjo0J1NA6Wj2nyTnDjjtMlCRbrX9tBawmv5YEiMMR0XD/Lt8kHvIYmcSIn7hYapYhutmhALht6+/grW+vEUG6v/LT0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeKP/fK+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB537C43390
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708531232;
	bh=nvbEPwgEUfEqlWGz/Uf7r3zk5UQ+i42ipsp1Z3fzkIs=;
	h=Subject:From:Date:To:From;
	b=oeKP/fK+2yBkpTJmfeqKUvFupdY6DY/nu/JM2A5qusI7szDAofWBqSZLqxNg+P6ZO
	 oLWbO6RY4Di0WgX+Ay27y0Jo7aBmb151TBmd1QtDfPTszSjJ3MEqUYX+BrOf1bj/jc
	 pSQP6srZ4PIEcFYXrXeWnK64DhMZK5dkaJ0PYacEl//klRRMHvTO2GfpwPlwH8WX9e
	 2MkwP+TuxX9CQPpPnZuq+L5N8JF6YfdpgyFJ4hMsDYEGNr5gRP0Nw0rK2pU8hOWHU1
	 k+eEUx9mCAFv/Tbus7u+S4UOUWY2PR+7mNBhdP7b37o9innZjh8wbJd7wT40Onsm7C
	 mCuS/N3YJ2fqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFD49C00446
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:00:32 +0000 (UTC)
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
 <170853123262.17598.17157788802958418633.git-patchwork-summary@kernel.org>
Date: Wed, 21 Feb 2024 16:00:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v3] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=825639
  Lore link: https://lore.kernel.org/r/20240213141300.159847-1-biju.das.jz@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



