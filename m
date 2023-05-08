Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3B56FA671
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 12:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbjEHKTm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 06:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbjEHKTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 06:19:33 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8031BCB
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 03:19:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-966287b0f72so319417666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 May 2023 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683541168; x=1686133168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXVIo20j+lxbEAUbF/aqLYCf9/CCUXNL6LmsVI4oGXA=;
        b=CUEf6mjzYiXbAY+no9+O7pfj5BoXLB5/XoIOlzdac4sTZOto2CcOa+Juuk1qkXbcfr
         XvS1Z9MPte6IsWz0bRxiVAynTQw2YOHfg00z4KH/cKTCSACBGQQ5vitjiv5ol0XC2eVm
         AZ6Al3L6GySJFVToHYsOvdNsPSPpMldneAIuk1oDrZjqKNh3e0Mc7dPLU0q1LAz16rHx
         ODA4L2atYSV8D2hRHnkLMe4XK2Ex+zoWG0TaPwxrx6PAsad5bA4h14/26wTCQ8j0MINo
         tCshd5W3zGisqXLcC0I0GKbe4MDzZBJhbhWAFYsnJiWNwHx+PGvN/QfTbEupS1z0q6KT
         hFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541168; x=1686133168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXVIo20j+lxbEAUbF/aqLYCf9/CCUXNL6LmsVI4oGXA=;
        b=g2BRpM+0HMm5mnNK+EFPrIUkY/PLA5LsoN+TCdREow1oxVPL6Tnf015NwusuOmzlbE
         Vp56Keef6kwEBeXL1Lh1DfL8lrohUTzK+J2YkXbwfFX9qZG9jHy0m4CUNE+QK7tfz/j3
         1Mjvdtpu4FQ9slf19fYpQVS84sAIHNwntogxm7Ve/PivhF67FoO9f5RGFBn3MJcCEhvR
         BVq8S7j8fIreRPU2FkZY1AGzSgYSZL1yFdK+a/CVM9DLMI5ENnYQDIYl9N+dDgwf1nAd
         nytO+Sh/5Ao5wOKcSguk47VgCnTS2KyOIAbDXKadHG+QN83RybxnLFPNxEZKWLUPXrDW
         CpmQ==
X-Gm-Message-State: AC+VfDwF1BdUmmLJzLs6GgZrSSbV8i6ql6HtxYnfJ9qN185lN4x5o1C7
        Lcj+LqNtb2cFlfMVEiX3iMQ3dTPl4QSb1Bg/R5SuIQ==
X-Google-Smtp-Source: ACHHUZ7fVZLV672PG4TDFHFLrEjXgnqezh3F0cxSp0H/nDO8hrLLuB6tQP4oSYlcx/XoTVOPLI1D8A==
X-Received: by 2002:a17:906:eeca:b0:965:d17b:292 with SMTP id wu10-20020a170906eeca00b00965d17b0292mr7471998ejb.60.1683541167994;
        Mon, 08 May 2023 03:19:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id tl23-20020a170907c31700b0094e597f0e4dsm4732513ejc.121.2023.05.08.03.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 03:19:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Cong Dang <cong.dang.xn@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] memory: renesas-rpc-if: Fix PHYCNT.STRTIM setting
Date:   Mon,  8 May 2023 12:19:25 +0200
Message-Id: <168354115955.104151.7636759306578579883.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419130234.44321-1-wsa+renesas@sang-engineering.com>
References: <20230419130234.44321-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Wed, 19 Apr 2023 15:02:34 +0200, Wolfram Sang wrote:
> According to the datasheets, the Strobe Timing Adjustment bit (STRTIM)
> setting is different on R-Car SoCs, i.e.
> 
> R-Car M3 ES1.*  : STRTIM[2:0] is set to 0x6
> other R-Car Gen3: STRTIM[2:0] is set to 0x7
> other R-Car Gen4: STRTIM[3:0] is set to 0xf
> 
> [...]

Applied, thanks!

[1/1] memory: renesas-rpc-if: Fix PHYCNT.STRTIM setting
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3d56c7364389fce14547803fef56d6f2cab5d366

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
