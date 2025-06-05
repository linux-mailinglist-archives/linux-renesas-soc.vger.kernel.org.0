Return-Path: <linux-renesas-soc+bounces-17869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3CACECE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 11:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B9211898D2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 09:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D854420E007;
	Thu,  5 Jun 2025 09:36:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA781FC0E6;
	Thu,  5 Jun 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116199; cv=none; b=eVdqp7RBmZ4uwLIsShAMvvmUYUedCoJpIRX8ygza4dz2JYxgYu9UY/qylLruKM5IzCI/BwQ1wyy50JKS68NwcrNtZTiosXVBC+AjWT1Cwsqso05j/zwmXeqX+mg6aX3hB8papH5W/RtmxAs2PI3tHIc4JUuWoEUDYxpUXnFSzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116199; c=relaxed/simple;
	bh=UHqkLp9adC6ZHKXDooOYSoYxHprU1FQ3kyvhOSlvg00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPK7zP7PVF8raqMrn5cLEHj0kh7Lu1KmOsNu65DvR1PZm5le+taknIEV12FSk4w8VMRtbO01iaKaZXNUPltcOSiLLXYgi12BjYp3aDlH1knp/Xvbo0QcKuppdu6Kgf7iHkeYaeLyPbG/AkLA+0dBmEBFQh5M39P1U1zMjilmFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87dfe906a87so273611241.0;
        Thu, 05 Jun 2025 02:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116196; x=1749720996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xryhKQkZHmq4kgjsA6/RbjQJhPziO7ch69eM4xZ/ceU=;
        b=Uv0/9sIsixXn4gv7n3m4+/ZubuAQlx8LcQKJ4J+oBReY3vUMZiCg9HbLLvn4kSqTz/
         VmxMVhDtX/r7Be7tS/aN2dplpVC0GzTlw6TIFRUT6jQijrJnUUb85ozhhhVOzi5WAJqs
         5GwK31Rp6vajyN1Fr6SUDzF/LTheDgmfcA7sqiGYwc/tQJzmp0wIfqeOgyc492GLguvU
         QBoo7aP80ayOx/qNkyslCX9ewKK0/tmG1asqlLrn047BwbKi5QZSAycZVuDvDdJEujn8
         PLMoOGGzimqLQadSgbJVhfC1dsmx0EUpsbLTwHkETq7HnPgMFzdk3tg/hIzWXxuN97Wc
         ReQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD+eczquyqrCdUIItgwO3JUkL0ejC6jATqhVDWDaJZsabH2xtSlx5am4jVDMYiK0jGs6FqRwaXVafkO2RF@vger.kernel.org, AJvYcCVSyaASQjJN/09ca5/3NI09QBUpZ6JyJ6q9jgYIbdII+W/kjze/PiYqyyRJpl4YtksWYvNVVB+7XhnF@vger.kernel.org, AJvYcCWbZUvhxsbKvsCy/8B+SNaSYvnAZFnac24nzvBNrHOoSFNpk70a/akgpXF7XAaKWuIP6azv37mxybRh@vger.kernel.org, AJvYcCXm78JTQS7BUdIOdREXV+vg826ZBNGh2wX9fmGDaHXKetsUBedljTcieFDWw/NY5bGWBaNj4rAFJgsgOrKaK+rw9cA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziyQ2uk7hPuCCSJvwd85K5gFehFcWPTd3D0Jv45kWhv+JK4Xwi
	4gur4E1VpXA84gE7tlh6ChlolJTBLsBrOTTtQftZE1oVMXxTlAC7hLv2Mnu5BkFgH4s=
X-Gm-Gg: ASbGncuITYwfhr6xlNLEHHI1YzzacZ9P/v1qrM/0xwwVaAj6QCWHt5GLFUxFGWkiH1D
	owNp38dJ1oIFnxRmNLlUv+1v2ytlIKb3ODJWDfhDHCYV6zH7wvjORLypdS/dnu0X82msKgWJ+aU
	MpQj86dRPoLZtFVZa5hpSgScd0VVTlNbZUGzXlpP7vJw8avo8FVHD6lVDUnJoUQil+rEAO1suJ6
	YMwlhAJEGJuFGHNeZ6F+KZwmbh+LdCTQo+Fta1KuQydDzcrYc4cVxZc8wYRrK7u5sUv28VjqsQD
	fc4LsFBM2bg3n9O2wxOHgG0jkw+TtgaEvyuYRBditAfzTDhoNamL1G9UWbvMkBMBjI/SoBXimDh
	X47SpRLQvTkUGsg==
X-Google-Smtp-Source: AGHT+IEZD9u41bj0Z4X9+3rdw0SGb2sONHzQLDky0Kw81pCdyRLJGobbxuuguR8a/wXyAVbnj247EQ==
X-Received: by 2002:a05:6102:5ccc:b0:4e7:3efd:ac76 with SMTP id ada2fe7eead31-4e746cff8a9mr5449636137.8.1749116196311;
        Thu, 05 Jun 2025 02:36:36 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074b095d4sm12398770e0c.27.2025.06.05.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:36:35 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e58d28ebb0so255654137.3;
        Thu, 05 Jun 2025 02:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGWiFFoEGCkUysNwUDrEMTIYL0f9p73UVUHeV7oM883TRWU+K7/xW2IKim6x1g1wB0zc8dJ/xPVKvt@vger.kernel.org, AJvYcCUkgs15mDPMaUE3wIXO47JkvAzfE7SSj2rIa9doiUMcV/tnVuZ2AnxDnR8XSRfAXD1WZZ/XnDZJI9iw@vger.kernel.org, AJvYcCWiNTXjkRj7c0jBvuAJ5A3Usbd4mAaqIucUVxni+XbbHZVECpRQHuAZECU+qRdn8K7tUz0p8+rgeFiKjr8+@vger.kernel.org, AJvYcCXy+hokyu64zJmmOM57a+VsiSHani4ysb1fOSQeFTnNDVtud2+yb1WhUXns8bxJAY7VZKO1KcdT9hbqGRo3g3tkBNg=@vger.kernel.org
X-Received: by 2002:a05:6102:c12:b0:4dc:81b7:f031 with SMTP id
 ada2fe7eead31-4e746590f3amr4888137137.0.1749116195616; Thu, 05 Jun 2025
 02:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com> <20250527112403.1254122-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250527112403.1254122-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 11:36:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVh0UeadvK2di-=KKVH=kRF1CwODGO2+=9HPjSmESNoaA@mail.gmail.com>
X-Gm-Features: AX0GCFsz4YfcCbExwtB459EMoOGxFHRLlhaU7rToOvglfZOY-c3ykLYYqGj_dgc
Message-ID: <CAMuHMdVh0UeadvK2di-=KKVH=kRF1CwODGO2+=9HPjSmESNoaA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] clk: renesas: rzg2l-cpg: Drop MSTOP based power
 domain support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 13:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain core code.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

