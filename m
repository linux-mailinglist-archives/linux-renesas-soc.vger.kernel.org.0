Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EF43C14DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 16:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbhGHOIb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 10:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhGHOIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 10:08:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBF4C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 07:05:48 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f13so15832958lfh.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+ufeDaT21nhfjyw9cGKcTF4DhPlIZOpHjYFDyar4c80=;
        b=yd+yEGhyMUFdP96YEq6tUr2UKmT88Fqpc8AabAPB3Tm+U4NkT4AdV4KkYJAP0M692e
         p9ESEGnndHj3aSYYH8dxioBLRrEm2E0FmKk/coZeHJmJDCi5rThZHOzOl9EJFfwwjjL5
         fqp5hkacWXxdFTvTnCr2oU92Q/H2OZE6TWnmG26fB+u/89tRkeYyF4mr/S8B+B2p6fkT
         pcfHAN5XiIJwKG55Mc1q0lG8n6hQtP4h2Or2WY0tTxgz0rKNUSJ3p8Tz1uFPNBEQIi5s
         fxAKNuykLj8dPVrzU6C6Z2a2EG/CEVCg8ASY0IaZjK92jYfzyW/6YGECNM9S7nKi84xo
         bpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+ufeDaT21nhfjyw9cGKcTF4DhPlIZOpHjYFDyar4c80=;
        b=mMpU7KGK/0zZwKpj4w53uRnYjKk2BdAOokIm5sKsB0GxersPbrXhUHY48bYMVm6goK
         Ht334JBN0Sh2nIB48JznSKVWKmtnQ2woRdmh99/1TSBB/EV4ipgZFHbFVTjWriJf3L2r
         wAqi/G7uWvqPMiXKOJPQRoD2e6GcyVjNhtWAXxTRE9XhT4lc9TEF6nvosTPN5DPJQhf+
         JDFHrxqRuJOZ8xWE4K9EcAwblDsYfqtakTmd8bJ8pioE4oHayew3dcoAGqmp16xQmgUW
         9YDzw8EBHd+sGIXDd10t7t35sE+JjGbTEYcLQyaOTDj9hZ9PX/7k3kq3mNGIhL1Km6QO
         kQ6w==
X-Gm-Message-State: AOAM533bfuuarsxrHB+ZDvOB69JxXtpV4VSXDfUcRv/WsAYzudxrISY6
        UnliN5yMm4lTUJ8jJZuczwL8Tw==
X-Google-Smtp-Source: ABdhPJwbyic1KcHLfh4DDFokLyxNZWUWvGjQK5G7cLvltJuoB9pGf8NFVC/BUbICWI3eMgLak1Z3Ug==
X-Received: by 2002:ac2:532e:: with SMTP id f14mr23553093lfh.103.1625753146590;
        Thu, 08 Jul 2021 07:05:46 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id z13sm222403lfb.40.2021.07.08.07.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 07:05:45 -0700 (PDT)
Date:   Thu, 8 Jul 2021 16:05:43 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <YOcGN3n7w0NAobdo@oden.dyn.berto.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160401.xssshab7nkxroxnp@uno.localdomain>
 <YOSBxLV86PX63AWm@oden.dyn.berto.se>
 <20210706165803.jepqksw4slo3xkyc@uno.localdomain>
 <20210708134040.GB3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708134040.GB3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sakari,

On 2021-07-08 16:40:40 +0300, Sakari Ailus wrote:
> Hi Niklas, Jacopo,
> 
> On Tue, Jul 06, 2021 at 06:58:03PM +0200, Jacopo Mondi wrote:
> > > > > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> > > > >  	rvin_v4l2_unregister(vin);
> > > > >  	vin->parallel.subdev = NULL;
> > > > >
> > > > > -	if (!vin->info->use_mc) {
> > > > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > > > -		vin->vdev.ctrl_handler = NULL;
> > > > > -	}
> > > > > +	if (!vin->info->use_mc)
> > > >
> > > > I know it was there already, but give that rvin_parallel_notify_unbind()
> > > > is only registered for parallel, can this happen ?
> > >
> > > Yes, on Gen2 where we don't use a media-graph.
> > >
> > 
> > Ah correct, for gen3 the controls are freed elsewhere, right!
> > 
> > Thanks for the clarification
> 
> I already had the set in my tree but I can throw it out if you'd prefer to
> send v2 instead. At least I noticed only minor matters in the comments.

There is one small issue in a cleanup path in 4/11 that should be fixed 
and it's always good to get the small things fixed. If I have a v2 out 
before end of day tomorrow could you refresh what you have in your tree?

> 
> -- 
> Regards,
> 
> Sakari Ailus

-- 
Regards,
Niklas Söderlund
