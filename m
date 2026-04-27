Return-Path: <linux-renesas-soc+bounces-31680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJo1KiBZ72n5AQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 14:40:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7734729FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 14:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F73C30021E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 12:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C9A3B8D6D;
	Mon, 27 Apr 2026 12:39:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDC53B8D4A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293597; cv=none; b=RZidNHoXowr3B0FrL2SkwGj34YeVUQfF+u7M08yBdOoQ8bhxOpdJ1T/rz9DDoT0JCh8U6qKI3X/sAjav0r4riKObmjrNAt2rUZ9HzhMxmvTEAvxAZNdJeo1fhbOiP4wLZOfIsgsvdSM5+8/zitQAqmex+PKbiPSORaaGYt/wkPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293597; c=relaxed/simple;
	bh=JDIWJkl/LgBTnPaChq7M+tWmJ9t9TgrLrxcBQAaM568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVrZAKx6g9e+c007qJ/3FmnHvH4B8+tEAq69nY3tTui7x9Rh7WfoU+V0p2MiL5kwWhuLjxcH9BDHBfNAx+9v/hBhjXjMC939UlJmFS/M/ZhpyFsVGY/+YRP59kCyaRSF8IDV7ddqxnF4eSQR64yMmNakEbpFDei84h2UAIZ+bac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so9629330e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 05:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293595; x=1777898395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I4ulITfm7RcRo2LSwevKoJMqLeV3TvjRz6ydPI4T5c=;
        b=PCfdI2s7wiZ8f126J2gbqR4CN16O2XMgy5299MDIJxnb3u0Bkkuw+s2N9YTJ1fYzno
         IyF7A2rXt2iXV7Lgn3XGfumUTu+GfXjl8+Dt6MpCagwVU+7PQXDcA0DlO7dfMuXc/8dX
         RgiC/9TttBVCb8OHbdLFXVzIeCEsWJeXYxFT08AlQWRhdwbDJzfl9Q3mBBCH+jGumBqQ
         TZP/+zy/d2kNg6VB37CWAX0GaF7kyoU04r+JBbhFgTF70WIk9LRPltsrpt6YVNc1c9+X
         Jx5FY/VpUD4MHQwFkZfR2IirwPGz4Zn/TBgP/Ib5W2U33ZUW+cZnmD6rKnt0M2ujLGpW
         ysxw==
X-Forwarded-Encrypted: i=1; AFNElJ9i6UWgzDpkvTqQSL5MRn7vqeiZbiXsvJV24d1FXmFCOFPdzmtRqSsZFLrxADOZKDAfFoQKZGEJ4jKhqxsgCu9F2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAktbPg9bPjisSK90Ll4ZgAS8gp+p4vEp3YJqb+zMB9rt2LwYF
	ZKYr4Xg8o1kDfGzh6o5srT72V4Jw7PObMx/NEr3wOzfivrb0olkl7YU7xORpdmX+N4A=
X-Gm-Gg: AeBDiesA/DXR03mGUGeuxwouFY1o64rIpZBipv+W6xvxRtmGwWTSestHCDjO0+U3JhP
	/4yXiGbMY2nel8MXeD5TfLLpd1SraQOGc4FjA7YTqpvur2I7g0a+jRGN4OTpHQ+mj2A8P1A0Ol3
	MKN2I4VCDDAzxOJfKHaxiGghvFPkQoOx0bp+So+FK23H011mV9hNmsO4YwSywc0NJzyfw4WJoMW
	+d0CeOzSloNxs8ugEegILKprGHhQBg07WO5fywwy8cOwhHoY0SGKBUL6wVBUM1gYIEkUFKG9EsY
	SBWToE8E9STocoGBq9U5d0qI34TfX034S0UVJuaUq5SizCS5eJmzqCcfmXd0pYCYKoO8TwH4Ugm
	NYFr7vdQ5O9oeEr7WCejTKUNs7s7CxqQ515jdYnKlxUXjb7S9E2kcs7Z6k7jA/yyhzgBEugnglM
	7naKd+BDKUB0+mUcVrhj9mxd+PKT0tDAcIfct0QZ5QiTce+oD5pv1pY06kHFSvWlVMdIoZJ39uV
	fBcyzRSHQ==
X-Received: by 2002:a05:6122:2913:b0:56b:a7de:7129 with SMTP id 71dfb90a1353d-56fa6697f14mr12047483e0c.7.1777293595264;
        Mon, 27 Apr 2026 05:39:55 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f21bbsm17767163e0c.11.2026.04.27.05.39.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-60579e72ff9so6928598137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/rKn/I0Kvj7CNeWzbY1zRwhwjlimsjCTg8gE/6WtlGt3hDqUlsmUJ2RsCm3RXBSnLkh5t2V847lqTqjDLEiMt72w==@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:60f:f686:3de2 with SMTP id
 ada2fe7eead31-616fd91c77bmr15161873137.10.1777293593886; Mon, 27 Apr 2026
 05:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 14:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8TOLtTXiEDmze745n1PUDuXB=ngrZpmQ82u1wzM9-jw@mail.gmail.com>
X-Gm-Features: AVHnY4KkIQs5InenbyGUiwPx39HZwsYBx-UWGIr1zOzvwEycJZUsx_PjwWzdJxs
Message-ID: <CAMuHMdU8TOLtTXiEDmze745n1PUDuXB=ngrZpmQ82u1wzM9-jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: pinctrl: renesas: Document reset-names
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2C7734729FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31680-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> All SoCs has multiple resets. Document reset-names property.

have ... the reset-names property

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

