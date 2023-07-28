Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B577676C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 22:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjG1UHv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 16:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjG1UHu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 16:07:50 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79451E73
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 13:07:49 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bba04b9df3so19485495ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1690574869; x=1691179669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5RacAQ+h1XYtfSxQvgrfsN4D9QpF3jxUnp9xUi996I=;
        b=YkhOH87FDTMpw4vyh+gJwH6I/onZpCyL7sNLAIlSe4tKB3xkRChnc8vMmxWhyRiTsG
         Km+DjTD+7UfShJmvlz9FcSsP1JsmszzyO/qlcgcpV5okteh16S4/wtQlseYxcpSYHk4P
         4burqc66jjjwEfHwxVgX40s/MhprBfMyJsy7PmA1jdAizFT9ci4NH1+g731ktGLRP3rT
         ErM77mdTkDZgnAmm6NTSKzSlUcIi9h4C57oV/jSskIAQovR0Y4n2qgknPxKIoEDbg7BI
         GEgB/CMgqCBrjcQn5qvLcVVHNkKClMvnA1DbuRDuJP1uLcbHrpvDdF+rArXc23R6xIC2
         cSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690574869; x=1691179669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5RacAQ+h1XYtfSxQvgrfsN4D9QpF3jxUnp9xUi996I=;
        b=Ei6ec0XSUDuAR6dkHyMdIpLg7SgNRXc+C2s0uqczTCEZ6cZRd+yhzYHOJax6swIrcr
         uw3tXzQ2Ilay4BFdn2EOOVnTS+89uuNomGSvYSakt2OZEalmT1qdjeFToffFLI1rrQhI
         aDsHFFoTVZDLo6GLdE1/AvSvHtb29pAr7M8gna9/bx2ddK40C014l177TEHfr63U2aP7
         riXJcXCYQXAmyXQRdwOz5j3Vqxl5n0pEgXrwKWQ2HMha6tn7bWylhU0yZkKf6D6swn5z
         EH7tV6gH6IRCm11XAb6TjA3LBQUR3LOFlRKc5mZd75/HZklsLowtfB3hcmZ8x/IUyL29
         mp9w==
X-Gm-Message-State: ABy/qLacCW0EiLzZYmy2GxTjP+wjFOC9/3khZiGttybEbI1z8DgOVLIy
        QqxQbpa9zEvnDe/3v9Y3bSGUibZqo8hwXIpEIvw=
X-Google-Smtp-Source: APBJJlEtdm4vDsdKp1B47O1dOduvNGOdg+zVREPAkMjxO4J4CBebVHWefhQS4fjMJlvpWmimiA9Vuw==
X-Received: by 2002:a17:902:a518:b0:1b5:5052:5af7 with SMTP id s24-20020a170902a51800b001b550525af7mr2910838plq.8.1690574868948;
        Fri, 28 Jul 2023 13:07:48 -0700 (PDT)
Received: from D100-Linux.hq.igel.co.jp (69-165-247-94.cable.teksavvy.com. [69.165.247.94])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001b830d8bc40sm3980848plh.74.2023.07.28.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 13:07:48 -0700 (PDT)
From:   Damian Hobson-Garcia <dhobsong@igel.co.jp>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     taki@igel.co.jp, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: [PATCH 2/2] drm:rcar-du: Enable ABGR and XBGR formats
Date:   Fri, 28 Jul 2023 16:07:14 -0400
Message-Id: <20230728200714.2084223-2-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728200714.2084223-1-dhobsong@igel.co.jp>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These formats are used by Android so having them available
allows the DU to be used for composition operations.

Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 96241c03b60f..d61bb2e44c06 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -122,6 +122,8 @@ static const u32 rcar_du_vsp_formats[] = {
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_UYVY,
@@ -154,6 +156,8 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_RGBX1010102,
@@ -194,6 +198,10 @@ static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
 			fourcc = DRM_FORMAT_XRGB8888;
 			break;
 
+		case DRM_FORMAT_ABGR8888:
+			fourcc = DRM_FORMAT_XBGR8888;
+			break;
+
 		case DRM_FORMAT_BGRA8888:
 			fourcc = DRM_FORMAT_BGRX8888;
 			break;
-- 
2.25.1

