Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBF1189916
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 11:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgCRKRk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 06:17:40 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42110 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgCRKRk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 06:17:40 -0400
Received: by mail-lj1-f194.google.com with SMTP id q19so26260028ljp.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2020 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w5hiQnyqmC7leWwUw3RoPwGqx4UC8Rj/FFauPygzaXQ=;
        b=Fh3xT1B709mKCCJL9a3pesq6Xdag4bEpJnR9x+hkjgnHq//gBDxAXLS5SSMaQ8hjUU
         0J9IMPkyxPq1vj8H5PnIGXFeRpW2vX95TpupuYS15JlJFP+RiAqTequOxPepfA+QiFjz
         kmRH5ygxcU0AFPBRG1pWfKRlGBU30kINeBxJ9sI/HaFTdj6m4x7i2my7R44CDlgHsp0o
         HC+rn3ZieMR+KBh/fmR7SQb9VvaFiraNQR0gbiQ1P3C3nK6tI7pmnTz60cTAqUsY7egr
         G359UuF0ts0MIF/KeCJ9yy7b2xdd1ZOyooGtnyjdD0ckdZyHpUGyYFYxzVZY2A9mbRoI
         +UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5hiQnyqmC7leWwUw3RoPwGqx4UC8Rj/FFauPygzaXQ=;
        b=X03cWJrVv99PjzxASlulMoGhrSe7opWJdzdLWRyDfrDHlDR4bNguo4QvP8u/lTD7PE
         v2u4K1oXWwmF7ByrEO6SoK2xKfZnfor9F/K19sTHuUVv27/7b8fIr161dYUbJbtrH2t5
         +/bOg0S87bsrARL5KUEbO4iPNPKLyjupWYuLkAzrBxrF0m4GCChQ15w+UH7PpKowXN57
         LKSg4fcXuxU0FGBqF6srXC9EYa/EZV2Bh5D5DdLXnu7XAtp56rmKJvQBLxGh3SwLg0aM
         VTZ15yUiD+HzThJie0BB9IhbtmN6p6U8XQzr0pOYj24+pfw7Mf2JIJjci8IYJOQyl29E
         qV2A==
X-Gm-Message-State: ANhLgQ20XSsAG+F70SFy+vJODQ5Mrjdzeudi/3uoeD+50LC8lGjzPRLa
        BzttBbmxCWJGPITOmJlzC5Mxc0I9dvd2CuxHjMzu3A==
X-Google-Smtp-Source: ADFU+vsAZAFVrrxbwAPsYObjIYPmAnYSYpXYcJ+WTXDFJ6VMXmjlOB31gdOrNSTLhe37nDOz1/XKwhWrVCPQ4ZitFEw=
X-Received: by 2002:a2e:858c:: with SMTP id b12mr2034864lji.160.1584526658415;
 Wed, 18 Mar 2020 03:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <158452367157.23699.16109085564905174396.sendpatchset@octo> <CAMuHMdXZNGMGE6h=dj_fFwDCumcowZt-vifyXBNb4gqOQWj+Ug@mail.gmail.com>
In-Reply-To: <CAMuHMdXZNGMGE6h=dj_fFwDCumcowZt-vifyXBNb4gqOQWj+Ug@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 18 Mar 2020 19:17:26 +0900
Message-ID: <CANqRtoSoeZD_aFSfUnM09SEEv3myDXSq2E6vKCqeK4tZWj13Xg@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: salvator-common: gpio-leds prototype
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Mar 18, 2020 at 6:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Wed, Mar 18, 2020 at 10:35 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > This patch adds support for a couple of LEDs on Salvator-X and XS boards.
>
> Thanks for your patch!

Thanks. Not exactly rocket science!

> > I've verified that LED4, LED5 and LED6 work by exporting GPIOs for GP6_11,
> > GP6_12 and GP6_13 on the board on port 9011. This patch has not yet been
> > tested though. Also to make matters slightly more complicated, even if LEDs
> > might work with this patch as-is, the code in this patch is most likely not
> > suitable for upstream consumption. This since SW20, SW21 and SW22 are also
> > using the same GPIOs as the LEDs.
>
> Indeed. I think we should add kernel support for sharing GPIOs this way,
> before we can describe the LEDs in DT.  Else we'll introduce a regression,
> depending on which driver is bound first.

Totally agree.

> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> As this matches with an old local patch of mine:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, I'm not gonna apply it, without a fix for the sharing issue.

Sure, makes sense!

Thanks,

/ magnus
