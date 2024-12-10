Return-Path: <linux-renesas-soc+bounces-11166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99819EB564
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE37728269A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9A322FDFA;
	Tue, 10 Dec 2024 15:51:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622F219D060;
	Tue, 10 Dec 2024 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845863; cv=none; b=nCSbEb+lDSheQsfdCjuKOCvcIg/2pR9HI57iok4RkDghuCtxyxCrdua44iQQb4jVVZQCx8sQa/LUlqwJAGeoDaOe7tvgfun1SEz/MeY4gkaQAf8IyMcPcKbBEuISSNh5tY/f1K214NiAsAaNAQJMnw9TSRp0sV5PmLR8cFPz5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845863; c=relaxed/simple;
	bh=Y37U+uT2jbAZ91pLBf8bs13LmT2ax+q/R3krH5S0H8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmef4ry4EX72kVjTzD/zATVY/DYhB7luXIOTj0mWfcyD2hkBr6uvM8Vh1TntlReEAh3XadIqZa1nQ+EfSFKDRHFhYf7nHFf0HwWf7OJ/t4BPKD6ISR5EMNmn6vI6YtWonJfWA7e26rLkt6abQYmJ/xIQWx4MVPSwH5pdWX2osyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso771832241.0;
        Tue, 10 Dec 2024 07:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845859; x=1734450659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5eZtEFSnellC7wxhcnLuAYVI8OYFt4yC3DLm0J29Y=;
        b=UqXYXKeEAvvXrC84HKPUwX6nAsMpgu1bPveWjhcjIbdREQG1eDUKntcN39lhLtUjo1
         YqvST+M3UPQaHILodBaka+/4pgi8wEpPzLKKgjqwj3/55ZAoo/dsxEbX4wJkCDsDGLUs
         DuSrbzwUxLcXf3bIe81ZKEOHoFSSTY6z21BSTtF6NYoyAncFl6TdTsWuHLRHuk6j6IaA
         vZqWJOwo+cOBAcEp/f00pl9z9f8TG0CGyY92JogxMbOSameMycRdkN2cWzrwzqFv1PVo
         PlJgxtmmHeyf24stE+e4KJfn/fMPiq3c6oe90ZXXCrF0xFWyqV7GlfT3vU7p716XCb3p
         GvPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUVKN6YI21e6fHEdlp+jhGq2TpgS1mCL65Aia5+L85h0sQoYYvh7TUwN0Zco4U3+pNgMWNLKHjTO8V@vger.kernel.org, AJvYcCWKVlo5dR6jydqgFe3b+l5GYb3urBJMEciUYRHWgQ+G7RK3o6rCcAupxVJHsGwcjri/DxjJl02b9TF8QJ+1KXIpGNo=@vger.kernel.org, AJvYcCWvUKGKrNWuc9AJ1or0v9h2go+qoVWTrKC1+tXfukWVdI7OH6IAAAJuZTRswEbpjit7hF5SoPT0v5d+@vger.kernel.org, AJvYcCXWFDfNBrd+to3J/hL1aUSZlAzO2vK4USuoe5FqVqx2xA6voMS9TBySO4U/2xgR/SmWAh7mEvHe/ceGB55+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdwxh86kdvrzvggIKnLP93dX1onW7deWXBUufIyKrR/PB16v9b
	1VVnprmGhDIW+sZfrNdCnAhTxPP3Ydf3g9faYZzFC/7cuPDiXdUW54zN3Jva
X-Gm-Gg: ASbGncsMUYaF1+XYoimvKXU1su/pPPoMkgB0b3RGiLVJZCgkO5C0jIA7JadrsbszsaI
	lsHmkAgOH1usOUprl24Rz2uOW7C9C47BLHhb2jKIzWakvki7DXen2U76CbKHPWUqAT0jQYmGuDH
	C8hbRY8rp7Sfzgh5VX4GZKmErUY7Tn2w8JmUK0YCgDpWn1qZYb+tisH5uHaIHJ3S+5YT5y+Vunm
	LlSoblY2R89Qjw1Srjfz9JLIRrOBF2ACp8lhtLx9OfPD6XpdsKqfPxP7TXvAumzIrbegaM/XkK/
	GNOI0TO2FKyd7C03
X-Google-Smtp-Source: AGHT+IEmrsXd9XaxWBj3a3FUBkcEAWz9uZqq8+iD7qruYgsfOU/0y2hfwhq+wzwIrkO05gSICY61ag==
X-Received: by 2002:a05:6102:5494:b0:4af:f630:7216 with SMTP id ada2fe7eead31-4b1160ed2e1mr6112616137.16.1733845858867;
        Tue, 10 Dec 2024 07:50:58 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2bac2217sm1229108241.21.2024.12.10.07.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:50:58 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso771813241.0;
        Tue, 10 Dec 2024 07:50:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtw9I1fBSXHKFm2UfR4Dg0XPAh1hwc6n2EKkfDxM8JLtI8Ri/CWuWzJGrtpW0BQpCRDKZG6GDv9zRy@vger.kernel.org, AJvYcCV8HIe2suy6CIEaGq1cfRvJtXgoTq3NtTYyIEmxG/NyHKR46/7VApmMeAsXYwCWABOajjFH/5B//J98ttqIKVKpA6E=@vger.kernel.org, AJvYcCVWqykbMBp33pmO71yCH+4OG0dpLjrWKIzXDY96nKP+QF952eVnYMNurw1blgDWtMhOGFSysHpPsZig@vger.kernel.org, AJvYcCW6J+AHo/ik+CdIA+Fu5kQHDx6DBcl9xCL+KJPQBD4NdGnnHXDjcCnidpval0U9ZLUHdINKeddn7gPhGay3@vger.kernel.org
X-Received: by 2002:a05:6102:3a08:b0:4ad:497a:268d with SMTP id
 ada2fe7eead31-4b1161c25f5mr5617537137.19.1733845857539; Tue, 10 Dec 2024
 07:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com> <20241206-rcar-gh-dsi-v3-8-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-8-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:50:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqO0MUVNCuynHGdH4cQaE85FzOei=8QAzQXfp8d07epw@mail.gmail.com>
Message-ID: <CAMuHMdVqO0MUVNCuynHGdH4cQaE85FzOei=8QAzQXfp8d07epw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: gray-hawk-single: Fix indentation
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Fix the indent on the two regulators.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

