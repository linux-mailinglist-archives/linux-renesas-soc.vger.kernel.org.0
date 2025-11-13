Return-Path: <linux-renesas-soc+bounces-24576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A2C587F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 840C935D614
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E8035A139;
	Thu, 13 Nov 2025 15:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKOg9J7D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B735A12D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047954; cv=none; b=LIi6jvVVaEgdaTqAJDNUwm6ChBgNpoUV/pv+I8vtajkGcFzpUrbhAqidtHape03YiKJKBW8gd5qtJgYykZXyQEgYjo4xHeTQIeGC0kBOi6osVqbxW1bwxoFV+xM5WAHFjG18Lk6B01nKfOPzywE/g4mZJRv8prWDQkEEVy8cpYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047954; c=relaxed/simple;
	bh=Z1vu2MOiIFQBcyrWVUVPL9kCsj3sq6loXCLsmGoUKac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcrMDXJDJl7IQa2vll6yK6XV7BTvd2sGNtOniRb94jGP95s81zanYTpg1b6Sbq61qL4KF8jndd/0PDpTfTNpRZF3teb5tGIcn6uN1b2HkOvT8WmxMYdMaEWHbt4wZiBVAxB6pzdIuoEcQhPKagLzoJh37gJ7rQ+MX4hvgkvXhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKOg9J7D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2964d616df7so12033685ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763047952; x=1763652752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=AKOg9J7D1B07L3Zh86GSs72adKKQAo9kFP0iXvWJ909llen+LapyTKuuk246YLU+SW
         9ZrrsIEiPHi9soWwzFXzwQXsLZVyLxxNnuKUuKg2ZO9ft+J+jiN5BEoxuZxXGWTAa0zy
         YOeraq2pUM8BG7X3A+qbpTcPaepIP2B0kN3YbDuY8f1VKOIZqSiDjmyCvH7z6r2kaHnH
         osp6dwA5tbmapRvjSmA32Q4C5yl7WUd6dHTSWoXdsSitS76CGkYxUdhxdKDWp+iSbPYJ
         2kQgNBYmsARlIYl/TVv7i1W79/CjvyLvkkFwBzEaRRSHvQwddKPrKwnlP0P+a2QC4PYV
         +o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763047952; x=1763652752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=J31sh2FReJN7NSyz7vwa6AfUocAj4VLBIhR2lUBoKGJOk962sgPTKDXwA01E7GZNv1
         Yo2F/bIhT4Uya62g2a7AOCLd9/EGA4YkpDKtBS/56yTz/CMUHKRusHJMSXfhtP1MJoQf
         sI7PA9QHLYlPo9IFEsuSgMBR523ER/1bt0kyRdrZ3BWowu+3ScEF9PelbvcMJ2JxF1VZ
         vFupmK9umd2ibg2opKtOnTQHW3pH+Jbp0kqa0L+BhGF+/Rpqqdjj7lBurDT6BrOSaZk+
         grrH8kppyb2B1+wq2Yg/r/2d4lRa3f+C/Zov3jcE/RHKl5Mh80jJA5Xbt6OUOdDoryeV
         q0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC036TjP/F4llcUSdeVFudn9dDK40w/3UznV53zqwPnWZSbGpbdinKUq1kQwGFGmxPeWrcvzRNj5laZVc5yH1raA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9C28SoMrsjPdCkvokPJlmSbsBGhOVzerr8Mz0i4ZJhAQ2fXx
	x8C9XKvIAhDDmkG1bREMsAX3dNObK2ETEcwzQlHZhwABiIJhUKwwl6vEhRLBsWs8l1U=
X-Gm-Gg: ASbGnctooYiVfragu28Kz2b8rw8T795UX5eAFblBPNvrcy8Ew+IdPts+SIVbnEIatb8
	VPlQZI9MhbwS7iToOOG1Dy4ic8l6AVjGJ687sVWz3Wa6VC6I69eDR6/ajPCv90oISqRftr2itnP
	MWC+J6BygvXSv568Zv879GcqYd2MBWX4P1OGN+ZyZRhRfjVPY6Gjew94RXsk0OHb6m8guoziD62
	HaO9TJSKSGqqpOCA/TzSJa4LFRzmKInck4QOIuxxuy/D6LXSXDdarTbgJv4yRgU2YSz4Q72T7zl
	1YsCthc75fKdG8+BX5Jcr0yzyEpieFkXTs/rmRn89Xd4ytaCcHN83RsCf8b8NfBz/lwV3xHS89U
	EWyw/KSILeFjzE68cM5GRIf4snmVj/6/KNUu6PK8Vd4xyuZF0nKkgrPb/9Q61Ca2FnQIqaOXzA9
	/RcuB7DCel4YuehHYBqNXYcbc=
