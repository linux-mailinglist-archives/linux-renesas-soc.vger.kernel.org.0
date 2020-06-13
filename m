Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF94D1F85DC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2020 01:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgFMXTx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 Jun 2020 19:19:53 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:38914 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgFMXTw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 19:19:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49ktpv3V6rz9vYTv
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 23:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wo7bLGLjMDE2 for <linux-renesas-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 18:19:51 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49ktpv1rnrz9vYTj
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 18:19:51 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49ktpv1rnrz9vYTj
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49ktpv1rnrz9vYTj
Received: by mail-il1-f199.google.com with SMTP id x63so9225845ilk.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 16:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=0J2WzBmWJmFnCbwYpPhvfRXosCtqPD3qdOkqR/y7HfE=;
        b=LZ16KaVj+L/3PDGxv7dCNxew4d6GRS3dAPrHGIhz3WLmeRcvax7dsMWazwLOa71YcI
         xtSaRmDB8bABi3Qdc6wmIhg2jHxqlMkFR91nj9cd4Xig5PwgsFgXShqy+gcpYaK7R6v2
         iq0y5reDWT1PT7CXeV2Z09/GTpQOTg9OcAnzggn6BCu8WaIWB+HUBhRjouCMHFitHuQR
         M85GgP3ymW2EQPt0EJEaIAqQcFVriggBmvTUe9M+J/Qe3oR1kuDtJAMxEszxyRne/xrk
         M4pjDGufS1MEgCB0aLW0aZ47WSMF9nV7KkUTJF3j5YmuzK0FhyiLwElRZ8N9HtvT/dxD
         vH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0J2WzBmWJmFnCbwYpPhvfRXosCtqPD3qdOkqR/y7HfE=;
        b=DR84TqabHdGI1qJp9i0JJfXzJnL7GSHrc9DfTdoATIcKU3sIvKzlwtcZVyM7Pndnv8
         gUVFZAsS18My5+W2xWAcsj55tTJMsx7efGSaH9YTQsS6Xn0qcdjYY4OUG0ouxgGJ0coD
         2qgjDqCtXKlAeEIVyLMSZm2PjCe2y8j77Mn3ybxfPkDX3k5J7MyUXt8dtUQlQn558OsU
         t+qxNDxz5uljwRUtqSHyHRB/U64S5N348saCwvFjvG0Po4ZPyaFEyvbzygTVN8u0hXJ9
         PgqbYxuOJyw8CB2/Nqd/dsN88rDEYzgF3m56BwsY88RISY/cLbjt0rTstzX0R028iG7N
         +MZQ==
X-Gm-Message-State: AOAM533SnxJa31BqJDLyfl48P/KLjtRj2JrzUw1veGeKpz7fRI9fE1/Z
        YaMO8dCNoWXgGJkjZza4FbB/H/vuBePI2NbBFZnNntc5nsfqqoxRB68ikHIuObV/WDR0+t9LKC8
        aKhdNoMknrzOAYNmBBiSCfSLNOtPH7HHf4Rg=
X-Received: by 2002:a92:c04d:: with SMTP id o13mr19972739ilf.201.1592090390824;
        Sat, 13 Jun 2020 16:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0AiM64XcNUQP5F+CpQiJ5n6UALfY3rldZ+jTicz2fR35pa0C6ClNe+eDg1obTNeFpnA6oCA==
X-Received: by 2002:a92:c04d:: with SMTP id o13mr19972718ilf.201.1592090390494;
        Sat, 13 Jun 2020 16:19:50 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id c5sm4391570ioq.9.2020.06.13.16.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:19:49 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: fcp: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:19:44 -0500
Message-Id: <20200613231944.16730-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Fixes: 6eaafbdb668b ("[media] v4l: rcar-fcp: Keep the coding style consistent")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/rcar-fcp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 5c6b00737fe7..05c712e00a2a 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -103,8 +103,10 @@ int rcar_fcp_enable(struct rcar_fcp_device *fcp)
 		return 0;
 
 	ret = pm_runtime_get_sync(fcp->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(fcp->dev);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.17.1

