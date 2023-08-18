Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164EA7808AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 11:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358546AbjHRJgY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 05:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359319AbjHRJgT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 05:36:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD9C26A5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 02:36:18 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so85906766b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692351377; x=1692956177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pojQP3VcjaTAfkflB+qDNh1uppY7RUN/tPX2gdHvZ+0=;
        b=YDy+nWd4tJjRzSq5DW0Kv30dxkag6C9FF2d/pYPAtXmJGrte8N0KSLg0VeJzP10R0B
         Tj4VMbOndG32N6YvljuQFfQlFsPd0c2W2Zh65weV2QQRGH9LS3OEpA1ZQwHz7OvmQhGn
         DmZCtElsxAwefcYOMK6OGj2p/WnpLFpymIz4IKxbTTlcka9GE4WmwdY0LQc32sDbib9s
         5qDZacLZ9OfCFD33QnC/KivLNLo5QNfWAM6bpcphC/xmpvWMoSs+7m/QO8yBB+UWW3sC
         iCUqUAq4y4SxeZ67VjVAfPyyssqPYrKO1Tdq75iRi3CpZljcXCcIgMnCCNsChbdSN0Py
         o4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692351377; x=1692956177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pojQP3VcjaTAfkflB+qDNh1uppY7RUN/tPX2gdHvZ+0=;
        b=Bs9Jr81FtZ8bFVkK7xqzcIgzDOUsi/Oi5Z3Yb07x0jCWJTsNmCajZ5LCYGt4U0AYBB
         19AHK1aex91yJ+LhXMoBJK/XBj5cLMLR3l5s5jnZrlkb8JPCQLEXPHOBwiPG9uva+thX
         EXYCQ9MBktwKw0PgxaIXYM5H4e5XVarK7+oN1iWLteZO2XKqxxX7Mt3dmiItLlnyi/Lw
         rc82NzqkoFqAhEzFVP8g1MLmFGio9LtDJgX7QAjWyH8UNrV01QSZKB4sTswTzWqF9/pn
         i1/Myqc7vP281g8qB/cMCgoaF+JuqFVPEllQVXJkxyhCCCBh2hVbSZDNltAok15V1wFo
         Z+Cg==
X-Gm-Message-State: AOJu0YzTuNVI44+nRFIk5b6FCVFTvuhr/Fmw48q+K/cilDBAqhaqEqAO
        L1uvOQeBJR2UEMG7ttE7ymXF4w==
X-Google-Smtp-Source: AGHT+IGpi5/nJ8BH5V60Hk1l8J1WbWXXDbIrJJ0bQxgnf97IOpUc+BszdnppOwVZa0TiAK43Gq+ugw==
X-Received: by 2002:a17:907:2cf8:b0:993:ec0b:1a24 with SMTP id hz24-20020a1709072cf800b00993ec0b1a24mr1518119ejc.7.1692351377162;
        Fri, 18 Aug 2023 02:36:17 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906b09100b0099cf44adf2csm977071ejy.46.2023.08.18.02.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 02:36:16 -0700 (PDT)
Message-ID: <b7f937d1-87f9-6c88-d494-8930e8d6aaf6@linaro.org>
Date:   Fri, 18 Aug 2023 11:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: versaclock3: Document
 clock-output-names
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
 <20230817142211.311366-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230817142211.311366-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 17/08/2023 16:22, Biju Das wrote:
> Document clock-output-names property and fix the "assigned-clock-rates"
> for each clock output in the example based on Table 3. ("Output Source")
> in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
> 
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock generator bindings")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

