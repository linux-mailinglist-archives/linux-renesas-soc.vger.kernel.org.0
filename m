Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4094C660B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 10:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbiB1Jtk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 04:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbiB1Jtj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 04:49:39 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5494B20F7A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 01:49:01 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A2E83F1B7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646041740;
        bh=ceaDhD4niQs2iNKx2wLX9waAEq52WgFLz5UEyDxG6ig=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UQtUqD2++XMBXn2vcC+ZZCvw26mCiDQs0dOjmvQGucNJZ5YtBy3mPCl/0RGJmDxjq
         3gj1ghzc0aRdcl3TjhsCxo8wUJrMlulHpd3XuK4MR/BIDcHo1gisEw80lxceCQ/RdI
         tIt96CmDr8IyBWlUMtmtJEBESyiCO0/LE2C3h7FS3pMa/uNdVBTg+nHbOuFPz9p4l9
         k06/q3WIH4CK677jrdtHCB9uKibuw5xyWUHpi/TLd6STig3D+awZ4ysoog1f+LLFRS
         yTqyJpfcHLw0KBxSRhtp9Og6iBnqCKJ+8FXYPMuz1DM1uP740fsMipnQYM4joSTl/D
         zwFm/vvIEkVig==
Received: by mail-wm1-f69.google.com with SMTP id p35-20020a05600c1da300b0038151176781so2665555wms.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 01:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ceaDhD4niQs2iNKx2wLX9waAEq52WgFLz5UEyDxG6ig=;
        b=BrYCTklpXg4Pe/e25RXktE1fRFJ/QRiUpTFol/9CAtliPHKKOmMf9561UqwSNx4EDg
         GTg6+lEcDfTpLHyBEH9hVA+8jrW7Iwy+VyW3I721vQQW/3WtKIiK/d0FNDL56TMeJkIh
         nHqzlAph+oCyV9zZO1qEI78KalNiEBrVF2sMWgNOlBBmXQ/6jXzWrYAGL7GZzJhCJ6dm
         kf6P7frB9XILNSF/Jtyp4KcZASFoA5TJ+jJzae7NVoJFLM1Rh+D26aweOj9eE8xVNDkX
         McgaHBTK1+T4F89MLnxBOPyR7poBZa1R6sdaiNEblrh2hobe/GaMTQKRhodwjaAQsLal
         Pm1w==
X-Gm-Message-State: AOAM533WgQoRNu7yxWI8nz2IO5PK08xo2ht3pusoA2jC7NiphY3z7fOj
        rQ/EXBdUFCEWR3gjNHbpG3w1Zu9QRQLNNwBH8OafXdvn8X/BvCOvIAIrBWZCo2/OzzMEQpQSTzA
        jQFl08s3pk/PObK0laZUmqOK1wTmsY9n/+7dNxnv5XkC1wNqy
X-Received: by 2002:a1c:a7ca:0:b0:380:e40f:c31a with SMTP id q193-20020a1ca7ca000000b00380e40fc31amr12472118wme.85.1646041739972;
        Mon, 28 Feb 2022 01:48:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2n0kQPswmAuAtnItiSKjHIDRHm4LVws01/9syDUytk7bdt9FaqAZVczUIGyFUWCp9P65UVw==
X-Received: by 2002:a1c:a7ca:0:b0:380:e40f:c31a with SMTP id q193-20020a1ca7ca000000b00380e40fc31amr12472100wme.85.1646041739729;
        Mon, 28 Feb 2022 01:48:59 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d69cb000000b001ef5b49d68esm10206096wrw.37.2022.02.28.01.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:48:58 -0800 (PST)
Message-ID: <dc043205-3f53-470f-5248-c571303f966f@canonical.com>
Date:   Mon, 28 Feb 2022 10:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] spi: dt-bindings: renesas,rspi: Document RZ/V2L SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-spi@vger.kernel.org
References: <20220227225956.29570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220227225956.29570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/02/2022 23:59, Lad Prabhakar wrote:
> Add RSPI binding documentation for Renesas RZ/V2L SoC.
> 
> RSPI block is identical to one found on RZ/A, so no driver changes are
> required. The fallback compatible string "renesas,rspi-rz" will be used
> on RZ/V2L.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> DTSI changes have been posted as part of series [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20220227203744.18355-13-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/spi/renesas,rspi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
