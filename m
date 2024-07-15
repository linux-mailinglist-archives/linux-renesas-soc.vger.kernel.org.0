Return-Path: <linux-renesas-soc+bounces-7337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC8931228
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365EE1F2355C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8553F187354;
	Mon, 15 Jul 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InB8U+H9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F86187351
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721038883; cv=none; b=ctWfZl6nRj5asOWESizMO/RPVmT81by6J8EBOFxBLXV3f63hPiF3csMEIAfXMSqUc6Hy/L7zYUPT+Tvx8H5dDKfVuBAVnNLtog0WAIQ2inyBURLoDxgxR/i6grC8tcN2l5djifnmVR317NOifXw4+baiRqWPFn/wqOPd9mBtDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721038883; c=relaxed/simple;
	bh=c3aW7LK08tvFkpKWbKMFVsag5/wvVkDyAM4JUZ6wm5E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=NLT/ODoVtoL1vVj2hifwTLnQ59yBy3vJilgNHMe2BUmzJscRwUGLa73Ouy9LFzp4b/es2wxNvN/RzmClXYmzdh2V6LKLzs2IlXfubqz0CWQqeUQhdJctKygjPGXrpxz3MvEipzIMSFnLxAJ/6IOIZn3uUNiaj9Fa3oOeowzS3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InB8U+H9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22759C4AF0A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721038883;
	bh=c3aW7LK08tvFkpKWbKMFVsag5/wvVkDyAM4JUZ6wm5E=;
	h=Subject:From:Date:To:From;
	b=InB8U+H9oGWUYE+e1ZbSOvgA1vU3VTNxZ6EgDaxk5fqbjzUzEMuI43G64brdctEuz
	 r7VD8WE5hg+DqSdCvdBKnyfZuAF1uwNgoht1H93FeH7Lf0KEyd5kQIVJR3okdls5Bp
	 k34h/kgFHJE7IgoUTTr3MSz2sunHB94Bp9ltPJdEmS/Sl/EXLLVPVnNUh9IRWUpenq
	 EsF2cXNbI4c9u2flT2vEf4UA6ktu9YxLCdvSXjtlRqQdDMS7aFIah9mlVImBKI5h+Q
	 xGnvnp8V0Bdns9wUlg2sX9zE3e6NxTYp0zdO/w19xNiDM0NvjIAWmOoL8/zfB5b8G9
	 253FTZXyeEhJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D07CC43445
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 10:21:23 +0000 (UTC)
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
 <172103888297.22157.11053150146231820065.git-patchwork-summary@kernel.org>
Date: Mon, 15 Jul 2024 10:21:22 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: i2c: testunit: avoid re-issued work after read message
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=870471
  Lore link: https://lore.kernel.org/r/20240711120818.46543-2-wsa+renesas@sang-engineering.com

Patch: i2c: testunit: correct Kconfig description
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=869982
  Lore link: https://lore.kernel.org/r/20240710065511.10330-2-wsa+renesas@sang-engineering.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