X-Google-Smtp-Source: AGHT+IExGtwG81uwzj9JgnEK26nwTkuowQ0TGIoI/B/ng4jHpuOWuk3RVAjeNdIAjjrFddHoISsZ3w==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr85532495ad.43.1763047952195;
        Thu, 13 Nov 2025 07:32:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aee4:3fd6:a52:8e9a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed4fsm29590765ad.75.2025.11.13.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:32:31 -0800 (PST)
Date: Thu, 13 Nov 2025 08:32:28 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <aRX6DJoaP4MXG3fN@p14s>
References: <20251031175926.1465360-1-robh@kernel.org>
 <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>

On Wed, Nov 12, 2025 at 10:59:42AM -0600, Rob Herring wrote:
> On Wed, Nov 12, 2025 at 9:43 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > > Hi Rob,
> > > >
> > > > Please see may comment for st_remoteproc.c
> > > >
> > > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote:
> > > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > > of_reserved_mem_region_count() functions to handle "memory-region"
> > > > > properties.
> 
> [...]
> 
> > > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > > > index e6566a9839dc..043348366926 100644
> > > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > > > >     struct device *dev = rproc->dev.parent;
> > > > >     struct device_node *np = dev->of_node;
> > > > >     struct rproc_mem_entry *mem;
> > > > > -   struct reserved_mem *rmem;
> > > > > -   struct of_phandle_iterator it;
> > > > > -   int index = 0;
> > > > > -
> > > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > > > > -   while (of_phandle_iterator_next(&it) == 0) {
> > > > > -           rmem = of_reserved_mem_lookup(it.node);
> > > > > -           if (!rmem) {
> > > > > -                   of_node_put(it.node);
> > > > > -                   dev_err(dev, "unable to acquire memory-region\n");
> > > > > -                   return -EINVAL;
> > > > > -           }
> > > > > +   int index = 0, mr = 0;
> > > > > +
> > > > > +   while (1) {
> > > > > +           struct resource res;
> > > > > +           int ret;
> > > > > +
> > > > > +           ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > > > +           if (ret)
> > > > > +                   return 0;
> > > >
> > > > The original code calls rproc_elf_load_rsc_table() [1] after iterating through
> > > > the memory region, something that won't happen with the above.
> > >
> > > Indeed. it needs the following incremental change. It is slightly
> > > different in that rproc_elf_load_rsc_table() is not called if
> > > 'memory-region' is missing, but the binding says that's required.
> > >
> > > 8<--------------------------------------------------
> > >
> > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > index 043348366926..cb09c244fdb5 100644
> > > --- a/drivers/remoteproc/st_remoteproc.c
> > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > >         struct device *dev = rproc->dev.parent;
> > >         struct device_node *np = dev->of_node;
> > >         struct rproc_mem_entry *mem;
> > > -       int index = 0, mr = 0;
> > > +       int index = 0;
> > >
> > >         while (1) {
> > >                 struct resource res;
> > >                 int ret;
> > >
> > > -               ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > -               if (ret)
> > > -                       return 0;
> > > +               ret = of_reserved_mem_region_to_resource(np, index, &res);
> > > +               if (ret) {
> > > +                       if (index)
> > > +                               break;
> > > +                       else
> > > +                               return ret;
> > > +               }
> >
> > This looks brittle and I'm not sure it would work.
> >
> > Going back to the original implementation, the only time we want to
> > "break" is when @index is equal to the amount of memory regions _and_
> > ret is -EINVAL.  Any other condition should return.
> 
> @index equal to number of entries returns -ENODEV, so that condition
> is impossible. We can simply it to this:
> 
> if (ret == -ENODEV && index)
>     break;
> else
>     return ret;

To me this needs to be:

entries = of_reserved_mem_region_count(np); 

...
...

if (ret == -ENODEV && index == entries)
        break;
else
        return ret;

But taking a step back, it might even be easier to go from a while() to a for(),
the same way you did in imx_rproc_addr_init().

> 
> If you want to keep the prior behavior when 'memory-region' is
> missing, then '&& index' can be removed, but I think that was wrong
> behavior.
> 
> Rob

