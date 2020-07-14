Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2969C21F165
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 14:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgGNMei (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 08:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgGNMed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 08:34:33 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A811C061794;
        Tue, 14 Jul 2020 05:34:32 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id f23so17067213iof.6;
        Tue, 14 Jul 2020 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eAKe8PeEcj987D5w27ZWETMcg348oP/WUZJbCVK0Am4=;
        b=hDJvX2v4RGCA8saCb/oq0dgy0tXxTBVw81xJrhtq2z/Uuaoq4Uud0kDbPb8VNcMZKw
         8ElIMp+tXFAN2hKp13CsAkLdBS2Oq9BSI3VXPsh7QSzgXCOZ1JrGomZDASK8Z1Yf3EzT
         J4DLfa3zTCpgRVA3ZNNxNA2gLlJ9sGsQhTn9sMXn2xjbD4gbt0/fb0utXY4TOBmA8k4V
         HY+ghiZyMHr9BNKNFEz30/1Mbpg2SLckLBIkagIZT9lOVYvQDejbIy/mZTj0032/g/Pc
         vVxyIHw3zcRffkSRX2J2nWrua45lHKghNPTvPimZMarTQh6eZTrgbdrntsKUdAboGkd4
         0nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eAKe8PeEcj987D5w27ZWETMcg348oP/WUZJbCVK0Am4=;
        b=t3+trm7hbYbAKg1tFmCo72VT5Dkcyaj3CxJexrMqCOV3N2m+yCds9+nvTZ5sX5UclW
         /x66/qduwLWoKFTbIdXDt8LmJFiqhqtiK3BcN3uZctKt123l6/+O1gmQ/XpZpsEjAM2Y
         m8CtFmOMFaiiuQPQwSDRzwxrxfpKTgvCzbQ0OGaFoWppq+rN/UuT5hgcmLEttP7kAs3Y
         7Foa8WRhK3EqLFjVTWXU7dmAHsYdXkJ77N0uY7QmPGhXojWFZcVjPWp+DdcNlUCbGTAo
         JC/PKt00VwsJUjMC0j1yxweEnXzIv0peToD1EqZZKarHUarJERtZtO67xJTdspzh5h+J
         RsvQ==
X-Gm-Message-State: AOAM532BGifCgkGW5IRABiAlhRloICG04UMewGok833SxHgaQLd1jcFo
        Eb+XJhgCE6/+C7F05JUFomXgj8Q4
X-Google-Smtp-Source: ABdhPJyUI4zKGfErzzFS/FV2xVH7oFqEb/L1x97v5vy21kHhG21vkssyxEEtfClY/JwkdTn8P5SpPQ==
X-Received: by 2002:a02:878b:: with SMTP id t11mr5750532jai.106.1594730071385;
        Tue, 14 Jul 2020 05:34:31 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id d6sm10059337ilq.27.2020.07.14.05.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 05:34:30 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] dt-bindings: arm: renesas: Document beacon-rzg2m
Date:   Tue, 14 Jul 2020 07:34:19 -0500
Message-Id: <20200714123419.3390-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714123419.3390-1-aford173@gmail.com>
References: <20200714123419.3390-1-aford173@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Beacon EmbeddedWorks in introducing a development kit based on the
Renesas RZ/G2M platform.  This patch adds the entry to the bindings
list.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:	New to series

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index d8fd25bccbf5..0d4dabb4a164 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -118,6 +118,7 @@ properties:
         items:
           - enum:
               - hoperun,hihope-rzg2m # HopeRun HiHope RZ/G2M platform
+              - beacon,beacon-rzg2m # Beacon EmbeddedWorks RZ/G2M Kit
           - const: renesas,r8a774a1
 
       - items:
-- 
2.17.1

