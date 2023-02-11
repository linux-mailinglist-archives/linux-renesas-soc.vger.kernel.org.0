Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F71E693184
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjBKOhR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBKOhQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:37:16 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C1B14E87
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:14 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m14so7901539wrg.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZPhQZVd1prE0u525zLL0iI3iGAhCCT+RWxvsYOv3R8=;
        b=Lws4bh7f6JP6kswkwuM5zn52lO2p41X7G7PAVfDUb/mEWHLXPtBDiHDGNBuN2DKfiY
         tWe0UeeMX7CD38UXFC4lFlH1CLc2mXl7MtBcbM2mueE922uIYkA9aSJjeXizKKgDXSji
         MG5b6qJ9Isi+QbZduPY1QcuKfTVkpQtoK1oRnpccAozaTMBpnxS/TOG6UuAVg0feLtJK
         dUDEH03Psm3vKlv+PaO3YzT3UTRXTT4C5Paa2017hrlz8JxwHoP8cvESe6i5gL7aH90/
         0udVnH+w3+oct7gIJPlrwc4Dirao0/aN/bhlaesdjik3NWGZy0Lv1q7XXhN9beJPMVVu
         F/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZPhQZVd1prE0u525zLL0iI3iGAhCCT+RWxvsYOv3R8=;
        b=dtN0o8JbziQ2sztu5mQ4tSJ4pIDM49XjMfpgVq8Up6VL9SHJ6BoNYOdA/alOnvvh33
         WWbFQKvRjDirO3E203BQ+V2JT9OtFR/YI2eN3t1fH/RdIdyQoWSkgFYKVOZadXzRaqVj
         RCEg6C58qyEivdb0AFgSf2R0AZr2uvBeyf/8K6O+mDmgkhIK7ljJDX6Rl/FGicqtzXzy
         oYePHoFU3DL4rQzeFeDzopPBr4nLwqKE/Prwl7xaGDz7MDHt0pwBwNP9AO0OApspb3nV
         ez9zNFYy3XxXi+K2tr2BKkg9jddk2Rh4z7gxs5XiIImp1fTfRi4uWDDgVEfleL8oySZ4
         7Ypg==
X-Gm-Message-State: AO0yUKX0fy59gaq7mQVuZQe5Uaue7xqQsYsb+e5wX5KaGM15DzzklfGm
        W3F1iDsEKpV3i04OmYsYz1xjQQWMHLrPpu8WipI=
X-Google-Smtp-Source: AK7set8Xjg4tm961mn3eBKQWSFx+mcPs/75Rp/T6FmaRo20eyxm9NIdcd47+Osk6dV+fzH1SFnSaFg==
X-Received: by 2002:a5d:4982:0:b0:2c3:dbe0:58a8 with SMTP id r2-20020a5d4982000000b002c3dbe058a8mr16018094wrq.44.1676126233110;
        Sat, 11 Feb 2023 06:37:13 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4194866wrq.25.2023.02.11.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:37:12 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] clk: renesas: r8a779g0: Add clocks for video capture
Date:   Sat, 11 Feb 2023 15:36:52 +0100
Message-Id: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se>
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

Hi Geert,

This series adds all clocks needed to capture video on V4H.

Niklas Söderlund (3):
  clk: renesas: r8a779g0: Add CSI-2 clocks
  clk: renesas: r8a779g0: Add ISPCS clocks
  clk: renesas: r8a779g0: Add VIN clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.39.1

