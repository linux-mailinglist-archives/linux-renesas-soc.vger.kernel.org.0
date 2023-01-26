Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD3A67C838
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 11:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbjAZKQO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 05:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236109AbjAZKQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:16:06 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E105B2E821
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:15:42 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id t18so1256082wro.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twBtZMn9wKaG/ztRkE/bpJjVZKfP8U9ZlpnQYKgfeeg=;
        b=XPrI2pHpkgT4ZxgfpxlYrcFBGY2eruA6Db+c5YRDQNdUqMALc+WwDqoqsgwLLXyKSA
         ekzOULU2MHbSbRLNECuTHzvJGdre8fgZRsg9h2Juz07NCjGNoLmDl1R4HWljo5pwl8xL
         53X73c46AaUKVN46+cMQnorTeJN8MJesJyBvQ4qgRufpAI/CHHjbCjS7vjRfOnjXzXOC
         1SRpXr6P3uEgbuki+L3gDtjBk+LBin5HoJCnNUK3t28sQegG7RGCb+dc5rXc5EE03BR6
         6CQDtkZcPj7PK1vcFU4dkv8xbp8Z7xoneM37+WhYZslJ4QeAKQzSR40cv46lJrS9Fhu+
         5Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twBtZMn9wKaG/ztRkE/bpJjVZKfP8U9ZlpnQYKgfeeg=;
        b=RX9U7+MnLSt0uucWIx8oFXMBRFzlJlPl6MAcWubafOpl9n/Udqa2lIPfYlPCG/ZTFP
         QBtW3B1QDJTA/l1rp3AU1FE/7rUs4TxeJQ0JkUPUAU+W5AREYe4UyLsWgpvuUyPb4obo
         tGsmwQ4m7nLo5FASvkmA4ZbfD/UQTEteNUhLM7ZVXQyirDMJYVZUUE4OpC3fq3K1JSBh
         LzBl8Ft8Mf1Iv5vvMwfJeZegT25NzAIHyw9ggFjJI1q6qOAEWR58lW3E1K3ijWmeteFu
         pv16sYvHCfzY7p1xGllnSktdNs2nkyXRHNynhDa3ROJqn/RgGXaZR7rPfCrYpGtIj3JG
         r9XQ==
X-Gm-Message-State: AO0yUKWFZnoj0iwVC/hrslx+tkvwHPk19tnsNcCTjMMQrExApTHGxpjD
        7zNYxnzDOUiBmQo4vhMKF77fgg==
X-Google-Smtp-Source: AK7set+28IeoLf32k4Lmsk+uscuInUvhlaQAjPA3pU3bPMptPmlY8O2wnZiVU74/5AoUSBadienP3w==
X-Received: by 2002:adf:f045:0:b0:2bf:b872:cf21 with SMTP id t5-20020adff045000000b002bfb872cf21mr4274135wro.0.1674728141450;
        Thu, 26 Jan 2023 02:15:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h4-20020adfaa84000000b002bfbf4c3f9fsm902958wrc.17.2023.01.26.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:15:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: renesas-rpc-if: Remove redundant division of dummy
Date:   Thu, 26 Jan 2023 11:15:39 +0100
Message-Id: <167472807936.10495.6129482426397494383.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112090655.43367-1-wsa+renesas@sang-engineering.com>
References: <20230112090655.43367-1-wsa+renesas@sang-engineering.com>
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

On Thu, 12 Jan 2023 10:06:55 +0100, Wolfram Sang wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
> 
> The dummy cycles value was wrongly calculated if dummy.buswidth > 1,
> which affects QSPI, OSPI, HyperFlash on various SoCs. We're lucky in
> Single SPI case since its dummy.buswidth equals to 1, so the result of
> the division is unchanged
> 
> [...]

Applied, thanks!

However it is late in the cycle. I'll try to squeeze it in, but there is a
chance this might miss upcoming merge window. If that happens, I will keep the
patch for the next-next merge window.

[1/1] memory: renesas-rpc-if: Remove redundant division of dummy
      https://git.kernel.org/krzk/linux-mem-ctrl/c/cb1ed99d9520892616c6d566efbe2d92a84a576a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
