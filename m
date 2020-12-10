Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7192D554A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 09:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387944AbgLJIYZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 03:24:25 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42105 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387534AbgLJIYR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 03:24:17 -0500
Received: by mail-ot1-f66.google.com with SMTP id 11so4107159oty.9;
        Thu, 10 Dec 2020 00:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bALKz7ou045OVVjtEQhAIxeM6l3p2vtzdMmOOh1FY44=;
        b=oQOltPAWfvqdlnPnjrv5e0E9YPFE2tY5HTj3gIEUTXcCo4A1Z6YuoJNJBrSuJw4oaM
         s4RCLHPVGyxZmkWo/BG06mn2aXg8UNxpFEagIjrmb4SOsHbY4ujE2wv/k99H2mCF69aG
         woVhpfapXtz4Joc1PV8vWduRAF6BUI7cJCpUuqp9fHaFMcN3xWCgqFABoxnOGQGCku06
         PTlDCbSgbc2Awe4o7XOJgMQH5n7JMuQIvHLHD4oE6uI6bMacRZb6JgEkOH0ve+efdlX/
         GvXufK0688GJu0HAt8oUEN0oqrorCYHdiTidcnTAE/mSefB37sfy8JAqmR2/vLApTRWt
         VE6A==
X-Gm-Message-State: AOAM531cG3ArzJg7GrKyqCs6Mm6TvinmFBo+1HF3AI/1j1lvNuTxUynb
        7gglq8iyoFtVPHcn7CDHgH7916oXKcYhyUMI4iA=
X-Google-Smtp-Source: ABdhPJw91BB0ZX7xUOKVvKsg1YA5Ph+wLOHJMrQbBy3Bk4cL5NiTdS3tlH2tf0Jw5C8SZh60OG/dElJoOAr69CsobyE=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr4997267otc.145.1607588616676;
 Thu, 10 Dec 2020 00:23:36 -0800 (PST)
MIME-Version: 1.0
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXr1kDaXF7FFowq5CSVHzyima2fbF1fJUOowUEb88dOTA@mail.gmail.com> <TY2PR01MB3692C55C6CDEFC83D6F8F90DD8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692C55C6CDEFC83D6F8F90DD8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 09:23:25 +0100
Message-ID: <CAMuHMdXHMHaXPDaUfLmfREi92FKK0z_+eSyuOLRuXW1TDRPxOw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Dec 10, 2020 at 5:10 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, December 9, 2020 10:26 PM
> > On Tue, Dec 8, 2020 at 9:06 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> <snip>
> > > index 80c6ef0..57bdb6a 100644
> > > --- a/drivers/mfd/bd9571mwv.c
> > > +++ b/drivers/mfd/bd9571mwv.c
> >
> > > @@ -127,13 +137,12 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
> > >                         ret);
> > >                 return ret;
> > >         }
> > > -
> > > -       if (value != BD9571MWV_PRODUCT_CODE_VAL) {
> > > +       /* Confirm the product code */
> > > +       if (value != bd->data->product_code_val) {
> > >                 dev_err(dev, "Invalid product code ID %02x (expected %02x)\n",
> > > -                       value, BD9571MWV_PRODUCT_CODE_VAL);
> > > +                       value, bd->data->product_code_val);
> > >                 return -EINVAL;
> > >         }
> >
> > Reading the product code register, and checking the product code value
> > can be removed, as bd9571mwv_probe() has verified it already.
>
> Indeed. I'll remove this.

OK.

> > > --- a/include/linux/mfd/bd9571mwv.h
> > > +++ b/include/linux/mfd/bd9571mwv.h

> > > + */
> > > +struct bd957x_data {
> > > +       int product_code_val;
> >
> > unsigned int?
>
> We can remove this member.

True.

> Or, keeping this member and then we check the product code by this member
> instead of switch() like below?
>
> /* No build test, JFYI */
> struct bd957x_data *data_array[] = {
>         &bd9571mwv_data,
>         &bd9574mwf_data,
> };
>
> for (i = 0; I < ARRAY_SIZE(data_array); i++) {
>         if (val == data_array[i].product_code_val) {
>                 bd->data = data_array[i];
>                 break;
>         }
> }

Given we probably won't have more than a handful variants, I'm
leaning towards the switch() approach.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
