Return-Path: <linux-renesas-soc+bounces-32563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKVjEcNHBGrNGgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 11:43:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4D530DAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53DF430B6D96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 09:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BA23E9C0E;
	Wed, 13 May 2026 09:42:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AE3E9C37
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665333; cv=none; b=cz/QjjxGY/CDvNVt94wD9ebSQzNII1WucS/xKxka4BTk/A2Typk30qYJObetves0qV3ho1JhRCIsforbFer81HDF7Xw4GeI19w8o4+K/NxtEkxpoRBmY/Az79ySakFvsBcYK0IQNvk5IkKC8BArO2zHh61fM1iEoi/m1GEyQddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665333; c=relaxed/simple;
	bh=uVYsoxVIXinsrUNO2qPk1Z0E1qtPCaft8XkhDwMRN48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5mzHoJgplWyRG0f2MrrcNLOOypfmUYgGYbVuytfzGeZLQnNE3f/HDuHed4+H/4+1IVLh8wqEOZQ8o2FDpmKK8iprq5QxzPyava/SvExSNRWSUWt9mLQvEFaDeKdERcoK1pEuJNd4QvheqfcwAKuSFs1asTjNEMHgp82EpZMY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-631a7868228so2781393137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 02:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665325; x=1779270125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imrv8gGof0CUbxurFPeQ8Hwv6N5BbSJLpDwNoIBJTok=;
        b=dEamn5RouRmUCdwmnT0I30tfPKsb/ggXxy4CvZmp5Ro2essN5zwXMmS2rhajY+7BgR
         6g5ix0aP5Zabuc8XjbFSO3UnzSshVof9Xg7JzcJQpL1N3E9Z6EpbmZHUk7igpicXxjQz
         5le5YVV6ZAfeizs4lE/nQK01lp3bNP/lI2Ee83kRzHe9TbPQffdMH9o9dB+PezxxWYem
         IFWuRHA7YjihazfzeZfQL34narTXzr+mBIUHoLK5n8cC6AlGrLlLLQtQHwJMkRC+QpvM
         AspqLSlYFO3YsBePTkyWkMvTil6tCSlopmsQplJHAt+yDHg582BharKJD5GoRNuxCWQJ
         A/sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nUEgF23lmJ8eaUDVUlTZ0kIubgUJSaxNoDw8yeHjTK1k93lyshVgbB5TR9Lhh7YuFPlvuJ0YnQ3XVtLD6DvjIsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqcQdXb2pYez7jKID0I+fWb7k28BV93OEp0STNNcdMo2T2xRct
	hxK/bepjJGq37BJ5vHtNtTStceQClUWvchQebytdXnQ9t2xFyt2DTLk/56wGNRM7
X-Gm-Gg: Acq92OG+RoI3VHaPVxoy0wzKXJzLA1s9+q8XgOcwpGGHRvxY7dK2g5bGQTBBy1LzAIA
	zAfYWAl75vwVUtj0wK5PqqMuJFFShzuJMmCyetz+8WAfhS+/Y5ZTmN91bDILxGzpLWSef8FHpBW
	zl3ejNXkzPDs7tqDzRjJ8ahPgZ+avrQ7dU9cbahfNj4hGSgzNqDtB8kwnDgTKp2LtzsPiEw53NK
	xz7GfpsLpfu19NJGrtQTFjdIMllr1ZCp9zAuei+jsviJXzWVGHRpeYeLrqnBpuv/9Yu15uO+phK
	K4RYRFKDRtcbkdIwo4MFIeCF6HHXTSFYJ/vVqYa2G2iaJkLnTrpY8vHIWAIamybhuA0i2aViQpC
	pvkBNq1Mxa+IVLb9Pkuk+xhN8yPl06/4pGFqme2wpVIjXe3Ed+zNrMkCeeUnEibGmn6end+xbd/
	4QOMf8pg4Y2PbQqeMy0TsDp8afCAxalR+y+FGRUY862yOH643hoHPeC2aq5UNxIQe7
X-Received: by 2002:a05:6102:3e1f:b0:631:cb9b:f9c2 with SMTP id ada2fe7eead31-6376fff6301mr1123330137.0.1778665325090;
        Wed, 13 May 2026 02:42:05 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f219f6fc3sm9213931241.4.2026.05.13.02.42.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:42:04 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso6082736e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 02:42:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9m8KGfDEqxfMoDMgnqXCKnIYtFnmcUhqGMrm5UOpXtyT/HgeW+ljCtVENPbN9FZ5BpZMb6QSvGqwb52klPre6Z8w==@vger.kernel.org
X-Received: by 2002:a05:6122:4d04:b0:56f:a329:6859 with SMTP id
 71dfb90a1353d-575e6f9a7d3mr1048517e0c.7.1778665323607; Wed, 13 May 2026
 02:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com> <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 11:41:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
X-Gm-Features: AVHnY4Kr-XCAHViwq5wXvuNDFdIDqB9sk9joGebrZRK91CK4SGoxuuFnaauWCrs
Message-ID: <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: ADC4D530DAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32563-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi John,

On Tue, 12 May 2026 at 20:28, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add support for the SSIU found on the Renesas RZ/G3E SoC, which
> provides a different BUSIF layout compared to earlier generations:
>
>  - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
>  - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
>  - SSI9: 4 BUSIF instances (BUSIF0-3)
>  - Total: 28 BUSIFs
>
> RZ/G3E also differs from Gen2/Gen3 implementations in that only two
> pairs of BUSIF error-status registers are available instead of four,
> and the SSI always operates in BUSIF mode with no PIO fallback.
>
> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:
>
>  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
>    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
>    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
>
> Future SoCs sharing these constraints can set the flags without
> requiring code changes.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c
> @@ -107,7 +107,8 @@ static const struct of_device_id rsnd_of_match[] = {
>         { .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
>         /* Special Handling */
>         { .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
> -       { .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
> +       { .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E |
> +                                                               RSND_SSIU_BUSIF_STATUS_COUNT_2) },

Nit: please split the line after the comma instead of after the pipe character.

>         {},
>  };
>  MODULE_DEVICE_TABLE(of, rsnd_of_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

