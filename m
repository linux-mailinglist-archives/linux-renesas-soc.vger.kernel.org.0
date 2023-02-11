Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2BA6931DB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 16:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjBKPAf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 10:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjBKPAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 10:00:34 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B192597C
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 07:00:33 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id by3so6652091wrb.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 07:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXex5qhwyMMcL1vblDg3YJ+btZsGTK/lZjJOH5vZtgE=;
        b=yfOUxOO6LzsGo/BB3RQkwc16vLiABRrAON4MRCfY7DhNrCb4eceGRZPmnZWY7yYvch
         ws0Di0gClAkUnW1eAEglISsyZ/E5ghhRQB7/9+bQicejmAY1NpgrRQeLxOBO3FiwK64w
         4/fdXm42V3Odil4HpVIqGtQMU2XMlqtlx6fGzDYtveRJvJ8TF3tztFV6kBPBQNjNI3Lq
         igivqbYb6yBu+JtFuWpQExi2tG+7q8uTRfy04+wb0OtY2/ozUTPeF2oT2HE/+890jgEL
         mFDA9hehFbhCPqxyLHTRBToQkwE5y5skxclcAphWxa/DzGzxKUSLQlOlV1zmyI2kLKPe
         fLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXex5qhwyMMcL1vblDg3YJ+btZsGTK/lZjJOH5vZtgE=;
        b=B+MlzI9inkzK1lqXCsHD/jHUMCbl8CGPAcuMxq85alu9imfRsGe7D71uGVWL23Dr0d
         6DBfrPxMgXQ9paJqjgAykVW943KRT9OUy8c1Y7eYXEhpeaJLEGMdae3b12HVnpJ3wdGO
         PTXc9sSegyZTo/ZlIrWqzINd95xRUHjIV0z4MTFTuTetJpVWV7sIsifyfQ29jSfksv7l
         lc8KQK7OQjX/ww/D454uyEFHSINBcEwE4OQ3HT/0M+8iAUAk8Pawb6i67OhfdRqlmiyb
         0eDmTX/bpRPNpV00fPxzjL+Zn8UKCEnv2+48u8bj2reAd7ss+NcVaq6J3kZGg2PT+P71
         1o1A==
X-Gm-Message-State: AO0yUKUZu7HuuDJW21dhlKpdJRb1/CVT/FpRQqObfxCqXZHikejbCqt6
        BxAsbc51AkwWXUGijXkSfqn31w==
X-Google-Smtp-Source: AK7set9IuR7K9CnLitanK7bfxMBH6a3rbW94ouIkPD6kV/d3Nt73E4bJbrJk3zo6oa4s97zIXLnMNQ==
X-Received: by 2002:a5d:440e:0:b0:2c1:2a15:9dda with SMTP id z14-20020a5d440e000000b002c12a159ddamr18188057wrq.43.1676127632221;
        Sat, 11 Feb 2023 07:00:32 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id v5-20020adfe4c5000000b002c549b91c54sm4231415wrm.52.2023.02.11.07.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:00:31 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: white-hawk: Wire-up video capture support
Date:   Sat, 11 Feb 2023 16:00:10 +0100
Message-Id: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se>
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

This small series wires up video capture support for White Hawk. The 
series depends on the bindings for each of the modules on the SoC posted 
in [1].

Patch 1/2 adds the internal nodes for VIN, ISPCS and CSI-2, while patch 
2/2 wires up the MAX96712 on the daughter board.

Whit this applied I can capture fine from both MAX96712 thus enabling 
the will video capture pipeline.

1. [PATCH 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779g0: Add and connect all CSI-2, ISP and VIN
    nodes
  arm64: dts: renesas: white-hawk: Add and connect MAX96712

 .../renesas/r8a779g0-white-hawk-csi-dsi.dtsi  | 172 +++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 666 ++++++++++++++++++
 2 files changed, 838 insertions(+)

-- 
2.39.1

