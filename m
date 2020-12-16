Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BBD2DBD38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 10:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgLPJB3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 04:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgLPJB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 04:01:29 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4F1C061793
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 01:00:49 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id y17so22356467wrr.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 01:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WLnMTl1G6UwEqHqPjfyqMKiBfvdc90ZzGoJC/xgl6I0=;
        b=Y3o8yyHxKNnQruLSD0iOGnwzUKH1Xan//YDBmDEqTy8bIHhqvPhBbbGRQi/otav6lv
         l1+xAgdlvxpIuJDn3ZxrxmeKpiCy69VHQDttA3ADb3kK/U7Rj8wcwywb04CVzdzT6apH
         8S8F36/LZxmDlcm8cr39DPhxidmTBKm2ppJV23mMGoeLg4Xh/4C8NgNjaeD2T3YS+0lr
         5KgTHrjgttcFC7dwS0POXXrP4ieh1hd8g6f1Y5y0mUdHOEvtA6Lw3qK+HInIYQ22PzZF
         oyNivuYTN+Ocl499/Xu46X4kSKQoou6uJXNt23eWj9s81ITwdJgefmMG2Yue916jBRro
         GPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WLnMTl1G6UwEqHqPjfyqMKiBfvdc90ZzGoJC/xgl6I0=;
        b=TVdUBfPd5f/VpJeeqjbS1rDxBO6/w5mP/5eZGT8SnWSW8SMp5ZWhHKYaFdo4877xzO
         Sbgrx+IVjGvsN6O7rTh+SHnY/pe4wmJyj22T/43ryRZMu6uEZE0CUGJPAS2gw0Fzcd34
         SEbNnNbzsP6tHU0heMD20zXlsxjp4tGWuNyy6ascSHvQxNoOHXbXwjDTtAtlYMIAts75
         y78dUbzIoE1KuOErYSD+/1OCs+x7DgQOGSlSqLVlzXdlEKzzZ9zPUynbu1uYMRoied27
         YBG/b/djTb5EvezfAuWAdm4sOT1KS4CgMw/8EU7oFqthMOMAJ9yqN1GFsIPdOWKkI0lH
         3jFA==
X-Gm-Message-State: AOAM533kB0tzYn1ZZEEDYhVwDl+efLGjlXT14saySm2v7jTFboGmkiI4
        PdI7A17KI4+4Nx53IyHvF4E8oHOBNY7iGyu9
X-Google-Smtp-Source: ABdhPJz+r6Xme90cLiDirEBfpRG5183hD9lrcdfx1lAqVbFG32jIzRm6jwG8cTWkOv8NKONNT3pAqA==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr38005448wru.118.1608109247855;
        Wed, 16 Dec 2020 01:00:47 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id v125sm1804504wme.42.2020.12.16.01.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 01:00:47 -0800 (PST)
Date:   Wed, 16 Dec 2020 09:00:45 +0000
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
Subject: Re: [PATCH v3 11/12] mfd: bd9571mwv: Make the driver more generic
Message-ID: <20201216090045.GA207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <4021c3f04bf8c4dcbcb015056455c4acf9e71b6b.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4021c3f04bf8c4dcbcb015056455c4acf9e71b6b.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Dec 2020, Vaittinen, Matti wrote:

> 
> On Wed, 2020-12-16 at 16:37 +0900, Yoshihiro Shimoda wrote:
> > From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> > 
> > Since the driver supports BD9571MWV PMIC only,
> > this patch makes the functions and data structure become more generic
> > so that it can support other PMIC variants as well.
> > 
> > Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> > [shimoda: rebase and refactor]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Please place any *-by tags *after* the other comments.

Fortunately, the first one below was still on my screen, else I would
have stopped reading here.

> > ---
> >  drivers/mfd/bd9571mwv.c       | 95 +++++++++++++++++++++++++++----
> > ------------
> >  include/linux/mfd/bd9571mwv.h | 18 ++------
> >  2 files changed, 63 insertions(+), 50 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
