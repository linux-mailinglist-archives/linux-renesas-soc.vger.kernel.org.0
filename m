Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7A9DBC81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 07:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503633AbfJRFGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 01:06:13 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:58374 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504076AbfJRFFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 01:05:22 -0400
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Oct 2019 01:05:20 EDT
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id B1E69C7E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2019 04:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qO3y1NFE5_bc for <linux-renesas-soc@vger.kernel.org>;
        Thu, 17 Oct 2019 23:47:07 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 89FD4C80
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Oct 2019 23:47:07 -0500 (CDT)
Received: by mail-io1-f71.google.com with SMTP id z10so7137813ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Oct 2019 21:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=EUxpZ3T7vF3Kc+2RT08v4EEjAUSgYRvb0sha4nlMD8s=;
        b=bdTw0PeubzcFLX1DriNm0Yl8F6jO9UQoufbrtSDEs2MigRgqIOl6EgA0X//E19MR66
         XpcdNRPB7qQNjzC43YxSWiD+KXoP8weegm1HXd7uoxT+1wgQ9KiBhqajAmyu8pEyt+fH
         qkvk2dC0jbqXNKfd71ZkAnX1/hNKlEHhYQaOkcRslt/U5CG7CZkuukajp9Au3eF39qDP
         IwRkhylUXdMbDkN5jqdMIUmSzuYH9W3wQ3cniFfx1nhZDFZlBDqyp61SR0djcWU0Xa8h
         q1xO07n9Kf4GAytT3Et9g44q/7pV5QhhZ/7v8uUpvS7dcD5R2ovx/hygqf0lz2X81X/i
         GnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EUxpZ3T7vF3Kc+2RT08v4EEjAUSgYRvb0sha4nlMD8s=;
        b=jnLzRonEuNfu6DbBfSgG56pPFzhzGG5RzcBUkvPi0uy4fwgR6CLVkiY6/2og9BUQwB
         Cn+o/v5fNH/p0AmWe3EqCeqvf+hopNSdmak5sMfn4uHoeXBJwdpt7thkWIXquGWhurm5
         tPo7Yxtd/XxC+tkK7iJ7DxdMNTtUOEaI3jH70Yq+GhdCQW4k9nLy5sNQePDbjlXFsy4B
         svn+rkMgkaONLVdY+mjjeJIQTEZu4VhBkKIjxQaJdHi3C+y0uzPbzpoMH2R0Jk7bMEKY
         0u92kZEUA4G5q0zG+H5NNFE+CRBIZn++acXxFvZ7n9oj6/PFYKgAwpdT2Jk73JeUvII8
         lkYA==
X-Gm-Message-State: APjAAAV53HxbbYNHL4aVIjuMpEoxIa/f32j5PZ6/1U50zx6VFzWhqSwS
        jGHrqP2UJ2A1eeLvrwxg7GmXeTunkWzi1EKaBGr2QwdsCS/kEv+gKgXVZaCSxwN4isXnlBesIEe
        K9y4Du/Dm9+D8R9P+qPGgXE1PuAt0eRLAndI=
X-Received: by 2002:a5d:8b8b:: with SMTP id p11mr6820749iol.2.1571374026858;
        Thu, 17 Oct 2019 21:47:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRFDJCsdCcPC5eb4L2SDx6043c6Gt8bq+dQz12A8oxvmQA4iLvhp+dkRZ6xTeypxz8f1Vy/g==
X-Received: by 2002:a5d:8b8b:: with SMTP id p11mr6820730iol.2.1571374026580;
        Thu, 17 Oct 2019 21:47:06 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
        by smtp.gmail.com with ESMTPSA id j2sm1968315ile.24.2019.10.17.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 21:47:05 -0700 (PDT)
From:   Kangjie Lu <kjlu@umn.edu>
To:     kjlu@umn.edu
Cc:     Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar_drif: fix a memory disclosure
Date:   Thu, 17 Oct 2019 23:47:00 -0500
Message-Id: <20191018044701.4786-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"f->fmt.sdr.reserved" is uninitialized. As other peer drivers
like msi2500 and airspy do, the fix initializes it to avoid
memory disclosures.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/media/platform/rcar_drif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 608e5217ccd5..0f267a237b42 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -912,6 +912,7 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
 
+	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
 	f->fmt.sdr.buffersize = sdr->fmt->buffersize;
 
-- 
2.17.1

