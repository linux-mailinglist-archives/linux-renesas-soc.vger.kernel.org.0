Return-Path: <linux-renesas-soc+bounces-11087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE29E8F49
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 10:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66AF161D5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 09:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45122217724;
	Mon,  9 Dec 2024 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f++3kwEL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201BE217F42
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737862; cv=none; b=ZxsLc7wT5YWHnXNgcTRptaoDpIsdL3mxXRquGxtYMlrUCVQ1P+wMZAoBwpuRkT1RAuzOpzb6sMNw9IZyDFLWiEzy8h/JcQN08o8Ozf8FG7/+0q/MYfwV11FKpLya8rorhHYUtVgwZVf3D3eQnw6ztCqUYNF5bmfAWf2CV4S6sM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737862; c=relaxed/simple;
	bh=WnppomJebLn3sgmhEpI5hasMpd8Ggy1cAou1yGyf2jA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=F9Bf2mCdmmeRoLWNBEDbT/HMaMucrRrUkrceSJA9VgiAoIAAGWh7oljbiuVGmY4hoKE/pk7PqRR0IGxPVPY5W435EXaFeATjxbFD1UmqY1ZjkMPTcWCHn4kA60WPnkSTUrR9vXtvxx8dxKBfeAkCP/z7tyyabHcIL0+K843d4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f++3kwEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A321AC4CEDE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737861;
	bh=WnppomJebLn3sgmhEpI5hasMpd8Ggy1cAou1yGyf2jA=;
	h=Subject:From:Date:To:From;
	b=f++3kwEL5JpdsBHzERzPy+wImEhSmOMaypB1z3MgdciavHntl1p2ZwPsw3F4d0xzq
	 FrBV8YqZtxWQCZy8hIWUERPdx2YQzMrzK1Pyq9tKPrRoiZjP+/TGqmzekyyYTNqwsn
	 zVUX921dCMbTYQG+yWpCY61q8eSYEajaGXCWSW4vFyIdCkBw6e1hr/RW3coy+cAtox
	 zjp0Dr38YtDU8Nm1/d/XOPly5Q0MzDMwzSxZflfN+XCEll26t9UITl7N37BhOVsIkp
	 ZG/goGm02G8iBJz/KXZy7s/LE3WAul3dpEdi3cArVwakgJNMvDWAL/K6on6uoyXFaN
	 x5Br4ZFUuQlqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B51E380A95D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 09:51:18 +0000 (UTC)
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
 <173373787663.4155285.11524446146402345010.git-patchwork-summary@kernel.org>
Date: Mon, 09 Dec 2024 09:51:16 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: genirq/proc: Add missing space separator back
  Submitter: Thomas Gleixner <tglx@linutronix.de>
  Committer: Thomas Gleixner <tglx@linutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914094
  Lore link: https://lore.kernel.org/r/87zfldt5g4.ffs@tglx

Series: scsi: ufs: Bug fixes for ufs core and platform drivers
  Submitter: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
  Committer: Martin K. Petersen <martin.petersen@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=908514
  Lore link: https://lore.kernel.org/r/20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org
    Patches: [1/5] scsi: ufs: core: Cancel RTC work during ufshcd_remove()
             [2/5] scsi: ufs: qcom: Only free platform MSIs when ESI is enabled
             [3/5] scsi: ufs: pltfrm: Disable runtime PM during removal of glue drivers
             [4/5] scsi: ufs: pltfrm: Drop PM runtime reference count after ufshcd_remove()
             [5/5] scsi: ufs: pltfrm: Dellocate HBA during ufshcd_pltfrm_remove()

Patch: scsi: ufs: Switch back to struct platform_driver::remove()
  Submitter: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Committer: Martin K. Petersen <martin.petersen@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911042
  Lore link: https://lore.kernel.org/r/20241119182856.55743-2-u.kleine-koenig@baylibre.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



