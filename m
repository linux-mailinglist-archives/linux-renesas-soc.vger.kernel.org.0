Return-Path: <linux-renesas-soc+bounces-15487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3DA7E512
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D936B4209A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEA11FF7DE;
	Mon,  7 Apr 2025 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ip7+SdGj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066E1FFC4D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039690; cv=none; b=JNhow6F8Wmi8FAkCW2yZgtEEv5iJh/XAzZVWUf2nRRP4a8aCT2iUeiK0IwqKleGXZ3Ug90DTYH9otvsqUIRlATQIBTvc1T08jwtTBucgQIdk42+4dDDFoRNBEV2DuURQNDP5uFtBb+PmFeGT0Rj7iM/YOzRBJGdI2XlFuIH1p98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039690; c=relaxed/simple;
	bh=AeCDJp54wAGtMg9CHmvKgr9djrzK4GgL9KpmTxPCRpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pswHz/BKiDvS4prCZQKoDnF0dEE8oO1XaNWRIIDCQOHWwv02tEgOXIy4n1fNIiaZl8i0tSebspJrMe0v9Ku+H5zUyluqQm4po/95spfXobKBXZ+mtTrsqKGDzJ62MU4PT6C+n1h4BUwvLL49JP/3bP2jgtMTMRFSghljYvI9yZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ip7+SdGj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b166fa41bso353942e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039686; x=1744644486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0o6na0F8TAk6lCusT5NLJ6CNUgxmH5Vy2ajrZSzJE8=;
        b=ip7+SdGjNUtgxOKuleuXElFbE+taTNOp21mE4yMEU060uNwuijy+AaNAIgkpy5Xe1b
         BMWxoMO7/2KNMJoH92cbcDgPL+ydUOPzVhpS/06/At+OS13M4SJF5d7nhKoEcDyC5hUi
         5NanepfdNLqTl4Q61rQwBk3tnjreCcerW+it/02yO8n4jjZGcdrXpwzTxyYZum723/JJ
         FcoYbC51fXiVoSPfEJANbdIGK5a8t5q+l2R7ximUipadjB+CL+RCz/R4OqYMC1ErfNrx
         kSU+eCd/j3VK8Z0DRfneu+J10UO7CXHJlJF3iOCObzF3e/LtcgZuQ9TVct9L2uWuB39S
         kdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039686; x=1744644486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0o6na0F8TAk6lCusT5NLJ6CNUgxmH5Vy2ajrZSzJE8=;
        b=wWgFEkBmmgv/nv7dgtyDCu/wXtY+2KhWWPYDPiNTJTGak7tRlg24kCL8L1ikJ5WiPC
         4EFjAu3CcAbQejYCVlN014+kgNuik5h3CbhTI925Q97GaKUYajW4L/G0skxU72XPS27z
         R8SKF0hGak/HOpDXrfcErogW2sOTxtxS9SGZtLYwzhqt7y6WJU+TBPydBrDCPKlzJyPi
         WvLqGRrktLtg6BY4+NLAjNimgLRqEi0u0aAFHsEpnueqCNfGqlgLFNmMUZ2UFje795Vc
         dzQAFaQvsB392BiGlS3b9Xvv+s8llJ4IGUUCBo/VLnPMsl/R8DAgnV+nbFuYA9wbFFQK
         F14g==
X-Forwarded-Encrypted: i=1; AJvYcCXLQ1biTa1hjcTnW6uE9j4TAhO2H72R6p0MHcwIhhwXDBFgXph5G/hq7g3JdP/ZPh/PZbVRtUvksYu+XoUQN+3RdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Te01rm6jEll8nnQM8ul6fIWKPSTYEKdYnNLGXZ5gPEuYC0sy
	wBJHdeBDFpEP2KbJZkOou+CjzkIXu5XWeSUQqfyafoeywxDqZ9BYNkAARzehRzQ=
X-Gm-Gg: ASbGncvd6+Jllt6+xbZIU39ZS8vytMby4CykprtIzL5oS8hxtyNo50ku8rFm6Ya1Lml
	al34CUnb5mvDKgEvK35ISCRkjCB9Pz1Cio/AbVvhQDURtGgGOGPyTxNagClpYZD/aW1BThCR2Kn
	JxhBBILsKqy5sL1qZUPNu9tvPYYZQujTsDmVUqWozbLo3s+io6H7NJqRxHJQeGJR5cMbZ82nOu1
	tcUAedY1Wlq6xCeUc6oxrAMrpvu04N9JptaZrs9W38obcwY2cEUjHrjPiNctXXRcTmr7s0ayv05
	fDvWEcIOxFFsOPbwskIQvIYewCxc5nXdv8ywVeNNO9FfCLmr54NPkGmc1vKpoF6YpmsnrXWVE6S
	Fi/B1UBn2YvFdwjTff6c=
X-Google-Smtp-Source: AGHT+IGP9ssOV6pn79yVfRWiq3KAcys7QHTQQoul8wvyG5t+BivqElpyAW6czWaQuzr79w8RI0P1Cg==
X-Received: by 2002:a05:651c:211c:b0:308:f860:7c1 with SMTP id 38308e7fff4ca-30f0c03c545mr42993461fa.30.1744039686432;
        Mon, 07 Apr 2025 08:28:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avri Altman <avri.altman@sandisk.com>
Subject: [PATCH v2 1/5] mmc: core: Convert mmc_can_poweroff_notify() into a bool
Date: Mon,  7 Apr 2025 17:27:51 +0200
Message-ID: <20250407152759.25160-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407152759.25160-1-ulf.hansson@linaro.org>
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's really a true/false value that matters, let's make it clear by
returning a bool instead.

Reviewed-by: Avri Altman <avri.altman@sandisk.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

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


