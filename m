Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FDE6D08A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbjC3Osl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 10:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjC3Osj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 10:48:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B5E9778
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 07:48:36 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w9so77549811edc.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680187715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gisAfBuKo7G7WXLwyB+pECfo6r1KAXyHvLdY4n9RpXM=;
        b=GBxyv/esI7p8tArGx56kiN0U7QdEbQejDP5PX+xlNFVPd20EDICDwQe0wEaU+mNAa4
         ObqE+dXYbg2ojbpq8nDwMZjTXyMFSJ77C38mOTHQt5zMQdNcZ2pQkWdN4YPJcsegGD9x
         3VtHU1p+l/2Pj4FzU7BPUjYaiJ2DP/83aPlgh/VnB9zoE5afIhfWtAY5Dqicd4hfEODi
         UO+LndPPF1dZMiV6WvO5JJhdRu5yRG3r+fctsFo7sJWtvbKe1/DpGKvVR/odlHMJTuhm
         cT3DdQ3EVnobMr+So+aQgxrSGKAo4xbweqY2Qvwu2GjCLclR2Gyzh7covxTOg9WJyS9h
         PWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gisAfBuKo7G7WXLwyB+pECfo6r1KAXyHvLdY4n9RpXM=;
        b=Gf5DaImI8+6X+GN18YEHb6OdawihQLdEjmjemOTuzwy5MpR9Cw8GBp5s941/ziCmjT
         itz7S55uPGiAZ2e4kq5xfHWXLLH4vc7iDxVH4bbrwfzan+Cic5ZxmXqeqimCxCUdS9Fz
         OhzQFYaYAUvfCBEyBmr45T4jvdzZXGts0yB87S30nPlqI5EI+7lyPI3tLVvXHta5kn8D
         s9u0Duenuj4kvq/kXPsakkSED653pggJ2BAwcELxbbKX5OHUM2y9TQ1tsn6CYzzOpV8g
         q16s/A9wVa8CH6GEaegekIZ83yw8cfPxJqVshWM17UUOUvGYyLd+TQ6JLaVXkG0QR9Vp
         neFQ==
X-Gm-Message-State: AAQBX9eBh6psFRDZxi8SzXO16FLivvU3+5y3UunPBrGAWHToDGQxNhJm
        mY/MS6F15b1laPB0FE0vI3iv9g==
X-Google-Smtp-Source: AKy350aT9/pC3o9rvu71vgkM+m5UkXMjuItXZkZxxtxxJiwsrrmLm6k/ctAjf5bAWtzAS97IkHxtvw==
X-Received: by 2002:a17:906:40c8:b0:921:d539:1a3a with SMTP id a8-20020a17090640c800b00921d5391a3amr23632023ejk.58.1680187715330;
        Thu, 30 Mar 2023 07:48:35 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5f91.dip0.t-ipconnect.de. [84.172.95.145])
        by smtp.googlemail.com with ESMTPSA id vq2-20020a170907a4c200b0093e9fb91837sm7830426ejc.76.2023.03.30.07.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:48:35 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] media: dt-bindings: media: renesas,csi2: Add binding for V4H
Date:   Thu, 30 Mar 2023 16:47:30 +0200
Message-Id: <20230330144731.3017858-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330144731.3017858-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230330144731.3017858-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the CSI-2 module in the Renesas V4H (r8a779g0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Add tags from Rob and Geert.
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index b520d6c5c102..977ab188d654 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -31,6 +31,7 @@ properties:
           - renesas,r8a77980-csi2 # R-Car V3H
           - renesas,r8a77990-csi2 # R-Car E3
           - renesas,r8a779a0-csi2 # R-Car V3U
+          - renesas,r8a779g0-csi2 # R-Car V4H
 
   reg:
     maxItems: 1
-- 
2.40.0

