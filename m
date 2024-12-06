Return-Path: <linux-renesas-soc+bounces-11023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 362929E700B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 15:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8221882A6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862CF1487E1;
	Fri,  6 Dec 2024 14:30:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E213D8B5;
	Fri,  6 Dec 2024 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733495423; cv=none; b=gYLy2OlLPr8LpIOpL+Ja9hqjNOuPDx3q//lvpI+1jhFz8kxUHNlyISqupms5TtjFIRCGdnQeYSNaMY//yv6xCW0E8gVPdV8NPwjZG1kPKiKVSnZHj44SuZSuTW1tUJGaailStFBwL9b15xPOwdG2nmQdntvjC8aimUEbMSABYtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733495423; c=relaxed/simple;
	bh=TGVasmDCO3tnOBpJKA4aLJGzJlE4q7jJxKgqMz/34tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL+3OA7NqX4z/4n4m8PSbvwuLe3j45HqK1ZJwF9t1GPOmiXfdqROewT3dhbVoJIHbBHwiMU0fNYh5Jyby48jTXpsf2g0BRa3/fifheasL8VNPz+zACbkZC4hJMitF9/E6s0m1IyIxWCFB/gPUlJ0PXLdR8KBcsAWZeSztVl7a3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c4557fce0so165845241.3;
        Fri, 06 Dec 2024 06:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733495419; x=1734100219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKDuu8Gf8V/wWQlq1EzhT4nZUUbeswEARFJ5dyRd2oo=;
        b=JoDov9tIAZv3S0XiVELfDFANQMtL1AMbv9yZr3trzd8r7/Yp9ZgToh/DAxhu9f2t+c
         JE7rhj3l4vgy5Ij6A5Y0AFjQiiEGEsYccU2QAqZc0Ze7z2Og9N6VX0F7LfGh47HE/6qn
         zKU1zU0Lcxd8k+jhf11HSzA8j706/XfS8K/PHuJgHkz3R8vdRp2iTEJv7v1UGi0w73uF
         JmZ+lQXcFpWo9OOVs7NIZRoNvKzbYRQOHGAs39GIEEKm0ZNZRAn0EJGZNhKSAyvayisQ
         Sc3LJ6IJYcKBnt6gqgupsJSSMqGVTkZSy6KYjwow7hZi0HqyR9VvW6kFMmg1QsDTV+i7
         QpVg==
X-Forwarded-Encrypted: i=1; AJvYcCU24aozmzlkDhR0VB13c6oLmr7OSxRPwUo+fd2L2J78271Pv9Xhn8QkIOzDfzg5YokyeVRadP0aJn6X0xC9@vger.kernel.org, AJvYcCVIr+lTrShPFJ4ILJorFwK9bSDhnvRgSuZqkpTjGu6iGjHUwet+14EDrhT4oaWGAQYjjw4uEAk45x41jz+a@vger.kernel.org, AJvYcCVn8ZBS1Lb4epZlue+KwMaNvosHCG+TtPE4K/PkiRzEp+zRb0btbSmm/ge9seKQ0VXm+aym3rTcqJO01Gm+xKLxx1Q=@vger.kernel.org, AJvYcCWjsN61UWJyUjcczIEmtGMSnjVNnbCzA7veV0mL4+yvDHImcjNg1+TDplT6TOC2A2ZGD/I7Nvt3i/yT@vger.kernel.org, AJvYcCXb/dHkAzX+9SJgMMb2PHXmuXvB1BmbZiAIeToeHLidBIOtfHw7lNec0Q1smeLOcd94p33Z4wjK4IRz@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcOGXnYIe8VeN2DUgxyFQkmfh6FqY4S8AUxuXN8YvK0ztV4pM
	sgiZbie/Jr3NfW8KieWfaBYfkkC3f5IPrbR4Tny10+0wmH8mbqHLiNXX28dF
X-Gm-Gg: ASbGncvgsGKBFi6iyTk/PjxSBI2u6Sm4ArLRzD7uv2J9KstYizw9cSAHZOqRuAhSnhU
	1KT9gV82W7zg0tlZEemwWztsfRmZ/fXv+euLIxc017+HDwNPj61KzINFaMMhwts9VuzGzWldcfG
	s43+JWez2retFanNbrPtUDoOsivV00KWnAgabOj/RhZbIYVuJS5OjYiawi5hHQ/q/2dsYPx0EWc
	lWOxbzdO3/pRtLTm9W7IUTO9wLNvBpk2Eg8xjCkPClaUKpYpkcBucbk942yfcMWzYHUot0A3c5d
	JE7UBTGor/Dl0c2H
X-Google-Smtp-Source: AGHT+IFcxhlJzUj7uxEx3SlyHKEVyAMYIbTLbaPBa9NHFLbRhbWv8Im71D6vq/QsTyuX8H251q9xug==
X-Received: by 2002:a05:6122:2a12:b0:501:2556:1cd9 with SMTP id 71dfb90a1353d-515fcae3475mr3236127e0c.10.1733495417846;
        Fri, 06 Dec 2024 06:30:17 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eaf60863sm333026e0c.46.2024.12.06.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 06:30:17 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-515e7d76f65so559484e0c.1;
        Fri, 06 Dec 2024 06:30:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOCI/QBEIPAZXg/hy65ZDihgsmbJL1rZrU4N87EK0159IdHT2tOa8YEJnOgj/XmRTeQgZTsrUVGkkK6J0e2eebqbs=@vger.kernel.org, AJvYcCVIh/jo2/QDtWg84msfrc3wVAWXUJGAQQhbh8VwpUZg3aeKTi6J4scCCLtvNoLaxmCP1sChIOFifJ2i@vger.kernel.org, AJvYcCWbXpMGxoeXcMAYN7Me/3Ss0WwC12q5TGyzsPpl3rS8Qg55pdmmnmlfKfosBW7WNy+lnlSGKOP6geUO@vger.kernel.org, AJvYcCXPSzzlFDgHf8DuIr5TEjYUfIIWzFeEoiwbWLXRfzOwedXduLsFRm8QkT2aAQzpCEQhjS6I2MuKUsNtK87k@vger.kernel.org, AJvYcCXjmnBLuBo7OU1h8Jkl6NPMuMmUQQZ65EppfPg/l/ueYe6KIB0oRDofW5AN6jwFS64RyuYO3FerVRBqDHrN@vger.kernel.org
X-Received: by 2002:a05:6122:2526:b0:50c:79a4:c25 with SMTP id
 71dfb90a1353d-515fcac6327mr3656559e0c.8.1733495417121; Fri, 06 Dec 2024
 06:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 15:30:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoC-MUgOpudNeKqVD-ka_Kiem6kzskX7VCJDH4rVRR2g@mail.gmail.com>
Message-ID: <CAMuHMdUoC-MUgOpudNeKqVD-ka_Kiem6kzskX7VCJDH4rVRR2g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: renesas: r9a08g045: Add the remaining
 SCIF interfaces
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 2:50=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC has 6 SCIF interfaces. SCIF0 is used as debug
> console. Add the remaining ones.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

