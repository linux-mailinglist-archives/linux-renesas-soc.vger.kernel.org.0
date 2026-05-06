Return-Path: <linux-renesas-soc+bounces-32123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLPmMrE6+2nUXwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:57:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC594DA997
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56FAC3006F2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 12:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB0E4014B7;
	Wed,  6 May 2026 12:57:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844631A7E4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072235; cv=none; b=UvGxG5srWaMWwGZPlcNqzMKnxuwiBIn5+cihisJl3veAt3+B4GIQi+hBlomDdg4RVsXFfIUQqNnHRj1s27Gt3tpCf7jvFXIES51pOzlZ088vt8ZsO79s+B9IDViSfMAsP9Mi5zukaVX5onK5BvQQOimyd91suQ+gIvtdGFQquH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072235; c=relaxed/simple;
	bh=qE5T8UHAQFi1iQufSJHwGyUN0HmUMjsbgTbfwLftTcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQ7TTiFwcSiC6HgIHAVquf0ho5acK2C5op4ewRpAOwN4aiU0rzyE5kxuitDBR2ixCLuNDDrPBhNAsocdoC1ObUEYAk3a0fumQR+o7Ki0g6rRF0cOg1sZ+ix6pMUaeB0IzJjuXVMNhezJDm4qvAyNfRGvKc20yqQmsGgc2NoaAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95d0476492eso1084726241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 05:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072229; x=1778677029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p//fBN7MGJ+c/0tcb2eTApLtD1OnS24t+3fsR1hc76U=;
        b=I1gQ9tgDHEYH/fmdvlr/dj39+xAkrPVD4ml3nO5aQhZVqWNB3wCW+4vraJggtv+/Cy
         5Zpz6QMaVr3Hk9oc94UzUW7+qaWj9mDkmvQ0gzPCZbGASIoe0wGm7oanP5Adk1wkBwwa
         bTisjP7ukYlFgniEsuV7MYaAGMlu3ZpkuBS+cYTEnANa3oPAbtvFL7jHyLBakG7XM09X
         LmfVfeO51avdqUipwt6qi58FLCiKAWxogNA5Jh8vY+OEY7dE/W/dBadeTv6M0hVLd1VJ
         84roZwWeZU4I+LS3Opt6AFDeTAFp9njWX1XVMIw1VqSAsuR7v7HVUb/VxlNIxJhehl0q
         XHMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WrPdXwtKJjazAldSLy+c2mjM5RYZpjVI+CHSx3Wsv00Tp+eQV002Y3G/Kav+/GQ2Vfm8ImJbrdzmuUk3AXzfXeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAEp+YB+2UHQfl/9zphV8oKv2DRLxyl9/A21N3m3a+S4b4Xeq/
	0aiYDzjGUKjcoxnqm+VnJpkRar9QNlphJFOVT8Q+6Vf7KezkRc9edD0tOTnfD7LdtTw=
X-Gm-Gg: AeBDietFWTgxJfQgGCpNwhQ3gmwUyAx8KtD2cz1NxEnv2d6qzXYLENW/s4xyMz1pcJg
	KvBLZZT1R8Kf1wWRjWo9YtNR+wflqib2X/K7+ZjQJQPxwVinpk1JFKb5w3IWGHzVWeHJ/+m4Mes
	X2Y8CV/ZMdJA7SDvLiP0JBr1u12GAK9XXgedtg9PtN6PjqVl4ea6rQKSXFd/jSAtskGoM2pE8dD
	jrjrhYuxrM44f0HbItinXWscJRbep2JqMBX8CyrR43/OqTLuSsy+z5yg2euRtN5ty5OkqArNsHV
	CwT5t6AnYfaxFtytu4klwIN/FmZdu9CzqtEoQ6rOiP/oCHSmOmwJTB73vGvlL172qROvFd0SBTF
	4ldaTQhRUyaMcOC9c51s2h65MCii+2obq2MQ0kTFWEfoh6WCKGGYDx6Io+fn/XvrkBBD/Hw2eAN
	5YLKNIFlRPaBKfHyJAVxDtNhXQIDcTLBRPQdIX3jLiuTzq84eqY/ejG5jmSvpnJMrKIKsrtic=
