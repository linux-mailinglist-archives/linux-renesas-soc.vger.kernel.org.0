Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B315F8D35
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Oct 2022 20:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJIShI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Oct 2022 14:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiJIShH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Oct 2022 14:37:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636A325C4B
        for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Oct 2022 11:37:05 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u21so13239151edi.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Oct 2022 11:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACwGlN0BRnEYThscUK3CoIEB7lP8hoVucUxDhLzneEk=;
        b=7Jh07O8JCrk3g4JYofKrvove8Gd75W0CRlQ4alht4UdEcSJJqDACJIkLzAxtVjgAaa
         X2kw1yMLePc4yXQY9xNLlU1hdHMzv/atTQCVozbAoMI+fxZKuUB9K9ZTmhXOinF5rOeG
         zJU2fAmaulQ3B55LQ8ijUnURHLp8fVfhpubn/+a035+kwZymsOBx0sDcomDaXZx5fAEn
         3cQzVl1cTnZRgeAVTKZ4QJGbBCwRr3YfnFkhYNXscZOpTvVmdUQxnbelEgFAvrrRsx5J
         X26+Dxox5YfgZz2Y8yHdpN+gPTVo3wocoqGJ54C2RYyLwsD8AfacZKNZr+sI9bx75O33
         YBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACwGlN0BRnEYThscUK3CoIEB7lP8hoVucUxDhLzneEk=;
        b=BNqO6j8F191cFgqD7DA4eqlaVyI3zC5B2BkSRq9r92O8aMvndv/WB227ylFRD6+4yu
         qQ36NiizIBhRvYOLMw+H3cUU9+JQrb6cXY1akgYcihIqgiJ86itaRRdpZqMK2lEHdOlL
         AJmw3zgZy/9YRCmR9EaxhFpqlSNcvD1fXYDMtjw3vyGIIazHioAX0U2GFNduvl4syrXz
         VHIcihomRhaH/FHX+xrosYK/23zsVsI44kje/yqaniIkJSRBYFehr+L+0yTMpdQDWnnf
         grKaTVnQh8wZrYOqzMaMlVX3s7QNXmEmW9Zhhde6BQ6kbUChxPF1mx7EaOIANeJsPCJf
         i6sw==
X-Gm-Message-State: ACrzQf1SaTKtJDDIPB/GfszsybNYVrkspU5XXn8ErAZkO6o5CTT9hWkl
        7wO+pDwJtsTZDFe88NI+SYybNg==
X-Google-Smtp-Source: AMsMyM5X2SgxWeDlvNs/2NvxgdONXqr+iN79eEHlJPeaCIRAMB2Om23eOUxGLRH/DY9y/Cv88rxuUg==
X-Received: by 2002:a05:6402:2793:b0:45c:21f4:35a3 with SMTP id b19-20020a056402279300b0045c21f435a3mr849746ede.345.1665340623966;
        Sun, 09 Oct 2022 11:37:03 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.googlemail.com with ESMTPSA id o14-20020a50fd8e000000b00459148fbb3csm5610050edt.86.2022.10.09.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 11:37:03 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: rcar-vin: Add Gen3 scaler support
Date:   Sun,  9 Oct 2022 20:35:48 +0200
Message-Id: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.37.3
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

Hi,

This series adds support for R-Car Gen3 VIN Up Down Scaler (UDS) on 
those SoCs that supports it.

Patch 1/3 prepares the VIN driver selection rectangles to work with the
media controller part of the driver. Patch 2/3 then do the plumbing to 
allow more then one scaler implementation. Finally patch 3/3 adds 
support for the Gen3 UDS scaler.

The series is based on top of media-tree/master and is tested on both 
Gen3 and Gen2 without finding any regressions.

Niklas Söderlund (3):
  media: rcar-vin: Do not cache remote rectangle
  media: rcar-vin: Store scaler in a function pointer
  media: rcar-vin: Add support for Gen3 UDS (Up Down Scaler)

 .../platform/renesas/rcar-vin/rcar-core.c     |  22 +++-
 .../platform/renesas/rcar-vin/rcar-dma.c      | 104 ++++++++++++++++--
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  93 ++++++++++++----
 .../platform/renesas/rcar-vin/rcar-vin.h      |   9 +-
 4 files changed, 194 insertions(+), 34 deletions(-)

-- 
2.37.3

