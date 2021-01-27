Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4A30555D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 09:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhA0IOx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jan 2021 03:14:53 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40521 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbhA0IMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:12:44 -0500
Received: by mail-ot1-f54.google.com with SMTP id i20so878532otl.7;
        Wed, 27 Jan 2021 00:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f/iQz33kgh6xnvFreqr2JBmntO4WEFL9xyCLy3xIbC0=;
        b=lQU3TTzCvmXOd5XXe8arsoH7nSZ2eJDyaFxuTqtkBamLgmWGEIClVHJXSzpyV/ejML
         36+7aL5aNzt+5HufGEixm2cKgHGM17fVV4O4LpYBBODWfges9TiB9A4f/lyeXaoGszHL
         R16kTUqBYLEGoOubmvtCLrrI7J2SmIYMHMuWMNzwlomB/vSkyVBXd2+yw+s27DsQb5wD
         h783tc9wyDceAIyaZtJbQq1ST6i/Acdzd5rhBGdOGTUMdt9DKGgAXrUL2pIdQ9TCx5YN
         nMxzq81DLZl3xENbEdW7qmCw/RfbmbaUDtRUVT/dB2lG9+CeIcXRcsRRbv9fhr71Dzid
         LOTw==
X-Gm-Message-State: AOAM530VdHb0sXUlSRZyNGHQe4ddUdnYajwaezpTj6h7O760blryJDfK
        DH65fEZ7aw8dy+VCTXSc3a/hB5wpHyJF6fW6OXA=
X-Google-Smtp-Source: ABdhPJwVJ5QU5cyczh35eHMkHRGaSDc7rqd/vvSHWfq2Q98yCiYxVmsxiAo478eNiF+zbFazNblMbwe+/6t4Iz2fDp0=
X-Received: by 2002:a05:6830:1489:: with SMTP id s9mr6101130otq.250.1611735051520;
 Wed, 27 Jan 2021 00:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20210125142431.1049668-1-geert+renesas@glider.be>
 <20210125142431.1049668-5-geert+renesas@glider.be> <YBCREUMJ0/LgxDlJ@pendragon.ideasonboard.com>
