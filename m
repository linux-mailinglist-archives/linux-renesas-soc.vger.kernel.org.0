Return-Path: <linux-renesas-soc+bounces-29898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBpWOETzu2lkqgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:59:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3092CB949
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1E8C304465D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6F33D413F;
	Thu, 19 Mar 2026 12:59:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0133D3492
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925144; cv=none; b=swk0bXdDf6pHHpt/hBEW0o3qI9PXGCGSlGxXE/1bCk5Az7rWeyBdn/b4VZeYkEVZ/QcT/c9RfDYL2FuegC1l+iZqCEBkRhKswHjWjSd9jhnXkglnXV+UYJlCQg68pvQbIgYcSrFrBlU35VF6Q2BPpESusWgD+Bs4PerqkYuQ/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925144; c=relaxed/simple;
	bh=0N/8WtKVotwWrreFUlfaV5m9aUHPsPh5U3Ko09fb/j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/4MfsM+9J/XmLE4JGIW2rRFfhprmgW84iHVYpk1ks1BtztR/wtkeD0TUvT+TUCm6sGc8n+fZu3OfHF0m9yQzqnLLaU1Kd3TL7Jt0lf+xf0DTJt+joAy99Mu4cUNgFDwzvBcWaAokqYf0p9L04l2g3i/rrvlMK9gbO5dkvcv54M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6027ef7e068so591040137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925141; x=1774529941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RSiEbcDdKg9ZBTs+EHZe4/O3U8u7buQLYBqLbYChew=;
        b=GpqSedRYu8gv/a2ugTGqGFWdVNJ/tPfQhge6Oc561Vyymi/ZxR5/RYZ99y9APebiT0
         GG72paB0KPCHAIevj17cYEc2SLKu/yVgHO2kNajKtLvE2nLrDIp1YN1bPpgH37eNware
         yOh6heBfObCwNa53b/Rh9PX7T8IZCgIM1/pnkeeEpHR89wUzG7h+ScY+/gk4scXoAo84
         87t1xPcKSbvAb6/hP5U1Om9DTwRlo9LpB9IvGFL+I3qyBQsOl4DIPUEygnVI8VCBFRK8
         RKCD1iaqZFb/I4Mxr3l5dq8SAEqiK6uPk72kR4+DLWOqZv4n1u6ebBDc0hgLCgcuU0Dz
         /iqg==
X-Gm-Message-State: AOJu0YxFLEBXIPN8x+9/OjkKUyJoION2I9ra314gIQk/Fb888922zZmy
	HXelWdg7vFnt6/g3s5gsTGafwCcaFBZrYjMwTQuvCdZCm924zUc6FdP5t3DwSXdp
X-Gm-Gg: ATEYQzxBiVp0si0pIb+pOjvrPso+x920FnN4VWl1zy2koHBlLJ7DjsEVBElUbwywLMn
	/QmQ97CQrXs1GzrwAGOf6y8gU93aI/hmn+ZCBL3iBnVkovnHAqjxq+MKap2YDD46L3SyIiHmDaY
	asBKupopXwNUOKxOHZD2vvOPjRIuQFYV5KM4f9zl779/df+pf0XwYLwTnyYMb744dIEOTyYJGg3
	paevdnywCrmhgpl8m0b/cKv+AzRB7BAkYbKT5AFFYtGoAu6Hhv7dx6VRO140LrUqyDwKxPISYZX
	6n9SuAxUE1epIhBOEWAc0eeZjbohaGF+xOzEigix08mG84lHO6vWyLKuS+py0Pd60osI4TruCrn
	oM5Psk7NChjmen8oEJDOu6BKbjmmnnP5FIESnOhIHdvPgRaSO0tmIHBYjaN8pBHeMEoTs2oZJ1V
	tHwAbFSQhAKCJ30QrKb+R1c0aMM3kaWNH8AVeFThcjBdEJQ6CkkNID094fxahb
X-Received: by 2002:a05:6102:a53:b0:5ff:ea89:44b5 with SMTP id ada2fe7eead31-6027d3bf72dmr3763698137.32.1773925140595;
        Thu, 19 Mar 2026 05:59:00 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951034737d0sm2655632241.13.2026.03.19.05.59.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:59:00 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6027ef7e068so591028137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:59:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec6:b0:600:a2:138c with SMTP id
 ada2fe7eead31-6027d2cedaemr3739367137.23.1773925140124; Thu, 19 Mar 2026
 05:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com> <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 13:58:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
