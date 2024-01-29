Return-Path: <linux-renesas-soc+bounces-1951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C464841426
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD8D91F23888
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 20:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EBF155A39;
	Mon, 29 Jan 2024 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jBPjWz2H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6447E76052
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559821; cv=none; b=Qsqy3Lz3ewQwVESiM2LmahOtL/4k2UjIZjzeBMn2WINsr092ZUtZpEsm7gyMv2a5ka6gSxVXvu67Mjz+VxN5AUceWDwg2hyLpoqs7Irfw74s2x0n3GK6VHPBqfEOcaiNVklPe44p9ndaJ385h6jHM3F1jYKpeDY55bQTqNHU7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559821; c=relaxed/simple;
	bh=YWG8CmzKubJdFKXSw2HqQKL1M446C1ZATh7csfQ+A8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E08xId+k27uZdfXXGCs64d8wX3GbCEW+DqjJD2F/P3+oy9Py8n4yDKW8Cw/ai/BbMmZmouPc9FVC8HTuNv844JozN5R8rIFi+owevBc71tvzbMoPPFA0iGBkEyUkr6pEOpImHwzb9K3bIwK4tuAwON/eWf0pUd8ryst/3H65zaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jBPjWz2H; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a36126e7459so12877666b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559817; x=1707164617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE6W35lEetVAB3eg8tehPOxi2QHoyhdMj4ExMler4UE=;
        b=jBPjWz2Hg+7hmt72dVvJDryMWDvVXyOHkUOuXmjSlSSZxSsZ1+jDkxiwmjV+56TBac
         CnrsTf+nCt96vcG5mxBNPESu/F3PD8s1zoARgbekLyrVogrgMLp34tkKk0/vz+6+FHd7
         HV8VTB5ipOGrcEs6jTLDGLNoXx1MN7xW6v2mKugrd8bSNZZtvAk3DD38QScgDoLsxEgQ
         qfjWL6XK7hZG64b4RZzG2tUlJQ4Xznx6ALNMdM/8N71zwYcotZ5nlAB3qbJIEX0zUDyx
         VQjPL4SujCPCGbajqnXJB93V+FMYDwgaoRE+Tr1mYm2jbZ4+9gKDqOG5xdjOG639pysh
         ex4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559817; x=1707164617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE6W35lEetVAB3eg8tehPOxi2QHoyhdMj4ExMler4UE=;
        b=NaQGf34EO24pl8Cq/IH3STBQduzBz/gmnOu2qNROeadJzzjEhcI6ZWIZP9iCwFCO4S
         hxOJKWdHy13j8cEJXRUjZaZWwnVXEuOVUvn+iwRPqQLuht8TQP/1zf+Y1yfByS/KRWmM
         xJJ716hvyVusg61E5cmvEvQYZC2nGAsU5UQA64xQj7/nDuXr7Bhs3uF1G24pb2JeOldm
         lHOAguwYosN9iVLs1xHJc+UKD9xn7GN2P4upCiYicHMrB46YvKiM1/9gjGXXpZohy+Ni
         9+PmL8uo+lBH/aYbchZbh2nVA7p+dV9nPyqulp0kSiPkwAmAW0vvYe6JMZmb8KbGrdMK
         lQtw==
X-Gm-Message-State: AOJu0Yy+BIuJSPXwxo8ZxjAkWrIe+aFvk8MnASLioPVbIGf+ecp59VMX
	nIjR3LcHexa0O2G0D/lS9d1xycpLbTYtLFOg7WPd4utR0MiM17AhGPmjBHqF12Q=
X-Google-Smtp-Source: AGHT+IFRd7Y8onCkOcHtW4j+5UkkKadTRq1UsjG2UtELDSqfo/CZHCAGZQNAuYMuTMu1jx3/tiF7rQ==
X-Received: by 2002:a17:906:d7b2:b0:a31:6811:bf99 with SMTP id pk18-20020a170906d7b200b00a316811bf99mr5268746ejb.56.1706559817580;
        Mon, 29 Jan 2024 12:23:37 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:37 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/6] media: rcar-vin: Register the media device together with the group
Date: Mon, 29 Jan 2024 21:22:52 +0100
Message-ID: <20240129202254.1126012-5-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for replacing the shared group notifier with an individual
notifier per VIN by moving the media device registration and
un-registration to the group. This is needed as the media device will
still be shared between all VIN:s.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index d8b9c3b991b1..ffc79c26a303 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -85,7 +85,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 
 	media_device_init(mdev);
 
-	return 0;
+	return media_device_register(mdev);
 }
 
 static void rvin_group_release(struct kref *kref)
@@ -97,6 +97,7 @@ static void rvin_group_release(struct kref *kref)
 
 	rvin_group_data = NULL;
 
+	media_device_unregister(&group->mdev);
 	media_device_cleanup(&group->mdev);
 	mutex_destroy(&group->lock);
 
@@ -215,10 +216,6 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 	unsigned int i;
 	int ret;
 
-	ret = media_device_register(&vin->group->mdev);
-	if (ret)
-		return ret;
-
 	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
 	if (ret) {
 		vin_err(vin, "Failed to register subdev nodes\n");
@@ -260,8 +257,6 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	}
 
 	mutex_unlock(&vin->group->lock);
-
-	media_device_unregister(&vin->group->mdev);
 }
 
 static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
-- 
2.43.0


