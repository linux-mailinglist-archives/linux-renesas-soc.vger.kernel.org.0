Return-Path: <linux-renesas-soc+bounces-35063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FMtGEboSUWoz/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:41:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AA73C5A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E96C30038F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E4D43440D;
	Fri, 10 Jul 2026 15:41:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774B435AAC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698099; cv=none; b=LzhEOzwv13o4CT4Ns238vADOoqF4ivajTablTI9/ryeneLGYkvMVgn4ZdXVi851Xk7rEoWES229H+mMzmyeLHdICSCKkKQ8VBUGUct7vjO6aS0dgo3ZpUKoU4CPP5OYOyR0KRVnPigVBI7k66Mqa9taNRAzT9qbHihL4kwZEIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698099; c=relaxed/simple;
	bh=CFdTAzR79yXfBDC1ONgb8EApFd6MY6Wqry/8rdfiwAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/iiRCheOK9186bYFUnAbuFHo4iZqvqTnav8DUOkdFVdFiVUexH81VaiCY8p5kFLmfxVxWF+mc+zxFfVuQVFQl9Z6ipFIH0AvHNnWEGH2lSPRAgNoyTNIsWC7xTIcgAfvVKUL/sRoqQ2eQB3mSauoSzpMwQ+B9O8LxV0QV5cmr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9690c99c917so339808241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698096; x=1784302896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2U6x/iww/H8ZEzzPTn1u443SVDkdUDkemPt2sl91mi8=;
        b=FLNWFkRL0DVTtDnTHntKV1+4iavuuwEUIwk9NiV9le27ww+HROWf6KyoleYGUJv2gP
         jzgsLo9OHS650Mn6czLr6KfEaZEIX8CT6TZCc9UKEG+Y+5vf/GuURkz5l36PWXtV8MXV
         v6aZUF2cao4zdskSnA0934zhliq2lmdDuswUXvlRvm+P4vKPRzMck46yr/Ma7GTN9eV9
         fm6aMxMd/tTKoZ3y/dgKK9Xtuvt0LLNhTvffk6hQCnj+eB13OjZvq4el163vaiIAV7OD
         s0IquUXlBumn3brNeGP2QGS+9dO4R/sONqcg5t/CXqZEdY41+BLsv5pV3HAfMSJQX1Ss
         WV2g==
X-Forwarded-Encrypted: i=1; AHgh+RqY1jaC9ji/nwEfVOz0d+z0azhhbBnIfNLjI8kGUYGzWOXBgFLQmU872ijjTrnwSfG9lE+MeG1EcSDjRXNQN3quMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwszCx2HYGHBAurlOL8MbFYb5zuDN6trsTM7ZfMObXzceOtHuAZ
	AqDYmT95MIPVR4VJSXcFfPeNQe84tGKGU8ZR/rZ2cjDG3/LVtb4975rOJK2RASqW
X-Gm-Gg: AfdE7ckAeCMTtTKEh3FmEZUJUvDhNu7Z9uZWGo7Lffup28Oej+WvWxBTQ0Wmb8naZHp
	1pu+WvBkd8SkQ+My+JXniZaPHUzI7J2/COXFPwGJOHeYmXdX2NZcHRrWJCtQZUOjQQ0QiVPeNQX
	/WHupIoFuILDRihzk7c4yYkQIvNLK+07S24qbwNOj2ErbXvEqrWXia9D4mu/zwKBQX3hlnHipd9
	jgkIf5IO9FMWIBg9DxqNj46eU3OFEHafhKb+bC1Z3FwwDjVegZxJvd9j9A9/e6B7LzlWRnh9ych
	dyH7BETGX8UO7LdYv5GAxivo0L598sw6VHMxbusADThGEuwBpT61dQhY42CzE2k0eVz+yzGx9qI
	7PKs3GEnID0vlDy+kBZ3LXuaMHEFOMOrZFn+sMVTu5amm62WjFUDMeL8UXPS8LU6yubR7P+bEwY
	E1K+FW76pln4F/I097n+g+ErRXynxN8Tnl3RpJ6SDd8vT5y9otF6W5fqYinm1x
X-Received: by 2002:a05:6102:d92:b0:736:e617:b4f7 with SMTP id ada2fe7eead31-744e03c3423mr7721399137.21.1783698095949;
        Fri, 10 Jul 2026 08:41:35 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6545095sm4787423241.11.2026.07.10.08.41.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:41:35 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9696369925aso356674241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp9taGOgI7ShScYQq14qWjZBN2PmBzDotqFOYwh3DuRCWgb7sQQjOXaXHqLwjZ8bdwy/pNEXumwJ0D92Bn+pgcsug==@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:73e:c6a0:331 with SMTP id
 ada2fe7eead31-744e0047e5emr7225411137.10.1783698090391; Fri, 10 Jul 2026
 08:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:41:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9EtPKbhLB3rmH5SCpwxkuEM+1eFRHmUi+UBzDWQAPdA@mail.gmail.com>
X-Gm-Features: AUfX_mxkEJXMxlF996XBRlIvUc3IV1GcyKh0Tq2bOtqByG6LoBoIxI64SOtetRg
Message-ID: <CAMuHMdU9EtPKbhLB3rmH5SCpwxkuEM+1eFRHmUi+UBzDWQAPdA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: renesas: rzg2l: Add support for divider flags
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35063-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 963AA73C5A5

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for passing divider flags apart from clock flags from soc
> specific clock drivers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One nit below...

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -112,6 +112,7 @@ struct cpg_core_clk {
>         notifier_fn_t notifier;
>         u32 flag;

I think the time is ripe to rename this to core_flags. Or at least
add the plural "s" ;-)

>         u32 mux_flags;
> +       u32 div_flags;
>         int num_parents;
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

