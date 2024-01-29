Return-Path: <linux-renesas-soc+bounces-1947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC18413FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 875961C22E8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 20:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9B460EFF;
	Mon, 29 Jan 2024 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iRu4lOil"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A4A48790
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706558491; cv=none; b=a/+SoC/Eku6TDHI9LsABclKaftgt+MoVRUkXFzd8EiKnGj+uKMNK50iP8XCb2pmg1mcfPE7t7CZ9QWFG1lHw87XKzuWJrf/EtwWqXf0AxOnzVQkprmgqvhXybUWm1dGS+GmkLDYbZQ6WsAVc4jhSY4mxvrv9CDDm8LBbouDpyUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706558491; c=relaxed/simple;
	bh=l74wCMgNHIGILBM62GQEer3+RAnaoh90tTNWu1/Em6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dYlMUdvsRwL7ZDcMpXnEJrhVmQvHwScI8AiISHJKBUWbMmTxD+AZu+TSdypsKGijxKIbtVjMXHWqvKCtnDv8OZWOvT8/ZQoZrXD7rvNC0gay7IehAkou240T0tUiAMbjD/RarfTuoVySNIp3qYXGYpQryDa9fUvpetW9d4lIjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iRu4lOil; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf3a095ba6so37003431fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706558485; x=1707163285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtKoU0dMc2/VwANL5DHhc0IZfKZvqlfdxMaMmK8zypg=;
        b=iRu4lOil1eWVnmr2chWiBkIF2vB37UDpaWBmdiua49u+IE2+QebO0W1b2NS6QKvQmc
         YHy2+JMcMnmJZwpIH1Z1CSaEefH3nZhb3niK13QGJcYNu5ybtIV8jvhM2khSxHPiN7lh
         Mjs81EGyTpNNSQR7m91hB9Aymax54qvAY6a7fBahsyv8yiSeipKOo0Km1G9NdJaI5DHs
         GGcuULmkqBuJRVDv8maYuDgx7P6SMMQHh3BJQuuGnlT6PspFuKlQaTa6Xu6zUYly3ajf
         9FY13TmMBgj5uye+2MBquija0jqwjMoTULAU0JdSZRBJgkPK9vfBhoTRqoLsup+608uh
         c0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706558485; x=1707163285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtKoU0dMc2/VwANL5DHhc0IZfKZvqlfdxMaMmK8zypg=;
        b=lNfxGBXOmW6Xfc12YSe1SgPJscFUt5Ym30hrxTPKzI58QOvy/HYcoZpT36qQ7XybBt
         7VXOgcNVkH+2REGzphjqJvIAD15drxcU4ar+vkvGY0E9jeLnwETRYIZsNs4ogNboSqe1
         EoOYGc/3LOBmPp6dIrjICHGf4RCf+fd4e5BdCwNffqQGpe4AXSVvjqk19yMStkctsbKi
         8PKU/JlVbAW2UJVCzQWrxkTYP4zlDmysPwgoW1J4Yzdkp1eQbIUGBUaVGuA7qImqnI7F
         xDI6TUwTAt9oq0yE5Z20WeDkhTr7aVVgcydiEvcmG1FvcnoQvya1Nv+49McGPIVu9N6f
         tn3g==
X-Gm-Message-State: AOJu0YyYw9LdUyrOo8TU3zL5qgojtkqL+2PsDnDXH5eGy60PNFGReXMJ
	GtXlPjLXUKde8YmYKUb0TV0elks0lJNznxTEHh9NDdYe13TqxDPFe0s6smoc7xc=
X-Google-Smtp-Source: AGHT+IHwrrMwCYqB0UqECcVQOKDgs/9bTVL/0vnOmGCoVmeioWJ9/5gFmGemvoY77zEIlK8EEak7gA==
X-Received: by 2002:a2e:2a82:0:b0:2cf:15b0:d14d with SMTP id q124-20020a2e2a82000000b002cf15b0d14dmr4582923ljq.41.1706558485028;
        Mon, 29 Jan 2024 12:01:25 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id t23-20020a056402241700b00558b0c513e0sm4085223eda.61.2024.01.29.12.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:01:24 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Date: Mon, 29 Jan 2024 20:59:54 +0100
