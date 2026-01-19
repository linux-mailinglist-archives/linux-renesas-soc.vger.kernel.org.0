Return-Path: <linux-renesas-soc+bounces-27045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9BD3AB40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E68E30006FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE89F36E47F;
	Mon, 19 Jan 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4J0tP8P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFBF35BDB9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831762; cv=none; b=mYt1tR+OVOCksASZXo37x5CExkW0IgxRHtdkWjXXNHvST4GoAVuiHAikytlwKfitKiRe6FVGZijZjZXY5JJaBb2EN40gthbiqnDBiRw4MYS0/6PrhNNgryOEnrL/ns/0CAA3uoryO4TOhJwjHnSvOU7hFxC/fG/4u4TuWGwF+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831762; c=relaxed/simple;
	bh=TTtQOeWErwFOrOMgLhS4h9t1YPuRN/11AFA5jMM1yKU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=aFfLthI4Yw4u1nYDSWtDQxjKoLuE2NvISTXEthLGD71En1vqiZJq28r2woQhGfDFLyzNOFByKIeuzbyZpr/IRUfFlV/JAwz6a7jjNRp3+PL4Azxi/FadnCZ2rEC++hPdGq5CMcIwZzQ0E7dgJML5B/g2HTLNi0Cz+FUwf/9aBJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4J0tP8P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E74C116C6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831762;
	bh=TTtQOeWErwFOrOMgLhS4h9t1YPuRN/11AFA5jMM1yKU=;
	h=Subject:From:Date:To:From;
	b=D4J0tP8Po5sC1AD4BAXjUVLdJd1PUTSIL33SkX3VjTEv59OXdYyW5p5E5Za5anyK3
	 zyLVEd6uSOdZ3y6de+aZGGEp1pYwMfpRGZpDxtLCjZkpEwyXxx2A3Cg3buv6/jE+/C
	 +UlXk2gBKW4pWPW39seQntsGWWTiFSPDpCgKMsfRnJriQiY8vTJ5r9ULpw0u81th90
	 DDLWkpc3L0NxhEs0eAKNKLe/LYOm6r7kzXgiNijWrMGA6SGsGQsc/loeb10pxwPgqX
	 uotRj7X5jSrvTO9Wylmm0rSyJnm56Cbf6aVszqmisnLdjpHDOU5Dd8DMnswf6ZnQSA
	 gmEeBA3igSoFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3182039EDE31
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 14:05:53 +0000 (UTC)
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
 <176883155165.1426077.17031771750266397616.git-patchwork-summary@kernel.org>
Date: Mon, 19 Jan 2026 14:05:51 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1023155
  Lore link: https://lore.kernel.org/r/20251113195052.564338-1-biju.das.jz@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



