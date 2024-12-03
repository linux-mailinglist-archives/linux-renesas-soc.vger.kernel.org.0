Return-Path: <linux-renesas-soc+bounces-10849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69A9E1AC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E8D162901
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC931E0DE0;
	Tue,  3 Dec 2024 11:22:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A82A2E3EE;
	Tue,  3 Dec 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224933; cv=none; b=Pd84V6VKAcHjW/OBwTAhofZCViH9Et5bs9745euuxfNS4ZT5cqZn2GpURqkFBpv2hO8+H5y07lxjfdXA1ghmHTEgmQ3ix8LwStGdXSaWiZRJIaSChVSE2y9BFkP39E2r1gHivIOzU2JRyWBTE4ZPFRjL5lBtsagv2V568AHnYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224933; c=relaxed/simple;
	bh=/H6R4C4sChQTZ5cXsO3F6WwGAd1/Bm4XLE+IQHsBDb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nX9eIZjj4YsV448SAFTDeBXKzwa5Hf/SEGLX3hUw+FdP+vwmL8vROtEKW//wq9njWpowdCLREIU76RxRN+vCgvhHhTWFkVtvwXy6ryr0jVLJdFll0C7AurZApEqUQWJ32CetZLWNXi8rePd6k086csHT3puGYxfQag1pqwrQboQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51532deb8a4so1406567e0c.0;
        Tue, 03 Dec 2024 03:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224930; x=1733829730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lk30vZWzCZVn5tIngj4roFMWQAAlwxhMJFj75FJfVvA=;
        b=NipV+aBpUbWXoYpsVgu5n/erwXhc8hh1xu+WtpBEKDk29UiB2FqnNhf7mmWfbrrL3R
         jSchApCxzh27AEhl3/75+TlGdfivrXI7q8WAlAB6gjgK+jTPhlllrEHTvsdF391g3Rfr
         cahq7W1nBptdGEzwne7RiyemFODzzE6QsMGy3C1X/WoHcmXcaqRpevBww9aGIw3kNMYj
         sShqn9ZwWCdawx4c0xCdeHl05QYWUY5iF5zr+ooOqDP6OEiSVx8GdAtmhiIVKkhegKe3
         XuPxghd6HlIfiFYrVVMRg/KvyVSUF/ZUWOx4Oo1WGC1+pE5JTJnJQhjvAjVZAWPlhBPA
         hPvw==
X-Forwarded-Encrypted: i=1; AJvYcCVo+HsMEtqWtlNddfDyk585K++7gAGMZ7fdgkfVPwyeAU5NcEQqjvU1Zlpr3yCnMdmrfUrh4jM1P5R24LVL1pTur10=@vger.kernel.org, AJvYcCW3B8v9pPM6qylYb6HrCgFTOj8qo0a9riDvbEG5nXaLv4hOCcabfXhEKhNPbIxw2NkaxwGnbV5cbXf/KuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ1D59yHqB0VWpCvT6Iyl2jzUa5wuwvaRAlVcbPKA+9m99SEwj
	7OoevdiL1n4ny62HvP0mtHOux/G6Y/SRVvuVQLXvI+p9oT6wFCBWGfBBLj+h
X-Gm-Gg: ASbGnctOUtALRvc2O727DEGRw7ekdYeYQEVCB+hA6niclsk3lcNR32DtwIbrtIq6NpY
	OF4QH8lZPPCntLB6E4lp7iH/AIgnOV82bv9rpSo1U6cjdprI1oRkjktydYHVzt//HNAGEDUGE9G
	bLAgVEyhgoYpdvwpS3WgcHiwwF0VPZgK5fqjDizwXLT6cWx5PgWLi4j/YMiLadTLtpSvDkS1m/G
	XB139ZYNu535QWln+QMwHxvTsM27OH84c3jU+aOJh6jAhPu/PlzN4qX+bdd52ZPh1JY8RaRaKJY
	OYdDzdf5Mfhr
