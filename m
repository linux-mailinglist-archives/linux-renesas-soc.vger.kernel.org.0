Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE96737F712
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 13:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbhEMLrw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 May 2021 07:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbhEMLru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 May 2021 07:47:50 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDE5C06175F;
        Thu, 13 May 2021 04:46:39 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e14so22725338ils.12;
        Thu, 13 May 2021 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rm89In9VFgXIxrvmbcLZClWvwBKBEh2Q5L+7MRo67Ho=;
        b=SJaLe9Zy5ycMUyRgFr43qRxDs35epaWnNzYIYXRnTU32HE0hWQsaruvP9WeJ3tUEFC
         I8EyDVXOl7qax0ttNsr+M5JgjFgdozLNLloiKm81joRa1hHe4hLpFr5Caw/OFZnF9Nrt
         sjemsJnMpkBs56Q6kOnjd09qo5Rg6L/KVU6+vp5/tcRv7WsUWai7REWjZnUxnK8IEFWU
         yJ1CHGcnV34w2LtpDR3+85REc84NOGJ6mcEjCM2rcNl2SG57bMYJl4pdtRFeYCmBQSuQ
         5F+Udu/TTY30UYkW7yc05ZbwR0xjJ3bhgnoz4QKNr9079w1p9VE/fJe4a+b9cKqcF6IM
         bJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rm89In9VFgXIxrvmbcLZClWvwBKBEh2Q5L+7MRo67Ho=;
        b=tuLu7ft7q0dfzE//kOu/oD9GUpRpYND+J8QF5zu/arYfvfxmk9IRRl+N8y9yb2YNqL
         DmLQemPzyxcVQMpMmuUk74K3YtJKTWUZMWW8F8sTLBhYixCjBgwlQGRkplmZBTgOwWaD
         bSouxp9AQ8cjbfdSCSDKARBfdcuxndQd8OTQEEKLKxCtFALWxwL4Yz/uczZI4NCAAYWI
         WJuEz2LKUEhPqMx335/7Da51Qg8nWL706I7Bu3qShJLe+vGZW73zZDyufyEhArB0husk
         HbVUxz6T94j/wqo7/FuErnFrcdNTX5nLYoPfEGA7rI+qMy1K92neXTyhs8PEWGd+4ncs
         7TlQ==
X-Gm-Message-State: AOAM533GEJxCRNkc0h93m/mnJRcMjqzXLC88RrUMM+/T5RjaGoPsxuvA
        aXNFvTbNITEiaVOc1bzwdwk=
X-Google-Smtp-Source: ABdhPJyXKOm4TyYEisCK+GMqYFhJFX9a3p/X+xRQOqdAcu+fYr2cM05ikYn20cVPJok9l1uLlyrpSQ==
X-Received: by 2002:a05:6e02:1b83:: with SMTP id h3mr19359239ili.199.1620906398843;
        Thu, 13 May 2021 04:46:38 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x13sm1298192ilv.88.2021.05.13.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 04:46:38 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: defconfig: Enable usb2_clksel for rcar3 and RZ/G2
Date:   Thu, 13 May 2021 06:46:17 -0500
Message-Id: <20210513114617.30191-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513114617.30191-1-aford173@gmail.com>
References: <20210513114617.30191-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is a clock driver that's needed when using an external
USB reference clock called usb2_clksel.
Enable it in the defconfig.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 08c6f769df9a..c1110fc20cdb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -987,6 +987,7 @@ CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_DISPCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
+CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.17.1

