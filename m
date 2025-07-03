Return-Path: <linux-renesas-soc+bounces-19080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD80AF71C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 13:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B140165A26
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F2E22D78F;
	Thu,  3 Jul 2025 11:08:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636142E2EFD;
	Thu,  3 Jul 2025 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540894; cv=none; b=JrmTV+ggBTiit0UT8ILDgnG7nePNHkhfIWfSoS8Z9C9h23ZCHZrzbuVNQCw12qzj3kn8qq1htdLNiMteRG3trNPAb246+wrDAF5QMeR4EsOPX84jBWUT4kaWW7bk3q17dyuHBPhMlCfdjGtI0gyOMFLMB8R//0LCYkLj7aOtOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540894; c=relaxed/simple;
	bh=nQ0i//OeOyftxY70pnyCLFIQiHmHKowvqGnd/2lFKU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uwj094H1893cMh/60gumzlwTq/1bQQoHcMRWQE1DqyeICZNyRIFkQVsiVDB9An5eDOybeoMjx25lJBqLASdXv0ECZIoS6MyzPW0u/zk0M8YoaCKFXoQ6vS/FlOaa7V1icJ2cLHIzpkyS4/RJ4WUq4MOCVOO3Cq6OSLxrbvpWpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: bmOSdLTPTR+ov5eeu73bJg==
X-CSE-MsgGUID: mum5qDdKSmiqoKaxWWLuew==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jul 2025 20:08:08 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D2FF040029D3;
	Thu,  3 Jul 2025 20:08:06 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH v4 0/2] phy: renesas: r8a779f0-ether-serdes: driver
 enhancement
Date: Thu, 03 Jul 2025 13:07:22 +0200
Message-Id: <20250703-renesas-serdes-update-v4-0-1db5629cac2b@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpkZmgC/3XNTQ7CIBAF4Ks0rB3DX0t15T2MC4TBsrBtoBJNw
 92ljSa66PK9zPtmJhGDx0iO1UwCJh/90JcgdxUxne5vCN6WTDjlNa25gIA9Rh2h7CxGeIxWTwg
 CjWy4Y41zkpTtGND55+qeLyV3Pk5DeK1vEl/ar6g2xMSBAjqmjGLGHqQ5fe72ZriTxUzi12m3H
 FGcVjLhjFXUXvW/k3N+A8S+V3kEAQAA
X-Change-ID: 20250523-renesas-serdes-update-3ec462f16ff4
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751540886; l=1312;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=nQ0i//OeOyftxY70pnyCLFIQiHmHKowvqGnd/2lFKU4=;
 b=dyfl8jNl0FVwyzaeYjDy0Zl/mdDbVHMxbeKF568+fBnu9uoiCDKLyCLbKh1+JPjVQfOYmlQ1+
 LlrWSIJ+fvmDmGbuz2vL+YjTFeIBhdwty8tEZHcjGQIVbuudpvJH0lF
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Hi,

This patch set adds the following to the r8a779f0-ether-serdes driver:

 * USXGMII mode support for 2.5GBit/s ethernet Phys
 * A new configuration step suggested by the latest R-Car S4-8 users
   manual V. 1.20.

Changes in v4:
- Fixed email threading
- Link to v3: https://lore.kernel.org/r/20250528-renesas-serdes-update-v3-0-8413fcd70dba@renesas.com

Changes in v3: 
- Fixed wrong macro (reported by kernel test bot).
- Link to v2: https://lore.kernel.org/r/20250527-renesas-serdes-update-v2-0-ef17c71cd94c@renesas.com

Changes from v1:
 - Modify this driver for the R-Car S4-8 only
 - So, this patch set drops the followings:
 -- any dt doc modification
 -- X5H support.
 -- 5GBASER support
 -- Registers' macros

Thanks,

Michael

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
---
Michael Dege (2):
      phy: renesas: r8a779f0-ether-serdes: add USXGMII mode
      phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet

 drivers/phy/renesas/r8a779f0-ether-serdes.c | 97 +++++++++++++++++++++++++----
 1 file changed, 85 insertions(+), 12 deletions(-)
---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250523-renesas-serdes-update-3ec462f16ff4

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


