Return-Path: <linux-renesas-soc+bounces-10244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 324199B7AF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 13:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 636DB1C21D6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E371619D886;
	Thu, 31 Oct 2024 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M97F/5F3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D51E871;
	Thu, 31 Oct 2024 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378609; cv=none; b=mwy+fWI9z2thCXNIwhoI3R0Zjb+jnsZrPQBTXNZdtDB9pMv35qyahsSvv3yVPrgErxdXuyrY9XGdO3Wrp49DdC6H5E8A8f5GhHCGvMDupUqGOZGocm3N61S/oG0m6loGUl4ecTfJ+3uGzbGPEaz0NZEhFqeuYCnDsEN6Z5PiKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378609; c=relaxed/simple;
	bh=AkKHx5eD3JOEHbGvtlRRQxoBiW2Ng0/M36tPib01V9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z2CPP8Fe8n3HgNRerhhODjALshm8wlwlvk1E1jM231A67vkIvOpUAvupFSMH7Gw9x8r2EJ3TuXknoBQp58uxPghDSW1KYB8Jks3VolgT32viVH/uOnhiswEgLop/8XqwXU3mtiM5blHIZR0TzWKa+MSXZobWIRpUQwZ7pIpTJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M97F/5F3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so626865f8f.0;
        Thu, 31 Oct 2024 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378605; x=1730983405; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGTb/DXB9jyYc8OeK66BIDZaMKcbgVQrCpPcNzMKXo4=;
        b=M97F/5F3N+UC6jyrvEqN5JZOpkwa0m3w99GPE8xGV7N/V0aLhIBBFFBFKtklE9S84n
         D0fUw+fzZeXyNzdC1goPBESkO30G/5p6ExgG7WLCD9Q+6Wc3HZ5nmNYo6nkQvXM2utAX
         DvWo3CZ5MolavU4pTfFzmbL8pVxxdjRGTfprVqae+dgd6l+x2j51TE8wWYSWhKGHj/a4
         7Pb4VigNZ3sE5jmURDMkE0VVW0ed28Qf0Ddt6uxfiP7ffPetAj8KCjVwJVnYNa1ONksA
         V0XhSYMDHxZEOQfArsuu7S0EbYhsGLOwBaYJkbAJvtNbt3NT4bvYck1BUZM9BkvotUWi
         XNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378605; x=1730983405;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGTb/DXB9jyYc8OeK66BIDZaMKcbgVQrCpPcNzMKXo4=;
        b=DyHAyIQd3MwUaDTrDR0f0TY6NdG/ydDJmOR09wKPK8FdiBA5R+PXNKuwxXRS3ryQAs
         7AQqJQ3lU9RDkpPE+twmCXj5nehMIw1LRmQ/stoGhPJbuW/v3wuwqFBCuB2PPS1Gi3ZA
         uLhELry5YB5H9Zz880abGTU6CMb7yLLUZ1MAQMgKpOToDms11a9v5B9wuyuAX34NDhbP
         gCtqex6UJXK18jHXZMLGJVqcJ0WPHWcV+ZuRx4i5PK6p1AFJsZOH3gjwrn90JCOKFyIu
         xezUC4LmkyZO70MpS3GNkZ2y39Gq1C+vd9Ywy5MJQD2tXzXtlf+X79qvBWsCt1TExlcA
         G6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc7MPuIAFDoU2gUCh+nAzxRmrd+USZYgiFXsGQGt4oRj7ViEEoekmFdojyD3+PTkYopV5XnqGcJpc=@vger.kernel.org, AJvYcCXBUXd25F8wJbFvgvRwfyyxEe9t425RKW/MpKlYo1vRmqklKVwup1z1RcetzCL7D0PWoMczpqemzhagoNNy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uN08U8w+XsUTecWm6z6C1Hm40twuHvlyl0YhQ/EBYpY4U/Ls
	MwGp2/7dJDDw3xEm0ChyvSZ5jupzDe1JAszRiK5pwuBtz+4lPLkz
X-Google-Smtp-Source: AGHT+IFEIVQ6pPS463YcejXrPDyaSA/UtTd61XxgHxKzbLgWYHBucBJA9TZFt3elDzGAGWQm/OFVzA==
X-Received: by 2002:adf:fdd2:0:b0:37d:3999:7b4 with SMTP id ffacd0b85a97d-381b707641bmr5307715f8f.17.1730378604792;
        Thu, 31 Oct 2024 05:43:24 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-d7b9-afdb-c541-d023.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7b9:afdb:c541:d023])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abdasm2021810f8f.97.2024.10.31.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:43:23 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 31 Oct 2024 13:43:16 +0100
Subject: [PATCH v2] clk: renesas: cpg-mssr: fix 'soc' node handling in
 cpg_mssr_reserved_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-clk-renesas-cpg-mssr-cleanup-v2-1-0010936d1154@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGN7I2cC/42NQQ6CMBAAv2L27BraEhRP/sNwKMsCG6GQrhIN4
 e9WXuBx5jCzgnIUVrgeVoi8iMoUEtjjAaj3oWOUJjHYzOYmcwZpeGDkwOoVae5wVI1Jsg+vGU3
 pXNMWrqaSICXmyK289/y9StyLPqf42W+L+dk/w4vBDAt7seecqW6pvnWjl+FE0wjVtm1f95hVV
 sgAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730378603; l=1720;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AkKHx5eD3JOEHbGvtlRRQxoBiW2Ng0/M36tPib01V9w=;
 b=nmTqZwyudmz5MVr0qhXTgTM6WrccGhKYgvQPFOc06zJIc77Np2zcshJVVb7+oFt+kYmHvXAz4
 to57HC7fXWXAcYSj+HjgVn17U31E7DgDCAlrHsrOwSm/SAFrMJ7qptw
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

A device_node reference obtained via of_find_node_by_path() requires
explicit calls to of_node_put() after it is no longer required to avoid
leaking the resource.

Instead of adding the missing calls to of_node_put() in all execution
paths, use the cleanup attribute for 'soc' by means of the __free()
macro, which automatically calls of_node_put() when the variable goes
out of scope.

Fixes: 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Squash patches for mainline solution without intermediate steps.
- Link to v1: https://lore.kernel.org/r/20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 79e7a90c3b1b..bf85501709f0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -979,7 +979,7 @@ static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
 static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 					 const struct cpg_mssr_info *info)
 {
-	struct device_node *soc = of_find_node_by_path("/soc");
+	struct device_node *soc __free(device_node) = of_find_node_by_path("/soc");
 	struct device_node *node;
 	uint32_t args[MAX_PHANDLE_ARGS];
 	unsigned int *ids = NULL;

---
base-commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
change-id: 20241031-clk-renesas-cpg-mssr-cleanup-1933df63bc9c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


