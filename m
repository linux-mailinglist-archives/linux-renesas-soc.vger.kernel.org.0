Return-Path: <linux-renesas-soc+bounces-7170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CF92A24B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 14:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77C9B228D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 12:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898A913DB98;
	Mon,  8 Jul 2024 12:09:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AC913D8B8;
	Mon,  8 Jul 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440598; cv=none; b=O4F6RlRnmqWc5oGwILiT0zmJBxxLCMcPnKwVZ+0X49lB0Ys6o3y7mn0YOp9TVvfyyVcqX5JyjNGtBXaVcebg9diqUQVhaDZMKNJuL+xq2s3k3e+Nu+feTkfxUC6uquw2557HmYBmlzdFFe6vdioKP43xdMhpSIYF0geirGVkU+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440598; c=relaxed/simple;
	bh=96kBXqUCCgpBggC0DQgfChmI2Fc3hmD6Zu7vnAuL33k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vCLOzzklPrihr1ncszFpVn+WP/9voTcejKrnB+eY40DLqQpHiYUMkQGIlDYtUmmC/JcyEfD7ba6r1sSPY1NcYrn9p81WtzLJdtAybESfiLhAPUQETCckXUkuQD8MVmTr/ggt91jsK+f1V4RnEBIB/R4NoFaw+j3676zKik/E4XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="214631180"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2024 21:09:53 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 993BD40029BE;
	Mon,  8 Jul 2024 21:09:53 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] scsi: ufs: renesas: Refactor code for other UFS controller
Date: Mon,  8 Jul 2024 21:09:26 +0900
Message-Id: <20240708120931.1703956-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current UFS controller of R-Car S4-8 ES 1.0 only requires statical values
for initializing it. However, other UFS controller (R-Car S4-8 ES 1.2) will
require dynamic values like eFuse values. So, refactor the code for it.
For now, readling eFuse values function which Geert-san made is under
review [1]. So, this patch series refactors is the code only.

[1]
https://lore.kernel.org/all/cover.1716974502.git.geert+renesas@glider.be/

Yoshihiro Shimoda (5):
  scsi: ufs: renesas: Refactor init code for other UFS controller
  scsi: ufs: renesas: Remove a static local variable
  scsi: ufs: renesas: Use udelay() directly
  scsi: ufs: renesas: Refactoring specific PHY settings of 0x10a[df]
  scsi: ufs: renesas: Add reusable functions

 drivers/ufs/host/ufs-renesas.c | 523 +++++++++++++++++----------------
 1 file changed, 265 insertions(+), 258 deletions(-)

-- 
2.25.1


