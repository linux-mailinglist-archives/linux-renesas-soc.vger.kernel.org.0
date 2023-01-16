Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6283066BD9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 13:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjAPMRw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 07:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjAPMRa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 07:17:30 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2601E2AD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 04:17:19 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 78so19531293pgb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 04:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niLw8CrFfbtqWSwYWAs/NSWK6EA7i4usYpPbKEoqMyA=;
        b=q6uTMPVzD/khb/6i8b46Suojs9oTXx6lzQhLZngzPhAi9JP06r0emP+CCfZSsJPd+F
         9wce9fEgGtZgafYsFKXVayUYG6vEIrMLvIszh38bTYKLZY44FM3OGptNIhW3735z3j9j
         tIj16RXbMEuPyLh9455tmWQ2iTtIehhf8LIe/o2iaYIHYwbHpm5aWeIZRK2Shrl5+2Y9
         2UQAjd6qtAz0UEHPi3EXsNKKl8idON8t48sCHrP5+6gR474dVEenUzQn8Ef/s7BjNX1g
         LskSdkmuKcZGXvz5JrNmjPbb59amnAQzz0UqLilKPDtn0sNacqXKSLmz5OzW4XW5picB
         M0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niLw8CrFfbtqWSwYWAs/NSWK6EA7i4usYpPbKEoqMyA=;
        b=Mc5p4ydYK//MBoIbQSWhL5v4Ev6YeWRyfGXTCAHD4iCueZWTW7ZilPtJ08ruo2f1AP
         sCQtPhKXpaVi53u/F9QDqJ8vy1BuJM819cJmSei9oa2QW9pd7mC8fejOW1k7SDc37YVF
         bUc5gXCJn6EqslWMxO3VzLZ+/fmzGfhmC0ppDZyYTYPqWLESGY1wdfYCBSZn5hKs6X4D
         GGBGMhISQRlWFDP/aAZZ1z2m7wHoJr7fwzPjR8X3E4y+9tcRNjlepJY9eRbQzlTQsRrz
         cKXvAwQ/Dmwr2z5opvgmlViEMZrn6m+WJB0XZM7ZF21gbuPbw5Z1Ovm1aWTU7ZQJdhRV
         UDvQ==
X-Gm-Message-State: AFqh2kop5sdEU9UEzDawbA4e9NWBhyG7QNixklrKK8cHQq1tEdBFuiix
        2bzRVS+Ut0iHHJcBxa+zsB7xoAPOv6aIqK5Uw4W0ww==
X-Google-Smtp-Source: AMrXdXulMG3/bVkeZEmcmYD/O8CnTyqzGEwQOU+28y4QK3hbV9OyLKDL2DAGiE9JNvgSHQLwfbpFDSlDnpYmJ/yceUU=
X-Received: by 2002:a63:454a:0:b0:4ac:d8f8:91e6 with SMTP id
 u10-20020a63454a000000b004acd8f891e6mr2233211pgk.541.1673871438709; Mon, 16
 Jan 2023 04:17:18 -0800 (PST)
MIME-Version: 1.0
References: <054c9f4dbb0bb1525f780d1e85c724436465c20c.1673270716.git.geert+renesas@glider.be>
In-Reply-To: <054c9f4dbb0bb1525f780d1e85c724436465c20c.1673270716.git.geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 16 Jan 2023 13:16:42 +0100
Message-ID: <CAPDyKFqVi=h8aBTp4KjNLS7PAbRSLfHpnyf9_=a6Szd1PfEtdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Fix RZ/V2M clock description
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 9 Jan 2023 at 14:26, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> The SD Card/MMC interface on the Renesas RZ/V2M SoC uses 4 clocks, like
> on RZ/G2L SoCs.
>
> The current description specifies 3 clocks, like on R-Car Gen3, which
> will lead to "make dtbs_check" failures:
>
>     arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: mmc@85000000: clocks: [[3, 1, 18], [3, 1, 20], [3, 1, 19], [3, 1, 17]] is too long
>             From schema: Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
>
> Fixes: c8dbdf2a1044951b ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2M support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 4357736074898ff3..fa089cbb155bd0fb 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -122,6 +122,7 @@ allOf:
>                - renesas,sdhi-r9a07g043
>                - renesas,sdhi-r9a07g044
>                - renesas,sdhi-r9a07g054
> +              - renesas,sdhi-r9a09g011
>      then:
>        properties:
>          clocks:
> --
> 2.34.1
>