X-Gm-Features: AaiRm52k5SFQocG3WYyTenDg8QkAR8gHfFPyDS2z7NwCFwCXEzGhzBOR3rInhVE
Message-ID: <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29898-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.383];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: 5B3092CB949
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Tue, 17 Mar 2026 at 14:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas R-Car MFIS offers multiple features but most importantly
> mailboxes and hwspinlocks. Because they share a common register space
> and a common register unprotection mechanism, a single driver was chosen
> to handle all dependencies. (MFD and auxiliary bus have been tried as
> well, but they failed because of circular dependencies.)
>
> In this first step, the driver implements common register access and a
> mailbox controller. hwspinlock support will be added incrementally, once
> the subsystem allows out-of-directory drivers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/rcar-mfis.c

> +struct mfis_info {
> +       u32 unprotect_mask;
> +       unsigned int mb_num_channels;
> +       unsigned int mb_reg_comes_from_dt:1;
> +       unsigned int mb_tx_uses_eicr:1;
> +       unsigned int mb_channels_are_unidir:1;
> +};
> +
> +struct mfis_per_chan_priv {

I would drop the "per_".

> +       u32 reg;
> +       int irq;
> +};
> +
> +struct mfis_priv {
> +       struct device *dev;
> +       struct mfis_reg common_reg;
> +       struct mfis_reg mbox_reg;
> +       const struct mfis_info *info;
> +
> +       /* mailbox private data */
> +       struct mbox_controller mbox;
> +       struct mfis_per_chan_priv *per_chan_privs;

Likewise.
This could be a flexible array, if it weren't for the hwspinlock array
you will have to add later, right?

> +};
> +
> +static u32 mfis_read(struct mfis_reg *mreg, unsigned int reg)
> +{
> +       return ioread32(mreg->base + reg);
> +}
> +
> +static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)

Both writel() and iowrite32() use the inverse order of "reg" and "val".
But I can understand you want to keep "mreg" and "reg" together.

