Return-Path: <linux-renesas-soc+bounces-30094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JOHJBoRwWk7QQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:08:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6772EFB45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84DF2300EA9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 10:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2DA37D101;
	Mon, 23 Mar 2026 10:02:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AF427B327
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260139; cv=none; b=ldN9y0LGCTKsTiFInw5p97wkFfXgvEUYQMNBa4MUxinNe0EkMMP33LwEUxWFxhbhLD+KQKsIFbIldDDRz2tX+LJJBGNXlY7NwWKl4rWBaeSK1IsNY9aDgeSvtJorcHjAvsbEkxBSCwVCfG3xO0R5BGKwhqqyDrLovLZa2LGRqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260139; c=relaxed/simple;
	bh=T5G+dtR03ducshqY6zvYtirI4VdqNulruwhFhl00KBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUYpD0uS9dNNfyqH1Jo2MfB8z4UySRXbb/GekZIh8MDiIfGxWYDuUkcqHUmcyICd/Gejx5RpMe8SpdSGQU0xs+8aPeYdq2V61KYl8JTojbd7baaaGotkMyPRvimi0orB7x+DR52NJtoDvQjECSVb1mmkunlPf6GtWmqwzc7vpVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so3804827e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 03:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260136; x=1774864936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGtOhKqghU6N+NjbE+A8sUjWn5liKfe5KomG235pN3o=;
        b=sxspnomdPj28haZ+WLE1yw/YlkBQbt+p5wAjIQuy4qaxeXLaGJKXRECeRAQBzB8ABU
         dtb6S9xuKlEa0dZOn8tO2W7VdgjibgR5XN/vxwI6TnbrHqUbX7ySAa/mHjb54xt77nlh
         nQFMrnFHZfWDjP4zhpGlFGH0wIaDHWwGhjD5//dW3auu85YPM/6B0LFtXKu+75L9eDl7
         JIJGVeCp58x8LhUP/Zxhzo0zI3v9D4d4sI1aGkFenV7t++SQ7qHAQof8RlKemKBR6baz
         UGWelCZxZUaasjki89/1bIQvEcYBdgCyTIJXiBKdQbBCL1YSSkp4tno8LQ/L0sOp+zA4
         Psrg==
X-Gm-Message-State: AOJu0YwqYW6Krynizk3+JE8seLIIdaEe/inaBehMRIf3lfzB3+VwkDuC
	u1mFuysra3TJYHxq5M9emJ9BraK1mAirJEvP/pF1az1jEAL+DRv6TPTojh1AA5Pk
X-Gm-Gg: ATEYQzzloX2845b2MVJRs6E5qKdjq3soKhbf7uC5ec50ZOcexBFuc3qFiWIUM33qI4K
	763CaUsNL7KaXek737aGEqEnV1W+jpl7E4AzKT87jcX1DPIeq2CAkMlbu2KSFqxiSyWy+krsM/U
	8PzkI1m8jxobCn6SzvcHEIekAor1aCamCDDQifSYnS6Pth9xEOUw24k0lsiSwmNZWuCLGThcdz/
	7b+wvaA84v5L2f5yt0Q1VTflMQ1gAzjNGod6M1e81jLDk2XiJaeFUAB+rTC89+bddK7a8h4mou0
	aZTBDy7+w4P8m4xx6YoQ1ThurmH9XlGylSyVB4n0LnjmBkC1o9VraLPUdM7feFcPE2EqFDA1w76
	HpV01MO+c6B91PJ9VoLlt5qBhg/PTBUcVc82Toy8861orcQH9UDFOobCnnVKNut7OQ7yzq3T1CF
	w+kfrB3kytuK4U2cH5kk85MTxPq+e2wU4J4dQjIWIrhm9L3U0muAszWJtd/M1H9VHy
X-Received: by 2002:a05:6122:6090:b0:567:4f98:fb82 with SMTP id 71dfb90a1353d-56cde08d915mr5352243e0c.7.1774260136145;
        Mon, 23 Mar 2026 03:02:16 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb94eaasm10179576e0c.8.2026.03.23.03.02.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:02:15 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so3804808e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 03:02:15 -0700 (PDT)
X-Received: by 2002:a05:6122:c181:b0:56b:8003:c2 with SMTP id
 71dfb90a1353d-56ccff5ab67mr5402187e0c.8.1774260135201; Mon, 23 Mar 2026
 03:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com> <ab-vWbjdlAIt1qaX@ninjato>
