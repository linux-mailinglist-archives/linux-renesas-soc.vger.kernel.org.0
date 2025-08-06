Return-Path: <linux-renesas-soc+bounces-20031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B74B1C3D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585D918A7725
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120128B51F;
	Wed,  6 Aug 2025 09:49:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03E28B514;
	Wed,  6 Aug 2025 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473752; cv=none; b=Qd5QPtQJ1JfehThfoGINc4IRCTIiO4BpKutZeEVybtdHM0675Zsm7Y+8HFqFPiBpFaiL9Zh+biQpybtD6Bs8mm+ktWnZlLq2W0hZFomYsHgF3EFl3Rn8wPiakspEhtcag6jP1almfSS5LdHXtZOWBp1BuDyZnEZxfikbko2Lwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473752; c=relaxed/simple;
	bh=KgpeG4/8kIZi+Q5pZBGORmIM9sqvgWvdhd9ciu1Zz/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/3FLxp2SEcj47HS4MDb7Sgai5A8UwMePB7L5pKWcSf/j3A42Pz1jPTwYdYBlKEGff/C/5KpFUAJmqWUDLoLkM1+y8M8u3Pg5eoGb3ohEqEZHZQhtWz6dPV6go4CGFgoW+s1+jO052IoxNstQ0+EfqCngHNn5fpwyzILaiQO8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4fbf83972d4so2034084137.1;
        Wed, 06 Aug 2025 02:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473749; x=1755078549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohW4yi6GOrjKp+9BF6Pd1f4PnxwG1hBCVQESPIRW15I=;
        b=mvzRlmNzBJk+1JSp8XbKq4Z+8RGQdjygK85yQI6Fx4UnM0hfu6QkKeKnPXTFZSmAsv
         kANIShD4oIESUMsH+fY8N36lPnWqIOtYWcclHHzwKuNYvLhPL+4+NGrf6Ylly0KxYe5o
         itxyDP3qI8NGG4mGQNsGgKdaQcx2k8xnZVqnwZYzK8ywHePuyJXIjTfxfPirLPMsmPro
         +ZoBb2Uo9Xm+wUOcg1xQnzMFIm4b+QNa0Aaj8cfFqn3V+QNM060CAeObIPEYO5t9e3Xg
         JU/KthCdarnpavfhDQLTxHNWcHMxmQHitnXQTgCxEahwAn3mFxPPDVW12Ssx+16M0+xW
         /OxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoX6BFIZpvxjGqVawrcwQTGnQTqMlX/TAotKrW/vsiui2m6oeSl0PTjodByMa5hJVJP7sRpO7HNWOBUCyRoLuFjj4=@vger.kernel.org, AJvYcCWnlJ6XujqgbTj68wYfE4sy+kfjW5Q7SNrlfbQgA/TIhaKhbTgwGsOGRr2N+tMgk3vsp/0xMjCTC554oePW@vger.kernel.org, AJvYcCXXSNCo6BijPVTxt4lFw+dQqzwnW78SDUDVmbU0BzdLc22A+VFBcFgMPgRy0y2eG/bOCsr48cuo7Sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXPbJajr7wrCB/udmRn1SByvIuG7mb6qVRF9GJ8aRzmoLISjE
	oLh2l7RekI3ApovPvVHVcaTBi/k+Tn4sMHFzdMEGygZq2i3VCTeFloJewOIUkVlj
X-Gm-Gg: ASbGnctReWcFmCeJcFfT3jpdHh9YthzuZ+Kc397hkVc4R3JWVb5wA6i/8r8o3iWEQq2
	obHnhudOSYvWr1pSoekm+CqTb81LzkRgb3Pl0i0T/3aR6o8rxAOM90qQAuq8TqmolO7zemoJSw/
	uj4uit9R98xnxj0uFXOT26BB1TRpZtygm5Xr8Uq+AkfYkd+Z7DL67dXDmYxasvL74szih2SLIW3
	WAGB/U03vWssUXotuZbAU+X9fQn4UsaM/3uR/rOdU15eDNjw9DRqRo5JmqPW3oB7MeImXH0gH5N
	oXPkjuItzGP7qgsIUQbycFMCzFDIBfbPMHXwrX4Fu3j9Me797/0T4z39fuWi4geq+cfrHB8WnrX
	QkWNJcUnjOQs2jwdu6xWenujFDO+v5zL71ytFTawUHuQGhdcppoYjagkjMEC+
X-Google-Smtp-Source: AGHT+IGmP3SxaQVS5gDa2okN+Mt6UVN3osYAZwoX4LtTeCy6dTbrS7DSKUfWCQ88aS+B12DekbwseA==
X-Received: by 2002:a05:6102:d93:b0:4e5:aa74:ac0 with SMTP id ada2fe7eead31-503715d0ff0mr648138137.8.1754473749440;
        Wed, 06 Aug 2025 02:49:09 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d1c4befsm3395572137.4.2025.08.06.02.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:49:09 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4fc83dda10bso1696222137.0;
        Wed, 06 Aug 2025 02:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPIMNJtUrGl/QRvdwW9WVXK+aLydTsi4PLKPQZ+nHJFQ0CuLqUJfCpJPp96N553QgXuKl9V0mXlq6kfGw+@vger.kernel.org, AJvYcCWRiBhjzcWL3/qZrc+aPxhMSLZdJHsjWXG2OvnV6Wd/AWhocIHyIPPcFln+eLRi0m33C/tPfR9tQUs=@vger.kernel.org, AJvYcCWdx2tEc9rCLyTkDtJxBbKDRPj49IUQv5l7YSmxZncL47L4T2TzjMiCFHKORQTfWpNRW3OkDxC8waLgrQRgHKIz1D0=@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-503710c71b4mr715537137.5.1754473748972; Wed, 06 Aug 2025
 02:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com> <20250806092129.621194-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250806092129.621194-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:48:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5Ws+ADfQKM9fFS24B4aznN1DJwL0bsZ9268+afFkCog@mail.gmail.com>
X-Gm-Features: Ac12FXwbzlNBQPuwzzfANplLaHQV3rogC4lb4UusjcCTRyRThDnCEQB2JILSN80
Message-ID: <CAMuHMdV5Ws+ADfQKM9fFS24B4aznN1DJwL0bsZ9268+afFkCog@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: r9a07g04[34]: Use tabs instead of spaces
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 11:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use tabs instead of spaces in the CRU clock descriptions to match the
> formatting used in the rest of the clock definitions.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

