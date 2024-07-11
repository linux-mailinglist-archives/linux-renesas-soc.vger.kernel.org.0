Return-Path: <linux-renesas-soc+bounces-7248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 476BA92E286
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 10:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40BF1F216BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 08:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C16157488;
	Thu, 11 Jul 2024 08:35:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA86155A24;
	Thu, 11 Jul 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686954; cv=none; b=KYpqr5oOJxuFHdDwdZYxfI9I4e43QW3+Ykol7rBizBh+vrsOH5MxSPyJnx00OXSo5CJWht6nfrXwKg4UtMM1tml0BmWwh0LOFRhAi6aGQSOYgSDbhNre1N8ejZsfP69GCO8xQhVc+/1S9o9jQKkpUGknMZ5f3zmvhIc0GeADs0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686954; c=relaxed/simple;
	bh=8q1r8au6kO3TF5KUsHOvNGSBdh6KP2dD3d2WrW85cRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8eQdJD8OACf1Yck28vg1IoVKfBpSzF/5qGlNWw5WOMyDhhNspq1ydkc9WUmiCRf8bOeVTIfdmUqIBkbDxLQwZ/k+tPT5kvc1pd70vLS9vqpKDhNHxcjNPuZJE//U6S9fTUQB4ig2gatwR9V/3ZaKWwzGCpDn8ycNEPu8ZER6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64b05fab14eso5977077b3.2;
        Thu, 11 Jul 2024 01:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686950; x=1721291750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EptZoKPLIWNKke/omWu8DOkFmBcLWw6b/BGuaFTohc=;
        b=ZFTULLusWyTImhWF7p84JFw7zPSYUAvwEvwiBUPDJSXIf1+8nP+Ir7blh+SUNCvMkH
         u9iRMNfe1AjUD6yZUtAiG2B2gkrPYkE+JRDiuZzMmtG1ZimiUyUTLMjoOFPoGtX3BZoG
         HNpVkFevl8CTA37gW+gLe39cDiBWODh47WylfgL+tcDmkjF2WrpQ3H9frgywCOxobytR
         XEnSlt/uDdGmOKk9CtFDvm2MqB/idZTg3vqtNqtTCoyF2V5joMhuCaEcTR7nab45nGZt
         Y1OpWHkLGH1jy4dUvACTN0/MLIU4FwOTfLOUszk/CQ9iWnSuz3mHrKiZJOfqy9vUb65b
         y8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTrMV4I7eZnzNSKrJ2dpeJlB0E0eqg4WS6xU5sk+iW6lxkfUejS7Lp2jvRUMN3Re+5F1f5gWwU0oiC8xnmJtnU5CdcZ9fKmpBCddcVW+j+tb4CWWCVydFkg8qLcIpXhrkmmOIEQ9sHtNDCMEo=
X-Gm-Message-State: AOJu0YyR5ibQxacTFnwy9rc8sGgJlC0WJ5bf49x3F5iny3SX/UAuEJW0
	wsquQr+SkRxEQLCrmkNoJ+qQof6STh4q7Hxa9vHOL+CAO8HmQlLNbmerpihF
X-Google-Smtp-Source: AGHT+IG3J9Aq0Xatb7u47VSnfjlyKTcjsydQjrEAr121Pp5f/ro4SVPJh3jfwwdU70JY3nEFQz3YhQ==
X-Received: by 2002:a81:8d10:0:b0:64a:a81a:99cd with SMTP id 00721157ae682-658ef4407edmr77530597b3.30.1720686949772;
        Thu, 11 Jul 2024 01:35:49 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4936086sm10236487b3.4.2024.07.11.01.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:35:49 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e03a581276eso528977276.2;
        Thu, 11 Jul 2024 01:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbGU8Tasw+bR105Je1936gD9tJrSn4mwaOAtkTTzW+n8uzuq180xj6gKniMxF+jUBoajpjiFbp0lOyF/2731cuyE63lI//0pB+qFu8CKtNAru1wKXx5pBx7lz7tJVacWHUjsZaKaqN2FD0x7A=
X-Received: by 2002:a25:d60b:0:b0:e02:92cf:4ea2 with SMTP id
 3f1490d57ef6-e041b035eadmr9528754276.8.1720686949154; Thu, 11 Jul 2024
 01:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720616233.git.geert+renesas@glider.be> <TYCPR01MB110400CA4023266B96C8077DFD8A52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB110400CA4023266B96C8077DFD8A52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2024 10:35:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC6JAZrR_rroy_87m9=hxTHQU-A9Hqzm95QSk+LKfD5g@mail.gmail.com>
Message-ID: <CAMuHMdUC6JAZrR_rroy_87m9=hxTHQU-A9Hqzm95QSk+LKfD5g@mail.gmail.com>
Subject: Re: [PATCH 00/14] clk: renesas: rcar-gen4: Fractional PLL improvements
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Jul 11, 2024 at 10:29=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, July 10, 2024 10:11 PM
> > Currently, almost all PLLs on R-Car Gen4 SoCs are modelled as fixed
> > divider clocks, based on the state of the mode pins.  The only exceptio=
n
> > is PLL2 on R-Car V4H, which uses a custom clock driver to support High
> > Performance mode on the Cortex-A76 CPU cores.
> >
> > However, the boot loader stack may have changed the actual PLL
> > configuration from the default, leading to incorrect clock frequencies.
> > A typical sympton is a CPU core running much slower than reported by
> > Linux.
> >
> > This patch series enhances PLL support on R-Car Gen4 support by
> > obtaining the actual PLL configuration from the hardware.  As these PLL=
s
> > can be configured for fractional multiplication, an old patch to add
> > support fractional multiplication is revived, too.  Of course some
> > cleanups are included, too.
>
> Thank you for the patches! I reviewed all patches and it seems good.
> # I sent a nit comment on the patch 4/14 though.
>
> So,
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you!

> > Note that struct rcar_gen4_cpg_pll_config still contains the default
> > multipliers and dividers for PLL1/2/3/4/6, while they are no longer
> > used. Probably they should be removed, too.  Or do you think we should
> > retain them for documentation purposes>
>
> I think that retaining them is good for the documentation purposes.

Another option is to remove the members, but keep the values
in the comments above the SoC-specific instances.

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