X-Received: by 2002:a05:6102:5345:b0:62f:46cd:d481 with SMTP id ada2fe7eead31-630f9283623mr988860137.28.1778072228599;
        Wed, 06 May 2026 05:57:08 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62e0b5fb1absm7164521137.4.2026.05.06.05.57.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:57:08 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-60fa5eb3ee1so2248447137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 05:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Bwl/jVdbDNuWTZn+K7XrqxrM2gzfaMudb7KWl8MgvjXfLmwut51LyyLF934kfCwcdVqGQA1t1vT4ZYrgPd0/i7w==@vger.kernel.org
X-Received: by 2002:a67:e102:0:b0:62f:5908:648d with SMTP id
 ada2fe7eead31-630f901cf81mr1045734137.4.1778072227584; Wed, 06 May 2026
 05:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
 <20260506122954.GL683841@ragnatech.se> <afs3U2zudfJEXkY4@zed>
In-Reply-To: <afs3U2zudfJEXkY4@zed>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 14:56:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoWRTgfNMQA5KxiwLhmycCHt+zc66MSpJNVBM7D=kcKg@mail.gmail.com>
X-Gm-Features: AVHnY4L_tSuxiPAO2UV_tD2yH-TbtSGRjrEcWxzzuYbRupR_1lDrgg-HJwPtBvk
Message-ID: <CAMuHMdUoWRTgfNMQA5KxiwLhmycCHt+zc66MSpJNVBM7D=kcKg@mail.gmail.com>
Subject: Re: [v8 00/14] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5FC594DA997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32123-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,mail.gmail.com:mid,ideasonboard.com:email,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url]

Hi Jacopo,

On Wed, 6 May 2026 at 14:49, Jacopo Mondi <jacopo.mondi@ideasonboard.com> w=
rote:
> On Wed, May 06, 2026 at 02:29:54PM +0200, Niklas S=C3=B6derlund wrote:
> > On 2026-05-06 14:19:28 +0200, Geert Uytterhoeven wrote:
> > > On Mon, 4 May 2026 at 03:08, Niklas S=C3=B6derlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > This series adds support for two different devices that together en=
able
> > > > ISP support on Renesas R-Car Gen4 ISP processing. The first driver =
added
> > > > is for Dreamchip RPPX1 ISP, this device purely deals with image
> > > > processing algorithms, statistics and image conversion; but have no=
 DMA
> > > > engines. The second driver is for the R-Car ISP CORE, this device
> > > > deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> > > > interface for the ISP.
> > >
> > > Thanks for your series!
> > >
> > > > This series depends on the ISP extensible statistics definitions
> > > > out-of-tree patches.
> > >
> > > So that is:
> > >   1. "[PATCH v1 00/11] media: Add iMX95 neoisp driver"
> > >      https://lore.kernel.org/20260413160331.2611829-1-antoine.bouyer@=
nxp.com/
> > >      for v4l2_isp_block_header,
> > >   2. Jacopo's reply https://lore.kernel.org/aeHd0G_JDaROMWDd@zed/
> > >      for v4l2_isp_buffer_size.
> > >
> > > However, that still leaves me with undefined struct v4l2_isp_block_ty=
pe_info,
> > > and lore couldn't help in locating the patch series that adds it :-(
>
> This version is based on a preliminary version of the extensible
> statistics. I can provide you the patches in case you're interested.
>
> >
> > As Jacopo have kindly pointed out to me in private, this work was based
> > on an early version of [2] that was not published, but as I found [1] I
> > thought it was.
> >
> > I will rebase this on [2] and address Jacopo's comments and repost.
>
> Don't :)
>
> Please re-base on:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D24772
> which I sent yesterday instead.
>
> If you're using b4 you can simply point the pre-requisites to this
>
> change-id: 20260504-extensible-stats-f2d6befcc1ce

b4 am takes none of the above, but does take
https://lore.kernel.org/20260505-extensible-stats-v1-0-e16f326b8dad@ideason=
board.com/
:-)

OK, I'll disable the driver again in my .config, and will wait for
Niklas' rebase...

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

