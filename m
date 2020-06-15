Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A561F955B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 13:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbgFOLeW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 07:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgFOLeV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 07:34:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548C5C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2020 04:34:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x18so18702597lji.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2020 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+WejR2o5pERcqVd6Trj7VuEJlddLGkD3FYHFq0/CoK4=;
        b=AXQ30Bw9eYO4fI0BV2m8xIiwPPYyPuTj9S2PD1EH7rfGvFT4gigek/tKvkj2aPe3MZ
         6DI0Fb66CCBNGkCL/EtpvCnAe+fqjF3XF5OeSuU9xHy0A3Px/nFA11GzgEHwrFBrUa6A
         dAgFS9Czq8ekkC4v853lXGT6HQKMqG7H2BJlqIHReCgyKZxlh/CNNfXQEuobs2GSvFkh
         5OJhfR2PSZ1XIxx/g3kFa5626aQffhU5X2vPVxnmQDLyp1KmYdnJDDOnbTuojlGinyxF
         mpuikbR4W0s/C0uv7GZaH868n9XPoBwc6ANae+Jd5pj2JGwl2MJ7QWksZO056KhXyFBH
         1X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+WejR2o5pERcqVd6Trj7VuEJlddLGkD3FYHFq0/CoK4=;
        b=mZWp/zhpcmXqwZjYPRF37yXpPZHrfNMQrgL7WZPlc1E4Goftdn0zz2ujhtsf/63auo
         vAlXLcc2pE0ZQF6AiKsqJJ07WU9eMgDRttiiv5bb54/MqtlDwAc33WWNJMW+tWXgMIJ2
         8CcSZt5sIaHrSKuvNCRM+eYbulEJCEQ+346yybdBfzgziZD2aVlESxkwzSL5M7ISJbw+
         gam6ZRA+80MOjhfOnkfO0f11skoyLoAcBCng6pZRRkWriYpm8d/ptccs3BrOMU7JDazJ
         bQZzOu9VzSB3vDmCZPUPCAHFRaRGmAbnKn/GDsPX3xTogol6CS1RiinV0bw+T8KWSvQT
         94eQ==
X-Gm-Message-State: AOAM5338hEUkEqNO3ZBl7rhHxoEroNtUEC2MdXzjwQ9ZubFKB1IvHEAO
        KiU3ZORV4AJIs0dsXNzHJ/Noj3lzuco=
X-Google-Smtp-Source: ABdhPJwK/DXQteu5ZjaU4oRLXVwrd/ma9heBHjYcom51b6XCdYtnGhXV3dtpYJIwRPFCWacDH4jJ+A==
X-Received: by 2002:a05:651c:311:: with SMTP id a17mr13532837ljp.322.1592220859665;
        Mon, 15 Jun 2020 04:34:19 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 22sm3781400ljv.26.2020.06.15.04.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 04:34:18 -0700 (PDT)
Date:   Mon, 15 Jun 2020 13:34:18 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] vin-tests: Add more SoCs
Message-ID: <20200615113418.GA2125222@oden.dyn.berto.se>
References: <20200615104430.105891-1-jacopo@jmondi.org>
 <20200615105546.nfyucmyiqoapfos7@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615105546.nfyucmyiqoapfos7@uno.localdomain>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for the ping.

On 2020-06-15 12:55:46 +0200, Jacopo Mondi wrote:
> Niklas,
> 
> On Mon, Jun 15, 2020 at 12:44:27PM +0200, Jacopo Mondi wrote:
> > Add support for E3 and M3-W+ SoCs and fix identification of M3-W which is now
> > named R8A77960.
> 
> I badly copied and pasted your email address in the cover letter. Just to
> notify you about this in case you didn't notice the patches from
> looking at the lists.

Is it possible you also misspelled the ML address? I can't find it on 
the list and lore.kernel.org have [1] no recollection of the backlinks 
to the original message-id.

1. https://lore.kernel.org/linux-renesas-soc/20200615105546.nfyucmyiqoapfos7@uno.localdomain/

> 
> Thanks
>   j
> 
> >
> > Jacopo Mondi (3):
> >   scripts/boards.sh: Fix M3-W identifier
> >   scripts/boards.sh: Add support for M3-W+ SoC
> >   scripts/boards.sh: Add support for E3 SoC
> >
> >  scripts/boards.sh | 18 ++++++++++++++----
> >  yavta-cvbs        | 10 ++++++++++
> >  yavta-hdmi        | 10 ++++++++++
> >  3 files changed, 34 insertions(+), 4 deletions(-)
> >
> > --
> > 2.27.0
> >

-- 
Regards,
Niklas Söderlund
