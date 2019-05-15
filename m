Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3611F5BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 15:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfEONmc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 09:42:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbfEONmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 09:42:32 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1161E216F4;
        Wed, 15 May 2019 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557927751;
        bh=mGL7pSrkoCJmzdWs6i7j7x/RyyRCZ67RWw19hDFTOmA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JjVTnJwhojXXAsW1E2VHSM2th7QJlyDy5lpVYWuggGW30PBI4zR7KVXib1bf08ojF
         KOXhxVX1aRTDaAJF4HNxjoScNiPIJUvo3rcQbGA3dRlRtQseErq13vOdADgEk+QjrZ
         8c+8BkItn+0n6C2W3AWjU72zBBBnSBhGQmtb+tlI=
Received: by mail-qt1-f181.google.com with SMTP id y42so3282064qtk.6;
        Wed, 15 May 2019 06:42:31 -0700 (PDT)
X-Gm-Message-State: APjAAAXoQOPQYysnIQEQ6X1QtuWbA4pxSaK6QfvaZRVClC2g37NsaE7/
        budnabdIPfPIcYP+I2EH50H9ijcaT9gaNUA65Q==
X-Google-Smtp-Source: APXvYqyI5lmy/u1UJbNqXT0pIfVO9mBMFi6VKsxUpqe+pBZ46+G1RxOu4kFodMRN5v0x+kUWd1YWUn5fdpuxbJDuUd0=
X-Received: by 2002:ac8:610f:: with SMTP id a15mr34494730qtm.257.1557927750210;
 Wed, 15 May 2019 06:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <1557920697-18057-1-git-send-email-fabrizio.castro@bp.renesas.com> <1557920697-18057-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1557920697-18057-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 15 May 2019 08:42:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLB+7-x8i=MDpZuW0ebg5BBLJ+Y3gruf40zFSNv8_42Xg@mail.gmail.com>
Message-ID: <CAL_JsqLB+7-x8i=MDpZuW0ebg5BBLJ+Y3gruf40zFSNv8_42Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: renesas: Add HopeRun RZ/G2[M] boards
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 6:45 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> This patch adds board HiHope RZ/G2M (the main board, powered by
> the R8A774A1) and board HiHope RZ/G2 EX (the expansion board
> that sits on top of the HiHope RZ/G2M). Both boards are made
> by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> ---
> Useful links:
> http://hihope.org/product/detail/rzg2
> https://item.taobao.com/item.htm?spm=a2oq0.12575281.0.0.6bcf1debQpzkRS&ft=t&id=592177498472
> http://www.hoperun.com/Cn/news/id/379
>
> We already know that the HiHope RZ/G2 EX will also sit on the
> HiHope RZ/G2N, even though the HiHope RZ/G2N doesn't exist just
> yet.

Seems like useful into to put in the commit msg.

> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 19f3798..95302b9 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -106,6 +106,14 @@ properties:
>
>        - description: RZ/G2M (R8A774A1)
>          items:
> +          - enum:
> +              - hoperun,hihope-rzg2m # HopeRun HiHope RZ/G2M platform
> +          - const: renesas,r8a774a1
> +
> +        items:

Did you run this thru the checks because this isn't valid json-schema.
You can't have same keyword twice. This 'items' needs to be another
list entry (i.e. add a '-').

> +          - enum:
> +              - hoperun,hihope-rzg2-ex # HopeRun expansion board for HiHope RZ/G2 platforms
> +          - const: hoperun,hihope-rzg2m
>            - const: renesas,r8a774a1
>
>        - description: RZ/G2E (R8A774C0)
> --
> 2.7.4
>
