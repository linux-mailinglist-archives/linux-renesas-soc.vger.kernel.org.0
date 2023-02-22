Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD3869FE4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 23:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbjBVWOv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 17:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbjBVWOd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 17:14:33 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D5548E0E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 14:14:02 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s26so36336364edw.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 14:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRAymfy24X6hnaOyqMf2RJMOVE3JO+CTaInboO0A5J8=;
        b=azWYnwsZNwaHw8425hTHWaI3baCPvRIANYpT1WiYEl52/5opREidcPpCWeAb7DHGFJ
         lDfYlItICxEvS3nl8bVV3w4fqtupHskPOWiSgWz+HZpuw2X6QaZlphEkmQ0+zzvnNsUS
         sb6CSbY4GDvpcUvhekJt+MtCInmjdvT9pRbfNp1Jd25qXbvugnOd1rpUW3jZQmUKAZzf
         6L97QjSqGXBSNV1jqKZ+wGaxbqnAB0MAeyszzKr8pz0eTzUOCM3cJbb0DlisiB/ZEZ6o
         HXMhNXmZgp+e9Vf0hT6ti9B7IvLRM4DEUtKUr24qHgt0TnrEFg3T7pPiae29lm5iOX6R
         gHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRAymfy24X6hnaOyqMf2RJMOVE3JO+CTaInboO0A5J8=;
        b=q9/mg3GP/qufauKE3MaUErQYNxfUVgHJMfnGkoqlTqqsZBENEjo4k/euFNdMt5FbU8
         /eDVIRgr9qBVTecPa5r9Q9OnHW6wBaUKMMvO1vDVPmmeNgTYh0f7mf5FqaXCOTVXMAZ3
         UrNPilZUv5MXzUQi0ccGRIcpeimcxt6uEsOx6IE7QXbz2GE3smwv2PcZev5EbilmoTaE
         abRpJbLx2vf73WxbUCyst1y6W5LwGTXHatOWnZJi/nv0AX823iDRA+FvTaSDiv5lZnAR
         WGuKj5e9sRkb9H87qHSG1Z8nD7IiLJhNCygxDvIsNuqpPQUrlokiD94foqNCIH9rQJF1
         jp0Q==
X-Gm-Message-State: AO0yUKU4pawD2YU6O6SCcZt5F3t1K8BfmVNGKxLI7BG216Wf6UklF9FH
        pylYsnoZhLFYHtFIxCSRayNULg==
X-Google-Smtp-Source: AK7set/nX8f4P79cTL39kcg/bO2H7MJ5MBdzSDXwVL9Q5Nqz4zT1qHEYH01bzXpUu1oleeWKBtK/xg==
X-Received: by 2002:a17:907:60d4:b0:8e1:cc38:6e78 with SMTP id hv20-20020a17090760d400b008e1cc386e78mr9117942ejc.39.1677104039852;
        Wed, 22 Feb 2023 14:13:59 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id a26-20020a170906685a00b008b1b86bf668sm7711893ejs.4.2023.02.22.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 14:13:59 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: i2c: adv748x: Enable pattern generator without external HDMI source
Date:   Wed, 22 Feb 2023 23:12:46 +0100
Message-Id: <20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.2
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

This small series enables the pattern generator for the HDMI block to 
function correctly without an external HDMI source connected.

Without this series there are a few small errors in the timings code 
which prevents the user from setting the timings, instead they need to 
be queried from an external device.

Patch 1/3 fix the lookup and matching of requested timings to the 
timings the device supports, this lookup was incorrectly implemented.  

Patch 2/3 fixes a corner case where the initial timing selected by the 
driver to have something to report to user-space can't be used correctly 
if it is the first set of timings the user wish to use.

Finally patch 3/3 removes the need for an external HDMI source to 
operate the pattern generator. Instead of failing when querying DV 
timings and their is no HDMI signal but the pattern generator is 
enabled, report the timings programmed by the user. These user 
programmed timings are then picked up by the pattern generator to 
produce a test image using those timings.

Tested on a few different R-Car Gen3 boards (H3, M3-N) with no 
regressions.

I can finally run all my automated tests without turning on my Xbox! :-)

Niklas Söderlund (3):
  media: i2c: adv748x: Fix lookup of DV timings
  media: i2c: adv748x: Write initial DV timings to device
  media: i2c: adv748x: Report correct DV timings for pattern generator

 drivers/media/i2c/adv748x/adv748x-hdmi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.39.2

