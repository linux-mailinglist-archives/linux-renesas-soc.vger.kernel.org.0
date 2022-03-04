Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237A44CCFBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 09:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiCDIOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Mar 2022 03:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbiCDIOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 03:14:17 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56C565820
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Mar 2022 00:13:30 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 427F33F5F2
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Mar 2022 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646381609;
        bh=PN+MwFyyD7KNKhN3V9sTc9ozhjbNqMNAeFcwOrkH/Mc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=jQLZrH58hWlRQirutLmFiWPu4+xkDTRoSVsohYkU5Qbg2tOzNcCOilU/ZgG1pyA7z
         KZ+1Y4rrxdEBoDbBune7YWUpbGGLe0W8MFlGdRhX9p7Vh6SiR0qhqxCZIfF1kwApOf
         OYDhZr80irR0CmKpITNYJ6vboRR3cx3rE8kpAVrvozRnQA3pLL1kAa46a9UH6GBMu/
         22Vffzlml/Wgmj35JV4Xuk65B9+AlDgvFsM3qeNVxM757ukWfEHVX4IuBBCmoXoPRd
         l55QKz/SSVks4pmZfLZYQnYAz9lZP8RSl5YiaZg5kRhmk0F8SsLG1dmwOx4Wx+JZ3/
         bcl+Plt2EmB9A==
Received: by mail-ej1-f70.google.com with SMTP id sa22-20020a1709076d1600b006ce78cacb85so4063851ejc.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Mar 2022 00:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PN+MwFyyD7KNKhN3V9sTc9ozhjbNqMNAeFcwOrkH/Mc=;
        b=Zm9e2Xm7juCk1NjzDE4rvBcQT1xWhFTNfVtUAUdH9onGoxR6OGGd121YuCFO2M/G8W
         XzvCJvaLaew32PiUNTx/jBXi1iqQuQYCEsxV3B6ExznKJQik6PHg3IqdpN6UAxtLXAGM
         kwINk2LqRn7nu1hpKMB1ePUFdCk9/1QmGLInCpEwU3GS7jUbVHmBqHPxWkSnDeDfVRyK
         tvxVmzPMQ2GaLtlnkPQf3lbU/m5V/dlB7LH4YIfTgPxsVw0jQ7tmFE7YPvIQn6iYEjkg
         2sPmmxQyGWfRq7bhEezPAjEru7SeeOuMflNKSH68m+oSbifH44eYkSQQfIXDQ8qYmMkA
         WbkQ==
X-Gm-Message-State: AOAM530MU2/wktTRCYPYfmTJwfECGducM5QEuxnhW5QNkDtJ0RcGR0D9
        QBLs/1VJrSmoKuA2/2wMaGe7FB5wL9EgFEGm8yWoHhCqACYVQn51AJqGuop0kk06Pv7Vs+tJ/iX
        n4AtOtum8LUajQu7yENfs0SIP5giBI1xI7dqXlr4x0K9/mOzJ
X-Received: by 2002:a17:907:d0f:b0:6da:63d6:b84f with SMTP id gn15-20020a1709070d0f00b006da63d6b84fmr9408974ejc.302.1646381608974;
        Fri, 04 Mar 2022 00:13:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtmf4M0vAgtkkJF2MjO14bSsPEfmcjiMMhZeu+y4rewMDiaaGtcHGsndvzz05ZBZ+o9hJiUg==
X-Received: by 2002:a17:907:d0f:b0:6da:63d6:b84f with SMTP id gn15-20020a1709070d0f00b006da63d6b84fmr9408960ejc.302.1646381608738;
        Fri, 04 Mar 2022 00:13:28 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id z2-20020a05640235c200b00415cec386a5sm1889584edc.16.2022.03.04.00.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:13:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: memory: renesas,rpc-if: Document RZ/V2L SoC
Date:   Fri,  4 Mar 2022 09:13:23 +0100
Message-Id: <164638154584.220122.4689452706717484391.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301123527.15950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220301123527.15950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 1 Mar 2022 12:35:26 +0000, Lad Prabhakar wrote:
> Document RZ/V2L RPC-IF bindings. RZ/V2L RPC-IF is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-rpc-if" will be used as a fallback.
> 
> While at it, drop the comment "# RZ/G2L family" for "renesas,rzg2l-rpc-if"
> compatible string as this will avoid changing the line for every new SoC
> addition.
> 
> [...]

It's late in the cycle so I might not be able to push it out to SoC folks. If
that happens, I will keep it for the next cycle.

Applied, thanks!

[1/1] dt-bindings: memory: renesas,rpc-if: Document RZ/V2L SoC
      commit: 69d6941949ea8a113ffc89410b0cb79bc7b35a0b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
