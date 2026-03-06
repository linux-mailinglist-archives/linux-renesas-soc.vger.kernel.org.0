Return-Path: <linux-renesas-soc+bounces-28945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJupMfHIqmlWXAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:30:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8718220A76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 032DC3022452
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F258A37AA8D;
	Fri,  6 Mar 2026 12:30:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD61387361
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800215; cv=none; b=O9NuD3l7ACjfh9+6Rp+cT7x/DBpXKnFWeCYb4JP7Uqn9wuu+YmBzLK9xwXvmP9gsVGU6kdMCZLgyeXkaqa4evqnM+eTxu+hWuShu7+z5qmE6d76g1TohLk5sKtZGW0s4EVaYen28JE+ExmYpi6kg/sUpRmQfuqCqFW4kJvQS3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800215; c=relaxed/simple;
	bh=oUbryjVVhid9Zt+Zf7/gBLZ34rqFvud0SV96+cSbomE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V12N2JgSgEwA9qB9eMRPkAYhwEYDoSsjBAX8xYsYSiUkx6frcB+XLqonhkQaPJ+OCX9J37tKt2MfSclwhSsp/SuN6XHiKL/UzipPa3fbB3OaVNM7t0MpeQBayocuXdhS/mvZruSrRJ7CuDUFA7Qtizqsv1pZjtD+jvb547Qftpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so2744444e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800213; x=1773405013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBqwNtBq04gW3XhBM103o7jdyiuax9OBXrNtqd4780s=;
        b=Plu7QZjrjKVzTvPSdfb2Wdn/+nt0LuIBKQghPtEHGcX2ZBv5OqZAwKcxvlzxsuQfPO
         OdpNU4hC4dK509WeeihgGKO4j+Kxw4Y50shLmFinTggpszx1f71q3X4ciDQdkCZ2jdwf
         2Z5OQNkJkADTmnGMqA3fJGK0QqI4ChypqjWBxnedrAZp9/uDAnzFZ4PoPAz6/JOqwyyK
         0iXeebTlrvvi0ANYrwNrC+bCfdL6Zdv/kzC2hny3tX912Ug7wKleYtk6ESN4h+HPWAAh
         +w8pqySf37/FXL9G5AS/3LdCHam+KXpfi/jZih0eN763WxMW7POd2edOe08yKOdubxRE
         DnuA==
X-Forwarded-Encrypted: i=1; AJvYcCVaoQLGOEcd0k1HvZVakxqzP9o0EX9Cq76SYISZlz5B2SpciYsdw+dg6Xd8kpzZWzSlB6wLcOs+YatpschEp1n9ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwexBlOFkpVjrHPNkd32EucMEI5B6E9zHzk4jyVljOrEdglrmtG
	Q4czRmi1oMTUwaxfWy0ZyOQD3BNiPArQSdYZ823+iB+t36V8JGcLjAO1z2MeNgX3m2A=
X-Gm-Gg: ATEYQzzEkA/yHyzRo1HSfnpFGJvvtsEMnX5hbjK31FPbqKQF7pqKBSr1BDmmh8EOmE8
	rgF7zatE9Xw3WvGsYb0PJpPmynDPqHlWs7R5UBloNHkLXh88O58AQPD0m53fZJdaNzmeecVmJmG
	rjNo+qMuJJjjnwC53joZWoXeM7AbnMDKiEtfO+aUdI1XlULnzuDbAaAY2WcXwkKjdYXVjE8xS3Z
	9ykTgQ0CClRynFZNAf7wqGyZj7iRGeUyOqQua7ZePnIf8pRf7lRnRWakr2wyBg9lNGRKfcZvsiD
	20poVe+SkQatoWI3arxSs/deNYr+7YjEMm8KJXiYwxlr/GwYX7kGYfhX8pwtp6ov19L2bUzvxLq
	8Y+vvOpppzZxvs/sGJZA27i3Wwaiy5a7xlBtpnE+rgM5Avl+xPHoM1sGdYXkrHn2kDFDWT0hAiR
	KjWl9YXWG4HogRN2EG+o/s1LnBIXuySgPZg/MI1/W2e/hFXc65i6uJHNkKRdp7
X-Received: by 2002:a05:6122:65a0:b0:56a:f5d2:286b with SMTP id 71dfb90a1353d-56b07d482e8mr641215e0c.5.1772800212693;
        Fri, 06 Mar 2026 04:30:12 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09a08dd6sm1256337e0c.2.2026.03.06.04.30.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:30:10 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso1255829137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:30:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoTUJwxu4IcEMaGh5RIZd9pZ85CwqJlZq8jbokQ0gLMjQAXF+y2lhqzzQgaP1599L74DAcIV3W2gIgcHjWVQCaOA==@vger.kernel.org
X-Received: by 2002:a05:6102:3f16:b0:5ff:9ed3:448a with SMTP id
 ada2fe7eead31-5ffe610f26bmr765636137.24.1772800209844; Fri, 06 Mar 2026
 04:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com> <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
 <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:29:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKErj=4NziSVFQ+uh=zJC9dSYY1SXDJTGHQHAuwqXcMw@mail.gmail.com>
X-Gm-Features: AaiRm50pZFMCJnJ-Np5cwSu_gQrc6nNwiNWkdS8Bm7_5qaQjQmPkxb2yN-NcMvk
Message-ID: <CAMuHMdWKErj=4NziSVFQ+uh=zJC9dSYY1SXDJTGHQHAuwqXcMw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()
To: Linus Walleij <linusw@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C8718220A76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28945-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.948];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,of_args.np:url]
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 at 09:09, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Wed, 28 Jan 2026 at 08:55, Linus Walleij <linusw@kernel.org> wrote:
> > On Mon, Jan 26, 2026 at 5:35=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wr=
ote:
> >
> > > +       of_node_put(of_args.np);
> > >         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
> > >             of_args.args[2] !=3D pctrl->data->n_port_pins)
> > >                 return dev_err_probe(dev, -EINVAL,
> >
> > To me it's a bit odd to dereference .np and then use other parts of
> > the args the next line but maybe that works.
>
> The of_node pointer is not used at all. The code only needs to validate
> the mapping numbers.
>
> > Geert will decide on the patch.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v6.21.

Promoting to renesas-pinctrl-fixes for v7.0, as I have another fix.

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