In-Reply-To: <YBCREUMJ0/LgxDlJ@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Jan 2021 09:10:40 +0100
Message-ID: <CAMuHMdUqCTvCQUmL-m7C=W0id+Oh5OqPxySutOs9DEdWnzKYEg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dmaengine: rcar-dmac: Add support for R-Car V3U
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dmaengine <dmaengine@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Jan 26, 2021 at 11:01 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 25, 2021 at 03:24:31PM +0100, Geert Uytterhoeven wrote:
> > The DMACs (both SYS-DMAC and RT-DMAC) on R-Car V3U differ slightly from
> > the DMACs on R-Car Gen2 and other R-Car Gen3 SoCs:
> >   1. The per-channel registers are located in a second register block.
> >      Add support for mapping the second block, using the appropriate
> >      offsets and stride.
> >   2. The common Channel Clear Register (DMACHCLR) was replaced by a
> >      per-channel register.
> >      Update rcar_dmac_chan_clear{,_all}() to handle this.
> >      As rcar_dmac_init() needs to clear the status before the individual
> >      channels are probed, channel index and base address initialization
> >      are moved forward.
> >
> > Inspired by a patch in the BSP by Phong Hoang
> > <phong.hoang.wz@renesas.com>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/dma/sh/rcar-dmac.c
> > +++ b/drivers/dma/sh/rcar-dmac.c
> > @@ -189,7 +189,8 @@ struct rcar_dmac_chan {
> >   * struct rcar_dmac - R-Car Gen2 DMA Controller
> >   * @engine: base DMA engine object
> >   * @dev: the hardware device
> > - * @iomem: remapped I/O memory base
> > + * @dmac_base: remapped base register block
> > + * @chan_base: remapped channel register block (optional)
> >   * @n_channels: number of available channels
> >   * @channels: array of DMAC channels
> >   * @channels_mask: bitfield of which DMA channels are managed by this driver
> > @@ -198,7 +199,8 @@ struct rcar_dmac_chan {
> >  struct rcar_dmac {
> >       struct dma_device engine;
> >       struct device *dev;
> > -     void __iomem *iomem;
> > +     void __iomem *dmac_base;
> > +     void __iomem *chan_base;
> >
> >       unsigned int n_channels;
> >       struct rcar_dmac_chan *channels;

> > @@ -339,12 +344,23 @@ static void rcar_dmac_chan_write(struct rcar_dmac_chan *chan, u32 reg, u32 data)
> >  static void rcar_dmac_chan_clear(struct rcar_dmac *dmac,
> >                                struct rcar_dmac_chan *chan)
> >  {
> > -     rcar_dmac_write(dmac, RCAR_DMACHCLR, BIT(chan->index));
> > +     if (dmac->chan_base)
>
> Using dmac->chan_base to check if the device is a V3U seems a bit of a
> hack (especially given that the field is otherwise unused). I'd prefer
> adding a model field to struct rcar_dmac_of_data and struct rcar_dmac.

The check is not a check for R-Car V3U in particular, but a check for
the presence of a separate register block for channel registers.
I expect to see more SoCs having this, so IMHO checking for this feature,
instead of checking a model field, makes sense.

It's indeed unused otherwise, as beyond probe(), where per-channel bases
are calculated, no access to this pointer is needed anymore, (you can
blame devm_*() for not needing the pointer ;-)
Note that a model field would be "otherwise unused", too ;-)

> > +             rcar_dmac_chan_write(chan, RCAR_V3U_DMACHCLR, 1);
> > +     else
> > +             rcar_dmac_write(dmac, RCAR_DMACHCLR, BIT(chan->index));
> >  }
> >
> >  static void rcar_dmac_chan_clear_all(struct rcar_dmac *dmac)
> >  {
> > -     rcar_dmac_write(dmac, RCAR_DMACHCLR, dmac->channels_mask);
> > +     struct rcar_dmac_chan *chan;
> > +     unsigned int i;
> > +
> > +     if (dmac->chan_base) {
> > +             for_each_rcar_dmac_chan(i, chan, dmac)
> > +                     rcar_dmac_chan_write(chan, RCAR_V3U_DMACHCLR, 1);
> > +     } else {
> > +             rcar_dmac_write(dmac, RCAR_DMACHCLR, dmac->channels_mask);
> > +     }
> >  }
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -1744,7 +1760,6 @@ static const struct dev_pm_ops rcar_dmac_pm = {
> >
> >  static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
> >                               struct rcar_dmac_chan *rchan,
> > -                             const struct rcar_dmac_of_data *data,
> >                               unsigned int index)
> >  {
> >       struct platform_device *pdev = to_platform_device(dmac->dev);
> > @@ -1753,9 +1768,6 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
> >       char *irqname;
> >       int ret;
> >
> > -     rchan->index = index;
> > -     rchan->iomem = dmac->iomem + data->chan_offset_base +
> > -                    data->chan_offset_stride * index;
> >       rchan->mid_rid = -EINVAL;
> >
> >       spin_lock_init(&rchan->lock);
> > @@ -1842,6 +1854,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
> >       const struct rcar_dmac_of_data *data;
> >       struct rcar_dmac_chan *chan;
> >       struct dma_device *engine;
> > +     void __iomem *chan_base;
> >       struct rcar_dmac *dmac;
> >       unsigned int i;
> >       int ret;
> > @@ -1880,9 +1893,24 @@ static int rcar_dmac_probe(struct platform_device *pdev)
> >               return -ENOMEM;
> >
> >       /* Request resources. */
> > -     dmac->iomem = devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(dmac->iomem))
> > -             return PTR_ERR(dmac->iomem);
> > +     dmac->dmac_base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(dmac->dmac_base))
> > +             return PTR_ERR(dmac->dmac_base);
> > +
> > +     if (!data->chan_offset_base) {
> > +             dmac->chan_base = devm_platform_ioremap_resource(pdev, 1);
> > +             if (IS_ERR(dmac->chan_base))
> > +                     return PTR_ERR(dmac->chan_base);
> > +
> > +             chan_base = dmac->chan_base;
> > +     } else {
> > +             chan_base = dmac->dmac_base + data->chan_offset_base;
> > +     }
> > +
> > +     for_each_rcar_dmac_chan(i, chan, dmac) {
> > +             chan->index = i;
>
> Now that chan->indew is set before calling rcar_dmac_chan_probe(), you
> don't have to pass the index to rcar_dmac_chan_probe() anymore.

Right, will fix.

> > +             chan->iomem = chan_base + i * data->chan_offset_stride;
> > +     }
> >
> >       /* Enable runtime PM and initialize the device. */
> >       pm_runtime_enable(&pdev->dev);
> > @@ -1929,7 +1957,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
> >       INIT_LIST_HEAD(&engine->channels);
> >
> >       for_each_rcar_dmac_chan(i, chan, dmac) {
> > -             ret = rcar_dmac_chan_probe(dmac, chan, data, i);
> > +             ret = rcar_dmac_chan_probe(dmac, chan, i);
> >               if (ret < 0)
> >                       goto error;
> >       }

Thanks for your comments!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
