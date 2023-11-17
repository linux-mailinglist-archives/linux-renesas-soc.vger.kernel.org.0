Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00667EF671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 17:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjKQQpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 11:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjKQQo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 11:44:59 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA72C1AD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50a938dda08so3175605e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700239493; x=1700844293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eA55YfApAKQilOmSxAi1H7xzp3FySlfaXmMF1pFLUMY=;
        b=QFcJLbTdE97VdTsGwBYOgP2MXlO+T5q6LA0On2Mlq462IXQfbiRTh2DXfievKoRQew
         ZMMxdIbr3VQu/McvZhAjv+dUJ2XWxch55L1t/eBwH6ISw/0XEY8RuEXLDKpYLqH4sYzk
         7c2iD5c88sn5Vficf4N/bFt5WirVmKUF+EjlwqQU4B7HnJTNmx/8qojGexXumJxtFT6a
         O1S+gkZuFoloHEFZ/ymY1a1C7nGIoSp04r58N7dNiaexdFW4UnGPGB+0KykHLybMal9f
         P65oCDPhIGSldT74U0YTO9jZghaVYOmgMVV+0Wg3pad0r6fBlMzUainLe3Ax7g0ee6f9
         suBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239493; x=1700844293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA55YfApAKQilOmSxAi1H7xzp3FySlfaXmMF1pFLUMY=;
        b=ndOsmU+XFvf3YHpP3ay7KYAody7enx2JdhJCKkgLNFTJnF7+tIR97nfeD0UwxIbUeQ
         AtlW+AY6OmqC2l9ZacYZErz4ak3TaHLpwJgEo9Ik3naNHIaeoutWpO2+9Q9lPSA7SQdW
         vVwyxZSsUWntTnSWUkPlmJgp4xmhTCJnsfuAZvQLH0gYnoZdhY1E2mLGIOfvo2wAhiya
         lWihCHLhsM9CbR9CETtyoUu0CJl2pvmnTQ6T/PFIiXY0DsHDeQITiPn/v1Xfra+1L38x
         EsQF5/62DP9oBD/jO3sNxm1dqX9rigXV0b0V4OTehlHOr6PeVrgZpHG4pV8Mti/7aH0i
         PDMw==
X-Gm-Message-State: AOJu0YyQf8QPe7knO8GXZ+tz0VJ1y2G3tQKRtnAVyO79VqWx+QycbfMI
        gxDhXcLnOAZ9CTLnX/zyww8+1w==
X-Google-Smtp-Source: AGHT+IF7UiC+QJF2Sk0XRI5G1Yt+AuSSfCDAgbG01W6BdSxNi7LKOZ0bq+GUwK4QdhoSqckMwsQQFQ==
X-Received: by 2002:ac2:5bdb:0:b0:507:b084:d6bb with SMTP id u27-20020ac25bdb000000b00507b084d6bbmr71517lfn.43.1700239493069;
        Fri, 17 Nov 2023 08:44:53 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id y10-20020adfee0a000000b0032dcb08bf94sm2791947wrn.60.2023.11.17.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:44:52 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H support
Date:   Fri, 17 Nov 2023 17:43:27 +0100
Message-ID: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small series prepares the rcar_gen4_ptp to be useable both on both 
R-Car S4 and V4H. The only in-tree driver that make use of this is 
rswtich on S4. A new Ethernet (R-Car Ethernet TSN) driver for V4H is on 
it's way that also will make use of rcar_gen4_ptp functionality.

Patch 1-2 are small improvements to the existing driver. While patch 3-4 
adds V4H support. Finally patch 5 turns rcar_gen4_ptp into a separate 
module to allow the gPTP functionality to be shared between the two 
users without having to duplicate the code in each.

Niklas Söderlund (5):
  net: ethernet: renesas: rcar_gen4_ptp: Remove incorrect comment
  net: ethernet: renesas: rcar_gen4_ptp: Fail on unknown register layout
  net: ethernet: renesas: rcar_gen4_ptp: Prepare for shared register
    layout
  net: ethernet: renesas: rcar_gen4_ptp: Add V4H clock setting
  net: ethernet: renesas: rcar_gen4_ptp: Break out to module

 drivers/net/ethernet/renesas/Kconfig         | 10 ++++++++
 drivers/net/ethernet/renesas/Makefile        |  5 ++--
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 24 +++++++++++++++-----
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 13 +++++++----
 drivers/net/ethernet/renesas/rswitch.c       |  2 +-
 5 files changed, 40 insertions(+), 14 deletions(-)

-- 
2.42.1

