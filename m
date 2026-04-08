Return-Path: <linux-renesas-soc+bounces-30962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JubDmwI1mnbAQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 09:49:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1473B8887
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 09:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 017513003319
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 07:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384D238F636;
	Wed,  8 Apr 2026 07:44:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E23638D686
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634289; cv=none; b=P1yyJdXPAVT9cFc89oWKXehMiXHqdcH6KsRXyConAtxBhFBLVsE835uHl2iEw0dfeKHBthJ1iHDJz+9LpLbEW2ki3RPB/QQkYAlkX+s2DQzeNp12pWScxibluHFhr46FNFraOdk0+0XarA0gxnCBeC3HyOblACCSm+gIMIgII/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634289; c=relaxed/simple;
	bh=Sedntlj+MRpt/fUUQE+k3MFmNCo9DsPGibGC+cz8uNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhNNeYKWuJ6KBcPCtwiOGkywFBhA5Pglurpd/pHnU5+DYR9JAMxXtOTMtgwpvLPngeGsfAvDw6kXuLgJC7YE/n4fDo0VoN7zmNImEQGVsfYKZuyJ01RqPVV5AR6LFeexxdm+9zmgF3NYPvUYDyzCxorzF9g3NalgnVF5oqsdf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso2770452e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 00:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775634285; x=1776239085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NEDWencaHGoC92/VXbD1rMBTxJckYQ0xVO4rQnCJYhI=;
        b=fBoxPda+dsw3+q1H+MsYdgBJUzqftoDxX/xuvYrmEBsNQp+m2/Jik8hcFYGE/L0M4M
         rdDwWDM7ZwuhWe3KI7+vQNy31QFdU8KAj1/iwUiLC0owSdaUbGETCCWvdAAz+wk/JURy
         nmKFIbC535QYh8tZUFn/A9tfqbEPXJznYlGk3pbelmx2DyYNFXm6jPREMBHImFSYSiBh
         pEk41wJsUJU+HBx7oTTUqG/B0teLwVj9oO2QqS40yM9UZ9Pqudh0sWN/rZP1R1xsSGbc
         e8zedgXFhWhtfmqkPl8GRt3L+X8GS6bXqHUekU6Zrew6kHOmPiSDK1TmoQWpBjmDTMqx
         n24A==
X-Forwarded-Encrypted: i=1; AJvYcCVQEZzM5+Aij2xZxOnz+cgrQA6gYCmC9E+Z4h5wOuftS4DFK/bw02NuRRocbGsTyl2yC+RnMG/1Yi27mcmiAMGfRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBPrH3ekD9s/FBwF+pwhzX6G5nL2ur10QGfxGaMPo9wUuTUvC
	oRDytm/tJKV38eSTxHE1jIPXWe5hhSyhULvoAf7jGDHsvzgMvzdcmqXabhiDfsjb
X-Gm-Gg: AeBDievrG7fhS2766XgiQxFg0+eW6+BVtCm9J++lktg6REDtjLpjksxKjJau3CkbDR4
	AqdoSlevKlB1e23bpAPtC0Sl8ZbpoARlMdnBtMzcvNQaPe48cN1xxpkbXcTuRp7J/qAG1yoDktl
	V46lnJstZLezAJcRBGywx4B6MRH82Osc5jXgh1+lWhH3RnW8pUZX8g+cxqtnV7E9CpZce2wMPI8
	l2tlVl4m5Tv0RIsMu0w+kG/2snEdZ4UI8WyfEZ90A1JbOZTQGFcnUpxoFZ1TOq6Ky+ueY1ahSpq
	VncJ9yEiv2qE/K+j9/XCrkwU9yYbaPeRQ3Syt93jkMQ0ThkGMeT6kPvRjLupqL7D7dR/0pETUlb
	4MXO6UytoPVmbLAkcd8M8yQN/X09wmxv4+89gk7oYi51yARv7Q7M5XHysuHcI1vXit30coXfARD
	t5/U5LHVQ7e3uro/SnW1EgtDWoZES4bVMQpHIyeq2BTxUDqD1ebsbwH66wpQFgoGmsWKhDxJW5W
	Bk=
