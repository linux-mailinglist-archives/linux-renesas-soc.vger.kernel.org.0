Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81CB3666C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 10:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbhDUIKE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 04:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhDUIKD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 04:10:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A2FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 01:09:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d27so8693591lfv.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=T0tM9KzBMBrQkALzmLkfaSqMp9A1TmBX50Y1OZcdVI0=;
        b=YtK079840hn0gjmBBLWch40NqKhDdpNxx4k1EVQ56172wLkjieFOW2BQ9sF5RpM27I
         xYP0X1gyd5VXiNKjFoBeMFYxpJxw/kaa7vgoSRUKcZyD6kYsa5N9BHXQMNaakJ8MzhQl
         wRl5JHnGgTYOxlGuUugA4FOGANhBKBroRAytpSx7B/Rx/wa4PpNvIhJx20fsIH1yW9nx
         vAZvUPVPk3o70NsDlhgBbNKu3RIiesVDY9MNI9Jzx9tRnjmBWOOT3qvTJilLfCchajAm
         njeBsjwBXzNh4Ol/vU8Louyex/bFyBJJh49WwsmUyKxJgHtDzJuqs2WavnEsBSbsVLmg
         kTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=T0tM9KzBMBrQkALzmLkfaSqMp9A1TmBX50Y1OZcdVI0=;
        b=ogh2Q6k4V7HR4EvTo05FLBE+AcJt7a8IPx14yPF9MPavd1/2WZsxS0RF5MUdqwdWAO
         i1PqW1L8q2+Q4yf1TsO/YeCKcYOy8UyUsEKRMjptnjXa30Rn3GTJB9RuI1DSE1G2FeNq
         5ompbFCHqNk7wk7kYOM+vW9juFoCkJ9MZdIin3kJAzFsUlD+6rJ7BdpBQ9SMeTPBAiUW
         xcRI/14eKQJ3aKODh1dg4A42Nc4mwVwMHXCE6+OtRDOrS6E8nJ1lpoLP0U1GLSEhN3hL
         q46SHWxpxJ8u63oeTBQCw4pQSLIUIQ9qPjX8l1eJdOjzd+IfqcbLQpS1jvfGWM+XSeTr
         AqHQ==
X-Gm-Message-State: AOAM531E5DGjeYuki5lU8VoCr/MzxzPJj5HeCCXDbbGZDbaIpcCENZKj
        A6TqfknWtD+zv4oi1f6Jr+SNqDzM0+MBAA==
X-Google-Smtp-Source: ABdhPJyzVDze2HErZI+UdoJ5UKXX7j7lyXlyro3+1U1+CQd+mFV26lkc3dj01/efC6o6Ao4f3BJ6sQ==
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr18337191lfq.425.1618992569543;
        Wed, 21 Apr 2021 01:09:29 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id f13sm132909ljm.25.2021.04.21.01.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 01:09:28 -0700 (PDT)
Date:   Wed, 21 Apr 2021 10:09:28 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] yavta: Fix usage documentation for --field option
Message-ID: <YH/duM/hWnDAlUrD@oden.dyn.berto.se>
References: <CAMuHMdWgkFiCbibrxUTOYPCFF+faJhacTEbF0LHA0gDpNA+_Jw@mail.gmail.com>
 <20191212234535.GF4892@pendragon.ideasonboard.com>
 <20191213010207.GD26038@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191213010207.GD26038@bigcity.dyn.berto.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Necro ping :-)

On 2019-12-13 02:02:09 +0100, Niklas Söderlund wrote:
> Hi Laurent,
> 
> Thanks for your feedback.
> 
> On 2019-12-13 01:45:35 +0200, Laurent Pinchart wrote:
> > Hi Niklas,
> > 
> > On Tue, Dec 10, 2019 at 09:18:37AM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Dec 9, 2019 at 10:23 PM Niklas Söderlund wrote:
> > > > The --field option takes an argument selecting the field order. Update
> > > > the usage text to reflect this.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  yavta.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/yavta.c b/yavta.c
> > > > index f83e143c051396c4..196345c323c662d3 100644
> > > > --- a/yavta.c
> > > > +++ b/yavta.c
> > > > @@ -2286,7 +2286,7 @@ static void usage(const char *argv0)
> > > >         printf("    --enum-formats              Enumerate formats\n");
> > > >         printf("    --enum-inputs               Enumerate inputs\n");
> > > >         printf("    --fd                        Use a numeric file descriptor insted of a device\n");
> > > > -       printf("    --field                     Interlaced format field order\n");
> > > > +       printf("    --field field               Set the format field order\n");
> > > 
> > > "Valid values for field are ..."?
> > 
> > Please let me know if you want to send a v2. yavta is a low-level tool
> > so I don't think this is critical, users are expected to know that the
> > value comes from the V4L2 API, but stating hit wouldn't hurt either.
> 
> I'm open to send a v2 based out your feedback.
> 
> I was prompted to write this patch when writing a test for vin-tests for 
> TB/BT and I had to look in the yavta sources to find which strings yavta 
> used for the different field options and misinterpreting the help for 
> --field to only concern interlaced field formats.
> 
> As you state yavta is a low-level tool so I'm fine with the patch as is 
> just to demonstrate that the --field argument takes a value and is not 
> exclusive to interlaced formats or extend it similar to '--format help'.
> 
> > 
> > > >         printf("    --log-status                Log device status\n");
> > > >         printf("    --no-query                  Don't query capabilities on open\n");
> > > >         printf("    --offset                    User pointer buffer offset from page start\n");
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> -- 
> Regards,
> Niklas Söderlund

-- 
Regards,
Niklas Söderlund
