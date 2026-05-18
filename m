Return-Path: <linux-renesas-soc+bounces-32766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDnYLP8QC2pN/gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:15:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED556D727
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21C0B3054325
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B522E480979;
	Mon, 18 May 2026 13:09:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2617A2FB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109765; cv=none; b=GPkWwS9gZvF0yrXFh03Q3wMvgEl90rAZLmtAz+y7kcVT+W+/ik0aP+6ou19fGnR7WmRmb1VpF9bV9rqDmgX1sH3fsk1puklxyMDv2wkD4DLE18tNYS4Bot7lgcGbIihtBn8djjuPZERPqrKAnAHP2O7Q/vJ+0XtqNBqjAUca0aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109765; c=relaxed/simple;
	bh=V0P9WDALJ1I2iIIoWPjcR0w4g1HygrqhqYPjuNek90k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGAmEqr/dVZzggsrmsZZiuBtTnatIR6DLmh8eeVqBGlhPMRbbEnv4sW9u1JPqHKJofRFz3hFjs6RA38ZYMAQMjlVaxMhCdUaS1/UmSzID1JIkdDR2sOCEeEvqFLk2TdLrnhSO4YQMthu+DX9wKyI6OuoDPdC9ejFb6plS44ALXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-63319183a49so667791137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109763; x=1779714563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4P5QLcEzhZH+iMBp8Kosg+9RMRtsU7zMDBAroJzlJGY=;
        b=qeGl6x9d8t4wLSKj9b1pxd6WQ1rBOhs1482cc0mNXNDab9r24UNGDCuUBhGAQb3Od6
         2DQac5YT9gpXG73cuylczLA6MHi4SFVkN8AnJ3wMTCcdrCQLIA+pJb0T9Jc5DKyPrnAv
         b0Ol7/w4QK2posP1gcQCIs6pg90hapbNY9Hdc0CER95/HkPL+SLMwYH8POTnxhJtQ5mh
         EIFDm1X515d1U/pwraCP36ZppBxE3YEcL9HpSgNmVZP17XkwgBpD27dgyC7yygBFD9wH
         LRKNB+xprJ0Yw6v0ePbLXcJytDLaiHYp/g06yxBUw/1QVGKii0XLPM/COpzsYn/Ty3+L
         urRw==
X-Forwarded-Encrypted: i=1; AFNElJ8VQbzhnfiPn+SH74jqrl7eFBUDPUx6zHqM1mZxlqn+pspZXFk4t0ArdocLPKkaUMBvQfptypdoT/UoFpLLNeFkwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcb5Bus0JSZ0JaIfp0Q+UVNE5P0s4ssEe/tQaAIXDislnmCiEe
	uE2V0G12X750nO6L05TtQViCj5oJqTxcUGyq+mFhhI4fpb8pdcwpnQbTtmn8lDLy
X-Gm-Gg: Acq92OH8yUo0wEBUoYAO0EANUdgL4Q8XUoN8FXhO7s+S4MZKM9UgnaTojIcDSPL1BUA
	7WkaypV6iWlU9v0CPic9iCRQz3G8imJESu+U/GRA7BvIZYw+ucUhIY+yrb1cPKwFqfW5w1hQ366
	sQaUf8Kgoy18fecgZ2c47cfmNk/jw7W6+WtwTXpC3FrC8lm2CjSZ0fm1PdTQCgpuI44umsQn7+X
	gRwfFtLldjkU2o5GnXKJWnE0jMch7BYTgo5GZqCq7D7XFnA7NRl9VViIBzjM7ZcWvgHYNgJ7G+Q
	vcRWPf56Gixx6bQw1jA54mmAOvPdsxcRSh8dkWxTQIEESie8hEI7Mb5GQB/uJKTAwRRjw205ONv
	XaagnoJZcRqKXJnr63RoctPph2zJ7LetUk///Wo8QpDAFrgUv6O66NCjQqIkjzFeqejEsBiRLlD
	qWvLWhAhSdqvnIhU8Yh+aTQm4df37Ji10jhSjYEXV6dxocMP281pmbO7ZnBFLjTLe3o/tU+GI0T
	Bo=
X-Received: by 2002:a05:6102:850f:10b0:650:94b2:3839 with SMTP id ada2fe7eead31-65094b23f11mr1361618137.7.1779109763030;
        Mon, 18 May 2026 06:09:23 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ce6ce44f3sm4704020137.9.2026.05.18.06.09.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:09:21 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-577500ac0e4so499228e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 06:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94IzixL9RIKl9yvPQC0uoWU8ZZ2ia2nxurQOaYZ+/jVy1bpgSnqkPX5vphY9clGc3FNdDAjcZFCxaxhfVnVUWEmA==@vger.kernel.org
X-Received: by 2002:a05:6122:4d06:b0:56e:f262:9113 with SMTP id
 71dfb90a1353d-5760c0943cfmr6808832e0c.14.1779109760741; Mon, 18 May 2026
 06:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260514212024.1624517-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260514212024.1624517-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 15:09:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdSuiJ77bjoP7UQD2FK=rdprh06=13kDfVt4otPmwLCw@mail.gmail.com>
X-Gm-Features: AVHnY4K0v1qwmuRJJHyFwdOzfeyYUi3b4ZKmDJqEEb1F8PYs48qlTeg31JaGAKU
Message-ID: <CAMuHMdXdSuiJ77bjoP7UQD2FK=rdprh06=13kDfVt4otPmwLCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi: Add SDHI quirk for RZ/G2N
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 23ED556D727
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32766-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Prabhakar,

On Thu, 14 May 2026 at 23:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2N (r8a774b1) is identical to R-Car M3-N (r8a77965), so apply
> the same sdhi_quirks_r8a77965 quirk across all revisions, as is already
> done for R-Car M3-N.
>
> Fixes: c9af138c42f0 ("mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -224,6 +224,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
>   */
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {

This array is meant for quirks, i.e. to address issues on specific
SoC variants that cannot just be identified by the compatible value.

>         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> +       { .soc_id = "r8a774b1", .data = &sdhi_quirks_r8a77965 },

Hence I think the RZ/G2N entry should be added to
renesas_sdhi_internal_dmac_of_match[] instead, referring to
of_r8a77965_compatible.

>         { .soc_id = "r8a774e1", .data = &sdhi_quirks_bad_taps2367 },
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
>         { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