X-Received: by 2002:a05:6122:83d3:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-56daba09bdbmr3999647e0c.12.1775634285386;
        Wed, 08 Apr 2026 00:44:45 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9b75dsm19825292e0c.12.2026.04.08.00.44.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:44:45 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9076813bso2770446e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 00:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU35nSYysXLJJ4irlrzyzQBBY3L64sQBVcNjEFa/k+A4f8aHMkmV81TifhJtx1SNlw7YXsm33lMN2O41NFVRAnUfw==@vger.kernel.org
X-Received: by 2002:a05:6122:d1e:b0:56c:da22:6921 with SMTP id
 71dfb90a1353d-56dab89ee50mr7759922e0c.5.1775634285014; Wed, 08 Apr 2026
 00:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWnjV=HGE1o08zLhUfTgOSene5fYx1J5GG10mB+Toq8qg@mail.gmail.com> <20260407185443.GC2551274@ragnatech.se>
In-Reply-To: <20260407185443.GC2551274@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 09:44:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULBf3fBZU62F3YgBtJGzyTQgM-S-c9rhtX=cUCkqDQbA@mail.gmail.com>
X-Gm-Features: AQROBzBzKJdNv4YGImgP7NuYcmguQh7usD6WewdHOw4ygij9zBJGnfG3HJWNFS4
Message-ID: <CAMuHMdULBf3fBZU62F3YgBtJGzyTQgM-S-c9rhtX=cUCkqDQbA@mail.gmail.com>
Subject: Re: [net-next] net: ethernet: ravb: Suspend and resume the
 transmission flow
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Barker <paul@pbarker.dev>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30962-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.329];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,ragnatech.se:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8B1473B8887
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Niklas,

On Tue, 7 Apr 2026 at 20:54, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2026-04-07 11:03:38 +0200, Geert Uytterhoeven wrote:
> > On Wed, 1 Apr 2026 at 20:39, Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > >
> > > From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >
> > > The current driver does not follow the latest datasheet and does not
> > > suspend the flow when stopping DMA and resume it when starting. Updat=
e
> > > the driver to do so.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > [Niklas: Rebase from BSP and reword commit message]
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch, which is now commit 353d8e7989b6babe ("net:
> > ethernet: ravb: Suspend and resume the transmission flow") in
> > linux-next/master net-next.
> >
> > > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > > @@ -694,6 +694,9 @@ static int ravb_dmac_init(struct net_device *ndev=
)
> > >         const struct ravb_hw_info *info =3D priv->info;
> > >         int error;
> > >
> > > +       /* Clear transmission suspension */
> > > +       ravb_modify(ndev, CCC, CCC_DTSR, 0);
> > > +
> > >         /* Set CONFIG mode */
> > >         error =3D ravb_set_opmode(ndev, CCC_OPC_CONFIG);
> > >         if (error)
> > > @@ -1103,6 +1106,12 @@ static int ravb_stop_dma(struct net_device *nd=
ev)
> > >         if (error)
> > >                 return error;
> > >
> > > +       /* Request for transmission suspension */
> > > +       ravb_modify(ndev, CCC, CCC_DTSR, CCC_DTSR);
> > > +       error =3D ravb_wait(ndev, CSR, CSR_DTS, CSR_DTS);
> > > +       if (error)
> > > +               netdev_err(ndev, "failed to stop AXI BUS\n");
> >
> > This error message is printed during resume from s2idle or s2ram on
> > e.g. Salvator-XS and Gray Hawk Single.  Ethernet (nfsroot) still works
> > fine, though.
>
> I was not able to reproduce this on M3N (r8a77965-salvator-xs.dts) nor
> Sparrow Hawk (r8a779g3-sparrow-hawk.dts). I'm using the following to
> test, is your test-case different?
>
>   # echo enabled > /sys/class/tty/ttySC0/power/wakeup
>   # echo s2idle > /sys/power/mem_sleep
>   # echo 0 > /sys/module/printk/parameters/console_suspend
>   # echo mem > /sys/power/state

Looks good. Major difference seems to be that I use either Wake-on-LAN
or gpio-keys wake-up, and I always have WoL enabled for ravb.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

