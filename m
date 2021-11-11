Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589B344D452
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 10:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbhKKJvw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 04:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKJvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:51:52 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D946CC061766
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:49:02 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id br15so9076173lfb.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+qxxRiUlYzV6NJy/w1aZA2zpC3Ejr9rcijb9xcejxtU=;
        b=fwabXdPxk33LTkpstTyhO/jeEyZ5v6A0mqZq1+yy8KikYSiyjm/0DHwedOLmaAHjv1
         5XnLqQ9QuTFJhBK6VRgdEQWnizoBvM28QQx0nzfsqZ0ZbSEzTtkO3mm1Rlv2fZWH6bk8
         ySNCyF26/3vbRMfvtienYmjhtKkPzuWCzJLrqpaHJH1jb8AtAY8ahGxYzzvKdT1dvspM
         5qxHHDpRVfVRBwEY2WoIFZ2ZFZHLTWDvVUFKuTa330N/i3ea4AmSPa5kn/1a08fq24r8
         6sEnq+4mcqXF8g4Ivw0giJXLpsIuTbFp+/85cy+lb+TOO+YZyjg4b+UaZ7WL98sk6qvV
         SZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+qxxRiUlYzV6NJy/w1aZA2zpC3Ejr9rcijb9xcejxtU=;
        b=iscyULWVOBpEq45h3wxkqUJdxykMlbpEMHvBr8oLyDXgpLizz2vDitT6uqrD/KHUjb
         5zDM/kB76e5N+SQGZuXVT90CGz+Oxp73iBlec+JkSSRtlWV79jYcrTVkT16ggERW1ZW8
         91YUMtztHJew+cv3hLVM6XPRFPXb+njd85SL6DVw5igmg+mi1qPedNkvJ7ImB9M42TVq
         Ds69n9VPV3mpV+k5I8YuOSsaZQAE7ThEIpJUsP8XAsl9M+uJwpo92vqMMcxIiPuehvQT
         rpgKJx5ua3R71D575nyaDmEl4F7/9iYYIkrBW705r4gMs7jw64m8xqHbOczaLyPxecgI
         djDA==
X-Gm-Message-State: AOAM531JpUnWajxxPAqrOiFASA1tRe7SqbMeGokQ6DsvgRmlImQ47Aid
        sqEj/A9yUiO8+2kAB9qn7WHo4ISsClUrx/3ju4JX9A==
X-Google-Smtp-Source: ABdhPJxlRFNKTi8iBaQmWxFjFmrG8Zxa9Hr3CI86dasWfmOW1cNhzLyoiKvcw5egKVy9Q/996Czu9iuLL3HWjhZTwN0=
X-Received: by 2002:a19:ad4d:: with SMTP id s13mr5456304lfd.373.1636624141233;
 Thu, 11 Nov 2021 01:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-8-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 10:48:25 +0100
Message-ID: <CAPDyKFpwYK9kyF0Q_TP0zpgNRPgcsYTXB9CDFyO+F4shO_qBOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/21] dt-bindings: mmc: renesas,sdhi: add optional
 SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 10 Nov 2021 at 20:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe



> ---
> Changes since RFC v1:
> * use 'oneOf' for the clock-names
>
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml    | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 9f1e7092cf44..190a58ae77b5 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -132,12 +132,20 @@ allOf:
>        properties:
>          clocks:
>            minItems: 1
> -          maxItems: 2
> +          maxItems: 3
>          clock-names:
> -          minItems: 1
> -          items:
> +          oneOf:
>              - const: core
> -            - const: cd
> +            - items:
> +                - const: core
> +                - const: cd
> +            - items:
> +                - const: core
> +                - const: clkh
> +            - items:
> +                - const: core
> +                - const: clkh
> +                - const: cd
>
>    - if:
>        properties:
> --
> 2.30.2
>
