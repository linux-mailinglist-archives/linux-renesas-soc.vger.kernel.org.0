Return-Path: <linux-renesas-soc+bounces-28545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLiYBuq0oWmMvgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:14:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7086F1B9853
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C38B314B873
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B854219F8;
	Fri, 27 Feb 2026 15:09:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226F436347
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204982; cv=none; b=an6/42ixKDI+jCbIty8c5NwvRsVfygQ5eNKtHMgUv8v3gSuO/EODUiXPp6A9p2AFRwZhEyrTbClseHt69nZNGGolFJDlh0o8ygxqckB+KqwbRsEaMONMceheAiONY7LTappXabbyE8GITZDhY+juXDZgN/XoVasgwiSdqcJel1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204982; c=relaxed/simple;
	bh=nbzKvIFlEB+rHxUj/DRoI+TEGMemWsYqDcWls87yhkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueaRSzwsoKn2LU6nAe/SSvb0sUDDGQZ/0RTxEpU3o1845sv6ddwe1jGH8gRkhc7hIA8nPBeDgAdWKKLqW7dKUTiZSIrBgdrlHwFgdWqOBUYUL8MvciGY+cScMv9IvwL2kPp0XlEBtLOoQtDfkPiFjqLC6v/7f93/aU9rHMbtr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5674d8be45eso955552e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 07:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204980; x=1772809780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNoU4njpXNM4J4sLdpH/jCioYswW5gHauk8KtcDWPNk=;
        b=MjVV41gOLJLA0X+cA4Sd82U7pG4FiIKmOTZ0tAagVMixjyWBMVyTDUg9rSxmjo5Maa
         P7lxLMHZi0WWth32MY7ZejAmVtHG8W3UwvOviKED2gz42zXjP1xy2iTNlplESV2pUjUY
         jpQf7GYE/F5qChyGWkV3rsGFoFOJa8b+HD1NtdO08WbnUQ0LJA5AQmY0K4Unt00fcbEi
         hkWn0gwftazTdEDpdzQ0v56Tis8uliy5v8ASgCitHFmKZKcuT3u+/6yASfxA8JcX9OZ6
         r4Ygkiu70KC2ArcSUsc7VR367xfjt4J2fTRy6o+bzVU94aGYkck6YQMOHURsaOk3piOM
         LGfw==
X-Forwarded-Encrypted: i=1; AJvYcCVIkjUjHSwmk/ergUVAFITQRP+YnDb2xsYLQ7zyuFruNlHev/f3GF7K4j9wA6whzWs/76Py998WdSk9AEQY8utUbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYZnF9C5QP9h/0+jcrsytHwtkM6SBqeZEpOr10GkbwMtNo9ob
	a8HAAixayw4Bbm+Zp+gIrk9iIGma9drz8Pkgd2pSxjgHnoxRn7ScghANxAtwliA8kAs=
X-Gm-Gg: ATEYQzx7dv8XKt0k13Sew5n+idHv0EfB4oN5rG6xV4rBqaF9Vb8JWxkmUuuOp+g2jtW
	3pOePQ+M3razZ0NHsaODyijKOHtiAJ3SYJugCLxw2rQVcyiy/1nbCiZVo1UPjlIhmCfNErJezHX
	nB45mwPSenGgfoXbtNCs3Y2eeNwLxjndKy/MRq5vV0Jx3e8f2ei4vQqfAM2e4VSCrLSVmh0Sqf1
	YPJg9SjYhQBxiXM/kOFdefbCj351JE+zjZ976wDFNah3kAX/6MT4aIJLMmbksM3BYkaWILpPLKI
	r0sWlv76QSqReHz2d9LmOWieF6O76TsVLC0nVzgLTOEvB+6Gd8e9Q7s+5NWVbhQRI3DpPi8YExC
	qkIBKYUhXJ6ZYoSAyw+1RVgznkLE412Xj/SIaVCkFwhoBWxLUYWcIjkCtj0WfXWros42QQVB4O0
	A2hWFzrMTfWe4zttd4kyVmfJKUVxqPlp0YXpsuvAKor7I7OaCh8LkittBboU8GkmUM
X-Received: by 2002:a05:6122:2218:b0:567:516f:256c with SMTP id 71dfb90a1353d-56aa0a87f0dmr1751442e0c.16.1772204980077;
        Fri, 27 Feb 2026 07:09:40 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65c4951sm4766406241.14.2026.02.27.07.09.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:09:39 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5674d8be45eso955498e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMPE/KkAH38K3UBt+D8ON3D0gt8jrM2Zrulh1/2czjIfYexlxVC4JdCmlkEeqIO3xvJpNu70dr3+3RB/xoBUQN6w==@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:5ef:a8cb:857b with SMTP id
 ada2fe7eead31-5ff324dbe3bmr1277792137.23.1772204979305; Fri, 27 Feb 2026
 07:09:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com> <aaGxrm0SqwaJWCph@redhat.com>
In-Reply-To: <aaGxrm0SqwaJWCph@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 16:09:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
X-Gm-Features: AaiRm52Jqo7UxSZlX-KgdyAXxubXhZyYwkTdtt3Z4LSPc0PHILPSj40Nn3W2qSc
Message-ID: <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28545-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,init.name:url,linux-m68k.org:email]
X-Rspamd-Queue-Id: 7086F1B9853
X-Rspamd-Action: no action

Hi Brian,

On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > > This clk driver has a noop determine_rate clk op. Drop this empty
> > > function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > >
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c

> > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> > >         init.name = core->name;
> > >         parent_name = __clk_get_name(parent);
> > >         init.ops = &rzg2l_cpg_sipll5_ops;
> > > -       init.flags = 0;
> > > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> >
> > Iff this is the Right Thing To Do (TM), it needs a comment, as this
> > clock is not managed by firmware.
>
> Before I start a larger discussion on patch 1 with more people about a
> name for this flag, help me understand why this provider has a noop
> determine rate. Is the hardware eventually programmed with a rate
> that's close enough to what was passed in? Or it doesn't really matter
> what the clock rate is, just as long as it is running? Or should the
> determine_rate function be filled out in this particular case?

I'd like to defer to Biju, who added the empty round^Wdetermine rate
function.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

