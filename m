Return-Path: <linux-renesas-soc+bounces-885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABB80C4EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 10:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153A91C20999
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83A421378;
	Mon, 11 Dec 2023 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqAeUgvS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0D21376
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 09:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EA8CC433C7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702287653;
	bh=Sz+1KuRfRcdvOVdiqjb/uTtWlXQOKlPXXc4x2aKTvE0=;
	h=Subject:From:Date:To:From;
	b=TqAeUgvSLTkPmTTJzFLKYXlSd6eTTj3DMhSc0lUJSdlUJFO+v6ARuR5AtMBboU/lH
	 TAfjAq58yAYRBk9I2cCSGGUXxJLU+7QKKNsadzT7ediC3c8/WDh1rojFyI1ZnTT//6
	 Xv1bD1wN0KweccKWgXEGz5BiYwVpKPGnIGki6WpfPjg2iMgbwUbBaJnJRYQoCPu1vA
	 oXVmyhTM+VkAO2yWlqtFm38ogwHK1uO9XX6wR9Zi/1Zxu/1un8pNmBi3cKZsY6xuuY
	 m5DbOU5gk3Vlth8n3sswN8jBYdYDYtKODm8LV5w5EitonAbHLnfExxufC281YnBnAO
	 273YY0HCEc2SQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58CBBC4314C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 09:40:53 +0000 (UTC)
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
 <170228765330.5878.11409138845182809002.git-patchwork-summary@kernel.org>
Date: Mon, 11 Dec 2023 09:40:53 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v3] riscv: errata: andes: Probe for IOCP only once in boot stage
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Palmer Dabbelt <palmer@rivosinc.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=805772
  Lore link: https://lore.kernel.org/r/20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Fix invalid wait context of set_track_prepare()
  Submitter: Liu Shixin <liushixin2@huawei.com>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=801218
  Lore link: https://lore.kernel.org/r/20231115082138.2649870-1-liushixin2@huawei.com
    Patches: [1/2] Revert "mm/kmemleak: move the initialisation of object to __link_object"
             [2/2] mm/kmemleak: move set_track_prepare() outside raw_spinlocks


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



