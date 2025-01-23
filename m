Return-Path: <linux-renesas-soc+bounces-12378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6896A1A1A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C7E0160CEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1179520C472;
	Thu, 23 Jan 2025 10:16:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB280034;
	Thu, 23 Jan 2025 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627361; cv=none; b=X4eTJdz2NRkqYq4Z7hg7VmeH82tZKOVr0lDgNJoAavW687lSR6viRV9QZKjVA7nt8qA4Nku7zu863FNqSnXbzGickb+GGJl5eMLgj9U5rWco0aS4d/GPs4dKPreil/5bUPjbXy1jm7fACpvaqXBxHTeVwh0x31KxIyR0ApzWVvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627361; c=relaxed/simple;
	bh=YNDv/FwB6hmodGysZCBuSZmue3rn5knzHsrVgcOXO48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpRGICABWSfz79jBTKmx9krM0PgNinoxYL0s7Hsu8WxR0LuF9EFntx7hqtUZO/z/0QHa67l9s13Con3c3NkXLtdbEuacNj4shFT5Rd39O2vHEa9Pyn9ap49wFzTk67TitF0Vg+iezBWOBsu22Mr4E0+JvjM29bNQ/ZfF9TL/cJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so241923e0c.1;
        Thu, 23 Jan 2025 02:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627358; x=1738232158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz9cXi0d4/7kEvhCEEVk7KDj5mPMfBVV43IF6B5w+tU=;
        b=r9zJXzLUI20VfQo4cUAyIS9B8uzHT6p+ZFlOLGWTWTBxeKMhul6rW2z/lbk34LpgLx
         9SF7WYXHgM0UClW1QIe5Qey/KnSJpMOAOXT17CztoNKJ6RIYCO1SyaZCMLqPS+NepePk
         EtJFCNmqzX8TYHB7gQIdXnKpEuS46MpyQU1/muB0fY311t/AOzS8suYQRcrvL913NTcE
         vN7sw75z7r1Zj8LGJt/O2BD7It+ixhUJAr2xH0tEUXN9RJQpI8F1TuQGBYee9HMkRye2
         mdtefRC1xdtY4PUzUr4nS9KIS/j1rrMGmMaU7fcYgpd1eHKkZfXe9tXmLxpCUT70/pEz
         DoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu06oHAZvIUucsNywZeeS6kUnXD+Yx+ri71NVHn7Zlajl05uxQfcNBS0lsoZW1BOO/qX57zggtrq7FVrxL8haWCTw=@vger.kernel.org, AJvYcCWkSJLy0jdba6198lcxc5ksn+5uMD7gQcSw9nSLwmXffumm8TwvYl1GTKpPUnarVqbbpejwWg+YuNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2qri50lYk74bJPj9F4RhSDybw7EdChR/Zyhox6Sc4ZHEz4DO
	lCbyxqja4x6PYyLIiddJIJ3dcsplxDkA/bZzCNZK9h72ZSK1WLB59xRB232q
X-Gm-Gg: ASbGncsPF1UIVPht6Ps8bGxCLuPK60rsE2cOH+R+YlU7+8nYmXXc4cgEACv54I0eylV
	ISPioKeBCnm12JVsCOmSsFCKHOUEah2aug11YHrNBAwVa+o/iEi/vkaDv/hsRWF1HlMOySdFruI
	Rkqn7tYvgco8mEWvJd1eTl0Cy4V6b+vbR6wBQdOVwZC5jFFs1fvVuxxPsNcZxaZkA6i3nDTkKxO
	NTEHMZdp5aHI1M4gUITFO2HezYgGGfAhFo9s/Ps8pLhqq8LQE/CrjVUOThk2IbXhbmLJ+jm0Fkn
	0WKnD+XwgsRUm9aWm3lXil3H5lhx+xWnSIjXxXc8v7Q=
X-Google-Smtp-Source: AGHT+IHxOVejymvA4rMhtojNrahIEqg/xo49zFcOiVnh4LuZ50tSf80PzJkIzuZlN7uaq/Ty1IkPiA==
X-Received: by 2002:a05:6122:c9d:b0:50c:9834:57b3 with SMTP id 71dfb90a1353d-51d59e4909bmr17136275e0c.4.1737627357810;
        Thu, 23 Jan 2025 02:15:57 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf5573e4esm2592944e0c.5.2025.01.23.02.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:15:57 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4b68cb2abacso155067137.3;
        Thu, 23 Jan 2025 02:15:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfgyTiGbLKfA3TacNxPKbXW6aEgmDx45wSn3T11QCC0f35tszVwjydpF/+sST9YEU9Oabwmp25jOw=@vger.kernel.org, AJvYcCXhOeRkxiGJTwHsz8LTYaNn5OtI5MTqAuOSfhkdOwHcKCiu//ZFH7NcLfGPDyLxfQz20nP3ieTDl++JEm2MzWyT5Fg=@vger.kernel.org
X-Received: by 2002:a05:6102:1611:b0:4b2:cc94:1e61 with SMTP id
 ada2fe7eead31-4b690b8b719mr22384327137.2.1737627357478; Thu, 23 Jan 2025
 02:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com> <20250115103858.104709-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250115103858.104709-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:15:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVJq=QyEB8As+Q8-ZAE0Cf2PHnCtggVrM=pK3njjfuNQ@mail.gmail.com>
X-Gm-Features: AWEUYZmpYkafOYHxjha5psfTop-7LNaacXGJMYX_BVpAr0OCXeHP0HGh77cKYtE
Message-ID: <CAMuHMdVVJq=QyEB8As+Q8-ZAE0Cf2PHnCtggVrM=pK3njjfuNQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a09g047: Add WDT clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 11:39=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> WDT0 reset is for CM33. Add WDT{1..3} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

