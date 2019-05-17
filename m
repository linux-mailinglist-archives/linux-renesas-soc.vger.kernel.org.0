Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBAD221945
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 15:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbfEQNi1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 09:38:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbfEQNi1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 09:38:27 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 468BF217D8;
        Fri, 17 May 2019 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558100306;
        bh=pbTJr359FJMy2WUUMG/Lf2r9Lyuh9YLPUqwHd+Wo8VM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vctqqeOF41AfIjkmUkCBWXAfSnm+p9DUxehsXrNwgZAO+bPS1LO55NQyEIHxaHsZ3
         q0XwJDhm1LJR1gHfXandcOp+J48YmQ1h8XDDzfB9Bdz0s6z+dtY+vRQWe+IMTcLE3+
         gOV+gjRdPhi5Mt9rQmcaiKsQ4Wkqht4HyISHWfCs=
Received: by mail-qk1-f174.google.com with SMTP id j20so4462731qke.1;
        Fri, 17 May 2019 06:38:26 -0700 (PDT)
X-Gm-Message-State: APjAAAX6gQ9xJI3N8LfZ34dD2sVtHWf5Wm/7pveoZ2C81XyBQ8S5GhKJ
        ePazCP5gVnp02sJoDSnWX6PtdP+S/vmPIVnREQ==
X-Google-Smtp-Source: APXvYqw49ctY7vjhM+4Z3JnlL9CMKiUL4zKvRdQ04InbXYUNxCMkL8zusPDA6stSF8Q6Xj2NjoygEZEuDR3YGpWMxGY=
X-Received: by 2002:a05:620a:1107:: with SMTP id o7mr36956035qkk.184.1558100305381;
 Fri, 17 May 2019 06:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com> <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 17 May 2019 08:38:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCJyRBX+08UriNeYZ01ow0yLv=VjK3sNbjVi1GB5=MQA@mail.gmail.com>
Message-ID: <CAL_JsqJCJyRBX+08UriNeYZ01ow0yLv=VjK3sNbjVi1GB5=MQA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for HopeRun
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

On Fri, May 17, 2019 at 4:27 AM Fabrizio Castro
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
> v2->v3:
> * Moved to vendor-prefixes.yaml
> * Dropped Reviewed-by Simon as this is a completely new patch and as
>   such it needs a brand new review
> v1->v2:
> * No change
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
