Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9AA1F3AFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbgFIMqs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbgFIMqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:45 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9B1118F5;
        Tue,  9 Jun 2020 14:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706800;
        bh=cHE6Ys+kzM8LHKV5CZpgZs0V5uY4hr5VVnJQYH7v6Qs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i38tBYkK3aIk+okVfs45/ff9BpcM7FuFQxQoKzqFMrodkG5XbQEdzViTxsZLXlUeS
         xlpJeLU29OVPbWtz+JroCl2r42Pn4+AXHCXHODJ7CwdfKzQIoVBVCGH30sC5y9GtDE
         nvN7b5NnADEjHmQAUz2Dz/IQ2nYOgVQCkRjpXJIg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jiri Kosina <trivial@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 14/17] kernel: trace: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:46:07 +0100
Message-Id: <20200609124610.3445662-15-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 kernel/trace/trace_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 242f59e7f17d..2c1e35ffcbb6 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2475,7 +2475,7 @@ __trace_add_new_event(struct trace_event_call *call, struct trace_array *tr)
 }
 
 /*
- * Just create a decriptor for early init. A descriptor is required
+ * Just create a descriptor for early init. A descriptor is required
  * for enabling events at boot. We want to enable events before
  * the filesystem is initialized.
  */
-- 
2.25.1

