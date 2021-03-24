Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E78B347BC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 16:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbhCXPJ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 11:09:27 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:34476 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236440AbhCXPI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 11:08:56 -0400
Received: by mail-il1-f173.google.com with SMTP id u2so1467766ilk.1;
        Wed, 24 Mar 2021 08:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jt57g3Q1bvcHWvSSFnpo32F/tY2xxwnncryY+iv03rg=;
        b=uYd3YhImAztqDWlTtdLNFbA23gPqAl/a1L77InC/YAks8Z3wyFOUFv1yXduZHWhmbt
         i1erfvXjKSZ7LohPfuV5ybKEsmi96emq+nyRN/8ZBExUi6bCkVanAGSMg3X/W+mDGxT9
         yo5akPSQvf6fTgfSywwnVlYEGDqBJ9n++WXFTGoED/YPTvezTJ7ZAzQZWu8ZooEvItUO
         TBAm+9ybBoIEpZ6LFIfos6JpyupAlmL5lHT7Aar4zDyXF1Mbqi9f4Tq/j06ETV7WuEp2
         fKc8rmHgMwRRlhheSCtnN3XkdsiVqQk6jijXpj6/boI80vEh5Dt+q/tDh4PqJ4PVOxRy
         vkqQ==
X-Gm-Message-State: AOAM5321i1LSCb0lV5gCYdaQKbAaYS6yHdNrjbXXknK8Yf2yphZm+11Y
        HXYGNHZVgtwY+zsGnzgeUA==
X-Google-Smtp-Source: ABdhPJzQMcSRimLW9Mb9xjoKpW5El8K0RuXwGH0EDYrKdjsAEuEBOT0TK9G1THW/6uNZa1OGFUx0gw==
X-Received: by 2002:a92:ddd0:: with SMTP id d16mr3081577ilr.52.1616598535326;
        Wed, 24 Mar 2021 08:08:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c19sm1266794ile.17.2021.03.24.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:08:54 -0700 (PDT)
Received: (nullmailer pid 3069444 invoked by uid 1000);
        Wed, 24 Mar 2021 15:08:52 -0000
Date:   Wed, 24 Mar 2021 09:08:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     linux-power@fi.rohmeurope.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mazziesaccount@gmail.com, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [RFC PATCH v3 1/7] dt_bindings: Add protection limit properties
Message-ID: <20210324150852.GA3069304@robh.at.kernel.org>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
 <4a12be22a3ea1cf9114dd67f017f3adea431c5c4.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a12be22a3ea1cf9114dd67f017f3adea431c5c4.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Mar 2021 12:21:41 +0200, Matti Vaittinen wrote:
> Support specifying protection/error/warning limits for regulator
> over current, over temperature and over/under voltage.
> 
> Most of the PMICs support only "protection" feature but few
> setups do also support error/warning level indications.
> 
> On many ICs most of the protection limits can't actually be set.
> But for example the ampere limit for over-current protection on ROHM
> BD9576 can be configured - or feature can be completely disabled.
> 
> Provide limit setting for all protections/errors for the sake of
> the completeness and do that using own properties for all so that
> not all users would need to set all levels when only one or few are
> supported.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> v3:
>  No changes.
> v2:
>  Shortended property names as suggested by Rob.
> 
>  .../bindings/regulator/regulator.yaml         | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
