Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9550E866
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 20:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244470AbiDYSmU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 14:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbiDYSmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 14:42:19 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C470345AFA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 11:39:14 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id g6so8527390ejw.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 11:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/xh4WXVTs7GMegefI7747tXqjfg2a1/ldWnws8bMyYY=;
        b=kk74G6qpFgDNWr9L2SkhCWE1MyrhKM2CNtoYhcY4E9QrXY5Mku35Xucbeh3Pv4JGC6
         l2xI+x+oPJA2EaOUqHHk3yPBC85VLT6Bp3zCyEiFw8kMBbVkxbYtWCDwEUHs+GrgCnBg
         YxHN6hWqvO2IHvyQpGUAjxt8YW1zm6sBPZoaQglXQi1XDQQUliPAM6WfmsnnacrxS5K2
         PQRM5mfT4eA5Zoo8R+whrtx1TSKrRQNxi21JGv93WvuXrstolyOCiQvt2MYSxeeYylsw
         obwbpq1kAWPcxyB84xiMS/DveHk7OIC5w0456b/Gm/agZdqOtBTLOe2ZWWCWpCss2o/L
         gVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/xh4WXVTs7GMegefI7747tXqjfg2a1/ldWnws8bMyYY=;
        b=75s35iiy8AhuiCIZzOiYSaD6tIGuarLQ8vs3c9+mKoSM/a4mu5IyMP4J43efaaa34d
         0jdf8psYRhX5x3fbgec6Jho2dvpgSf2dj95bFRNW1QVwGVIwP41UYLx+1VvvPzhozjxR
         xm10oEWwzPbqbiEWWBF9+kAoZCQRKQH+BdDbmggD+lZqONYG7XojLbVJPDwuGhu7cu4H
         iRPVooJGAO9uUN0fEjlA3iaXAhmgsROeVsYQXHH84X5/zTrVe4OlDAJojM2+Kucz/T6/
         pzzXIlD/OBskieiJ2XLG37KGT/iVbGWzJ8PsHp493HJQqhr/qq8KAUUz4mhyRsLyWz6Z
         LVZA==
X-Gm-Message-State: AOAM533uAsoPRhF7GIGV/GxymaTUQRszZWazcCATr3OxHODutZs8yUGC
        zgI4w7npQqyqzRuO2b35oCHfhw==
X-Google-Smtp-Source: ABdhPJybKgZ/h5Rgya0pjy4YBGuKkkNESez2u3qtnRopwPp1OGz7XLM3O8JlzUy9qMmIYSZOejlwLw==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id y23-20020a170906559700b006cef3cc14e8mr17515737ejp.426.1650911953407;
        Mon, 25 Apr 2022 11:39:13 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ot2-20020a170906ccc200b006ef9bb0d19bsm3890344ejb.71.2022.04.25.11.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:39:12 -0700 (PDT)
Message-ID: <1a2ad0ad-cdbc-4b84-7de8-761db0572058@linaro.org>
Date:   Mon, 25 Apr 2022 20:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: Add r8a779g0 CPG Core Clock
 Definitions
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
 <20220425064201.459633-3-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425064201.459633-3-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 25/04/2022 08:41, Yoshihiro Shimoda wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
