Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C992D8F5A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390539AbgLMSkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389472AbgLMSjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:54 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA433C0611CB;
        Sun, 13 Dec 2020 10:38:44 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id n4so14752102iow.12;
        Sun, 13 Dec 2020 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nHrku4p969TAUqir7FPQMxkNps9bIRFhqKRzmPC/DSM=;
        b=dRJoWvaiWGk5apyFbA6H+kwmbXv57fwOmQTLSLvBVSHAyBmwTEnMvXBZJYwxkeENmP
         WWgito9UCKdt1jpLuab/gaKJxzmTZx8nVyiYn6wRMXvRybURqww6+NCAHttLVngFpBYy
         brFzzTKFmLHRwe2rqy4TNiasOAIeVg/kSrM8FEgt8cmMZCXqpzahpvLbepuCprHQditY
         Ey0SCFTzMIMXyYQBXwOzjLtfNZWyc1xl3uAdfiYQhiKpzsQolMjZaNSb0C+cbPMMmlSM
         3Wl1GEocEsz4ZZJY1oFFSU0jXXJ0nB3bFbXHwkwJf/MxZGT61K/azBwU3+Bzrlc5bkNj
         37tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nHrku4p969TAUqir7FPQMxkNps9bIRFhqKRzmPC/DSM=;
        b=iFJNu+ZC6Ra1CXeyPdtu1toD4cV7z7jXp/mCGoB//lu9qidY1tIuvWYXIiQn3gjf/s
         6NPvG3MLybzh1/zw7Ys/eNP7VsHqZyVjEpSw46/Emchy79nEhuUclA5WBDrM2hKG34A0
         Bc7Aoujg+ia3PoHka1x0BKB/mjD9gMZXnHIJyxZlJXjxkuplmhjI3Gs+GM+iGDjLw1lv
         8jzPzHtEFXhngYLBXmLU3l9eqJoN7cXzQYrnJJBivgGvMHon1DgqkRJcZeId7tjX37yq
         58GuM0xemRVCraSPdD8iTGJ60CcLwgO218g3FbR8aW5RcaSpq8O79MhMfea1VTUiOQI8
         caXA==
X-Gm-Message-State: AOAM531xUtPQF1rB6RQCHBKW9rDGTXqPPiM3eK8tDmSTPBCFmNUvBXtH
        CjVcXW9QFSGDuiD6tAFt5cmqJYSwyd1vUg==
X-Google-Smtp-Source: ABdhPJyleH0ECWvp7anq+AjLjNnJSTIQsUS2jca4Wvs+Q4owxRSgF6znLWsjaey4MNHbGDlDWgYLJw==
X-Received: by 2002:a02:999a:: with SMTP id a26mr28820161jal.103.1607884724003;
        Sun, 13 Dec 2020 10:38:44 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:43 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/18] dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards
Date:   Sun, 13 Dec 2020 12:37:56 -0600
Message-Id: <20201213183759.223246-17-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add beacon,beacon-rzg2n and beacon,beacon-rzg2h to the bindings
list.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index fe11be65039a..5fd0696a9f91 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -130,6 +130,7 @@ properties:
       - description: RZ/G2N (R8A774B1)
         items:
           - enum:
+              - beacon,beacon-rzg2n # Beacon EmbeddedWorks RZ/G2N Kit
               - hoperun,hihope-rzg2n # HopeRun HiHope RZ/G2N platform
           - const: renesas,r8a774b1
 
@@ -154,6 +155,7 @@ properties:
       - description: RZ/G2H (R8A774E1)
         items:
           - enum:
+              - beacon,beacon-rzg2h # Beacon EmbeddedWorks RZ/G2H Kit
               - hoperun,hihope-rzg2h # HopeRun HiHope RZ/G2H platform
           - const: renesas,r8a774e1
 
-- 
2.25.1

