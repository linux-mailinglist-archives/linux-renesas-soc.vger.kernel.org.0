Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A80616678
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 16:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiKBPs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 11:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiKBPs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 11:48:28 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1C22A409
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 08:48:26 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id u7so12691720qvn.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Nov 2022 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqcHEbUhCxHVF2jWXX9rIliz1pXonUtemL5GAsoaHYk=;
        b=cjJzrwScQSgi/EZHgfDyhONjigKwZTUHGMRYmsipn6PDa/tNpPT/r2YTXbwn+PRKJ4
         hvzoTNyiUfkrVhEJfrY/3QI261jDZLrgAhiEEfSyujwWfrmCA47QPAcaRWNz83HrWHcC
         oSBkL/Puj1M+J8+qZCePxUcHVUMGN6VMGWnKOQIcaLXmxQlCOZoxjDMHjtrOTcHIqTM8
         flR7MAuX6cP0wvRF6Hwx/xzO3ezPAqetNe8ghGHlaO57R5Y8am849P9vRJUIkM+YNNWq
         rldzL5zpeBkMlu+KVhL+JAIcsiW8ZuqfkRkD4l68HPX4D2c5AdQNJVLVy4LNtv9FgbRt
         RR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqcHEbUhCxHVF2jWXX9rIliz1pXonUtemL5GAsoaHYk=;
        b=iaKEaFHFyFWOB8nWxbc7Elw7CxpdC4WPgBVKg2Ob8dp4WofXKf6FpDMsJrv1k+Lvex
         9V5ypTO/5dIUBOAdkIkwzXTJ+zi2t3QlXkZ8+mOW5YJXvZEtjEfFpDVpONcfbs7cZhCX
         rJfjI7TrLthDQ6KYWsvyzPdCy2rT0DIH8FaPR/yKW9pVSIfrpPgvW7Uj0n6nm/uRMEbG
         +y8gJXBLyylUW4jNn09vg0YSsyBMedAhuZlnhQMG59TUnWxzuFh5ofd3wmYHJwRiAVrE
         fUtW1QCiyqGYyzDx7rZ4jK59S+knMjuVb7Sxt33dlLS3Rggl3ZHkWNMaO5NPKTb29zTI
         xdcw==
X-Gm-Message-State: ACrzQf2LLgzucbM++xXef7W3EqRux7oN4BkLCYWSFRH7UTkxIG+8AAko
        ApblkDmCtalBGGWWHC3YWU5ATg==
X-Google-Smtp-Source: AMsMyM5lWMNbK9eIVv4y7NtTus+Bm2qBB8TllawiBRSGYs8TQbhuMAvGKmpM6iRqg5hbBhBe4lXZUQ==
X-Received: by 2002:a05:6214:ccd:b0:4bb:663c:8018 with SMTP id 13-20020a0562140ccd00b004bb663c8018mr22348600qvx.24.1667404105566;
        Wed, 02 Nov 2022 08:48:25 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id w20-20020a05620a445400b006cbe3be300esm1361638qkp.12.2022.11.02.08.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 08:48:24 -0700 (PDT)
Message-ID: <4d981879-f6e2-8046-1a34-f11abfb19187@linaro.org>
Date:   Wed, 2 Nov 2022 11:48:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] dt-bindings: net: constrain number of 'reg' in ethernet
 ports
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Sergey Shtylyov <s.shtylyov@omp.ru>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Martin Botka <martin.botka@somainline.org>,
        Taniya Das <tdas@codeaurora.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20221028140326.43470-1-krzysztof.kozlowski@linaro.org>
 <20221028140326.43470-2-krzysztof.kozlowski@linaro.org>
 <20221031185737.GA3249912-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221031185737.GA3249912-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 31/10/2022 14:57, Rob Herring wrote:
> On Fri, Oct 28, 2022 at 10:03:25AM -0400, Krzysztof Kozlowski wrote:
>> 'reg' without any constraints allows multiple items which is not the
>> intention for Ethernet controller's port number.
>>
> 
> Shouldn't this constrained by dsa-port.yaml (or the under review 
> ethernet switch schemas that split out the DSA parts)?

dsa-port should indeed have such change (I'll send one), but these
schemas do not reference it.

They reference only ethernet-controller, which does not even mention
'reg' port. I'll describe it better in commit msg.

ethernet-switch is not yet referenced in the schemas changed here. It
would not be applicable to asix,ax88178.yaml and microchip,lan95xx.yaml.
To others - probably it would be applicable.

Best regards,
Krzysztof

