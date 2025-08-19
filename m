Return-Path: <linux-renesas-soc+bounces-20696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E3B2BE01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 11:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B034E3A9F71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 09:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C5831B13C;
	Tue, 19 Aug 2025 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARXZMRhw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C091531B138
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596997; cv=none; b=LfqlQSI/9cXZ9Uy2AK8klr7KN3MXvnVfc2DjqNM9UrrQcVZI3AMDdm1DTvvd9sKKSnWaQjqowW5UJH/+gFiRLZLx+MEGzRn0cFo9cSEcq7iODUQ5arICeLno0XK7ZIrynzlqD0H1Qs47vb2M0iwxgo+NKdSLIG5tAcZgzL1P1Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596997; c=relaxed/simple;
	bh=rfYwpIN+FIJ8AowWbiEveVVrI1C0PXLdK5aACMJk9mg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=GVZ107tdlYkfhcfKJTptmlOoT1sf1WGXYXZ5xCt2yqZOn28D5z7mJnfYIAEaHD0XbtFV2qraAWbk0WglN7oP8Qa2YXjqN8wHvq3AfA+JMvEvX9VJjTLgjPPOM2y7io7cHrcBv3OoZs6UfFHea7DVMtTEoC/YBWo2oDObfzBc8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARXZMRhw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F96C4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755596997;
	bh=rfYwpIN+FIJ8AowWbiEveVVrI1C0PXLdK5aACMJk9mg=;
	h=Subject:From:Date:To:From;
	b=ARXZMRhwRtxKf4Acf1rwnFFfBlfg81fT1l0VlxvIuB+rQBYn4Fte1lB8MiiSBJr9s
	 c+L5mNXjbw+Q3kH9HS/urTtV03j1IQT5No1sN3KzdEB2d9ulxRZxhXBIJd8GdNABdJ
	 LCIztAsoi9RHgQv3Ld72fECwrYjLEVnX7JGSxcZNfwIsxuwL3MVTUI2+O7i1aEEvFN
	 Fe3T8JlkGtOg9bfROrKYtl7QTSjMLeBJVIy9iziogc+6CD40+/QySJ1ECRfoXkJ0TC
	 1IgjHBqaz6LFBQJWQ5r8Q/PS9leJn6HFV0MTy3mcQtRaByQu1RYlHJbmHCIywGMhw9
	 d/xveE4Sb4zlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B774383BF58
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 09:50:08 +0000 (UTC)
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
 <175559700669.3472455.10671051661214385090.git-patchwork-summary@kernel.org>
Date: Tue, 19 Aug 2025 09:50:06 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add support for SCI/LEDs/I2C/MMC on RZ/{T2H,RZ/N2H} SoCs and boards
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=990711
  Lore link: https://lore.kernel.org/r/20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/13] arm64: dts: renesas: r9a09g077: Add DT nodes for SCI channels 1-5
             [02/13] arm64: dts: renesas: r9a09g087: Add DT nodes for SCI channels 1-5
             [03/13] arm64: dts: renesas: r9a09g077: Add pinctrl node


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



