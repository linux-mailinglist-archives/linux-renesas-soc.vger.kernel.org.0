Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013DF20816
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 15:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfEPN1E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 09:27:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfEPN1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 09:27:04 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3031C21734;
        Thu, 16 May 2019 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558013223;
        bh=zEFdoInrSu3w4wszosiHwA5hrPeEyDrnKLKZLKu+oow=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FKFchKCzGYAA0qrYlNLrhBBoLziA8Qm8XW1eejQ/Pic/iSQAYvB/TY66dKlaTeEXz
         rDSgI+u5JM5pCPch1jMH59NVvH2xn51LD4UT7xpOWZBwNQJJlXbajjbu0W8WxlxvkL
         yddx0cPeXRg2I1W02zMw9L94lwdQtuMSLLzjqTL0=
Received: by mail-qk1-f177.google.com with SMTP id d10so2231839qko.4;
        Thu, 16 May 2019 06:27:03 -0700 (PDT)
X-Gm-Message-State: APjAAAXyHIJAA20Z1Td0+Ytqi9E+itTtX/CnQQoBQLN7h/8+KslAw79n
        nTI5QAdbMfNh8/Lu9xIKvT+9i/0c8lbfGCVRzA==
X-Google-Smtp-Source: APXvYqz882BYvIjG1PBCKdxbGNuYx/9DtP7e/wTxIKnWhMHtvFhKWfNav3sowYfhMHzDpQ7AFfYuV8thXD8HGlRsEbU=
X-Received: by 2002:a05:620a:16c8:: with SMTP id a8mr25728481qkn.4.1558013222345;
 Thu, 16 May 2019 06:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <1557938083-25423-1-git-send-email-fabrizio.castro@bp.renesas.com> <1557938083-25423-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1557938083-25423-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 16 May 2019 08:26:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKZNPGwTp3OR7E-05cA5Kh5+2TmaP5c3ryOoX_V-FbmLw@mail.gmail.com>
Message-ID: <CAL_JsqKZNPGwTp3OR7E-05cA5Kh5+2TmaP5c3ryOoX_V-FbmLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: renesas: Add HopeRun RZ/G2[M] boards
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

On Wed, May 15, 2019 at 11:35 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> This patch adds board HiHope RZ/G2M (the main board, powered by
> the R8A774A1) and board HiHope RZ/G2 EX (the expansion board
> that sits on top of the HiHope RZ/G2M). Both boards are made
> by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).
>
> Useful links:
> http://hihope.org/product/detail/rzg2
> https://item.taobao.com/item.htm?spm=a2oq0.12575281.0.0.6bcf1debQpzkRS&ft=t&id=592177498472
> http://www.hoperun.com/Cn/news/id/379
>
> We already know that the HiHope RZ/G2 EX will also sit on the
> HiHope RZ/G2N, even though the HiHope RZ/G2N doesn't exist just
> yet.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> ---
> v1->v2:
> * Fixed according to Rob's comments
>
>  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
