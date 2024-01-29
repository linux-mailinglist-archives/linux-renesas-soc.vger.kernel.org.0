Return-Path: <linux-renesas-soc+bounces-1950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E9841425
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284A02877F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 20:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE567152DF7;
	Mon, 29 Jan 2024 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bokvl0Ff"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053C6F08E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559820; cv=none; b=Mxd4e1dgOTl9ON9bG7123jcOlwrU7JP10qOjFKiojiBi7xayfDnGCFIH/vOL3qByf/x0PKPgwftQKrUBn6rI6L/NUTrvfKoDJBru3iNKxatkT4DSEuqbWHA8Unjsh+hi9ELbwseY3k8wnUZogHo47B+uv4A++UCN5n4tFFxq0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559820; c=relaxed/simple;
	bh=iMlH79qYBNldFFv1Njqv0IFBn14F++he1X19oe3kb2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFp+KTiZ7B9UuJeZ4NqZaVeDUs/kExrL9q9nJ2n6b7dObTuHLjA1n7qmHrYVFgktJQb6dqDGoTSO8OWF/AMWSAuHmZGdbeLypx4Z3HUkT4BgoRfFcuErVej752DhoJWb4fz/QhC3n+QyexUd3LkIrtrPelAN2uMgiXFD3SF/G20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bokvl0Ff; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so371552066b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559817; x=1707164617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsKZI3XpF+N8SjQE4iiekcXHPqMgd276oSIsUuTPE94=;
        b=bokvl0FfyfVFASuSHk4y5Sd1Z09fRIlKpjDjLflVEHcBfHgUOVuDFhJD1yTtkracDo
         8YxM+HG8naD/2wzcuihIUTWg04bHma8Iw2lahCORNGbJfP5uB9ltHy8vD0+CkgmJvLxm
         FUG33QfQCKtRiI0EWJ7RDEw+EslU9JgPvMY8nbKiOX0ahYYs4LfZn+X8SKamztiUWf2e
         8tRdGKobCkJfzs2nDrRIiRgSFupjI66+X8A13bYVc5lDnbplhsJeIFrKVOyZTcuak3cV
         x8xQz/coY6vAp4Er0BlIH3EdqVkO4JxQFoW9jsewuDBN9AEOAexOjXjCbokcGJdXuTfJ
         zuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559817; x=1707164617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsKZI3XpF+N8SjQE4iiekcXHPqMgd276oSIsUuTPE94=;
        b=XBWVOgGo4sFu7uwItX3F8/UfAW3Q/OPxROzqZiHOK5/YjeCEZsg8wvb1IwDam/5Q5G
         Yo6VjBb+NZwJpB/ELDCWt39iSaBhyPds+kdacmwBO+vOO5gbWbjVMFeH0q3ZBIZJLH5q
         zE290hksr4WtMxLR9GOpMGW0kVCiAayWaScpVUy2YmfNACt8jsdSwRbBWRXkQwSXnNFs
         /9cWdntabo9kKok019Bg21sk4ZYxClhLl+SyFeG7V5Q45W6TRSCrEzXG4j8flo5eNtGu
         HaJujOyM8I/VklstRoN3xe6QpEQA4KgNODcpHpMontfQNV578HL4oz7ZiRmxJ6jHOl7l
         JKlg==
X-Gm-Message-State: AOJu0YxFTZ5qsIiZsz0+460d/fqx0nS0Q4PrqEond2l5t9V4wHYlqvbR
	rm3QWQ3Qo23Qnw6sf9gV+BeQjGFr6KPLhXgdquTf6wcGHf/48rl0SdCEIugDjpU=
X-Google-Smtp-Source: AGHT+IHBrrjPFytBekLy/kVDe2ZVNPI83c4pp/h5GEOdIwRjRes3Octz7os4vo9YlvlezEsI6Lmf4A==
X-Received: by 2002:a17:906:b195:b0:a35:9513:4081 with SMTP id w21-20020a170906b19500b00a3595134081mr3119544ejy.14.1706559816976;
        Mon, 29 Jan 2024 12:23:36 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:36 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/6] media: rcar-vin: Fold simple functions into only caller
Date: Mon, 29 Jan 2024 21:22:51 +0100
Message-ID: <20240129202254.1126012-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The two functions rvin_parallel_subdevice_detach() and
rvin_group_cleanup() have been reworked over time and have become
simpler and now only have one call site each.

To make refactoring of the notifier code simpler fold them into their
only call sites.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 24 ++++++-------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 8555fa446811..d8b9c3b991b1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -58,12 +58,6 @@
 static DEFINE_MUTEX(rvin_group_lock);
 static struct rvin_group *rvin_group_data;
 
-static void rvin_group_cleanup(struct rvin_group *group)
-{
-	media_device_cleanup(&group->mdev);
-	mutex_destroy(&group->lock);
-}
-
 static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 {
 	struct media_device *mdev = &group->mdev;
@@ -103,7 +97,8 @@ static void rvin_group_release(struct kref *kref)
 
 	rvin_group_data = NULL;
 
-	rvin_group_cleanup(group);
+	media_device_cleanup(&group->mdev);
+	mutex_destroy(&group->lock);
 
 	kfree(group);
 
@@ -558,15 +553,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	return 0;
 }
 
-static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
-{
-	rvin_v4l2_unregister(vin);
-	vin->parallel.subdev = NULL;
-
-	if (!vin->info->use_mc)
-		rvin_free_controls(vin);
-}
-
 static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
@@ -611,7 +597,11 @@ static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
 	vin_dbg(vin, "unbind parallel subdev %s\n", subdev->name);
 
 	mutex_lock(&vin->lock);
-	rvin_parallel_subdevice_detach(vin);
+	rvin_v4l2_unregister(vin);
+	vin->parallel.subdev = NULL;
+
+	if (!vin->info->use_mc)
+		rvin_free_controls(vin);
 	mutex_unlock(&vin->lock);
 }
 
-- 
2.43.0