Message-ID: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allowing multiple connections between entities are very useful but the
addition of this feature did not considerate nested subnotifiers.

Consider the scenario,

rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko

video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
video1 -´

Where each videoX or v4l-subdevX is controlled and register by a
separate instance of the driver listed above it. And each driver
instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
trying to bind to the device pointed to.

If the devices probe in any other except where the vidoeX ones are
probed last only one of them will have their complete callback called,
the one who last registered its notifier. Both of them will however have
their bind() callback called as expected.

This is due to v4l2_async_nf_try_complete() only walking the chain from
the subnotifier to one root notifier and completing it while ignoring
all other notifiers the subdevice might be part of. This works if there
are only one subnotifier in the mix. For example if either v4l-subdev0
or v4l-subdev1 was not part of the pipeline above.

This patch addresses the issue of nested subnotifiers by instead looking
at all notifiers and try to complete all the ones that contain the
subdevice which subnotifier was completed.

Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3ec323bd528b..8b603527923c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
 static DEFINE_MUTEX(list_lock);
 
 static struct v4l2_async_connection *
-v4l2_async_find_match(struct v4l2_async_notifier *notifier,
-		      struct v4l2_subdev *sd)
+__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
+			  struct v4l2_subdev *sd,
+			  struct list_head *list)
 {
 	bool (*match)(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd,
 		      struct v4l2_async_match_desc *match);
 	struct v4l2_async_connection *asc;
 
-	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
+	list_for_each_entry(asc, list, asc_entry) {
 		/* bus_type has been verified valid before */
 		switch (asc->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_I2C:
@@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 	return NULL;
 }
 
+static struct v4l2_async_connection *
+v4l2_async_find_match(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd)
+{
+	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
+}
+
+static struct v4l2_async_connection *
+v4l2_async_find_done(struct v4l2_async_notifier *notifier,
+		     struct v4l2_subdev *sd)
+{
+	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
+}
+
 /* Compare two async match descriptors for equivalence */
 static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
 				   struct v4l2_async_match_desc *match2)
@@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 }
 
 /*
- * Complete the master notifier if possible. This is done when all async
+ * Complete the master notifiers if possible. This is done when all async
  * sub-devices have been bound; v4l2_device is also available then.
  */
 static int
 v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 {
-	struct v4l2_async_notifier *__notifier = notifier;
+	struct v4l2_async_notifier *n;
+	int ret;
 
 	/* Quick check whether there are still more sub-devices here. */
 	if (!list_empty(&notifier->waiting_list))
@@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 		dev_dbg(notifier_dev(notifier),
 			"v4l2-async: trying to complete\n");
 
-	/* Check the entire notifier tree; find the root notifier first. */
-	while (notifier->parent)
-		notifier = notifier->parent;
+	/*
+	 * Notifiers without a parent are either a subnotifier that have not
+	 * yet been associated with it is a root notifier or a root notifier
+	 * itself. If it is a root notifier try to complete it.
+	 */
+	if (!notifier->parent) {
+		/* This is root if it has v4l2_dev. */
+		if (!notifier->v4l2_dev) {
+			dev_dbg(notifier_dev(notifier),
+				"v4l2-async: V4L2 device not available\n");
+			return 0;
+		}
 
-	/* This is root if it has v4l2_dev. */
-	if (!notifier->v4l2_dev) {
-		dev_dbg(notifier_dev(__notifier),
-			"v4l2-async: V4L2 device not available\n");
-		return 0;
-	}
+		/* Is everything ready? */
+		if (!v4l2_async_nf_can_complete(notifier))
+			return 0;
+
+		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
 
-	/* Is everything ready? */
-	if (!v4l2_async_nf_can_complete(notifier))
-		return 0;
+		return v4l2_async_nf_call_complete(notifier);
+	}
 
-	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
+	/* Try to complete all notifiers containing the subdevices. */
+	list_for_each_entry(n, &notifier_list, notifier_entry) {
+		if (v4l2_async_find_done(n, notifier->sd)) {
+			ret = v4l2_async_nf_try_complete(n);
+			if (ret)
+				return ret;
+		}
+	}
 
-	return v4l2_async_nf_call_complete(notifier);
+	return 0;
 }
 
 static int
-- 
2.43.0


