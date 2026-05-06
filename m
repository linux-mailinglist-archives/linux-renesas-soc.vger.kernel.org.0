Return-Path: <linux-renesas-soc+bounces-32149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNNiNaFh+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:43:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA84DD7C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57423304644F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E1D49252E;
	Wed,  6 May 2026 15:40:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF68494A08
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082033; cv=none; b=QJ8i29Kpi7OImfeZAuU/NJAghWvbVGYdmEVRf0I27xOWklkVbQJCLc6OZ9iK4RTh4T8iWWkO1LPJco3B+eBKDoKpMM/EnhCg4TFyq2B1nicMOM2Kk378jMzXxbqxnXJoEgPwStosw4+A1TmYSK5IHym2cWRH/PhNHnO6XlbGVgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082033; c=relaxed/simple;
	bh=hnTY1C4YQfuFQnTdHlPMeKkehEjARMiDrJabpHckQn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwimQ6YZYZxtXczrdSrFEeYAlbhVNfDQL/QP2h/M1ghan2RaYR9ODYeKDgS3pBqxoaw8/g9eq0hCuGvtPTku+3OXZxZqoJ9mZlhkx0WgX27kdb+LRwNjBixnvPjWvO0bIapDunCNlt6H26VGrx5Hqk2AHXoon7V5a0OyTe8O2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-62f2eb2b67eso1636769137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082027; x=1778686827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhB1wUc2hdpCHk9AKQGT4q75t8HPfDZeAd/QYRJBqkA=;
        b=eRGaBxoAhfmYZP7SyjMQ92ZQIl7CwEI2wMekTPLfVanJ5qog3oHE1qtE9awCCDVEXx
         6z1y8lkpI8d63vYD6fLoQXedE0blPk9apjtPoa3uFi0NdqVFLzPjU9O4Hn6MJty4FuSQ
         S6rOjmbnZwbiPNyt/Suz6u3y2E7255RVxjXSSICSyLNDiLTfZvDm2ZwuC9bO8cbwqMlQ
         /xZM3p518PWlvLp95pg6m37t9e8dfwf3wChBdaF+aNohqeJZ6qgbbQF9pYmoknD7rkKW
         i9ZHsWTJcQje/ZyrKVwpdmTJ9FNUKAi20hTYZC10GFwaSyz0QE6rIQw8YLBnt1Xj9Fok
         TwLw==
X-Forwarded-Encrypted: i=1; AFNElJ8eQlTbyD5NI05RhxZm60escnAUIfHl+1lcW/LTKgxcwswU73CZ7BhptEB8KWUKxeT6iSmoanhRr2567N5mAe67Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKhwc+5N2Y0VDV4fYyVWUcUbaD75uH8CHsuCrC2X5Ny8w45l2
	z5a/coZiWCI+i//WDE18Aa9QvsTjwOEFuRvSnEmiM9VG7vulfMwaE33g0xMo8G7/154=
X-Gm-Gg: AeBDievHjdUmQQzovs9ZqmzYWtu+bofdYZeV7B4vrkx+/j3CDvyJQaMrxJTPkjuO9Lt
	vcSF9CO3X6Kjmob9NnnJ8XpNiKcVFnDlQFXZAejlyjeg8L0vt2Z2Uw4m05XR95Wxzrla8JMNqfG
	q1H5PwPiHfevKw3kyS6kVcBOoKfFKzbR2d1s7/TfCnSeMMyOnw1PGaQ7h9tTIDC6E0B3fuUqjaF
	we61PqwPxEAI6KQESbSDdkDRk8yDzSckqSEuf52Uq8dROjkHztb8MjaGgJ121hIzqmOI1RbjFQF
	9SKPVh23GNdcEzgRdhDDhUX7tXJNa9fh5Hd/6/yVRgstM28udo4/zSkdUyse5rsEnGDlMmaoyUq
	McsLGPfGlpgXtHcPIqfrOcCNIX5kCMMPjXsqcVWrx1bvk2mm2QGK2tE7ZbvRvyV6anPdcYxYn4I
	sYqQA3X87hReL+3+fwYrDiuo8CgvOmJXO/8tBnNvZjWdr79lNT6J8G5tXXdZF5T7yCntZ2IAXRB
	wY=
X-Received: by 2002:a05:6102:5cc2:b0:60f:7499:9b6b with SMTP id ada2fe7eead31-630f9283aebmr1590172137.29.1778082026694;
        Wed, 06 May 2026 08:40:26 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f7ea016sm10466827e0c.1.2026.05.06.08.40.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:40:26 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575602688deso236555e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:40:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82zXRsWcc9Yo5ueLLvOvI/WdDMIW+5YGhFg1rf6Ubm6PFl/OCpevF3ixiFA458BPM6qphK5DDUEld9a5X3rOLPAw==@vger.kernel.org
X-Received: by 2002:a05:6102:4429:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-630f901b15amr1756658137.5.1778082025698; Wed, 06 May 2026
 08:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:40:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwdKsmV3A8opxi7f1rnqSpVFsRg+Mfb7wQLC84NkL7PQ@mail.gmail.com>
X-Gm-Features: AVHnY4JATluaWsu6W_RJQ4MJF5cAxj9Q7vuMaGT0fiazB3FLnuoB8rjp_3_f3yc
Message-ID: <CAMuHMdVwdKsmV3A8opxi7f1rnqSpVFsRg+Mfb7wQLC84NkL7PQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] pinctrl: renesas: rzg2l: Add support for clone
 channel control
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 90CA84DD7C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32149-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]

Hi Biju,

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC has some IP such as I2C ch{2,3},SCIF ch{3,4,5},
> RSPI ch{1,2} and RSCI ch{1,2,3} need to control the clone channel for
> proper operation. As per the RZ/G3L hardware manual, the clone channel
> setting is to be done before the mux setting.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -623,6 +644,45 @@ static int rzg2l_validate_pin(struct rzg2l_pinctrl *pctrl,
>         return 0;
>  }
>
> +static int rzg2l_pinctrl_set_clone_mode(struct rzg2l_pinctrl *pctrl,
> +                                       u8 port, u8 pin, u8 func)
> +{
> +       unsigned int i;
> +
> +       if (!pctrl->data->clone_channel_data)
> +               return 0;
> +
> +       switch (func) {
> +       case 2:
> +       case 4 ... 7:
> +               break;
> +       default:
> +               return 0;
> +       }
> +
> +       for (i = 0; i < pctrl->data->n_clone_channel_data; i++) {
> +               unsigned int pin_data = pctrl->data->clone_channel_data[i];

u32, to match clone_channel_data[i].  I will fix that while applying, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

