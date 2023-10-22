Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1E17D2527
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Oct 2023 20:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbjJVSTb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 22 Oct 2023 14:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjJVSTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Oct 2023 14:19:31 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54800F2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Oct 2023 11:19:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so1599121a12.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Oct 2023 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697998767; x=1698603567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/lSMMwLtEfp+7Hg4EK1tgM1r1sMLEzlM+5lX3wV/bIY=;
        b=fiEPZvceZ8I8DxwsMv+1M9X4Yz6umEvy/tUzhF7HS5iVTBSWYRZomyPW1Nxh51byIk
         TImy6U6BPqJ+mhtKDt9bpe421ojENDByDXikqqj4jaovsAc6VGKIXdYxPelfb+l20IF1
         FRUMg62ou0syXcByEReJkMFGheDCG8KlT1Vs4rDiZQtk9T5rAqBYECQQbEwKYhGjgcay
         AB3MwhNJL3f3jvsxgCZobIysLN9K3MI6jsXaGJq8YG+iwyzcFR1WLikGoBqMP7QEeKek
         3n6W9p0ODPfOuLRGXweA9AdtXq/gL+VxesEpRE4slR1QV8QLvSRSEFVh0FYN+1Bs5FJ2
         pYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697998767; x=1698603567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lSMMwLtEfp+7Hg4EK1tgM1r1sMLEzlM+5lX3wV/bIY=;
        b=PeKLtpD+FmPP1z7NBg3Hc1LuN+4R72tufQoyh3Q7vm8aKhivkoHM2SYewoN992Pl8O
         XojPflF1BN2zdU+GDqncS9SbVHgwdIshZJp0YtqrVaRAY9KvOB+6OyIDvIxuFhV9gjuW
         vV9OpFfO9JpBeZdiffrqnLS9v/amV8kST9M2Af/2z7WqmqN2NbAt+15Qe8M9+L7vzDDy
         UFuK8l0T93bfIxOVKUi9fxH/wGcRM0lDiMNfptuROnQdUKSpHzP2euZS9cT/zYaWX9fh
         ocqj/TnD/mjPHB7IzJg2eDFgNEvfqZgw19cYi+D1Ey4VAv1z/2Pir+P3t4RLuINqG3PT
         Tp8w==
X-Gm-Message-State: AOJu0YzOYBYsoQB5d+SAJ3ivFvVz4W+b2gHBTxQqgB5Wf8RHyqj+/NZd
        XX6RSaRuQZv3ahr9uhRAlv0GZeaWvGusHYkambk=
X-Google-Smtp-Source: AGHT+IHRCSjI9FqAIrR6xJa6CDE9kz44/K7Y/0m1Yz2IFEsazTJ9q9YN7GTpF4a69gy3aWzr/AG79Q==
X-Received: by 2002:a50:cd9e:0:b0:53d:a90e:be90 with SMTP id p30-20020a50cd9e000000b0053da90ebe90mr5207585edi.15.1697998766645;
        Sun, 22 Oct 2023 11:19:26 -0700 (PDT)
Received: from sleipner.berto.se (p4fca2773.dip0.t-ipconnect.de. [79.202.39.115])
        by smtp.googlemail.com with ESMTPSA id h12-20020aa7de0c000000b0053e43492ef1sm5035159edv.65.2023.10.22.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 11:19:26 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] arm64: dts: renesas: draak: Make HDMI default video source
Date:   Sun, 22 Oct 2023 20:19:08 +0200
Message-ID: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series makes aligns the Draak board with other Gen3 boards by
making the HDMI video source the default video input.

Patch 1/2 changes the default, while patch 2/2 moves the bus properties 
to the correct node so they can be consumed by the capture driver.

Niklas Söderlund (2):
  arm64: dts: renesas: draak: Make HDMI the default video input
  arm64: dts: renesas: draak: Move HDMI bus properties to correct node

 arch/arm64/boot/dts/renesas/draak.dtsi | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

-- 
2.42.0

