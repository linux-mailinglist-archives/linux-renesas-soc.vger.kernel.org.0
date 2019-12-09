Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7DD11729A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 18:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfLIRQn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 12:16:43 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:34611 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfLIRQm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 12:16:42 -0500
Received: by mail-lj1-f175.google.com with SMTP id m6so16560873ljc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Dec 2019 09:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6iI9lVnNH0UerpE1bqPQXNj2mhvS1xA7PcDef5F/gq4=;
        b=mR1y/P/bsXVYdOXFe+gzP8Zx+TPszIIkDMmW+dwhMwGMkI7ExOmKWYaFMX8bN1t+F9
         qj7X1paf5T8B09y3Tc2Guldv0ZAdxJ7YdOJnmFsohxFishgjq7UB6KGFhNm27tDnNy6b
         59EPegpLJ3rDltgIz79c/aixut12eQtABsSvuz/l6gqVjXTkSzNotRwf2FY3uJpPe+nh
         Ox8z2/3rOmSNjkaK3qlqt0RlB580fBFcwwKdSjlNg8FCWIpauBTR2kZNWptlVfAG3Okd
         dlrCtNwGY7g3xe8YrGv+ArpF7ePEJY7ULSdDuqN9+gPz0AI4fTLBCKjy486Jfs9lwvKH
         xdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6iI9lVnNH0UerpE1bqPQXNj2mhvS1xA7PcDef5F/gq4=;
        b=rO93PsAcQS81gH2xQ3EuhGqIJM3B/K3gE1tTOgkEUSoTfjKaYME5JZfe/ZSvtqutIs
         6GVya9GZkdxjSAaxJn4USgWyXIVfHFOuynv//llnXa6mbPQmfiYPCZHIFB8hxwmUqcJe
         IXzqgrSwUbDem+MkDRQ056zbMYI9uSIHqX/pfdQlnjGd3BQx2ePoTIQiRgV0j5znmLfl
         t3e7rCl3gIgtC+3cWg8jYulEL74Inr8FMoHckv5MHU1rm1kmLM6EbN9p/kZ5UI3acf+k
         oFGPc0qmmPB6q5VvAeWkWv+IgwVWsCBRjPb+8jBwQkmlKEMRL+o5l4nJcg+OTdLMuKSi
         sw5w==
X-Gm-Message-State: APjAAAXFb1JdK1vsdKuqaZ1LM4yo188mSoGtcKhC/Xr0HxVhLqK/0AbW
        KOakWCDA9ugEeeJ8Qof7xoQD+g==
X-Google-Smtp-Source: APXvYqzl9cFxZSPvvpaQIXgXdff1sFs4hGHEOy5+qo4OsYmYemYSxedzspKdfjczzVboniC0F2/dCA==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr17287507ljk.15.1575911800327;
        Mon, 09 Dec 2019 09:16:40 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id h24sm236983ljl.80.2019.12.09.09.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 09:16:39 -0800 (PST)
Date:   Mon, 9 Dec 2019 18:16:39 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: Regulator probe on demand (or circular dependencies)
Message-ID: <20191209171639.GA27340@bigcity.dyn.berto.se>
References: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
 <20191209163755.GF5483@sirena.org.uk>
 <d7003d64-e838-9dcb-8c61-d6567ff6eb69@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7003d64-e838-9dcb-8c61-d6567ff6eb69@ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On 2019-12-09 17:03:38 +0000, Kieran Bingham wrote:
> Hi Mark,
> 
> Thanks for getting back to me,
> 
> On 09/12/2019 16:37, Mark Brown wrote:
> > On Fri, Dec 06, 2019 at 04:38:04PM +0000, Kieran Bingham wrote:
> > 
> >> The MAX9286 also exposes 2 GPIO pins, as such I have configured the
> >> MAX9286 driver [1] to expose a gpio-chip [2].
> > 
> > So this seems like a MFD then?  The nice thing about using the MFD
> > subsystem is that it means that the drivers for the various subsystems
> > on the device can instantiate in any order and defer separately without
> > interfering with each other which seems like it's the issue here.
> 
> Well that's part of the problem... the V4L2 async framework can not
> currently support the device performing a probe-defer at all, so it
> *will* fail later (and crash currently).
> 
> I hope we can fix this sometime - but it's a recurring pain point it
> seems. Unless it's just our video-capture driver, I'll have to dig
> deeper here, and check with Niklas.

The problem is that we can't register, unregister and re-regsiter a 
video device in a sane way. One easy solution to this is to not register 
the max9286 v4l2 subdevice until we know that the probe do not need to 
be deferred as this would sidestep the whole v4l2 issue described above.

> 
> 
> >>  - is there anything I can do here within regulator_dev_lookup() to
> >>    attempt creating the regulator_dev 'on-demand' when
> >>    of_find_regulator_by_node(node) returns empty? (or is that crazy, and
> >>    just a rabbit-hole?)
> > 
> > This seems like a terrible idea, you'll have a half baked regulator in
> > the system which will need special casing all over the place and
> > doubtless be an ongoing source of bugs.
> 
> Thanks - that's essentially what I'm glad to hear /before/ going down
> some rabbit hole. I'll re-evaluate with the team, and see what the next
> best steps are.
> 
> -- 
> Regards
> --
> Kieran

-- 
Regards,
Niklas Söderlund
