Return-Path: <linux-renesas-soc+bounces-32921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NevIOIQEGrJTAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:16:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1D5B0683
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58030300A583
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 08:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1F52C032C;
	Fri, 22 May 2026 08:16:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5D2EF653
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437782; cv=none; b=lq20uZcyeDZmGluuhClQRBaPr0ydEjqjc83La1IUpwK5sD9hngN3JzgmJSOy86dfUREGXGFGk4701U4NiSNeVhuDjLpd3roiqjQGUThyhOcdaxqWeMhTEIb7KEqZxsHMc4f5NcuhWHAVP0/Mp6859j297tOJUMBclT49uUEPxhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437782; c=relaxed/simple;
	bh=Dst/cEN9INcj1DtpT9Fle7dMJehPxMPRYGLV60t38N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5okS1xcxdFgHZIy0FH2zJfFLRUdZ2/Rc00T0D6ChUeF919dVJFdTkGuv0hG8r8ktrAC3+7uLysYLj95h6L5uBS7lXs+HiP/Am17IxohPy1XaLQkR2k5ZELFmQ/9kJD8UNSrR9Ho+/77dISsZdtF5PoDdasBB16KE5lRiLYer70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5753a289955so2459623e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 01:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779437780; x=1780042580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCdaajXZ3y6/6Pkvxr8ZTKSYuFSegVssO+Xm6lrWkzk=;
        b=JTuQaJahhrhp4t7MSaRm0xbAYPoHL/ZkzBqI20O4WAkJhEHZRYy4+Sx2qPZ617nlwP
         Nlhh9x/S93grDvzqntpw6/RHAvEIsvX/XlZljTzxaDQb0Rx0xyHP9QGkbKZViLhgzZTe
         k6DMRfB1lk0IUnQt47SI1l4ZNGi0OS2n9ObdknluPEpgO45O+MZGs1x3WUrM9DkA7uz/
         tvutHOiBGfxYIEdwzhCZyroVR1xpK116gwQlZfztnQ+hQQSADUDPkfwRl0Gous/Si8fW
         MtXiYU35+tnAubeBW9u4bsndF5d3RyXRvPGBwvLjlg63JqcbGAId8+DC6ciwqSFJurfO
         HYHw==
X-Forwarded-Encrypted: i=1; AFNElJ+tl7YoPx2TGhEYFtsYYoZMxuOEM7VfUgj42VAKQRLBKZv1F6u/PEDQgBh5za3quxIBKAbLFdaGF66UU0VTrAGnug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdzABTvqjlBpIQAUuUuiG3vi6r1QQTmLVoT//OPHounXO0N/R
	DvjUFOqTH82juFYAn5QC3BL2JKjVoEblWwcMMVLW/8G+y7zQNOqmJEINSjWpQB2z
X-Gm-Gg: Acq92OFCIdqg10li1Vam2ZI8yjyegte+ow+FLfitd7KPrUJylfhw+d17aCzFiwTvHsh
	ezopMTukr/YS24ANYBFoYSg+Z3iNzN6LZn7Qztj+0HZDw/aKQMlQx3zuTTDI1tV8kx/HcR/i3y3
	bf3GqWlbWuCNQsX1+Rlc59h/1klJEM0JFEcpgElLRjAnANFdh1umO8/m3mnCbBHFO1QP4Mfxux4
	iMKkAhh3ioMEXdZb+abUbFttBzCHMaQnq+rY/fZCUvQBNi7RRfm8OGsj2i28rJXrTatQKCocTS+
	JkXNlPfrdXQNOlRKItC9OVrngRhCHD/U5vtzMrYR46adW/V620AIJWjHdjySUZp1hpnmAoFKW/W
	PGKvvwOeXq1vO3Brrh3g80nL7MzqFi8QVwdrpWDNeDrnhSi4BeMaeC4WD0I8wrr0ELdKuSzVOi3
	vDrmBrFasVrznXjUC+vOnGOdblFVbS+ifukAJyL7GkPiKyOjsS7szLcSyA+YafVOpgfYQSXy8=
X-Received: by 2002:a05:6122:130e:b0:575:360e:600a with SMTP id 71dfb90a1353d-58661834f53mr1194138e0c.8.1779437779972;
        Fri, 22 May 2026 01:16:19 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f25d708bsm1374619e0c.1.2026.05.22.01.16.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 01:16:19 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-956995b5bb6so2132128241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 01:16:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BWXej88U/9dmtnN5z/Xgb6GqBpr/CpDVK9AWnFIZG6NTLo1r2hvtPjmrvwXcYjrvgxrjvb2HzVhUJO2ea1DKXSA==@vger.kernel.org
X-Received: by 2002:a05:6102:94d:b0:60f:ac13:c99 with SMTP id
 ada2fe7eead31-67c9085f3femr895129137.29.1779437779393; Fri, 22 May 2026
 01:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521144755.3476353-1-maoyixie.tju@gmail.com> <20260521144755.3476353-3-maoyixie.tju@gmail.com>
In-Reply-To: <20260521144755.3476353-3-maoyixie.tju@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 10:16:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOrE0ouHo5759k8ULpFPBS=gyqd7A_k-RTnSSk+MPGvQ@mail.gmail.com>
X-Gm-Features: AVHnY4LybiMpxYrUpMtQaHmizecfTGaYtZxZVu1CJQ_a2hFyOdeR3Oe_IQNE-Es
Message-ID: <CAMuHMdUOrE0ouHo5759k8ULpFPBS=gyqd7A_k-RTnSSk+MPGvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmaengine: rz-dmac: fix dead empty check in rz_dmac_chan_get_residue()
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32921-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8FD1D5B0683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maoyi,

On Thu, 21 May 2026 at 16:48, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> rz_dmac_chan_get_residue() reads channel->ld_active with
> list_first_entry() and then tests the returned pointer against
> NULL. list_first_entry() never returns NULL. On an empty list it
> returns container_of(&channel->ld_active, struct rz_dmac_desc,
> node), an aliased pointer derived from the list head. The "return
> 0" shortcut is dead code.
>
> If ld_active is ever empty here, current_desc points at
> &channel->ld_active. The subsequent cookie and status processing
> then reads bogus values from the head's neighbouring memory.
>
> ld_active can be empty when a residue query races with descriptor
> completion on another path. The author intent was clear from the
> existing comment on the next-following check, which already
> acknowledges that the descriptor "could now be complete". The
> empty case is the limit of that race.
>
> Use list_first_entry_or_null() so the empty case returns NULL and
> the existing "return 0" path runs.
>
> The same shape has been cleaned up elsewhere, for example in
> commit fbb8bc408027 ("net: qed: Remove redundant NULL checks after list_first_entry()"),
> commit c708d3fad421 ("crypto: atmel - use list_first_entry_or_null to simplify find_dev"),
> and commit 10379171f346 ("ksmbd: use list_first_entry_or_null for opinfo_get_list()").
> This site was missed by those cleanups.
>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>

Thanks for your patch!

> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -723,8 +723,8 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
>         u32 crla, crtb, i;
>
>         /* Get current processing virtual descriptor */
> -       current_desc = list_first_entry(&channel->ld_active,
> -                                       struct rz_dmac_desc, node);
> +       current_desc = list_first_entry_or_null(&channel->ld_active,
> +                                               struct rz_dmac_desc, node);
>         if (!current_desc)
>                 return 0;
>

Note that proposed "[PATCH v5 09/17] dmaengine: sh: rz-dmac: Use
virt-dma APIs for channel descriptor processing" would remove this code.
https://lore.kernel.org/20260512121219.216159-10-claudiu.beznea.uj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