In-Reply-To: <ab-vWbjdlAIt1qaX@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Mar 2026 11:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxbKEbm6EoZmVwnoT5uiBZqwrZ6hYpWieW=-K5uVEARw@mail.gmail.com>
X-Gm-Features: AQROBzCkJnqZdNNipvdPMo9TBOEZnXCGcSWEa0egNojP2rWTU14smqdZoGOIlh4
Message-ID: <CAMuHMdUxbKEbm6EoZmVwnoT5uiBZqwrZ6hYpWieW=-K5uVEARw@mail.gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com,renesas.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30094-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: EB6772EFB45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Sun, 22 Mar 2026 at 09:59, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I am usually not into AI but I can definitely see value in its review
> assistance. So, I checked what Sashiko thinks of my series and found the
> comments to be largely reasonable. I'll copy and answer them here, a)
> for a more complete review process and b) to give feedback to the
> Sashiko-devs (CCed). Thank you for the service and efforts, I hope we
> can justify the additional energy consumption here. Please let me know
> if such replies are actually helpful for you.
>
> > > +static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
> > > +{
> > > +   struct mfis_priv *priv = mreg->priv;
> > > +   u32 unprotect_mask = priv->info->unprotect_mask;
> > > +   u32 unprotect_code;
> > > +
> > > +   /*
> > > +    * [Gen4] key: 0xACCE0000, mask: 0x0000FFFF
> > > +    * [Gen5] key: 0xACC00000, mask: 0x000FFFFF
> > > +    */
> > > +   unprotect_code = (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
> > > +                    ((mreg->start | reg) & unprotect_mask);
> >
> > The mreg->start and reg variables are combined with a bitwise OR. If
> > mreg->start has overlapping bits with the reg offset, could this yield an
> > incorrect physical address for the unprotect code? Should this use
> > addition like mreg->start + reg instead?
>
> No, if a device tree is so wrongly setup that the bits overlap, then '+'
> instead of '|' will only lead to a different wrong address.

While there are no overlapping bits, and thus both OR and PLUS have
the same effect, I agree PLUS is More Correct(TM), as that matches
what you are using in the second iowrite32() below.

> > > +
> > > +   iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
> > > +   iowrite32(val, mreg->base + reg);
> > > +}
>
> > Can mfis_write() be called concurrently by different processors or
> > interrupted by an interrupt handler like mfis_mb_iicr_interrupt()?
>
> Yes, it can. It even needs a hwspinlock instead of a regular spinlock
> because it needs protection against cores which may not run Linux.
> hwspinlock support will only be added later because of dependency
> issues. My plan was to add the protection once we got hwspinlocks. But
> maybe I should add just spinlocks now and convert them to hwspinlocks
> once their support is in.

Have you ever triggered this race condition when running the mbox
test? Or is that impossible due to locking elsewhere?

> > > +static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
> > > +                                     const struct of_phandle_args *sp)
> > > +{
> > > +   struct mfis_priv *priv = mfis_mb_mbox_to_priv(mbox);
> > > +   struct mfis_per_chan_priv *per_chan_priv;
> > > +   struct mbox_chan *chan;
> > > +   u32 chan_num, chan_flags;
> > > +   bool tx_uses_eicr, is_only_rx;
> > > +
> > > +   if (sp->args_count != 2)
> > > +           return ERR_PTR(-EINVAL);
> > > +
> > > +   chan_num = sp->args[0];
> > > +   chan_flags = sp->args[1];
> > > +
> > > +   /* Channel layout is described in mfis_mb_probe() */
> > > +   if (priv->info->mb_channels_are_unidir) {
> > > +           is_only_rx = chan_flags & MFIS_CHANNEL_RX;
> > > +           chan = mbox->chans + 2 * chan_num + is_only_rx;
>
> > Does this code allow out-of-bounds access if a malformed device tree
> > provides an arbitrarily large chan_num? Should chan_num be checked against
> > priv->info->mb_num_channels before computing the chan pointer?
>
> Yes, Geert pointed this out as well.
>
> > [ ... ]
> > > +static int mfis_mb_probe(struct mfis_priv *priv)
> > > +{
> > [ ... ]
> > > +   mbox->chans = chan;
> > > +   mbox->num_chans = num_chan;
> > > +   mbox->txdone_poll = true;
> > > +   mbox->ops = &mfis_iicr_ops;
> > > +   mbox->dev = dev;
> > > +   mbox->of_xlate = mfis_mb_of_xlate;
> > > +
> > > +   return mbox_controller_register(mbox);
> > > +}
> > The mailbox controller is registered using mbox_controller_register(), but
> > the driver lacks a remove callback to unregister it.
> > If the driver is unbound, devres will free the devm_kzalloc structures
> > backing the mailbox. Will this result in a use-after-free regression since
> > the mailbox subsystem still retains the controller in its global lists?
> > Should devm_mbox_controller_register() be used instead?
> > [ ... ]
>
> Yes, this was overlooked so far.

.suppress_bind_attrs to the rescue? ;-)

> > > +static int mfis_probe(struct platform_device *pdev)
> > > +{
> > > +   struct mfis_priv *priv;
> > > +   struct device *dev = &pdev->dev;
> > > +   int ret;
> > > +
> > > +   priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +   if (!priv)
> > > +           return -ENOMEM;
> > > +
> > > +   priv->dev = dev;
> > > +   priv->info = of_device_get_match_data(dev);
> > Can of_device_get_match_data() return a null pointer here?
> > If the driver is bound manually via sysfs or instantiated in an environment
> > lacking device tree match data, would this lead to a null pointer
> > dereference regression later when accessing priv->info->mb_num_channels in
> > mfis_mb_probe()?
>
> The latter case would be clearly a driver bug. In addition with the
> former case, it probably makes sense to handle this more gracefully,
> though.

That is an interesting one I never considered before!
So far we always assumed of_device_get_match_data() cannot return
NULL if all match table entries have their .data members filled in.
However, you can indeed still trigger this by using driver_override
to bind to the wrong device, which obviously has no match entry at all:

On Salvator-XS:

# echo fe960000.vsp > /sys/bus/platform/drivers/vsp1/unbind
# echo renesas_spi > /sys/bus/platform/devices/fe960000.vsp/driver_override
# echo fe960000.vsp > /sys/bus/platform/drivers/renesas_spi/bind

BOOM!

Do we care about that?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

