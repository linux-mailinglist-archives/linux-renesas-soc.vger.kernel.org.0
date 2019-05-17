Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D1E2120A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 04:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfEQCbc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 22:31:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfEQCbc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 22:31:32 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 115362089E;
        Fri, 17 May 2019 02:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558060291;
        bh=eIzPxBlgFMmSIhsB2Wn8TZeUlrgKMyDclxyL0h3ETug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zKa99yiDbGSmWyN9wunQGvl8eaZbg1spNOEgfHMhSBcbKvvqkkAm+Kh3Y2S2cXGrV
         KKDEGEj4ZAciVccrSpYfNyZi2b06eDftsgEGXkwIXydIgBOBz8RmJ3kPBabZzyE7BF
         3F/CGBh232kpGzV8xp0crIIj7O4vRF2RNuYAve3Q=
Received: by mail-qt1-f172.google.com with SMTP id f24so6346921qtk.11;
        Thu, 16 May 2019 19:31:31 -0700 (PDT)
X-Gm-Message-State: APjAAAX4+Z2gZkPeYHoPZRYE1ABbepUtW4fGkCJuVoVo9Cgw+b4xpqsR
        suPkVNuFrtVDJJtzRzDLtvcQXj5GeRqLw8Hnaw==
X-Google-Smtp-Source: APXvYqz4rYsBAzsMn0v7/9foVYSGIQIsDDEyi5I24pFx4f3t/nAkPJ+axUljXEmVymY/rRL9t5aOhUD6zJyG89AhPog=
X-Received: by 2002:a0c:8aad:: with SMTP id 42mr43534910qvv.200.1558060290364;
 Thu, 16 May 2019 19:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <1557938083-25423-1-git-send-email-fabrizio.castro@bp.renesas.com> <1557938083-25423-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1557938083-25423-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 16 May 2019 21:31:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJtS4R57t+-CQZaDNYQ7HsW+TORUhXLxWLGkf+mkg94HA@mail.gmail.com>
Message-ID: <CAL_JsqJtS4R57t+-CQZaDNYQ7HsW+TORUhXLxWLGkf+mkg94HA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add vendor prefix for HopeRun
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
> Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
> vendor prefixes as "hoperun".
>
> Website: http://www.hoperun.com/en
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> ---
> v1->v2:
> * No change
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

I've converted this file to json-schema as of v5.2-rc1. See commit
8122de54602e. Sorry, but you will have to rework this patch.


Rob
