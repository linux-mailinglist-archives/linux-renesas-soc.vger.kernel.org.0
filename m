Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE07647FE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 10:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiLIJKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 04:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiLIJKw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 04:10:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF7754B18
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Dec 2022 01:10:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id s8so6054845lfc.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Dec 2022 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3FnNOdvI4rWjnHyWgDozXRbaw2AYIAUlqPWPsqxkL4=;
        b=KVD+7kE5lL+pTeO+6c4//dBqt1KZPY3HulvHg+MoL6IdGUPCh+ks/OvIUzmXSBeEZw
         bcZmjv0cv6XT05ZOc/dnJzmDozJjL246ZFrSno03viiWBYVODbdpzpHEIhmdSeDfI16V
         flZB2ySxV2+7+m77ICY/k1pWlMzq7oD6sXN6d+ielbPXEnbl93/eVV86wfJ5qCjOVoDD
         lr17Kjufd+bsqRgl9pAc3iYAlKiubrAR7RZ+fTNNA8R+731rLSlX0xBLtpZKgmnf3++J
         gcv59wEAqSoD9TDOswZUYuIXE+l+SF61eJnC0ojJnkqOoxulqUbiwQwxvavlZyvMLKY8
         PhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3FnNOdvI4rWjnHyWgDozXRbaw2AYIAUlqPWPsqxkL4=;
        b=BbfuNgUnAn9CiiLimWCcDpD69jvdfU7hPL56W+WBZqEk4//bsbKHDQINemxk0o66Sa
         G1In10v775ub2tcvDeLI5KWsFA6S0BpA/5GPUGEi8FgVIeUmLPHGNniNggYVTLzof+uN
         4fPyrtPpYgBTtICEq5L7UdVvSbEVyAvqUxKeBTCm5zys2//W1PsCri5xcsjGFQsYY+Of
         2J12bflNX3qS5Y5uSuEG7gNI8oOYVB2lefbuWBeYbHO3qYeM/gF+6n2sf+dXgQcW+6eN
         BHbpyfIrAsSSe9lCRigz5zKgaVqzFJ8S3anYgoH4IiQozVIhVFm6Xj0FBZYI627zrRG6
         hLew==
X-Gm-Message-State: ANoB5pmfsbWKz5s7DuIslbNgSNvGqPlMStw89pVzgGS30kxOaKvoWxwc
        2fLBHnHeCz6i+5dt4uW+4U8d8Q==
X-Google-Smtp-Source: AA0mqf7xEULdEwSJaPke8khzMoilV4EuukcDjEPYH9CA6fV2c9nDO1TqTdVqHoLoVpg4ATBzhLO7RQ==
X-Received: by 2002:a05:6512:3d05:b0:4ac:959a:a23 with SMTP id d5-20020a0565123d0500b004ac959a0a23mr1775763lfv.7.1670577049659;
        Fri, 09 Dec 2022 01:10:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y17-20020ac24211000000b004b01305732bsm175657lfh.216.2022.12.09.01.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 01:10:49 -0800 (PST)
Message-ID: <15d9461c-5b31-dfb5-ec9d-4b79ea120aeb@linaro.org>
Date:   Fri, 9 Dec 2022 10:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 net-next 3/9] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Content-Language: en-US
To:     Colin Foster <colin.foster@in-advantage.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Marek Vasut <marex@denx.de>,
        Sean Wang <sean.wang@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
        Linus Walleij <linus.walleij@linaro.org>,
        UNGLinuxDriver@microchip.com,
        Woojung Huh <woojung.huh@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        George McCollister <george.mccollister@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202204559.162619-4-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/12/2022 21:45, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.

typo: switches

> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> defitions of the DSA switch, but add additional properties under the port

typo: definitions


Best regards,
Krzysztof

