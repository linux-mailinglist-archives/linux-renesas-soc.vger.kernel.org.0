Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA70162470
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 11:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgBRKW2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 05:22:28 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:42224 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgBRKW2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 05:22:28 -0500
Received: by mail-lj1-f171.google.com with SMTP id d10so22291353ljl.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2020 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=W72sztoRh+McmphKRgX4tOdWz/1TaY4NH71C48f69Do=;
        b=G4ZUB49J3pMicoq7W/iK1YVpTZTH9Z4LyNa1uZLGY/eTKKilcqPAWRNGmf1h1NXJcf
         QrLjvCrvjaDz8+WlTUj6/Hfpaa0LFJkRBfHF3arTL4sDBATuRHB9zyESubreMSNtSuWx
         tKylmJtPD41ywj85q+Dg10/WN6XFllZO+lYFnHsjEpb4NkUx+BfNqnWelqLQ54/XKc/x
         yO7kvZdPCHeTMJubju7OQVWD+ak5O08xiXhpRi0ef9VS8mmk5Cnkgeisuup0OOMAp2LE
         /Pf6Md6i2jfF60kxqRwzMU/vkRpgFEhVxOrKcy61l0LmYKwnWcf4NK8wd9CmPqaTBzZ3
         k3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=W72sztoRh+McmphKRgX4tOdWz/1TaY4NH71C48f69Do=;
        b=Crooly2AaULoHlAgoh+lEMzcL+cAELQqJUXS9A/s4cuqWuak/MjeaQpf8pbFKon2s7
         +qrE3ixZThg4VpBdxyWM0aZu3+Gso+dgwh464XHC8521WHJzJCxcNwU6yN/E3fC8mPlx
         AJUKox+vtNBtZ8Z+BvpuIV0khhYSbhipSpM4vVjKPhFNobM92CbOoFHHZhYXtX1990MD
         83NhFuuoyWw0oSjX+9C/YiRtgav+emLqyW/TMj1BlqI79BxfaUhtzoIRon/nbXWTXJYj
         496eC01aEU56rhgm7bHdVZa5AquXI5QANo2m5eu9ZDZXJpUHLjydFD/9OaAnyjoaBDI3
         jQyA==
X-Gm-Message-State: APjAAAVXjwFJ9kVygmBZ+SSKz+2VvU/GS7QIz+UgkQ+Gg6FiKtl8c8KF
        EOw3Cckc2mPcJnEo83aHu5K5JA==
X-Google-Smtp-Source: APXvYqzHVkBWWMyB11qGkZJ5O1yDGNinCi2d0MWFVrLqBUQwfpEWBEaci9jMNx2iXoh6EuufcRXiuQ==
X-Received: by 2002:a2e:5854:: with SMTP id x20mr11740789ljd.287.1582021346380;
        Tue, 18 Feb 2020 02:22:26 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id m21sm1937481lfb.59.2020.02.18.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 02:22:25 -0800 (PST)
Date:   Tue, 18 Feb 2020 11:22:24 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Renesas R-Car thermal drivers
Message-ID: <20200218102224.GA812084@oden.dyn.berto.se>
References: <20200216130252.125100-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUdBVwAbG8Qicg3_aKvwjq91QJWS5FQwM6NPdgbyP2Wzw@mail.gmail.com>
 <20200217101114.GO3013231@oden.dyn.berto.se>
 <87zhdg2293.wl-kuninori.morimoto.gx@renesas.com>
 <TYAPR01MB4544C2F924EA24C7F6394267D8110@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYAPR01MB4544C2F924EA24C7F6394267D8110@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san and Shimoda-san,

Thanks for your feedback.

On 2020-02-18 00:11:03 +0000, Yoshihiro Shimoda wrote:
> Hi Niklas-san,
> 
> > From: Kuninori Morimoto, Sent: Tuesday, February 18, 2020 9:01 AM
> > 
> > Hi Niklas
> > 
> > > > +renesas@???
> > >
> > > I have not used the +renesas@ for my other entry in MAINTAINERS for
> > > R-Car VIN and wish them to be the same. I have do not mind if that is
> > > with or without the +renesas tag.
> > >
> > > @Shimoda-san: What would you and Renesas prefer I use?
> > 
> > Please use +renesas@ for Author when you post patches.
> > We don't mind for other mail address, like MAINTAINERS.
> 
> I have the same opinion with Morimoto-san.

Ok thanks, good to know my view align with yours.

Could one or both of you provide an Acked-by tag for this patch to bless 
it?

> 
> Best regards,
> Yoshihiro Shimoda
> 
> > Thank you for your help !!
> > Best regards
> > ---
> > Kuninori Morimoto

-- 
Regards,
Niklas Söderlund
