Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8946647EF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfFQJ67 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:58:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37059 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbfFQJ67 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:58:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id n65so1073093pga.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=Lowt54KhlQ+41icEpvoHpzc5/UfiJDZpuWU1eqcCBiY=;
        b=XnfKtJx51d/W8+Nd/543szK6Athvd+umhNP2UiayMhF7nXuqp1q5osV6b4/rAprG5A
         bzTQByQ/kFyG8KY7GwmEcrrUXuXfxymlOO3lPSj13DvqMJjHR/nDUMqAdPo+AXga6xNQ
         3nVElm4OqJ6nL+CuElKBkExm65AAjLWaBjPk2dL2NDxzVy5EoEBgy/lENTotCGGvGapc
         PZGqyHSb5hIKWP2R2TLk1PeimI7zs8QTyr+ySuQYXK3UGvxiZtiUfbFIIU+c043IUxVe
         zwvT7L/z0Yx88M5pLEVDE5Z39ahOeHGJJSMhPneDfXQpATgFu8o95bx30ScOtvlnF7C+
         a2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=Lowt54KhlQ+41icEpvoHpzc5/UfiJDZpuWU1eqcCBiY=;
        b=t7cta3/BKdPptTdqOTbccENSXscNm57orLEfj9fEf5Gemt1U1soszV0J7eO6TtnfZZ
         p6RsqEKXB4NuEGsdj/ABr4j7jTLaXo7l/Rd01SJAIqFnsaAJ9cI12RBD0J3KopB/wrWV
         uzRJznnTxQWgmLkdvWyDyAHRmltvQ3C2BD/ZDWQBhaqf2AfT7s5ieJJ6lLx5zfi6gN6+
         T0rGekU6/eH9G0erKsHx+B6ixCXegsLpD7fITzUD+v7ZLpPxKUNGtl4jDhHjWrZPjHc+
         T/99xfgnkBIRrheWcEhh+ynPu7cxNgdPylMM0Qu5flS9vxkJSjzVzdStmP+1UfPG9wr7
         6Q6Q==
X-Gm-Message-State: APjAAAVVE9PMyLYmZFFtYCAPh14oNx2FjrP0Yk2kP+BfHV6bXJn53oUp
        zWpwF5SHD7ZN0iSNMQh5tYZeQ40x
X-Google-Smtp-Source: APXvYqxaVtoYvBoKVSe7LYJ81ERnnjhfiZ6NpWYV9852xNtKJ6h7e74wgRQZuOFQ/k6MXIvdI8yrmQ==
X-Received: by 2002:a62:5105:: with SMTP id f5mr113149121pfb.127.1560765538010;
        Mon, 17 Jun 2019 02:58:58 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id f10sm9872228pgq.73.2019.06.17.02.58.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:58:57 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 19:00:23 +0900
Message-Id: <156076562362.6960.14055306539589207977.sendpatchset@octo>
In-Reply-To: <156076560641.6960.5508309411424406087.sendpatchset@octo>
References: <156076560641.6960.5508309411424406087.sendpatchset@octo>
Subject: [PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Since late 2017 the DT compat string "renesas,cmt-48-gen2" has not been in
use in the upstream kernel. SoC-specific strings and the fallback string
"rcar-gen2-cmt1" are now used in the DTSI instead.

Remove "renesas,cmt-48-gen2" from the CMT driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/clocksource/sh_cmt.c |    5 -----
 1 file changed, 5 deletions(-)

--- 0027/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-06-17 14:44:52.819144991 +0900
@@ -923,11 +923,6 @@ MODULE_DEVICE_TABLE(platform, sh_cmt_id_
 static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
 	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
 	{
-		/* deprecated, preserved for backward compatibility */
-		.compatible = "renesas,cmt-48-gen2",
-		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
-	},
-	{
 		.compatible = "renesas,r8a7740-cmt1",
 		.data = &sh_cmt_info[SH_CMT_48BIT]
 	},
