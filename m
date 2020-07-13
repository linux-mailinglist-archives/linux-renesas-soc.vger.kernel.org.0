Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430A821D178
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 10:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgGMIP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 04:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgGMIP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 04:15:29 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9372C061755
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 01:15:28 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so16123853ljl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 01:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R18zMb+4L+lO4uAfr3cc7mGDQXZ6aBFZ+wYNBdZQRsI=;
        b=P79kToCmtjng9W6EEOEf5Xeub49B/GEJev9El0Mnn0iQJF/uTUacEA8M1rS5bYBPwa
         WN7Dwrs0WuAtogkYJbRfgEjgKkMzFwtBhpIY3k480hXAQ9AsjFAHdKUTErtBJxzp+EC6
         nJb8hw6tJP3Mq4oed7OdAzGMyK2zEGc1+bCzfoUuEd/KkfrQC58iO7/zWzU0hTdI2ijD
         diRDNrzMBkDzxvU2FXXCHbeMOXJqpLWvfhNUCtP1oXktuNPyipxMSItAKBnCoZvD03L2
         34fcoKcmYazfjVisNcjxI1ehWXHsLIyUp+/7xwnYWJR8OgjJ5uzCIMcNr9+gYL3SEY/h
         HRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R18zMb+4L+lO4uAfr3cc7mGDQXZ6aBFZ+wYNBdZQRsI=;
        b=kDwQvWhOKJG6lMriMhTgeXg7xbqRFvh+ICgyWcfvstS4q1Fg4B7qG9h0FFVnpWuMkN
         kqa9uzTGxqXTjgueVozCb25gDf9I0dTZqNtB7U2TPe8/sjFonH19Hbo+CVL3fxkDjyra
         toh+b0K5PjaMiUhTEid/uImF/3MnnowND5bJe9A/pCyCE91pd85XuJ9cHmwzcE/O2aEI
         e4UklKYgKPw970f2JV6npTqWfVml8WF4x1WoFRoxGCgGSg1kMGrlZDn5SWXrOUwvNRXB
         cU6O1wN9NvJ19Ut7xfeUPVvE7Z6Oh1fR1bTD3zfUZKG2pdh5/UZUWrMtiv0qe7cPkWAE
         G9Xw==
X-Gm-Message-State: AOAM530yfUrIQhpv1XgI+HbrlRFMI9Otp5Y144fxZvibhkZ8BtL72w5u
        Y1g85qQMMnP06mvTi3BicTuU0wsRoaQ=
X-Google-Smtp-Source: ABdhPJzt+ws/cPTBoaCriGlN55ih6Tej+nZJNIgqVWJx/dFfca9NjRwNVQ0bXJcbvFKyqHe8iNeigg==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr3364272ljc.159.1594628127015;
        Mon, 13 Jul 2020 01:15:27 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id f21sm3907074ljj.121.2020.07.13.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 01:15:26 -0700 (PDT)
Date:   Mon, 13 Jul 2020 10:15:26 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH 1/2] ARM: dts: gose: Fix ports node name for adv7180
Message-ID: <20200713081526.GK1498036@oden.dyn.berto.se>
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
 <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUR6ouBg3LTqE80vUS1UMriXnOiVBoUpoL8SHyCAiFrWQ@mail.gmail.com>
 <20200713072455.GJ1498036@oden.dyn.berto.se>
 <CAMuHMdUfDzDi1ELwsHeCe71Jm5zr9+rGT3o_R+cyPRqiyax3=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUfDzDi1ELwsHeCe71Jm5zr9+rGT3o_R+cyPRqiyax3=g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2020-07-13 09:51:08 +0200, Geert Uytterhoeven wrote:
> > > Don't we need the same fix for the other boards?
> >
> > The only other board we have that uses the same compatible string
> > (adi,adv7180cp) is Draak and there the ports node is already correctly
> > named.
> 
> Ah, I missed Gose is using "adi,adv7180cp", while Lager, Koelsch, Porter,
> Alt, and Silk are using "adi,adv7180".
> 
> Next question: why the difference? Gose and Koelsch should be identical
> w.r.t. these interfaces.  In fact all boards listed above are using
> ADV7180WBCP32Z, and seem to use similar wiring.

Good point.

The difference as far as I can tell is only in the bindings. The older 
'adi,adv7180' compatibility string only describes where the adv7180 is 
transmitting the data it collects from an undescribed connector. While 
the more recent compat string 'adi,adv7180cp' describes both the 
destination and the connector. A good example as you point out is to 
compare koelsch with gose. From a V4L2 point of view the connector being 
described does not effect the capture operation.

Ulrich maybe you can help us shed some light on this as you added the 
new compat strings?

> 
> What's happening?

If I only knew ;-)

-- 
Regards,
Niklas Söderlund
