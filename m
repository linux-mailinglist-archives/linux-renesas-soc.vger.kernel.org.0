Return-Path: <linux-renesas-soc+bounces-30095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGSIIjgSwWk7QQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:13:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E192EFCD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51626302E856
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 10:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9279389445;
	Mon, 23 Mar 2026 10:06:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE94388E76
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260412; cv=none; b=qXn/XNRkMLBYuKHhLxtJJjkcaJepsNDPQve4wFE7/DDtmSwowGsY9d1u0h1PMsHGdJNsVjYO1ovb/G4AkFdB5AtHwekgSnO4OfA/nXGXa2ZXvUh5TsdHZtRxR2lyHBcyNPiejdnMV76kdkqQlsnxaZkyWcIXwx7ouAs+gmGAoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260412; c=relaxed/simple;
	bh=v8ltNxQSaMtC/Rg9Xv+itqHrSwoiUOypFu/u0rdT67g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e88o94DoQcRuMc1pnf9FsFAg2f2gJK5Gu1yJH4jRV3Zc4s6W1B/D/WkJwbdIADADEZAJt/OoPw8CTT2gioskqyut1ppomTdinbYZCvFBI7xmVfMaifJvbiHpDihGcFq1bOsDhOpGiz6ok+3DZXLKhoPz9ugcPZ5VNMk6S7WdtwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso979612e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 03:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260410; x=1774865210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzjYJMjOI3TN6MOGwzXdV6Kc+YW0xfKSVW0iyQ2B4tw=;
        b=Fq3Vi4hdlrXfb9ZS4FQDfDg3MZ5VV25mdztWh/MPtnjW/RgBXFGvWWYLslIwD0hQar
         l++Bq02yysJjl5F2fePwmZUcJ7OEB0PbFE2sZmY0PnIfQZGYsren9XZMrwSN7/sId39Z
         vzRmb0q0d4AtEQlRJVrxR2VIkOi3/Ed5tt8X7IIjG/nG3mN3Hn0Avx6TmUg6Qp45pd3C
         XitCwCKWFNLItfeJqVn6XMo0TM0lG9hP6XKNUFHDBo37yG4nm2vM90/M3bMOPNU+ORSW
         Iv6JnCjgSHCyMvTWoh2FHBeLDDCVjpNLXWEJ2ytR9Y/UDXoFSlWIO+7TTlodvV1u2vN9
         L/nA==
X-Gm-Message-State: AOJu0YxV+xudrBgEhLnsNij5gNPY/JmFA2FLfuZB1CdJx+2up47mL8Rb
	zPXC3HAhwej5gSEaKPdd0zsKlwyq1jAT0JNmPIf8Fp+y1JYwsdEnOsrxgPNCU6jN
X-Gm-Gg: ATEYQzwCGPxu7NEmOW0WkY9TtqZwHptneQM9pl11WeQWm2CXp4X8rJnjsQu5jvOQOMc
	qrDy1UmT4Uam3q0aTadTsP0mWOEAm/l9OR4vwE2iNMLl7BuaivowJEOgoNH4cRT3PgJpH+JTlGo
	78K9cIUrveswMuahsH9/5uUfcNVzoD6dH2P0PUh3F3a1LB4OFW3rUJVWYFPFETMZI2S4h4mSX2l
	A+vI7vxHL8DqGLaJNpKetj0BCT81v3d8UCcvmPlDYWH/zip5QnA+b0hOLxMf3wfIXeFRw6IRT3L
	wKWPKUhtIAYYVxaaI2yx3LgR6mByOFULSPSw8Z5qpVM4xQ4mgUuCR1JgNOisGzrbdkNFOhhGY/z
	67Zt3MYMknj9DByP9Q9Yb4+naG+R3gnwMsTNIFrQk+v5Y/xUn2W7dOctCw4qUHbxfz/y5XEprmr
	nL331l9T+EB2gyh+zXKU5TPhWwxT9szbbbObcKR/hu6NT/yj+FOYKBHWmy5ors
X-Received: by 2002:a05:6102:5091:b0:602:6e95:bc84 with SMTP id ada2fe7eead31-602aed11931mr4192166137.25.1774260410295;
        Mon, 23 Mar 2026 03:06:50 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136c4e2a3sm8348945241.7.2026.03.23.03.06.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:06:49 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffbd778410so570703137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 03:06:49 -0700 (PDT)
X-Received: by 2002:a05:6102:4a86:b0:5ff:a606:3cfb with SMTP id
 ada2fe7eead31-602aeca9a15mr4244366137.18.1774260409730; Mon, 23 Mar 2026
 03:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com> <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
 <acBJ_G1ZgZwrJfEh@ninjato> <CAMuHMdV_AFhOEi3fimZF467EWpupmcOQTW4SpdUffjzskBrNmA@mail.gmail.com>
 <acEH8ZKis36cgxT-@shikoro>
In-Reply-To: <acEH8ZKis36cgxT-@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Mar 2026 11:06:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxEj=XJTFdw73evOBXsU+DDnr1VfaWDxsyQDGVa4kZdw@mail.gmail.com>
X-Gm-Features: AQROBzCIk5Q3wrhw1UNVtBOeKvSwYJ_Pmh5DIssVDj07r6WtSOn1zt4MmmDc_YE
Message-ID: <CAMuHMdVxEj=XJTFdw73evOBXsU+DDnr1VfaWDxsyQDGVa4kZdw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30095-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,sang-engineering.com:email]
X-Rspamd-Queue-Id: 14E192EFCD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Mon, 23 Mar 2026 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > > > +       if (priv->info->mb_reg_comes_from_dt) {
> > > > > +               tx_uses_eicr = chan_flags & MFIS_CHANNEL_EICR;
> > > > > +               if (tx_uses_eicr)
> > > > > +                       chan += mbox->num_chans / 2;
> > > > > +       } else {
> > > > > +               tx_uses_eicr = priv->info->mb_tx_uses_eicr;
> > > > > +       }
> > > >
> > > > "chan - mbox->chans" is the logical channel number, and should be
> > > > validated against mbox_num_chans, to avoid out-of-bound accesses.
> > >
> > > "chan - ..."? You mean "chan + ..."?
> >
> > No, I did mean "-": you do have a pointer "chan" to the channel,
> > instead of an index into the mbox->chans[] array.
> > Using a  index would  make validation easier to read, though.
>
> Sorry, I still don't get it: If 'chan_num' has been sanitized above to
> be in the range of 0..priv->info->mb_num_channels - 1, then how can a
> OOB happen here? "chan += mbox->num_chans / 2" only happens when
> 'mb_reg_comes_from_dt' is set. But when it is set, the array of chans is
> also always doubled to have the "<n> IICR, then <n> EICR" layout.

Sorry, you are right.
I guess I was thinking the flags specified in DT could cause an invalid
index doubling, but those can indeed not happen due to the
priv->info->mb_* flag checks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

