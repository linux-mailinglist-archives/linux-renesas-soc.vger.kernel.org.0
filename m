Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E33011DB6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 02:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfLMBCL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 20:02:11 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37301 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfLMBCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 20:02:11 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so685241lfc.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2019 17:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=m2ipbqjcG+3wnAW6roK9EIDaSuEvIBu+cgILXapMkDs=;
        b=0p7CmntPIXqnn42f4FiTPX+r6txSjZ3v0sEad/ERVNpn/mzwTO5Aj6A1armwwNhhVK
         wHr/i8CXWZhEexAK1SK03dnEbZEcs79MXz1OrtIR9MHjGnGYokO8/9OSeCoduQ1J74A1
         5M9M+nqevJ+T22iWdHdO1VCJGH4XkQ6gQB34wfR/WQbuh+wn+bPRbqZ2WdOMxB8C31u3
         G31PIeMCIHVveJv7tQpERkwDm2XeuzXtAhArwqjZ2t9Hs0w9ApngSW/AZxCJHbIV+dGT
         vXCKcBcZkC7ejzXpNo+n7SIN+s43YCEeNjlhTLi01WEqvGPX6hj/T4Bk8BF+o8lsn65b
         Y8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=m2ipbqjcG+3wnAW6roK9EIDaSuEvIBu+cgILXapMkDs=;
        b=YFBz3qccmGb4exfS3RC/w5UbeZokQGg7X7nPxJoLhwIipa0h4dEHwNgE+0RYw7sKZa
         sag/U0sO08x57VJIdebjO80eCpvoUCbJ9ak+5vBVlyPx25Ui15i+q3nRUvyhHcX8WyeY
         Ebpc4f8VdN5X+Y4MN1rTllLCISTNRejwT3jpkS9zrnNsfZPdpOJMnu7BdjfmpqPObSRF
         eQji1d1HMwJ5gVGocbdizHvvN2zvIGYUMACnv+fMtSyxDbD4sH94k32g+sQWpBwesaQA
         FXcGV4E7QEV7/T/j6+AZ4g6IW9ciR7xFCGVbYoBds94G2ZWmGfXu7BMf9kRnd+sVfday
         Ym+w==
X-Gm-Message-State: APjAAAUAlEHAopytNmHXpCiULphH0x7HuBF/LXptbs9ThJNL30Awbj//
        97Fb2lg4b3rKVYH+BIQIKNwid8acVJU=
X-Google-Smtp-Source: APXvYqzIHIJdzpKLstVR9ornnNXVwRNsOe67G5LYRpwkSV/SmghTgVWC0GwojbZptncmT+WDKRODVQ==
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr7464615lfq.46.1576198929188;
        Thu, 12 Dec 2019 17:02:09 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id d24sm3745532lfb.94.2019.12.12.17.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 17:02:08 -0800 (PST)
Date:   Fri, 13 Dec 2019 02:02:07 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] yavta: Fix usage documentation for --field option
Message-ID: <20191213010207.GD26038@bigcity.dyn.berto.se>
References: <CAMuHMdWgkFiCbibrxUTOYPCFF+faJhacTEbF0LHA0gDpNA+_Jw@mail.gmail.com>
 <20191212234535.GF4892@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212234535.GF4892@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-12-13 01:45:35 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Tue, Dec 10, 2019 at 09:18:37AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Dec 9, 2019 at 10:23 PM Niklas Söderlund wrote:
> > > The --field option takes an argument selecting the field order. Update
> > > the usage text to reflect this.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  yavta.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/yavta.c b/yavta.c
> > > index f83e143c051396c4..196345c323c662d3 100644
> > > --- a/yavta.c
> > > +++ b/yavta.c
> > > @@ -2286,7 +2286,7 @@ static void usage(const char *argv0)
> > >         printf("    --enum-formats              Enumerate formats\n");
> > >         printf("    --enum-inputs               Enumerate inputs\n");
> > >         printf("    --fd                        Use a numeric file descriptor insted of a device\n");
> > > -       printf("    --field                     Interlaced format field order\n");
> > > +       printf("    --field field               Set the format field order\n");
> > 
> > "Valid values for field are ..."?
> 
> Please let me know if you want to send a v2. yavta is a low-level tool
> so I don't think this is critical, users are expected to know that the
> value comes from the V4L2 API, but stating hit wouldn't hurt either.

I'm open to send a v2 based out your feedback.

I was prompted to write this patch when writing a test for vin-tests for 
TB/BT and I had to look in the yavta sources to find which strings yavta 
used for the different field options and misinterpreting the help for 
--field to only concern interlaced field formats.

As you state yavta is a low-level tool so I'm fine with the patch as is 
just to demonstrate that the --field argument takes a value and is not 
exclusive to interlaced formats or extend it similar to '--format help'.

> 
> > >         printf("    --log-status                Log device status\n");
> > >         printf("    --no-query                  Don't query capabilities on open\n");
> > >         printf("    --offset                    User pointer buffer offset from page start\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
