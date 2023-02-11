Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9956932A2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 17:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBKQ6y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 11:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjBKQ6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 11:58:53 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E6126BA
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 08:58:51 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r2so8145907wrv.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 08:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEf/kTpN43eH+vrUE9v/AB9AZsGg8S2Tb6TMHkcmHsA=;
        b=Q7W1rdC2D/JhzgvtkyUhuI0LKOiuzUzUmoBhUHN7E9eXOCqtMDDisQt0h+pSaZ3Svv
         q9Qj6OTDM7ejlYtR9pqc5bwA2VCqk2RGRtXjyJXEbLH2v/KrbFB9jiUs9l5lQd2B0XIk
         9bgHTRDyWqEOY58wBYGjERZ1coIAjY+TL73uE2URrz9AqquWf+NxHQm9XYREsDA3J2nr
         kQZP8c7OgOBeN6U1C6B41Rf3uw+z3/xpO88xuRMLb61oJVsBPeIFoWDZrGo1OGI7zVTe
         A8/jiARK7a7B6cSeSQ64CLKMfIMpvg5enRvkRnu3uBBw1zu6BvRqOixeOZEZ9kPA0Gwo
         g0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEf/kTpN43eH+vrUE9v/AB9AZsGg8S2Tb6TMHkcmHsA=;
        b=HGrOFxWQIygwJCCpWUMkEU+H0+/DFXVFssC54jeKgQWPq4V83Oc1PXDklgAuiI4G58
         3i0JBswo0qmx+DENdIzkR9DZ4uoM7vMhi8Ps+byzox+d4reznueFLw9okklAXsEvjUsj
         WcXOxnpX/ZsG803RxiiAMIjCp3x+m+tVin1fbt0kqghG/NHcn6CwLPCE+H/QPHwfMtze
         Yf9roNkmWfNF0/xVsSuCLQEK7YRv12REAzRD4auZPkHlXKL9hVQlVG22oLJdQ2igu0fk
         cWymfwCywUsjFIYkdm6PxYa7sa3FlnM9TmtM8tyu+hfINU5VgnLTlnZz+SjEWDuS2AeL
         pJ9w==
X-Gm-Message-State: AO0yUKXF1hECzpa+QOChkHxF0aziA2cXZ+S590x73PXKAyQmcFENjnmc
        G61o31fASwbLPAOjWJu4f32a8ackqlw+JMTWnFY=
X-Google-Smtp-Source: AK7set+9A4mwA4sx4s5dGSOLkObjuF692+RawXhL6sTC9BnSdfurORhINDZOdpW/6aTzphipqwHnCQ==
X-Received: by 2002:adf:fe8c:0:b0:2c5:4d68:5511 with SMTP id l12-20020adffe8c000000b002c54d685511mr2919341wrr.48.1676134730393;
        Sat, 11 Feb 2023 08:58:50 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id y13-20020a5d614d000000b002c5526234d2sm887064wrt.8.2023.02.11.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 08:58:49 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: draak: Make HDMI default video source
Date:   Sat, 11 Feb 2023 17:57:13 +0100
Message-Id: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series makes aligns the Draak board with other Gen3 boards by 
making the HDMI video source the default video input.

Patch 1/2 changes the default, while patch 2/2 provides and overlay to 
easily be able to select the CVBS video source.

Laurent Pinchart (1):
  arm64: dts: renesas: draak: Add overlay for CVBS input

Niklas Söderlund (1):
  arm64: dts: renesas: draak: Make HDMI the default video input

 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/draak-cvbs-input.dtso    | 33 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/draak.dtsi        | 24 +++++++-------
 3 files changed, 46 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso

-- 
2.39.1

