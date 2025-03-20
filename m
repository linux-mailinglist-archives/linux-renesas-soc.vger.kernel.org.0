Return-Path: <linux-renesas-soc+bounces-14688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FDDA6A7DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 728DD3BF932
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B8E2236ED;
	Thu, 20 Mar 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKAeFCP+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C21D6DBF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479254; cv=none; b=TordnJBKjVrghkwnEx1l1xiPhi96Ug6YKAF1/7iobsbyQlVJvrDK3LmmteSVXd+Q/dl+97LVtdMNhHCb0rYe6Z2u/0WciBzBhskttmAB85tfiOsd4BUrJfiFgtYmXHLPImfYHA7bL1Esgrxqf8DTzZooolys+HGviiF3Vh7NvNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479254; c=relaxed/simple;
	bh=j4UBzDHgk4sG7kqb/Znxr+FvEZ/5sfuewiW9AIFkVSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KljY6c+27ywPmwSqp/q7cZILCorkHnGi/71JlQxk4EzayB7z12QlyqiNjRIiSx3j7WMZylz7V/N+hjFSLgIc0ui7U6kn45nrZoGyeaZ+BeSF7ZapOMo5i5gJ2DcsAy8T2AXglFqrq0HBhnEHervHS9peG1qI6JQnCB3dP3t4sQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKAeFCP+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5439a6179a7so903976e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742479250; x=1743084050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1plaKCpUseZn1Yu08x42hT09CM3UN2ZDD1b7XB7y9s=;
        b=NKAeFCP+tJ9jaqQlMdRR3APcTkkrZ99hA0tP5R5qtxhXeC4jt9eDkkl2pqQq0OGDMh
         aN/S9eJ+dzKpewWdQbaJEM2QB4jkSQBZIODAUhEp3pgrbdleSyLDkdTrAaersbQ0RTVj
         q57b5hdc9wfCRVjktN3OnYDVC1peOBL0RdD0TAxHK+fCJc/WhGkwu5mTsGiXKneA6DFI
         gyl16nK34SRjGjakXTzfnqWoudAhaLhfmPQs9FNkTgYSwNfFAf/dlFzUDjYCIMbPhkiC
         xQj1ZeFRuaYWbruVlDNmfgC/wiBfgo9yN4J0UP1q8zWizr9JZlUZ7ZJyi9sEh0KlVw7B
         Gktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479250; x=1743084050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1plaKCpUseZn1Yu08x42hT09CM3UN2ZDD1b7XB7y9s=;
        b=Y5eAnsiCLd5E4g6Plt4z3KXoqqiBTuv2x+vv9f5aeUzgkPkDfZSFIHh+dc0ovYucFX
         JKnzTokIYj3MZNEG9pxjLuUlZKbEz7YoTUZm3wtSDLOZxKUx182J4t4Xl+s5cdc4j1JP
         J7D/nR/2bZXKE16nf5zq16O5oafpHHNzK8ti6CMK0NGzPkDfsWwu/GivSP7pI3YL5UMl
         0XodgwKMZpjNYcvAfeFTTwe6U3tPICMrPsi6Jkg732zY++wjb5ZM1FDXdKpUW1xhAZWG
         9gWn4WEMdhc1lVeCNQoTynrIQh9lQd844RMfmnlXctmLpiOR22s0z1oDI0DGDT/kUSg4
         LC6A==
X-Forwarded-Encrypted: i=1; AJvYcCUiGoxRoSUz5OlEoXFMRGNEKsobSUgXk9OVb+PMGehHc9n0XMeCRoxoQGNxQkNfn36exTvVoQVFVvBjkvbHsF/xpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAveIkmkfWwrbj4mBVRRI+baKm/YBlWkGceR3adMY5k+LkPqi
	MyzVp3IoRVcQ75bJf09Sfs4eBP57V9rH2VBIZLeUA+hyFOQb5FOSUm9kUbJLbzM=
X-Gm-Gg: ASbGncvU4Mwif5T+NsJWbMjl7VBGic3g60zdgXI67U07tBD/lck9WRPnTiJX3B5HYpY
	2JWB24wYN1fRMtNvjnQwSIHRpfb/Wk2T2Wr/NTuEKGoDNJLCkQH/KaYs2P/Qdxka0JCKXJc9ASe
	p5isJ6ZJBqYB6qr4ymxOfHdy7dCaMx4dbr3jLv0ysJbmB1L+cau/kK2q/6rjnaxccLpcT+PWuUM
	3aKUQG4tGKBffiUthZWpnQqdsDH16fR4WBTTpM/6XUD73xUqmxEL8hTDv0UxP3QZAahUYJFw0Pj
	mYbqH9l6YhA7Dg1SRWbQtFcRFAZbGgbsSINdVIELG/ZRCJkUZLb8wQZ/mogs1+jHlwg8DfCC7tl
	ioONG3rhbstjHjUlbKv0=
X-Google-Smtp-Source: AGHT+IGLDkayWqw+uQ+t5WY6cfFF97KDSfF4dlhtyKOD98B93BOTyBSUBT6MzlDFFxBRVZdolYijWg==
X-Received: by 2002:a05:6512:304f:b0:549:6ae7:e679 with SMTP id 2adb3069b0e04-54acfa79c17mr1505467e87.3.1742479249732;
        Thu, 20 Mar 2025 07:00:49 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864dd9sm2295029e87.148.2025.03.20.07.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:00:49 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] mmc: core: Convert mmc_can_poweroff_notify() into a bool
Date: Thu, 20 Mar 2025 15:00:32 +0100
Message-ID: <20250320140040.162416-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320140040.162416-1-ulf.hansson@linaro.org>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's really a true/false value that matters, let's make it clear by
returning a bool instead.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/core/mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 1522fd2b517d..3424bc9e20c5 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2007,7 +2007,7 @@ static int mmc_sleep(struct mmc_host *host)
 	return err;
 }
 
-static int mmc_can_poweroff_notify(const struct mmc_card *card)
+static bool mmc_can_poweroff_notify(const struct mmc_card *card)
 {
 	return card &&
 		mmc_card_mmc(card) &&
-- 
2.43.0


