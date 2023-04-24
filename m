Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D326ED4F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 21:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbjDXTAA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 15:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjDXS77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 14:59:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198D230ED
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 11:59:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so36061089a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 11:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682362795; x=1684954795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKBK2Yd+RZEYbehkK7NhR2R9eIS3vYVx24M/JJ09Ytg=;
        b=WOjh7zs74p4I7idQWkzJsazHXN0Z65Qks1oviIh8uq8hKRJhaHLVw6boUKk3Meosy7
         7X+3c/b0P92Ppw2VV4ERpkB5/OpzXevwNsta8AO/zwWmVhAhDfwYFG2rwv3ahF64WWuN
         Nguu31ABZQ6RTZnhbKjzuOr8nElNEenletTCjtd+edkEKVbEm5iQZx7nLA9FpXV3dk9m
         /zoKus9HdVjFwzq0KvvYhH5AV4oWlC1e08QjRakUcORQ7nFEnh1X7qX/Z+hw+rWqJifN
         E3TQ2EYwiw0BxN3LSkoTOa1VeV4jBDXwlNCoyr5qWeZZ+Du0c0c/3lxM8H3lZVRQ0uJz
         N3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362795; x=1684954795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKBK2Yd+RZEYbehkK7NhR2R9eIS3vYVx24M/JJ09Ytg=;
        b=fljWpivA0ER/SozghtMZzcA+ohHjSvJWWclQ8AGmcyRG/6cGo8v5SBL50ckXg/O4wW
         k7iVmX5ULdm7r92Au9fTOOBhFWmdkIrTbyA61+gMsrQqbFx6J1odlicFTJ84cnMPoWVL
         ar8O6ix7qmbNBjTE5aiWhpJ7oPEouW4DoKeT4K72b6SjOUQ2b5LOn2DdJw4r0VxAb7R+
         wZd2vCoAz87VlkCEZKg/ykTnUwaGfiE7+SJXEusrOwdzIeZZRrUB5TdwRFYmbum8Mobt
         1MVWIr/RpAfv7AVdbDyc1ceISQOGA2/oHHI5qmHc3ylR5BraDBWP+0xwQpl8sf2JjaDe
         D4lg==
X-Gm-Message-State: AAQBX9fe6mQYHMCi1HJaBMe/F4zeXt26QhsTwiU3bo0aH6Iq7kk/bTD3
        ptP/OBMMO/EDMPghO/I4rQLAuJ3S4kjdwkVefhg=
X-Google-Smtp-Source: AKy350ZgEo4Gbt/zYMhEe+QcTeR84MsHxXYXrPXBIhIa2toJXZdxXf7R0KjBxnHEP8ajUDi9ap0d/g==
X-Received: by 2002:a17:907:7b99:b0:94f:2916:7d7 with SMTP id ne25-20020a1709077b9900b0094f291607d7mr12439891ejc.19.1682362795630;
        Mon, 24 Apr 2023 11:59:55 -0700 (PDT)
Received: from sleipner.berto.se (p54ac52fc.dip0.t-ipconnect.de. [84.172.82.252])
        by smtp.googlemail.com with ESMTPSA id ke15-20020a17090798ef00b0095328ce9c8bsm5849818ejc.67.2023.04.24.11.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:59:55 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] media: rcar-csi2: Add support for V4H
Date:   Mon, 24 Apr 2023 20:59:31 +0200
Message-Id: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds support for Renesas R-Car V4H.

Patch 1/3 prepares the driver for R-Car Gen4 by creating function
pointers for differences with Gen3. Patch 2/3 prepares for parsing CSI-2
C-PHY properties. Finally patch 3/3 adds V4H support.

Tested on both Gen3 and Gen4 hardware without any regressions. Tested
using both regular capture and v4l-compliance.

Niklas Söderlund (3):
  media: rcar-csi2: Prepare for Gen4 support
  media: rcar-csi2: Prepare for C-PHY support
  media: rcar-csi2: Add support for C-PHY on R-Car V4H

 .../platform/renesas/rcar-vin/rcar-csi2.c     | 391 +++++++++++++++++-
 1 file changed, 376 insertions(+), 15 deletions(-)

-- 
2.40.0

