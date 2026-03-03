Return-Path: <linux-renesas-soc+bounces-28708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDBAGYTkpmnGYwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:39:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F416C1F069D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C1C830579C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ACE2288E3;
	Tue,  3 Mar 2026 13:36:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6963248166
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544960; cv=none; b=Cn4x2ytjfSxv7jb0Bi1OTHJi1w+kAQORQkF5vFiSSql/qejs3D7fLQ+IhCu3WFNLPCO0mvO/y0TnPzaLTGQBd6mX4MXDOx8y2usoKiYDfariFC6MJHdi+PIHdLXN11g05ll+9TZ2bwOGGtgSllDuVbMnHUNjBfVxzSsYr5X5Vj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544960; c=relaxed/simple;
	bh=237yIWVIGSqP8Nr5OxXm6vlm1rkrjBql5SlE9/8gnlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaN1PxPV9zkhOaTAlVUzHOKemLo3afLYQLcLsEOyAsUTdHfIbF7rnAZaR03hqyE45VyOY539gsE8Gxz22jOqRn3q/u2GwVEXFZIvssmzkYfm9n/ZSgrGMxDhA3o3Pkh0fRRkAvPzqnQRFQIk4UFbBQULI693iyxKa76yoZLxiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5069df1de6fso48518081cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544958; x=1773149758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAwQLMiHJNmA+WgXHi1U8N28xuUzy6H6o/lizldAOqQ=;
        b=lS4nZe0Gall7in/g1lvhbv9gwOxpXQMGHEE/NEa7M2GbEAN+OF2AvrIe3SEHmtyT8I
         eg6WUdHARcddjhIAT2A3Z7to4zM2q3qIcKQVOSGDrAOv5RxW4mCbAt8cJ4qVJkkvMMtU
         DBYtByoYrPsykUoZT4B4NFhDcdQ8YZYCtmMENcFi0xcfK7yBJPCbExLDxvd/ynPPlEAG
         To0Zwbv9d7GdjY+70lck2q5IJza61r8Qp9R2YBwsf8JQKQoZeOmgaMkNjIqjtspJf0H5
         Gi7ArrSNMSLb5eUCkR7LBS2+kvPNRoA8bnJi5Jsi4NHUeMFgyyZpPIELTVYseiEXRFku
         mPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgAJDXqSDKfsXqzPmYt1MkXo/jeuvPyDJd7C9Tv0teMDpEjWiVjcwblpd0l/pWuCLDetR4zHG5jR6PC321cWsSbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyf8UreI+zMxefbgsxms0vY30G6JuJhnBQjyjxrbK0yIygMhM
	8wI524Eu+ZFHeWMN8d2d2XWpZYU9zp9q49SRxywZxDymak5AElaFZymUZ1rZGlRL
X-Gm-Gg: ATEYQzxJTk8b/D0W/Tz/JVmW/L53pFKcWVIaLNU14N7SM9YeKqDH2tRLeXOUARqiCp0
	v2PaZyz4ZXDJdB2yeRqWJHZYq9zAfGyhQZfkbDsHNUlNRbOyKKkJMU1hwZuCDnoWqTn43uDb8em
	VfRqO7o3WHCKvL+ZIirsxVbeArTQXFveU01RHKxM7A9Ot0eYBi+sc0l29SivU4uUOVx4wvl/c4Q
	QlG67vqw9zUvojAnGXtcVUbOXxpGDBh3xA7GvERP+iVLH9phWV8N1ZATwqMekzH3GGlQl5YWhWL
	nlNIUeGrO3qWk4EXFySt2I4vzwuvhI4TdEdZhHuVAN8H6Ky+AWi/KTPfh1jcE7WihCNPsVJ0d/L
	gQltpEpNCwF4ugX3Xe0g492YCRSCDJ65yqcU03+DIgAJL/5zsKS5rjfwWk7lb20ayho1lBNJCX5
	Smz3kAWlG0M04BrXmApVRgVXPL+yTHnvmhxs6WV+c700F8WPSMivcz2qk9JWuXYpRl
X-Received: by 2002:a05:622a:138a:b0:4eb:9eaf:ab4d with SMTP id d75a77b69052e-507528a8351mr194598331cf.62.1772544957785;
        Tue, 03 Mar 2026 05:35:57 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630absm134183191cf.5.2026.03.03.05.35.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:35:57 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb39647a70so534862085a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:35:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJzvCFbEIqYGwtfti6Y8Nep+Zd2zv2kAYSwFIzlM0dQl7kn1c7+Gonw82mMsohaK8KtWA+KQpHnhN3mdymMwtftg==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5ec:daec:580e with SMTP id
 ada2fe7eead31-5ff325a1577mr6210023137.36.1772544609268; Tue, 03 Mar 2026
 05:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:29:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
X-Gm-Features: AaiRm5008H6GA2iSW5UrwIeeY5Wgcg_c3Mk5GG-msQ01mr1Ry27aQjZHaY7c6iY
Message-ID: <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F416C1F069D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28708-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.643];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Fabrizio,

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/V2H(P) SoC specifies
> that only the WDT1 IP is supposed to be used by Linux,
> while the WDT{0,2,3} IPs are supposed to be used by the CM33
> and CR8 cores.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 and CR8 cores.
>
> This change is harmless as only WDT1 is used by Linux, there
> are no users for the WDT{0,2,3} cores.
>
> Fixes: 3aeccbe08171 ("clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-fixes for v7.0.

Apparently the same applies to RZ/V2N.  Shall I just apply this patch
to drivers/clk/renesas/r9a09g056-cpg.c, too, with the SoC name
and part number updated, and

    Fixes: e018f9f8973760fa ("clk: renesas: r9a09g056: Add clock and
reset entries for WDT controllers")

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