X-Google-Smtp-Source: AGHT+IGokTiyN45PCACXYt+i0Mc7CEfm1mccDHyDRnl1dI8s9+aLqh1FxKVY0BNOn6/gEl5pGErUKA==
X-Received: by 2002:a05:6122:251b:b0:50c:5683:ad56 with SMTP id 71dfb90a1353d-515bf3b9aa8mr2404582e0c.3.1733224929643;
        Tue, 03 Dec 2024 03:22:09 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156cc04975sm1346556e0c.20.2024.12.03.03.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 03:22:09 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4af3eac0d8fso1543470137.2;
        Tue, 03 Dec 2024 03:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUW0UAVwXaDxLcakaVTe/jt0tJRg5f/8Y1qXNks/yxnpU2hwSATsUqgS8w/9i9K06sJDZ1B1IdCodDocior44vOTqI=@vger.kernel.org, AJvYcCWFcGpGdBqw0QdIiUVrGP9IYjCPGhFZu+E1lTaei2lAE3zMZ08BlLhUBd6rgDXyEQ/lHr+Q3OzJbeXMEZc=@vger.kernel.org
X-Received: by 2002:a05:6102:f07:b0:4af:a216:c0e1 with SMTP id
 ada2fe7eead31-4afa216c377mr412453137.0.1733224928841; Tue, 03 Dec 2024
 03:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108160717.9547-1-00107082@163.com> <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <87ed36zon8.ffs@tglx> <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
 <87zfldt5g4.ffs@tglx>
In-Reply-To: <87zfldt5g4.ffs@tglx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 12:21:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWY_Yqx3hQSWx1XAUpDx+-YG6ZNPpb-LisOgATOVocKuw@mail.gmail.com>
Message-ID: <CAMuHMdWY_Yqx3hQSWx1XAUpDx+-YG6ZNPpb-LisOgATOVocKuw@mail.gmail.com>
Subject: Re: [PATCH] genirq/proc: Add missing space separator back
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Wang <00107082@163.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Dec 3, 2024 at 11:40=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
> The recent conversion of show_interrupts() to seq_put_decimal_ull_width()
> caused a formatting regression as it drops a previosuly existing space
> separator.
>
> Add it back by unconditionally inserting a space after the interrupt
> counts and removing the extra leading space from the chip name prints.
>
> Fixes: f9ed1f7c2e26 ("genirq/proc: Use seq_put_decimal_ull_width() for de=
cimal values")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/4ce18851-6e9f-bbe-8319-cc5e69fb45c@li=
nux-m68k.org

Thanks for your patch!

> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -501,17 +501,18 @@ int show_interrupts(struct seq_file *p,
>
>                 seq_put_decimal_ull_width(p, " ", cnt, 10);
>         }
> +       seq_putc(p, ' ');
>
>         raw_spin_lock_irqsave(&desc->lock, flags);
>         if (desc->irq_data.chip) {
>                 if (desc->irq_data.chip->irq_print_chip)
>                         desc->irq_data.chip->irq_print_chip(&desc->irq_da=
ta, p);

You should also remove the leading space from the few .irq_print_chip()
callbacks that print such a space. According to

    git grep -lw irq_print_chip | xargs git grep -W "seq_.*\" "

and filterng out the false positives:

    arch/powerpc/sysdev/fsl_msi.c:  seq_printf(p, " fsl-msi-%d", cascade_vi=
rq);
    drivers/bus/moxtet.c:   seq_printf(p, " moxtet-%s.%i#%i",
mox_module_name(id), pos->idx,
    drivers/irqchip/irq-partition-percpu.c: seq_printf(p, " %5s-%lu",
chip->name, data->hwirq);
    drivers/soc/qcom/smp2p.c:       seq_printf(p, " %8s",
dev_name(entry->smp2p->dev));

>                 else if (desc->irq_data.chip->name)
> -                       seq_printf(p, " %8s", desc->irq_data.chip->name);
> +                       seq_printf(p, "%8s", desc->irq_data.chip->name);
>                 else
> -                       seq_printf(p, " %8s", "-");
> +                       seq_printf(p, "%8s", "-");
>         } else {
> -               seq_printf(p, " %8s", "None");
> +               seq_printf(p, "%8s", "None");
>         }
>         if (desc->irq_data.domain)
>                 seq_printf(p, " %*lu", prec, desc->irq_data.hwirq);

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

