Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8B1165BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 16:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfEGOdp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 10:33:45 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38352 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfEGOdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 10:33:45 -0400
Received: by mail-ua1-f68.google.com with SMTP id t15so6098911uao.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 07:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2+nW9Fa/RTU+kRi8Kjd9YcSYvGzElthXAVs65d+tibQ=;
        b=Nw3tAP3H2UxaGn9a0XQ9jx2bSTobTYc6fxjt74yCHQgO2TsnqK7WH6oOF0PVmGoVhn
         ngAAAs+7fjsr4bSdCM3J+JVmhsJ7tRq91iS/bZrTcK3TIOc2DIz28do92r6fnT9gasgD
         +MDTMp3ZwGmbAbe2sdH9yb2ARyuWR5DehCccSOY0ciY/mGpBpt1ANOev7T1NG76lxY8B
         4FhtXa6lKfOKAmW3Z22iQkfQdIlPMqUY8rm0xV/pCRidW/VtoF/54MjvwXQD3PMvRp/T
         4EgCiXsAWrtf41Jkx10ysITCj1bBFwhda1X8ius2qVx6Z6qtLdr2JL7/3wKTtJY5wjiv
         AFTw==
X-Gm-Message-State: APjAAAVUoSO6UCe9rT88l2Sa0tRf5nEPqB2vbLxYIVPxuNk929VWMvDT
        zD3H1Nbxf99tcvSIdEDUP8VyFqc0e5Gn3QwBs3o=
X-Google-Smtp-Source: APXvYqyRJBFuMI4/6SrePGR2PEWd4v4APR9kNxFQAR6mYPQ+bUkCVpjNeBgKi6yNF0zZO11+y9M34blQ2ACJ2/i1JBE=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr16594003uao.86.1557239623947;
 Tue, 07 May 2019 07:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com> <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se> <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com> <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
In-Reply-To: <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 16:33:31 +0200
Message-ID: <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Jonas Bonn <jonas@norrbonn.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Tue, May 7, 2019 at 3:25 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/07/2019 04:15 PM, Tudor Ambarus wrote:
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 73172d7f512b..b94a6eaaaca5 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1551,6 +1551,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
> >         u8 sr_cr[2];
> >         int ret;
> >
> > +       dev_err(dev, "%s\n", __FUNCTION__);

This one isn't triggered.

> >         /* Check current Quad Enable bit value. */
> >         ret = read_cr(nor);
> >         if (ret < 0) {
> > @@ -3911,6 +3912,12 @@ static int spi_nor_setup(struct spi_nor *nor,
> >  static int spi_nor_init(struct spi_nor *nor)
> >  {
> >         int err;
> > +       u8 val;
> > +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > +
> > +       /* Check current Quad Enable bit value. */
> > +       val = read_cr(nor);
> this should have been:
>         val = read_sr(nor);
> sorry.
>
> > +       dev_err(nor->dev, "%s val = %02x\n", val);
> and here
>         dev_err(nor->dev, "%s val = %02x\n", __FUNCTION__, val);

m25p80 spi0.0: spi_nor_init val = 00

so the masking trick doesn't help :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
