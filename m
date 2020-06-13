Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E374F1F85CD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2020 01:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgFMXEl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 Jun 2020 19:04:41 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:52454 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgFMXEk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 19:04:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49ktTN02dSz9vbsc
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 23:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2-j9xymvm8Br for <linux-renesas-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 18:04:39 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49ktTM5LY3z9vbsT
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 18:04:39 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49ktTM5LY3z9vbsT
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49ktTM5LY3z9vbsT
Received: by mail-io1-f71.google.com with SMTP id l22so8676223iob.23
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vdWthCsmOsBiHMJwiA3g9GCqF/ZUI6PIYJxkxVMjZH8=;
        b=Edt0rD6Yt02A/FMLC1/3iWyMUZULyWs4zPYMO1nwpQz4AKx88deJY9VPwnjFkVAIdw
         kkJpM78kvFvwUyN/G2xmEetRViIQBSUtLQJ8MHV1tC+Umei/gQp/YNM4dbJh1pAxcaaN
         HXNwOSXVM8SoJCS2nQu/dASQ3p+DkWsDn2QNHiAUC5gSg6jnBzpW0VArxHYrmJYTaorT
         +IwYA72fIoDNfYYIpRDk5u9lNKHHzH2O8KIqXDrvbs44FvNMKvDvJyGPQm8hctAbdh5X
         GCvjJP0O2st2YGsdaioTAJqjXlRtU/4b43v7VNdDE74YbKuh2AtuxzdP7V67C546UweH
         V1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vdWthCsmOsBiHMJwiA3g9GCqF/ZUI6PIYJxkxVMjZH8=;
        b=b9Xl1/Bv3t/Kr8UUvKhNn8JmjPlHME4m0tHxwkq3d5hE1kExdNYgoCCF1CAPE5c4ba
         M9JTiIKT65b6Cp2gTRFif4dAuLAO9Jmw8E3Y38B/d0juryUg5H7SsB6mD+/IX3kjZmP7
         Acn1E6Eu83x2n4eI4pUXp2TyuaVf9eI04VyQkGFBZdDqmIt01hDaEWAzu9Pvhc0krmOr
         /1ylfCdOBePi0xDV8i7GFPZEv6HQM+IiYzZuTfSqSNiuZYwKFE2RfmghC+U0XDaaJ5VI
         XXGx6vd8e+Zt6Ehp0zKhHo0vc2ySz5B3cMrY9WYLgFiAPKe6h7HsObCthIFzLI6zYQOL
         fJWg==
X-Gm-Message-State: AOAM531ZBL0sA9x0kBNMzz6RxxkNf/uKvme/73s9LT97aTHReRXPFLdE
        hHjI2sK5Ds8X1/EW6tRRC9DJlI+91HZHedSjqofcJL8TBWaJW48/8vJy+QhNyBGoYJOzsxAVi0U
        Jlu5pO80RWNgor8/MFDlL4k+sR1MQ+njixhc=
X-Received: by 2002:a92:b699:: with SMTP id m25mr14652656ill.208.1592089479228;
        Sat, 13 Jun 2020 16:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Amm5x/e+7fkof5wamzDW0mUfhmnXCG35Wi4I575sv2CQNQ8SYgfivVcBHqk1UbbABGletA==
X-Received: by 2002:a92:b699:: with SMTP id m25mr14652640ill.208.1592089478980;
        Sat, 13 Jun 2020 16:04:38 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id m90sm5546517ilb.79.2020.06.13.16.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:04:38 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar-vin: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:04:32 -0500
Message-Id: <20200613230432.13025-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: 2a18fbec1dab ("media: rcar-vin: Move pm_runtime_{get,put} out of helpers")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f421e2584875..06808be35f98 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -835,8 +835,10 @@ static int rvin_open(struct file *file)
 	int ret;
 
 	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(vin->dev);
 		return ret;
+	}
 
 	ret = mutex_lock_interruptible(&vin->lock);
 	if (ret)
-- 
2.17.1

