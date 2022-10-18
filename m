Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 274BE602F32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Oct 2022 17:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiJRPKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Oct 2022 11:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiJRPKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2022 11:10:18 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1323D82772
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2022 08:10:15 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id r19so9814776qtx.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2022 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0Decu5eTuYq3N9NuHRvD7U+AWF4ZxQHh/idpTYZ40g=;
        b=RGlxyzqhPb2t80nAETjS8IOyBUe24qtWyTEd6gm/VZa/Z29OU+ErYNEhdNI0FOoifS
         +gwq81e0wSpl2BjqAzEJGtqszyWZv9+FNcWFCnrm+Utm1nsd2+V9qxPtw6inAJFIRn7k
         lhirN/B37gt01mMUUO/7j7IzF2PRy1+/WKB1cK6SckO9CWqWlP3jv8ZyCgWq2eGnqPR6
         VjTOmbhke9ooJXsrllAm0BL81ynQjO8JbdDRUCvOkLs3T8eU0wPnbRh8hjRo+hwBrQ9o
         bEwjE65WHCDJgd41vX/S8tv0ZylQLZBBWMsrA8U+U4+O3C3wTexXDMuMRWR1LX4f4JzB
         xSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0Decu5eTuYq3N9NuHRvD7U+AWF4ZxQHh/idpTYZ40g=;
        b=Vj7vi4IqXGXgpbOW5EiQm4vfQ8JPODo/s0w3U9Fh9F/f+Un1d8gEozFF5xTWnAkBNJ
         G0HK29p8xr5+6WtBqus+XZ9+grTufYg9W1sv0YJxlSutRblqH8o7heGEGuvKYTXDGTFS
         pEnWO/c0AXXaVtwnsJsvDxatj4QG5Pj8ftztDzVPctF0vALAvQUKxH2r3R9/dwe7Wh50
         UAqwXAjIznRaxUo+AF6B0Ma97IpG6pyonQ57ukuH8Y530RDPRZsiKyssHFwMX70EiG28
         r5SzUv14V6Wmmfqf+AXQtjkqRXm/2EY+p5ju2xaj145Z7boJ3r9QSRnP1G4CEBsFSxY7
         Ikmg==
X-Gm-Message-State: ACrzQf0S+tuC4b9+SpT2WOQ+e1Jtq7/iSFet3rFwc8iTiPjx58C6gliC
        78LNM8taqVRB/YGe8C5COSZ8mg==
X-Google-Smtp-Source: AMsMyM4eyh0uwoJa7v/OTSATTJn0qahU/rlnu8ZCSdMx78M4vDnm3kcHa/H4tGKZjc0xr5yNguriXA==
X-Received: by 2002:a05:622a:13cc:b0:39c:c0fb:95e8 with SMTP id p12-20020a05622a13cc00b0039cc0fb95e8mr2513006qtk.63.1666105814981;
        Tue, 18 Oct 2022 08:10:14 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fx12-20020a05622a4acc00b0039cc7ebf46bsm2035297qtb.93.2022.10.18.08.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:10:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hai Pham <hai.pham.ud@renesas.com>, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document R-Car V4H support
Date:   Tue, 18 Oct 2022 11:10:09 -0400
Message-Id: <166610580691.30968.1388657340691484523.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c268cb4497cbe79773bb6568f36c37adc6fb5bbe.1665582645.git.geert+renesas@glider.be>
References: <c268cb4497cbe79773bb6568f36c37adc6fb5bbe.1665582645.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Oct 2022 15:51:46 +0200, Geert Uytterhoeven wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
> 
> Document support for the SPI Multi I/O Bus Controller (RPC-IF) in the
> R-Car V4H SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory: renesas,rpc-if: Document R-Car V4H support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/fad9489abf932ff01ca2b9a9bf41a11311bdc8d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