> +{
> +       struct mfis_priv *priv = mreg->priv;
> +       u32 unprotect_mask = priv->info->unprotect_mask;
> +       u32 unprotect_code;
> +
> +       /*
> +        * [Gen4] key: 0xACCE0000, mask: 0x0000FFFF
> +        * [Gen5] key: 0xACC00000, mask: 0x000FFFFF
> +        */
> +       unprotect_code = (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
> +                        ((mreg->start | reg) & unprotect_mask);
> +
> +       iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
> +       iowrite32(val, mreg->base + reg);
> +}
> +
> +/****************************************************
> + *                     Mailbox

Missing closing asterisk ;-)

> + ****************************************************/
> +
> +#define mfis_mb_mbox_to_priv(_m) container_of((_m), struct mfis_priv, mbox)

Both "mb" and "mbox", so perhaps mfis_mbox_to_priv()?
And perhaps s/mb_/mbox_/ everywhere?

> +static int mfis_mb_startup(struct mbox_chan *chan)
> +{
> +       struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
> +       int ret = 0;
> +
> +       if (per_chan_priv->irq)
> +               ret = request_irq(per_chan_priv->irq, mfis_mb_iicr_interrupt, 0,
> +                                 dev_name(chan->mbox->dev), chan);
> +
> +       return ret;

You can reduce indentation, and get rid of ret, by inverting the
conditional.

> +}
> +
> +static void mfis_mb_shutdown(struct mbox_chan *chan)
> +{
> +       struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
> +
> +       free_irq(per_chan_priv->irq, chan);

if (per_chan_priv->irq) ...

free_irq() seems to support zero, but irq_to_desc() still has to
traverse the mtree.

> +}

> +static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
> +                                         const struct of_phandle_args *sp)
> +{
> +       struct mfis_priv *priv = mfis_mb_mbox_to_priv(mbox);
> +       struct mfis_per_chan_priv *per_chan_priv;
> +       struct mbox_chan *chan;
> +       u32 chan_num, chan_flags;
> +       bool tx_uses_eicr, is_only_rx;
> +
> +       if (sp->args_count != 2)
> +               return ERR_PTR(-EINVAL);
> +
> +       chan_num = sp->args[0];

"chan_num" is the hardware channel number, and should be validated
against mpriv->info->mb_num_channels.

> +       chan_flags = sp->args[1];
> +
> +       /* Channel layout is described in mfis_mb_probe() */

Given you already use "chan += ..." below, perhaps:

    chan = mbox->chans + chan_num;

> +       if (priv->info->mb_channels_are_unidir) {
> +               is_only_rx = chan_flags & MFIS_CHANNEL_RX;
> +               chan = mbox->chans + 2 * chan_num + is_only_rx;

...and:

    chan += chan_num + is_only_rx;

> +       } else {
> +               is_only_rx = false;
> +               chan = mbox->chans + chan_num;

... and drop this line?
With a proper preinitalization of is_only_rx, the whole "else" branch
can be dropped.

> +       }
> +
> +       if (priv->info->mb_reg_comes_from_dt) {
> +               tx_uses_eicr = chan_flags & MFIS_CHANNEL_EICR;
> +               if (tx_uses_eicr)
> +                       chan += mbox->num_chans / 2;
> +       } else {
> +               tx_uses_eicr = priv->info->mb_tx_uses_eicr;
> +       }

"chan - mbox->chans" is the logical channel number, and should be
validated against mbox_num_chans, to avoid out-of-bound accesses.

> +
> +       per_chan_priv = chan->con_priv;
> +       per_chan_priv->reg = chan_num * 0x1000 + (tx_uses_eicr ^ is_only_rx) * 4;

I think it would be good to document this register is either an IICR
or EICR register offset, through:
  1. A comment, or
  2. Definitions and code, e.g

         #define MFISIICR 0x00
         #define MFISEICR 0x04

         if (tx_uses_eicr ^ is_only_rx)
             per_chan_priv->reg = chan_num * 0x1000 + MFISEICR;
         else
             per_chan_priv->reg = chan_num * 0x1000 + MFISIICR;

     Or:

         #define MFISIICR(i) ((i) * 0x1000 + 0x00)
         #define MFISEICR(i) ((i) * 0x1000 + 0x04)

         per_chan_priv->reg = (tx_uses_eicr ^ is_only_rx) ? MFISEICR(chan_num)
                                                          : MFISIICR(chan_num);

> +
> +       if (!priv->info->mb_channels_are_unidir || is_only_rx) {
> +               char irqname[8];
> +               char suffix = tx_uses_eicr ? 'i' : 'e';
> +
> +               /* "ch0i" or "ch0e" */
> +               scnprintf(irqname, sizeof(irqname), "ch%d%c", chan_num, suffix);

"%u" for unsigned chan_num.

> +
> +               per_chan_priv->irq = of_irq_get_byname(mbox->dev->of_node, irqname);
> +               if (per_chan_priv->irq < 0)
> +                       return ERR_PTR(per_chan_priv->irq);
> +               else if (per_chan_priv->irq == 0)

No need for "else" after "return".

> +                       return ERR_PTR(-ENOENT);
> +       }
> +
> +       return chan;
> +}
> +
> +static int mfis_mb_probe(struct mfis_priv *priv)
> +{
> +       struct device *dev = priv->dev;
> +       struct mbox_chan *chan;
> +       struct mbox_controller *mbox;
> +       unsigned int i, num_chan = priv->info->mb_num_channels;

"i" is only used in the for-loop below, so you could declare it in the
for-statement. As a bonus, that would avoid mixing the declaration of
uninitialized and initialized variables.

> +
> +       if (priv->info->mb_channels_are_unidir)
> +               /* Channel layout: Ch0-TX, Ch0-RX, Ch1-TX... */
> +               num_chan *= 2;
> +
> +       if (priv->info->mb_reg_comes_from_dt)
> +               /* Channel layout: <n> IICR channels, <n> EICR channels */
> +               num_chan *= 2;

Curly braces around multi-line if-branches (even if they are comments)?

> +
> +       chan  = devm_kcalloc(dev, num_chan, sizeof(*chan), GFP_KERNEL);
> +       if (!chan)
> +               return -ENOMEM;
> +
> +       priv->per_chan_privs = devm_kcalloc(dev, num_chan, sizeof(*priv->per_chan_privs),
> +                                           GFP_KERNEL);
> +       if (!priv->per_chan_privs)
> +               return -ENOMEM;
> +
> +       mbox = &priv->mbox;
> +
> +       for (i = 0; i < num_chan; i++)
> +               chan[i].con_priv = &priv->per_chan_privs[i];
> +
> +       mbox->chans = chan;
> +       mbox->num_chans = num_chan;
> +       mbox->txdone_poll = true;
> +       mbox->ops = &mfis_iicr_ops;
> +       mbox->dev = dev;
> +       mbox->of_xlate = mfis_mb_of_xlate;
> +
> +       return mbox_controller_register(mbox);
> +}
> +
> +/****************************************************
> + *             Common

Missing closing asterisk.

> + ****************************************************/
>
> +static int mfis_reg_probe(struct platform_device *pdev, struct mfis_priv *priv,
> +                         struct mfis_reg *mreg, const char *name, bool required)
> +{
> +       struct resource *res;
> +       void __iomem *base;
> +
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +
> +       /* If there is no mailbox resource, registers are in the common space */
> +       if (!res && !required) {

Given you only test for the negated "!required", perhaps invert the
logic, and replace "required" by "optional"?

> +               priv->mbox_reg = priv->common_reg;

This left me looking for an assignment to priv->mbox_reg in the "else"
branch ;-) Then I realized "&priv->mbox_reg" is passed as the "mreg"
parameter.  Hence perhaps:

    *mreg = priv->common_reg;

?

> +       } else {
> +               base = devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base))
> +                       return PTR_ERR(base);
> +
> +               mreg->base = base;
> +               mreg->start = res->start;
> +               mreg->priv = priv;
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

