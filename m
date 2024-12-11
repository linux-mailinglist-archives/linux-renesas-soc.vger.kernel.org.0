Return-Path: <linux-renesas-soc+bounces-11223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEC9ECC3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8849162FBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61028229128;
	Wed, 11 Dec 2024 12:41:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55D5238E23;
	Wed, 11 Dec 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920901; cv=none; b=eZuwhRDkB0DybyXpt1FgvMtjc2eYk0Pv3nApY9SHIU2jj9IzO6plDdYBijwDJu0Y2jTl9qWJz+GB45MF5eP3JZbJbSsy0aY4ZGNhfJLC/8e2GQlbxvzF4cjRMguCp0w7jIFC4Nmis46T9Pf1C2EHVwnYhbth5f7e9ZlRhnaeZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920901; c=relaxed/simple;
	bh=3IPjATGtHTwfv3rm6pB+PvNHKiHP1q5mEaYGiLff47Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/UJhwC5WC6iTJ+YpU6951cIJK76q+dP0bXKWkrncfTUFP4Bftq1hdTiws+3velcdj2XHD8a5BkZBQxxbQA36pd1EsX6zxAL8ENAleP1/ezQWwy8Q8lRZIZRz21qQUtYsOj1cJzD3ntqPkSoOOY1FC2m/2PGgZPOOTYUHlioOP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-517aea3ee2aso1554364e0c.2;
        Wed, 11 Dec 2024 04:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920897; x=1734525697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DCrtf7wYIhIaFf1iMVk56iPDLl7IK7GssPMowJhMSw=;
        b=L2JwBwnTCicNEerBWliUbjdohkJcs/QbxGnJGqkEr/doCxGJ7psHTiKJNHSloXgugX
         bdaJI47ARvxCh7/EBTUBdZfbQPwPheG+hqu2+JrveGzKaTuoNozFLs8Ho1dMAltrfhbW
         0vl+5OEk4YpIJjwl39OjHq+MbgLE/6aoWNMTxwLd0R7GVHHFPp2MTGHIydYGhq+CFcxw
         zlHUnwv1Bis8FKvZIWLtr4nuqsEIgQG90r68MY5dvmK4c/ROVL2oll5Oi8Ox1DQfcJWY
         nkVX0UzKuWQ1W+F0nwLOXSI5rq+uNYl/wHOvwLQeQ3XJTPD+NOOjus9YnZGNPEr5POY5
         vD+g==
X-Forwarded-Encrypted: i=1; AJvYcCVMaW+2L+Usekc6SAZ1a23Z0GP7zFVwTQxuCw4pncmwxgyKm+FeSXJYIYdu5AEIaF9lXgXAYYhkcc+y@vger.kernel.org, AJvYcCWTmMluGjX4cEo8cVDkbkuWiM2rSE8Ndy89zaig7VAxWID3G3jMYqxWUSPGM8jq9SUD15331/Cga3k84jx4@vger.kernel.org, AJvYcCXFh/G4Br9IURzokPO6OcgZJuhYDAmlym7I6ERfxJ6qkOHHBsmt8rQihVg8zejFUrNcwhhsfNBkvfiV@vger.kernel.org, AJvYcCXYlkZe0GkErKprXCEYtAeXBAAsUWQcZBxOVsxSnO3zDkOhCUJ+Leqrt+KsPwsfbjpZ4PaZXDd+yignt99LleAPIvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTnpDF3Zw4mkj/s5rA62X3yVmVIyZXFVh3lEPlguza/1n6wN1
	LG1CZ11+wvqsXnsf1WK8yVcJutyNSH2Y71hl04b3qtP45A5v87F/0gbyAxU0
X-Gm-Gg: ASbGncv6oJ3ez3/TAwecu4FWJ2nKQtOXkP9DWUduikKyBDkkqjulVVkE++SU/wltLLD
	Rrq33N2uQq05++Nj7KvXd7LDSVDJwDCGnY4/DEkRiCN/afjwkL2cuNBJ8LT5mJorw/00enXmVG3
	qFOJHKCLlr1mVELxZ3xmhCcaa5ppuEK+ZJcQTCOSHB6uguG0dUfb/wkIuKsKufelxyuTlvaUk0t
	QA02ZYVLmumeIhaY7diVhA4h+oDVjXDS/ZtoP/uLoYhHGJ4QzazVi5XyOVGV3gFBT3Dp5RRYeXu
	/B0ozErWT09HeelE
X-Google-Smtp-Source: AGHT+IEcu1crK7F7sNnWMh9RUx1FBBamJrOtV7mJxYZOC4yXqsBWqC+M8OPBC/wsmy+Gjj3CFtoULA==
X-Received: by 2002:a05:6122:8c07:b0:515:d032:796b with SMTP id 71dfb90a1353d-518a3cf0c9amr2379340e0c.11.1733920897054;
        Wed, 11 Dec 2024 04:41:37 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eaf6290bsm1124635e0c.50.2024.12.11.04.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:41:36 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so2768638241.1;
        Wed, 11 Dec 2024 04:41:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3cXTcn+C3TVNbyXWfHGChC8pG+R7mRazXgOv2rwBocLEx8o66kgds/nk4EHLNi12UBot6bZtKzLNV2XxnJbNnBMg=@vger.kernel.org, AJvYcCX2KADwhSDGPhyM8zcRwyGaxdMcvkqcWAy1J1STLXExlUON1nk5U7p74ueYrKAwf+hh+qOuU4TsfEZd@vger.kernel.org, AJvYcCXH/ByivBHfNc8uBbe5eB6WAwMXv4kPGvbBSY3j/ejjbUwF1oHAYVEN0EWCHKWz3r+AkYwMdM/TYQ5I@vger.kernel.org, AJvYcCXozF0CCg4gSztsF7bfQ3znJh6HGGc8WtaGjc/mWeQk+HFatfM8gkwTZkhp1V0Z3MN26aM/rLqrqyFzmUtN@vger.kernel.org
X-Received: by 2002:a05:6102:ccd:b0:4af:e61d:e225 with SMTP id
 ada2fe7eead31-4b128fa1f58mr2267972137.10.1733920895889; Wed, 11 Dec 2024
 04:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-22-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-22-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:41:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBKd7H7m=84Jh_CT7kEUYr7ANi3czZRCPWR7CcJYw_xg@mail.gmail.com>
Message-ID: <CAMuHMdXBKd7H7m=84Jh_CT7kEUYr7ANi3czZRCPWR7CcJYw_xg@mail.gmail.com>
Subject: Re: [PATCH v4 21/24] arm64: dts: renesas: rzg3s-smarc-som: Add versa3
 clock generator node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:10=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add versa3 clock generator node. It provides the clocks for the Ethernet
> PHY, PCIe, audio devices.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.14.

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

