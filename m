Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48BB57310C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jun 2023 09:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243203AbjFOHdV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jun 2023 03:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243959AbjFOHc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2023 03:32:56 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E6B2D5E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2023 00:32:40 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-519b771f23aso1692898a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2023 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686814359; x=1689406359;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0T01BUR4iszPkfnXV4jgUMkmxhDftwtafpe9lYKGnDA=;
        b=WOUH9Nbt08zqpgFCndvBJAwWodKyinVlSsIdRlxu87njqklXzJoKG4tz78RGoxdBMq
         eMPmQWN3FREY1Ofwo4Rc0CohiZJVMxyAvmSGkzuEVsAMdNhhxTGtBqoTdH4VWEQngAhG
         OoTIasWySTORlamWrug9m4lSJoF/Sc0MEHiQGWnCSaAAsSGOMkbhIjYob3LEKIjc3oij
         ic8vMYSm0Q+7JNL4EcWSBa+3SIJACce3UAStkO4WqWeNQlnW6sgZlPwlRSUgWcRUIE3f
         LZ85xIWqFDjQtqta6bkVgbGksYO37nndDM0NETnZfQvOwI/BsoZEl0wZ5FsnWi7Vak28
         XuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814359; x=1689406359;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0T01BUR4iszPkfnXV4jgUMkmxhDftwtafpe9lYKGnDA=;
        b=cSg7WtL/Ft02gILNw8KxKdRjQSFbf6/+5f0n6r3CFWQbtftPSwGxZfp32YxiGSjt0m
         dzhRIO3U5uVeS01hzhkBXjAw90OK/m6+YlDN2DifTqTqZCvDAfYiVBDJFx8haIZ548UA
         1+P5uDxSAhV+ctY3tC2vBOsmp5YTXF3de30LT+fDYD6qeZOd5QCUJssuTIOie/EWaLmN
         McQuw5tWF9cw13LHMijGctQTZloO20x9xNfcx3aYF5OiPr10EdoKxuCvwrv+hb07XVi9
         V8yr9rVKH7pxA62OmFyHC6ui/3TXMV1tMpgA0sYCJLRg2yHDr1aQswivWCWkzfOalXur
         Dtaw==
X-Gm-Message-State: AC+VfDwRrKap1MokIGfhFIHDJfvmYgd+j4uzY8u8+h+Y0Z5tsb4oLHeT
        iTv5opaSCLaPjeFn0mw78GbFdg==
X-Google-Smtp-Source: ACHHUZ4vc4UKj8FD6SlKtS2PYzsT6NzQeOIOWArA5HI/qAH+CQhyfwIsc1QUnMosg4S/oHU9avvWTg==
X-Received: by 2002:aa7:d756:0:b0:516:416b:f736 with SMTP id a22-20020aa7d756000000b00516416bf736mr11247984eds.35.1686814358858;
        Thu, 15 Jun 2023 00:32:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c489000000b0051422f31b1bsm8437975edq.63.2023.06.15.00.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 00:32:38 -0700 (PDT)
Message-ID: <df613aa9-00ea-2a8d-cf61-f1e85d26cd4d@linaro.org>
Date:   Thu, 15 Jun 2023 09:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: clock: drop unneeded quotes and use absolute
 /schemas path
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20230609140751.65129-1-krzysztof.kozlowski@linaro.org>
 <b07d3bfae4702417010ed5ee14739bb0.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b07d3bfae4702417010ed5ee14739bb0.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/06/2023 02:35, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-06-09 07:07:51)
>> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
>> checking for this can be enabled in yamllint.  Also absolute path
>> starting with /schemas is preferred.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> It's not clear if I should pick this up. Do you want to take it through
> some DT tree?

Please grab it.

Best regards,
Krzysztof

