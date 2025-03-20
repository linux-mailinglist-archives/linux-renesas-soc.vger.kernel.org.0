Return-Path: <linux-renesas-soc+bounces-14689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C6A6A7C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF6917A80C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 14:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777FD2236FC;
	Thu, 20 Mar 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1lWHOCQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B92222C0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479254; cv=none; b=aePwlE4CfR7zwzv0YeSaajqNJfDgGZKB305FVGpUaQTVhHVONnPQ5KRBLO464N5TwJylB2UshnypErcOiDsUv7wcgHUkCcGvo8XNCJg5CE4Iy2pR8c+GBerLgE87ie9WfYUqvbow35seatBXzVBvxIDwBlHnwn2DjRJ+jTgSfW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479254; c=relaxed/simple;
	bh=TMAuU4onZ/cymJIqOhYHnqnXdS4duBL3QBe64ptE4WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBdkFghCi6lP6caszLrxrt0XaYXxnlxZ+z0/bZI3noNACZ8S448ZL2O3+NDTxb5E8y41v6kjYC/KKuWBSB4M8Z1aGNhmvPP5pfXVnikybMFRrcFs+tZIAJMFoN1g7hTvXO9aRVC/CMu3YPl6HPBFhTAeaNxNIPas6ubwmEXjDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1lWHOCQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so876975e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742479250; x=1743084050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVzbvi3/XOkK9yO+8BTkmB73EOh3os+jpQOtKlsdsjI=;
        b=Q1lWHOCQY33Aa/+3B6BQRldaZyHpuImNA3g9jUhdE2SkBpLJedbp+kAVzwCR5DS1jg
         n0YgSQPkgMvDqmCEe3rULS6UKStWjWRugpgKfVSkjMAd57oKyvsB4HdGGoiYIXcC1KUr
         sUrlQ1MJKu2DEi4pgBCu0mBd26oE8WQIRKwcIBbnIS4iJfa50DFjk07lCCIHboGFktz0
         1D9ykGLkVyGk8mv04EXQPtnVfEcvqaHwL8URKhTLsGsULURNxT0Qh6vJZyrUMkgZUGR4
         PsC7bPowtMnF4W9eha7ONc7mUe5Sg7j7+dvtoLkBMUxrgAncZeZnWHCrXJSBazbrJBEo
         cihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479250; x=1743084050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVzbvi3/XOkK9yO+8BTkmB73EOh3os+jpQOtKlsdsjI=;
        b=GWzvTyha/aMI+yosj09GO2FP8leeTmwDusMNlnoAwg6jSfakymTOaM3dgejp/1+Klw
         YV71suwYJgH+x+tSO2rLJOOIs7bpeQi8rrFHuha1fTZ3UpBCFPmGPedwbHveknrJFp2Q
         UvDsaXGI90eROoXSz/RiTM6thyzvD+LG7kHdyOz8sse1Gu6l1TTmH+h1ttkHpAkaWF14
         FzCP34dWb3yeeS32xgOxjemMLKk2JAoI/puBKmElneGU25bNVHKyanHOA9Oosu8Dx/ba
         ZiP29952+h8sO3rnZ7DulTkqdf8uhwtvyQKpmNlES5YzHz66zpQpqKgMb1CEkCvMe+Ea
         3SRg==
X-Forwarded-Encrypted: i=1; AJvYcCWX6OksrtyGZAuRQYLXyJMZL15xoAXX9WEyAJb+4LIDysLqkKoOp5mEbj99ymNeCopOZrZR4W+Qh6IoSILNnLB2bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXP3me4T5oGtNqtjRryZCrZukyXK4fZ1/wqdpDoHLCFk33qTvs
	7IF7/YKSCrif15Is1ZAFp1AW6yIw+7KDdf8fjUr61FvcF2iAHhhHs1YvCxUTc6Q=
X-Gm-Gg: ASbGncsliTMaaSpEURn9Hc6jdtrFSkpvO0l5477MQtDIjMoC+4cIDXUc1hFQNk7AI60
	OWgfSbHQuiBecXLHaRsy8CvN0fDrl2BMyhsqL1PRk/hyuybalee6HNwMbH/TFESIiYkfCz5lU/T
	kDijhYCXpSqS3lrPtVmqD2FHEVB9afYYBXWcnUdgzlbV5XsmriPiNUdChBQCowGdFZfKM1I5wnw
	yH/HSxqi1Qtw6GHEpWkeSWxeoVopFniR5AdXjvC4T23TyHAnTkBLq532Y8v2/NCDEIIdh8zEOFd
	y/CPf/2zyLtBjws8QK3sElUk3rwkXmI9rK4oWTOofiarQtgz0cwWJBuJnI98hCNm37gW3g0+EHf
	wfvpT0l/f5tNKXesngy4=
X-Google-Smtp-Source: AGHT+IFMYBU0DIXrF7R99VRRvNyaKksRIT+6rLXREKORT7TWKL6TEFXo8/nh8xP6GcxkGQSqzFY85g==
X-Received: by 2002:a05:6512:3191:b0:545:49d:5474 with SMTP id 2adb3069b0e04-54ad062a16cmr981532e87.20.1742479248474;
        Thu, 20 Mar 2025 07:00:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864dd9sm2295029e87.148.2025.03.20.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:00:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] mmc: core: Add support for graceful host removal for eMMC/SD
Date: Thu, 20 Mar 2025 15:00:31 +0100
Message-ID: <20250320140040.162416-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As pointed out by Wolfram Sang and already discussed at LKML [1] - an mmc host
driver may allow to unbind from its corresponding host device. If there is and
eMMC/SD card attached to the host, the mmc core will just try to cut the power
for it, without trying to make a graceful power-off, thus potentially we could
damage the card.

This series intends to fix this problem for eMMC/SD cards.

Please help to test and review!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20241007093447.33084-2-wsa+renesas@sang-engineering.com/

Ulf Hansson (5):
  mmc: core: Convert mmc_can_poweroff_notify() into a bool
  mmc: core: Further avoid re-storing power to the eMMC before a
    shutdown
  mmc: core: Convert into an enum for the poweroff-type for eMMC
  mmc: core: Add support for graceful host removal for eMMC
  mmc: core: Add support for graceful host removal for SD

 drivers/mmc/core/mmc.c | 66 +++++++++++++++++++++++++++++-------------
 drivers/mmc/core/sd.c  | 25 +++++++++-------
 2 files changed, 61 insertions(+), 30 deletions(-)

-- 
2.43.0


