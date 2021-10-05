Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D5A423022
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 20:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhJESlk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 14:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJESlk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 14:41:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E548EC06174E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Oct 2021 11:39:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i24so40021063lfj.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Oct 2021 11:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d/tHIHjw7ZnYFq7/UhuxdGYlC4KUDKdDfIjG7IvQMlk=;
        b=iK8nqCo/0QdNtGbc/xsVf32LFNdC2IEup2yBBQmY1Q2MoBtOPJUvFtSl1U5U5rbWO0
         XrAFnEHX1eSjFSplqRA+3HI7RDM2UzuBzD6MUenxZhyubjbmtQn8eVN39hVYdXXb0CrH
         QlUrjLEDjBPqhVvmgIDU+kJWlGCRqlW4TrwrFE1P7ExJkhwuIsD0m488RiHA7oXBvwnI
         cafzHOcMzaBTG84ROzSIivitz/b+cazfJHTI04sVpctK+3vQ/f4oiwZKpxcsq+D3gjRm
         IjqJUiw3/AgLSAcV3GLMEerIvXpaKcofby12oQnYyfXYGU95OWBQJPL6aLRTl3nIKZ8f
         L36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d/tHIHjw7ZnYFq7/UhuxdGYlC4KUDKdDfIjG7IvQMlk=;
        b=zz1euT8QgcLZn/O7DoussP4FqlOR457CVJ2Zwr4UW2rFT97ItYXzNwdCorosUtkkUQ
         yIsHG6Y2PzJN+Wv0kNx77ksv5NhV2btOVQkgvpz3x2K1tSkUqFSdIeGEww4Zy6fBJLvw
         EHpVgmtfPvDqJD3lrQzjRlOIZZDcxNWaMNWvYOysoWTjslrEzTx5Xc05iHo3DQNsLOEH
         ncDT7t1KkHsgEqM66FN71nDAS4+eAEDzB/rEVf6exGYGzAS868+j7LSObw+qCgc78eV1
         AwRmAdxEGHYNqbHmwI4wFIxZta/ANjbmXpPXUbaAFtelIa3vjLyi+b3aG0Zgt368z6uU
         X+ig==
X-Gm-Message-State: AOAM5322Em4QEHbAypSx3Ci8nf17hxSuUCQErYA9knJSH6aUzO/5X5pD
        v8AVEeBY0ZiZklF1TkcHYTgoQQ==
X-Google-Smtp-Source: ABdhPJyLXt9yK+w/X9S/NH15wvXSpp2pBNNGfPWoHOIEsfelxYF6EjS7XGcwoDmQKj7KdlSILL/p6g==
X-Received: by 2002:a2e:bba0:: with SMTP id y32mr23465515lje.135.1633459187300;
        Tue, 05 Oct 2021 11:39:47 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id a9sm2046661ljn.6.2021.10.05.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 11:39:46 -0700 (PDT)
Date:   Tue, 5 Oct 2021 20:39:46 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <YVyb8hha/UXsllr7@oden.dyn.berto.se>
References: <20210914140057.2801405-1-niklas.soderlund+renesas@ragnatech.se>
 <f3f48e76-01c1-92ec-3845-6687d030c4e9@xs4all.nl>
 <YVrXN9H2d1+wGEdM@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVrXN9H2d1+wGEdM@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On 2021-10-04 13:28:07 +0300, Sakari Ailus wrote:
> Hi Hans, Niklas,
> 
> On Mon, Oct 04, 2021 at 11:11:55AM +0200, Hans Verkuil wrote:
> > > +	isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> > 
> > Is this correct? Based on the description it is really more a MEDIA_ENT_F_VID_MUX.
> 
> We also have MEDIA_ENT_F_PROC_VIDEO_ISP nowadays. Just a note. But VID_MUX
> would seem appropriate based on what it appears to be doing.
> 
> Niklas: what does the device do with the data other than redirect it to
> some of its outputs?

It have other ISP capabilities. I would love to extend the driver to 
support it, but the documentation I have only covers whats in this 
driver, muxing. I don't suspect this will change so I agree VID_MUX make 
most sens.

> 
> -- 
> Sakari Ailus

-- 
Regards,
Niklas S�derlund
