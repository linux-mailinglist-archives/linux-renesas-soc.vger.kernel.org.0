Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB8C44D47B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 14:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbiCJNGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 08:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242284AbiCJNGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 08:06:54 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C4D14CCA3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 05:05:53 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8D5BA3F329
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646917551;
        bh=FKB4VlQOufpKotMV20xHpYkdGltyIjnCzZMMtH1boRQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=a0pk3jR9hLq6KRt29/yCUKm0vGEJB+dBrzngQpQUEMi4DRb2rg8Jg+LtV7Kg3Q2tE
         4fA4gr9WqCMVEajtw7KOYlwvjKUt11NL2k8ge5NH0rERWfLTHbOGqdJ55Mnv3uvHau
         eJf0qH+GvjODMMVrq0z2GKB20kDe7zdaydDMPP0l7eQPLBdPTsiIf1psjCZf4DcJ3y
         OdngFWkgmtCVTucppiCAk365Do1Eym9C/kIxUg0EfGwfx7bOhdcuzijulBq4GnlkYr
         5yG6VqLZV0JK61G4DXBa/h2X5rbrICxB2w8cfNLGi+nI/RvvE2GBxC0gHF2RtlJA0h
         g2orhncxyzteA==
Received: by mail-ej1-f71.google.com with SMTP id hr26-20020a1709073f9a00b006d6d1ee8cf8so3029574ejc.19
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 05:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FKB4VlQOufpKotMV20xHpYkdGltyIjnCzZMMtH1boRQ=;
        b=vR1yS5iiMm3Uny0G0G8JwdFur8Zd3IiewrOXzI6xjG7bUzqABmmfoxcMXk6drAw9H3
         /AZq6qZWwF1S/3DAFYORfe20NsyX9aqYR3l3q8C6hlr59WwCsjaTFJ29Kf/5XowFGcQ9
         LhjgRAZb+JbnB756NZtIYKKteXhmZ8Sl6g+9zuWeEo4L6GziapyQmTrNYVMYkmD5jx14
         xsU9coyYsRhrOuKrpRPPsDbfXsi6xT+6RIsdHNgoQtczLxZ2cFXrVu47FF7Pk4ft1Ti+
         6DDOIdT2TAhjAaavj0eUkMeb2wMttJErr1A2m5dqR8tfZuVEbMgUgK5MDDWhBXT5tSxJ
         eO/g==
X-Gm-Message-State: AOAM5310cJz/Gt5bNakP9mwEV3A+BvcANVaGQU8W64EwTZ9P3+oo73R4
        Xg/kbZ06OAub1RbqcmYVJWQfqqy6EcONQXuMblgpXpRbiDmW33qoJ0cJXWU30gONJ4IUs9ZGqhV
        T/ypOhZr5+K8NZ1kZQkAS/mbe/bMGZ82Lor42CKE1FaDIGmiX
X-Received: by 2002:a17:906:6144:b0:6cf:bb2e:a2e1 with SMTP id p4-20020a170906614400b006cfbb2ea2e1mr4221130ejl.299.1646917551078;
        Thu, 10 Mar 2022 05:05:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiRc5O0Gtppn95CAjgppoU5NcKydy5dEEbUl0JLUUdM1jWq9BY0CaVuFjFQ/Gd7ZN8/q87Xg==
X-Received: by 2002:a17:906:6144:b0:6cf:bb2e:a2e1 with SMTP id p4-20020a170906614400b006cfbb2ea2e1mr4221113ejl.299.1646917550899;
        Thu, 10 Mar 2022 05:05:50 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id g9-20020aa7c849000000b00412fc6bf26dsm2032975edt.80.2022.03.10.05.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 05:05:50 -0800 (PST)
Message-ID: <e1d09845-d543-b826-b833-4fabe2967f59@canonical.com>
Date:   Thu, 10 Mar 2022 14:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
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

On 09/03/2022 16:11, Biju Das wrote:
> On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
> lower frequencies causes display instability. On such platforms, it
> is better to avoid switching lanes from 4 to 3 as it needs different
> set of PLL parameter constraints to make the display stable with 3
> lanes.
> 
> This patch introduces 'adi,disable-lanes-override' property to disable
> lane switching at lower frequencies.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index f36209137c8a..2dc378039d21 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -84,6 +84,11 @@ properties:
>        timings for HDMI output.
>      type: boolean
>  
> +  adi,disable-lanes-override:
> +    description:
> +      Disables the overriding lanes at lower frequencies.
> +    type: boolean

The bindings should not focus on desired feature/functionality of
driver, but hardware. You are now encoding the driver behavior in the
bindings.

Best regards,
Krzysztof
