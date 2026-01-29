Return-Path: <linux-renesas-soc+bounces-27578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGLDDxAae2msBQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:28:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09CAD7E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A3D7304275C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 08:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6582637D124;
	Thu, 29 Jan 2026 08:09:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6F37D116
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769674165; cv=none; b=p2759GzOHv45pVsDeH6uvY8keb784ODd6AKpnHrtzZsfhKvfw0XI3mkX3RUq3/JHuiRijV+UkLEcvtfxUFXdSyGSNNiNC9QdeRJuAzdTg0Q7tmfPYG8NuxjUMkolPwyOMpBGSg+LnK1uPaWs8QQZgPgyLFPIpX+FpOfdHSsLIDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769674165; c=relaxed/simple;
	bh=dEcExVZUpePTfNi5pTXkJ55wzgIjcUWQz3BrGyxUIdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xp74i/GOFYA/NM8NQDsjnlmjumKfIk5vlGBEu7bP5VrJSNH2qepsYLPeA5YgCSKXM2tIBgLyPl7qd0emI2+HlmUgpbNGu223T4DMk4qX8xQBmKsUCLk2dopFXPpcQ2m8HdvLQVOLk9R8nxAwGecMgD9WgWXbmI5R4e02MBW1sMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5637886c92aso206175e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 00:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674162; x=1770278962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2RYHlQBqPbWZpA11riL5qiYiCgBO/aHNTdRm3/6Ht/E=;
        b=xRby2RYLjoFAGyckLNM2kH0Zha2AuZzwsOEZlZZIoiB9Y+rI6drjQqioblSj65UiNM
         LmpvpiERsee8W5NOjzu00axFThdTKz/Ilr8bRUGXnUx9eWuJAXlwSFfquwy2uO0qWCbE
         ovW5ZMRUTFG9I32Sm34DLAhq+cfUAPy8jH7GQXC7gYPf86xQXMz6vu+GFcOeSsutNMa7
         GcYzw+GQoryE84znH7Dc+NQ3QL+ucjhwkl5/utxpfKnqyhwMRgdyOHn0OooPJX7MXodQ
         guCDMgKVLrYNuQYraKqqW0i4TTKBMCODYWqHyZJ2swVuW/4yuQeNCctCb/FYJwbJqTNj
         Y2qw==
X-Forwarded-Encrypted: i=1; AJvYcCVfuoKoUOloNryeJCB65Dw+GMXDqEBgfxiNSchO1bhH5TzD755Hahf5UscRVcpH/Ci67fvg4BCncWtFsPOXbafo7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwu4QWCqkQdHFryJAZF+R8fgpUmKjbzFwjYGz6WsbGf48hiPtP
	YOvzCJsLmLFb7hCSGL6zJWfn9OkXll85UVXnMC8N5tseqkIUlwz0uj5dkYZbPA4+
X-Gm-Gg: AZuq6aKSvZ+ZNGNIZ1ftbHAkCJ6NHxmfaRXASAf8L5DfMDOdLG+Qabq1Tgj+Fse359k
	wlp/B51dZY/QnqutqX6vHDcS+d4uD3W79K/D8PlkqcjJDyJ1ltFUdVjFEd39sUHljLDBhY/LM88
	tbmg95jKUPCg/2bnXySSauXz6Rt97caASAGZzqt2Fek9WlahgvvpmYI0FbULS8r1nsC59eGpsBK
	Ru6bEa/3576n0BhK7wBMjqmJuMXrFPMouJvNEvC1ZWrVNwZW0nqrXCKU2Hz8cPr2Jpq94g0Rt8w
	uj5FxBvfWsrDmCqWdcEjhhFyw7CmKLtvPEoLdsVROuqIidbhWADNpFhwTdjISy6/duYcBor5C0C
	PpkApXkxR8RMW2bNjO2liaZ98R/QNvANBcbaJkfNsknSgvYkuxyl+VjsStWJ5H3W8V92PLTpa7z
	m6B3xV7BYfxMvr0zzhGPrGuv2naXdSPVwGGtw+xobL4mMq09nNwITeVOcZrhCT8b0=
X-Received: by 2002:a05:6122:2a0c:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56679553d11mr2334338e0c.6.1769674162390;
        Thu, 29 Jan 2026 00:09:22 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685afc974sm1072670e0c.2.2026.01.29.00.09.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:09:21 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-560227999d2so230721e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 00:09:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaR+wFUsN3lrc216b+KWEWOMi0OQUSM2Y6FM0RWyB34LvrHGll9au/7NZgTnU0mvCsje1WzEePZORFmHRhu13Z+w==@vger.kernel.org
X-Received: by 2002:a05:6122:2a0c:b0:55f:c318:1afa with SMTP id
 71dfb90a1353d-56679553d11mr2334330e0c.6.1769674161452; Thu, 29 Jan 2026
 00:09:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com> <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
In-Reply-To: <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 09:09:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
X-Gm-Features: AZwV_Qhi1kH5pOpvyoAQdGjaojTMEjrLQeeGn4WgSYUxomJrZ-aWTrUsCARxGZw
Message-ID: <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()
To: Linus Walleij <linusw@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-27578-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[of_args.np:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: AB09CAD7E1
X-Rspamd-Action: no action

Hi Linus,

On Wed, 28 Jan 2026 at 08:55, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Jan 26, 2026 at 5:35=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrot=
e:
>
> > +       of_node_put(of_args.np);
> >         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
> >             of_args.args[2] !=3D pctrl->data->n_port_pins)
> >                 return dev_err_probe(dev, -EINVAL,
>
> To me it's a bit odd to dereference .np and then use other parts of
> the args the next line but maybe that works.

The of_node pointer is not used at all. The code only needs to validate
the mapping numbers.

> Geert will decide on the patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.21.

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

