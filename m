Return-Path: <linux-renesas-soc+bounces-23574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCEC05466
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 11:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37E0D427DF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7D42F99BC;
	Fri, 24 Oct 2025 09:00:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1392749F1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296441; cv=none; b=OwEfUhkpMPwQp33Fr0NJ5m7fs+VJsRkSJdWEeE80e8l8ELaCwNo17Hql/x54+ShTdHoYx6tZAEO+wlA14pFFBJPZcZZ2Tex6yUffK9K752cGXqrgGCE8N4R7S4ArNVX/PkjG9FZaKyVy7UaBIo+XrwZu5iMRftWiG9y29Mpgp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296441; c=relaxed/simple;
	bh=VTwfEDA9O/4R6v1xPBzrfJocZUu/+v/Lfn5nRGgSQOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8nJGQhh0pVMrAD8/kXQvn1AOmPTf3UZblUTNuav/z6Z/2XW/dERmdauXHuhKsLJh3ui+wlz05KmLL3HOza7UP4lwBSVi8+P+8d1CeQ39+68D7eVKlsSHHStv5Gnzo4GvPXIQN3IRmRucga4b+zSqAlNBk38pWHqKfod3/Frhq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5d758dba570so1311389137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 02:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296439; x=1761901239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3v1IEsc7lG0F5yaUsZFsiMjA7EGPtVnzD5XrOqlrERI=;
        b=iIQoy/rHeIpGnzCi5rfxLpbeinVkWWlkVWj0HbvaSGiLmDC4hQcSED8/cpXDY6X/iD
         7p0j+5iR1S5jWLHU0xskuQ5MCRVag971QZWHfzk9JsAXfgoo7G3m2Hp54r+nnvSndmbC
         DGQAcjCcusJSAuEfeu6DOZbHOc7BP9M/I+xZVYH7rSBkptis2cvo1ZKxGevzcHhI4K76
         tZpJWGkjbYqd3vxnMgWxWlmgNkTrJDsUt4x3rexS/jo1ryTz4Z3aY/M5mPxgHmDmhp8V
         fMr7+xy4RC6jfDPGOXfOX8gpV06b4/BbqAS5790RI6aXyj+IN206+DmeDxtcz6SZXZxU
         S9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCW5GnfNM2RGMCgHZE62PwKSWTTAmz98VuiDjTPlagkDGJhGC4atOWr2ADs8Dg07g+9FE9GfnZ+LR3RGxICqItw3VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpg96O5jwsi3s6N5yVXtLVpcOURjtvPnF0TVbdADC5a4GX/gFj
	nYp7LQTEEf6kjruN4qTk76HLclqV41Hz1b3yyDQIo2Oxj9MCMT9LqYQq9F0ymoad
X-Gm-Gg: ASbGncucGrH5oZ6aAh/HYhCj6oKlJ3acDy49CR/X8w/PE8wTuBHxVAq3npqHQEU+kCs
	EmVpfU8LGk2wrs8S4lbHGAeNTlzq2Zo4WNq+Jg+d3AWIhJjwGVgMtpBV8J+cn9KLRFYZdiwmyfa
	h6svmUpy+lQtbsFGexVnQy7q1XqElx4TMqTrZyeXa1F9MHWK8pj4K/dv0squEt5j31NPAvpk/1Q
	tb+dH6Lj/CNnf/DNE7zzoHPgxrEHMdF+mFGhTMwmNaj/abcI3i/w5YdKaSYRyBD/FNy7c0d985a
	7Ep8gkD+H5udRs5EoxMitwBDaYKbe3kQD1F+dEf0a1pEwLW9z+xcSDgl6/4KFeOpYfCK5aEbkmx
	a8bKLgfJVUTtc+WbW0S1NUfGcwguxRDItJcjoTm9ZKHkCWRsiRcibdml40iPo2Zi/QvnY9iPsyq
	+R9fA0aVjQPPTmptcTLErHGaOEvP3pfMtdMt04EIZ2inx7tz1J
X-Google-Smtp-Source: AGHT+IHXxLrkKmp/rFJxyUaTeWOlvQkEEEWlf75Ua1Sn7wG522X8bzAWQhviZSLu/w0pOfiE2v3TuA==
X-Received: by 2002:a05:6102:d8d:b0:5c3:d964:a689 with SMTP id ada2fe7eead31-5d7dd67f8a5mr8722850137.32.1761296438744;
        Fri, 24 Oct 2025 02:00:38 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8cb772sm1812223e0c.9.2025.10.24.02.00.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 02:00:38 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-934ad40c2c2so675490241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 02:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVz1PCxjBcZuIn7uOTEwto60TvhM7hAzQ0dWtu8V/kNADs/UG1qCEmylmeYcndCVtVx0NzMC3dpDVWTAp+Qu32d5w==@vger.kernel.org
X-Received: by 2002:a05:6102:6a81:b0:5db:341e:94c2 with SMTP id
 ada2fe7eead31-5db341e98c9mr1497710137.4.1761296437697; Fri, 24 Oct 2025
 02:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022074100.1994447-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251022074100.1994447-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 11:00:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaw0DXz7AgdLORDerNqGD=juJvHOAevTODpMiniDyRjw@mail.gmail.com>
X-Gm-Features: AS18NWA1mnJX-CfRjNX5MadNbQ2xKcHaLUi92Y49yOhA0Cb_I7az37noXQXhEEo
Message-ID: <CAMuHMdWaw0DXz7AgdLORDerNqGD=juJvHOAevTODpMiniDyRjw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: remove useless wrappers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 20:27, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzg2l_gpio_irq_set_type() and rzg2l_gpio_irqc_eoi() only call the
> equivalent parent functions, replace their usage with the parent
> functions and remove them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

