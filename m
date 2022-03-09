Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF64D2C34
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 10:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbiCIJhO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 04:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbiCIJhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 04:37:13 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D9916F954
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 01:36:15 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 43FAA3F616
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646818574;
        bh=vgJXPJxV0L+vAaGNHZUa0pyZRilCw3Wji1ihg6t2p5g=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pYKMWNXmR681ZhCslMiROvJkXFM0yK7Z4FqkFaXpgaGx5AOJ2BpdEv65sPMwkIDj2
         C/qQQRzwMMX7LV31vK9azVXyuYIbsUNZ4dGf+oNKszE1S8qaWuwiQrtyV+lrth1Qgg
         RU8TQM218qVREfBHELS8iEHnPpQ3o186uxQFG95rLiYYOBpu7pPIAEWX4HSbGWbn1T
         X5erYCpC6LXEfkZMnYCjVfarm4e1sSZFny9kzPInLrVLY/pCZFIshGNaQj/zRyOQEv
         iDZDhq/RMXmspqBsRN7ffQ3xSskhpCmhFbr6JSUhs5x5rUO7oecJWymy0G60rCb36u
         N3TCMMf9d3uKw==
Received: by mail-ej1-f72.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so998494eje.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Mar 2022 01:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vgJXPJxV0L+vAaGNHZUa0pyZRilCw3Wji1ihg6t2p5g=;
        b=Giv5VrXMJUoQE0v1ZSzk4vzJuFyWPHGmzWQPlxy6IuEbCknZliotjlyYvy9lYY7GY0
         RpvzkzO9McxvL6GTM+MaNDx/bXNGy/lBzC+IxnBfNGDNS2TdR1OIP8HOc4UUGFnpVw58
         lTHJ5/EgZuH+id7CfYj1mGFZBkQTt1vkaM8osEACzLsN2oIoUL5Z+vtjQ6zqohzbNr53
         +11oAhFbIwsskbC+aZCeMUYkVwmP6boMjF9uShe6i17dlECkL0+YBolIL5rHbd7fY5Y0
         vvOvdb8Diov+9HI8dlbOZVdHx60cWQsAh9phZD3qB8zXPOfFqKsx+AOX1nziKdn9Qiz8
         FR6g==
X-Gm-Message-State: AOAM533KCl0jgbM2kwd3TM71UExe+Gbr7zeMEPSqDaWJ/JCWw/MhMoOo
        IZacSvTXPPw/LuLaTd62Ff0t07cbYpChnSjLvi4VubhSRmMEiZS3i4D5+tGWDwFrmFfk8LgNI6v
        tRiHjFftZ2iKM0dCZOr+cptpiXLtJA1pvEvOzTWEHF/lQR2Ky
X-Received: by 2002:a17:906:f41:b0:6d5:c6bc:fbc7 with SMTP id h1-20020a1709060f4100b006d5c6bcfbc7mr16234672ejj.541.1646818573802;
        Wed, 09 Mar 2022 01:36:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqJfkq2ncyoyHFJqrP5yMmZhK6ZJIwjOk5HnVSwV0BZkhtpkJH5FaPNRu22hHODgSjQwGtxA==
X-Received: by 2002:a17:906:f41:b0:6d5:c6bc:fbc7 with SMTP id h1-20020a1709060f4100b006d5c6bcfbc7mr16234652ejj.541.1646818573591;
        Wed, 09 Mar 2022 01:36:13 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id a7-20020a170906468700b006da636fdbe3sm496370ejr.105.2022.03.09.01.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 01:36:13 -0800 (PST)
Message-ID: <a96004cf-155f-22e7-8b1d-7168f3187598@canonical.com>
Date:   Wed, 9 Mar 2022 10:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Document RZ/V2L SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08/03/2022 22:15, Lad Prabhakar wrote:
> The Renesas RZ/V2L SoC (a.k.a R9A07G054) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
