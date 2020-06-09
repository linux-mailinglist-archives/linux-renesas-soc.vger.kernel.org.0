Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926DA1F3AFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgFIMrS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:47:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbgFIMqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:49 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 253E61942;
        Tue,  9 Jun 2020 14:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706804;
        bh=2UAwZkYOU3U5khlBp2+65z4qlugY8z39u93qNZGjZBQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uxop1aSEY/OnWjl2QlAuZ2Ol+e1obL1E0Ij6QB+kjKXxF++evWTKtILMgKy/Fa7rK
         pV8nX5bkunCs4O1OT+p3gFIa8xPzZ5BbBlNoHv7BLimusHsHrHRs5lHW6M1/sNq+OZ
         mvfofTopNzuMREz63h7nnxp5abODD0UFNaZMIKUQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Xiong <xndchn@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 17/17] scripts/spelling.txt: Add descriptors correction
Date:   Tue,  9 Jun 2020 13:46:10 +0100
Message-Id: <20200609124610.3445662-18-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After coming across the s/decriptors/descriptors/ spelling error twice,
a scan of the tree showed it was a pervasive mistake.

Update the spelling suggestions database to prevent it.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 scripts/spelling.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index d9cd24cf0d40..c171a06efdad 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -404,6 +404,7 @@ decendants||descendants
 decompres||decompress
 decsribed||described
 decription||description
+decriptors||descriptors
 dectected||detected
 defailt||default
 deferal||deferral
-- 
2.25.1

