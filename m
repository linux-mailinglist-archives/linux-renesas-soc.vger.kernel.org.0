Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F57A50CD1A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 20:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236818AbiDWTBa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Apr 2022 15:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236706AbiDWTB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 15:01:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95B534B8E
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:58:31 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id m20so1526749ejj.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mbXH9GkXryg1QQulWs+ls+5h6FW0yxx7/Y7vRbR6C/s=;
        b=T+ifu4nHMWFUHBZzJCy9RJEez/dm0zUE5pi+Q6k6Plu1gNN6KWhdQYqzOBEiYPmDK/
         tUlfW1QT0omI72H3KvVwzPXGU2sOVlM6vnqNWrvZfvKWUlt0MwxVE+nN0pKWF/mkyqnV
         cKcyS8B5TYXKosP3NybIAqA2Y85MGL6kFOBpQdjIW9uzgDylcmOUW1/EeZ9ZkQtZDHWw
         gKqRzrwV5Q3zB3cScmyhYsznZIHAm1zBiovkCb0VplLfa9u1v0MINxhkHD5Bw5bZpGqg
         8xmKWutjiWTn2Zz2QsoQyjLTN0qhdOybYG+SJYf0rEbB8iSFB5c+eop8SF/wNEX3H3Bo
         9NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mbXH9GkXryg1QQulWs+ls+5h6FW0yxx7/Y7vRbR6C/s=;
        b=rRxFBAK2OabqqeaxDaVNik2B+llTn6p9PshkZgMcTVkipsPha1wT33tG17kXpQMLUK
         aINYWE0pQIgEhiFwSBhoNOh0BlJT4i5hYNB1jXT0FBwzRHaLfU78KOOUxOeDsi+Fb6cF
         9RUqi4foQI18ZQODyGqf9s5lZgSLufp08h6NtwHuq/4WQ742bloq8jOpQOK/oLbET3lX
         SBReEzKjNtSv2Wu3K/rgmeF6+4FFOs4zmzWg2DC/w9Ht9/m3IHoqRH0k9lNI+KwlEt6i
         M0dcnrqxZVNUMwLBQqdJhBrX0F+09k6d4w52YCt4i0Erl95gR+2M/wGvg5/CiEhKrqGx
         cXQA==
X-Gm-Message-State: AOAM5319+EW0frEBfYbmnqDg0vg5LR4m/E/3oDcs3RtTWvoBm51CVx5e
        I5/pMnDoewWF11tuLBaHTxLH/w==
X-Google-Smtp-Source: ABdhPJzzns+nrccigk7TbM/rHh3ycHmBdd+FBGsa20xOxBuUxK8OvDuNcpCGaCRs04d0GnJiJRzGKw==
X-Received: by 2002:a17:906:94d6:b0:6e8:d608:c960 with SMTP id d22-20020a17090694d600b006e8d608c960mr9529108ejy.96.1650740310492;
        Sat, 23 Apr 2022 11:58:30 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906b09200b006e8baac3a09sm1923271ejy.157.2022.04.23.11.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 11:58:30 -0700 (PDT)
Message-ID: <a8c9e05c-1690-8b62-2e5c-43ca4c516d00@linaro.org>
Date:   Sat, 23 Apr 2022 20:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/G2UL phy
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220423134752.143090-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423134752.143090-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/04/2022 15:47, Biju Das wrote:
> Document USB phy bindings for RZ/G2UL SoC. RZ/G2UL USB phy is identical to
> one found on the RZ/G2L SoC. No driver changes are required as generic
> compatible string "renesas,rzg2l-usb2-phy" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
