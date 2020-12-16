Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B352DBD3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 10:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgLPJDC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 04:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgLPJDB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 04:03:01 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6A1C061793
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 01:02:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id g185so1636300wmf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 01:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FWvCYlZeHvTxLAz8vqKtVr/s/CrDMueKsSBlUuHF038=;
        b=ZVg/fQwwPlgfRWzWYIdZRkw7KTosGTnGGAagJAXpartiAIQ+TKyw2RabIOsuagIxrf
         WM7wAkSDezZKZOCZKPLg7zjD+Mk2KoRM1WJQVLjQrspL0oyT5u7UmbeIn+8jiYhmMgGn
         fv2ISwDLHCNykWFAFB4wat3WGNVoDX+ao4lQM0vvk1iweizruS40HywStuduF3hBPCtu
         kKLelaSPkE30iyOka10aUw7KWLWP8e9LIrah1oD6lAEk3zjZ2KZrmzO7NDe4K2iimNfI
         cPYixcji+RmRNrg4g7bH50zNajE5LyyXayyDF6oU6I0+4+GMaGD9Gt9NdkA6vQtCe3n/
         cCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FWvCYlZeHvTxLAz8vqKtVr/s/CrDMueKsSBlUuHF038=;
        b=OWoi2ndKzdybf/wXJU1q3E2TrxTS7+2TOQHNOsuCqoidm+fECX9xxsXUBQJSIMjk33
         v71dyX0nm4cSRyZaHv9Mp34+a+iyusNoeJW2WNm0OGpKXXE+0lJjGIQ2lviPFfKXNkoE
         cgc4fnrLH8Fq/zVDdGqGp3P3zPh4JNAyUbK883RUzH5gr7BZo704nUqChmCcksBwbfck
         DZBPr/knfj8OugpG403YaLSE7EHqtieGhhrZ0naHjcu5bnQN3LnGDYo33t8YlbL1eUif
         4HYrFM46wMurE0J1Uq0Aw7l64sba4zaPjB7m2nL1TKqPqBdgBKyY+ggv87L7Ai7gqHhh
         QGGg==
X-Gm-Message-State: AOAM530hD4qDAOyq1KivjmmGh8SopXeeB2nGX2Ifvzl6NwVIpt/YrLYp
        Sq9kRZbEp4OjRKFdNLW59V02Yw==
X-Google-Smtp-Source: ABdhPJw6R7Z4nW7a8kYNXv2QcariaxDSBMTL4lMnIGxjItNgV3+WYaUuN2zmT6kT6ySCF1fc39Lp6w==
X-Received: by 2002:a1c:43c5:: with SMTP id q188mr2225355wma.163.1608109340195;
        Wed, 16 Dec 2020 01:02:20 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id c1sm1741920wml.8.2020.12.16.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 01:02:19 -0800 (PST)
Date:   Wed, 16 Dec 2020 09:02:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Message-ID: <20201216090217.GB207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <6937e03fd87f12925d904c2cad0cf665efdc895f.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6937e03fd87f12925d904c2cad0cf665efdc895f.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Dec 2020, Vaittinen, Matti wrote:

> 
> On Wed, 2020-12-16 at 16:37 +0900, Yoshihiro Shimoda wrote:
> > From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> > 
> > The new PMIC BD9574MWF inherits features from BD9571MWV.
> > Add the support of new PMIC to existing bd9571mwv driver.
> > 
> > Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> > [shimoda: rebase and refactor]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> 
> > ---
> >  drivers/mfd/bd9571mwv.c       | 86
> > ++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/mfd/bd9571mwv.h | 18 +++++++--
> >  2 files changed, 99 insertions(+), 5 deletions(-)

... and please snip long replies.

Scrolling down past lots of un-reviewed code and/or past the end of
the last review comment is a waste of people's time.  Thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
