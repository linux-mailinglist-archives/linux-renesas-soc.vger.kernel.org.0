Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EDC40EC4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Sep 2021 23:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbhIPVSx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Sep 2021 17:18:53 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:37287 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240270AbhIPVS0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 17:18:26 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 075AE2B011FE;
        Thu, 16 Sep 2021 17:17:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 16 Sep 2021 17:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=iroseorgTS5+5
        6n4OvAi9A0zE9zzgwEyhNq+UyaK88I=; b=JqB6MykZyikjd8FHQpkP2BVRiApCi
        p97PKlwm5G0/L/4XVX3lqmTmwqebWnYTO76yp5b24TACA4mDucytOHtFwCKVR8pi
        5Ut3HOIY7pMqcVlQPruSd3NBk1nqJmyk6Q8GmUt/PhC6uecC5BsJCQbe7izkUB1N
        1oODFBA15PXUkwVN1edova19IWI1k7sl3D7GZlEfJxWteVbHVqnCXIiBON1YeF6Q
        ke7f46GEo8x9M8/x8g/68cQq+/34OnakZm4nftR794yVgm7HS84DcfEz9/9Xquzn
        NQIrRugchM7CwmINRox74fte0FisiWe+QHwoEe63kzk/D7XsFOC+W5/Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=iroseorgTS5+56n4OvAi9A0zE9zzgwEyhNq+UyaK88I=; b=KFmCLz46
        1FPNUNZEQDILKwJHhkCM3LDNBWvz+Du0FfVwgzscjCIa1lfAFUMCnimOCnz+v2VN
        OIGyPho+V34dOTg+c/liZ3nhJ8V7rjnRiHRq7+K4LuplvVdLlICSGB4EQRysKM3m
        XsRnIfK3DrD1MuKduXDb3s4qXdjLNNXnWPtLpx+Svp+INZSW7vWv7S+5pgFBVO/7
        YKtF8vjl/idG8MDmrMGP+k7KpEgPEie9FYkCHdSaT6Qs2myEMyviDTW4WP8Qkv3U
        y+kmKM4SWxPDHOWwdVvrKTSZPvdibP0auTw41yvGQfEUDCrBhInYnVVyzHzf1P8w
        /zDqSRxgO6ai9A==
X-ME-Sender: <xms:ULRDYUreEiKr9-wfH7gjUQbDYKJlFusHfKWDogv7Ge602Ckdj2vj2g>
    <xme:ULRDYao97dVnQm7nZvkBz6y2xX7-1i4D6m8xRuEBPuUiX83LHVnC-ALNHac7hyfxI
    eqfXjkzgZz4MQdYaQ>
X-ME-Received: <xmr:ULRDYZNVgneZAgEhKnokbUl8KnYcgUKXaZlcEOsOsRIX_j_8iuHMQKyHUnZMPLTcfbv1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:ULRDYb7tx52V7V4Uy3ZFmKN34pzWAWKKXV2pf9Luy9WJAsmvqBWktg>
    <xmx:ULRDYT6yJPnE9_oDxHhEFQK0wZYXfux_ly9TKvbmMj96gpW4clHJnQ>
    <xmx:ULRDYbg00qLPg30a5Fg6nDCEH4CMmlk7HY8xQlq1WDVb42fpgWPiGQ>
    <xmx:ULRDYQH6y7bdl-ZVVuxrF3UsbDA2Ufy00zFfyaZw0zyk9jss2N3JQIvlack>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:17:01 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 15/15] doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup
Date:   Thu, 16 Sep 2021 23:15:52 +0200
Message-Id: <20210916211552.33490-16-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The previous commits do exactly what this entry in the TODO file asks
for, thus we can remove it now as it is no longer applicable.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 Documentation/gpu/todo.rst                | 17 -----------------
 Documentation/locking/ww-mutex-design.rst |  2 +-
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 12e61869939e..6613543955e9 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -353,23 +353,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
 
 Level: Intermediate
 
-Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
----------------------------------------------------------
-
-For cases where drivers are attempting to grab the modeset locks with a local
-acquire context. Replace the boilerplate code surrounding
-drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
-DRM_MODESET_LOCK_ALL_END() instead.
-
-This should also be done for all places where drm_modeset_lock_all() is still
-used.
-
-As a reference, take a look at the conversions already completed in drm core.
-
-Contact: Sean Paul, respective driver maintainers
-
-Level: Starter
-
 Rename CMA helpers to DMA helpers
 ---------------------------------
 
diff --git a/Documentation/locking/ww-mutex-design.rst b/Documentation/locking/ww-mutex-design.rst
index 6a4d7319f8f0..6a8f8beb9ec4 100644
--- a/Documentation/locking/ww-mutex-design.rst
+++ b/Documentation/locking/ww-mutex-design.rst
@@ -60,7 +60,7 @@ Concepts
 Compared to normal mutexes two additional concepts/objects show up in the lock
 interface for w/w mutexes:
 
-Acquire context: To ensure eventual forward progress it is important the a task
+Acquire context: To ensure eventual forward progress it is important that a task
 trying to acquire locks doesn't grab a new reservation id, but keeps the one it
 acquired when starting the lock acquisition. This ticket is stored in the
 acquire context. Furthermore the acquire context keeps track of debugging state
-- 
2.33.0

