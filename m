Return-Path: <linux-renesas-soc+bounces-20617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A00B2A2CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9A8318916D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B6431CA63;
	Mon, 18 Aug 2025 12:54:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14031B107;
	Mon, 18 Aug 2025 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521657; cv=none; b=lZ8zwGoroCCGsLnwmw2x0br7tWiFeAqFyL5r9RXj/PIntVrKrL9moC3ciUVCrnY+Z/TcF5LgzmVu5qNHBJDXCPzra+nI3fuE4RludIqm13PMWaaV+Pgl/oxG5WKZOZV+U6NQ2kn7SkL94xX9sqP7kLAOPsw5YED8vzMqdA+Yk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521657; c=relaxed/simple;
	bh=1BLfdJ8Dbu/W2vFpjvjXm7I1iWe3RjmyWoBKeO+gbeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ri6hCLz48yk0fi1RK8IeSOwpSYDf6fVBnKNW+knXDMULHw1QQxSOoKrBQkSgfw3sGJS6AqREBPBcxeni54h7FbBpDL1nJ2qZTpsPvDhoK3x7k+JX/nKGMpF57S8Wqk7nFHqKg1HZfqGDA9zSZrh3ft9yws7jbPzvuTcq7XFAZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89018fd51a0so1087923241.1;
        Mon, 18 Aug 2025 05:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521654; x=1756126454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSOgWhnQelCymbUJXHvf5wQch/Wh4T+JWcFrhmtVTeU=;
        b=nthjJbxr+TZRgGD84f/h8Bx2jUbuipywfqxhtZG5lpgaO6tzHvbo0EwTXHjUrETdcD
         TcEMUo9wEFUPFZT9BgJakr+CfF+vkqE3qh+EhXw7nn0E5y8a3Yj90dGe5t2XcWy7SBKQ
         w/R9LMVZIE0O8WR1lO2wXH55PTT465W6inbWOmyJ/ghf61gKDashsv747iamIpn0Eor+
         oAUDQZ7FAUy/mwF7MZZB1iQ/QQXvE2g+d/xh/Q/g2zR/JDxebJBtsRMqxFjmMEw76UPN
         T83Tagqgz+6ql4LE5lMDcf/utgOXR372tCopqZ0VPMlHfhCNiFvrQFUxagMcMDdOF0Gy
         3g+A==
X-Forwarded-Encrypted: i=1; AJvYcCU1FfiG9iDxW3o1xwpev2wZVd/EeHNcKptw8yiNtokiEQlI6gN26zmZs6vOcMFskM/lRY0JPaQS1oNN@vger.kernel.org, AJvYcCVQnWftbHvDIR4qk+aEiKYyZkCajBkeq+MwleTjk+yWoLNR97ehyp6di76hzM3ZZW7CjFR1ysiryREx+YjoXzR25Ko=@vger.kernel.org, AJvYcCXXsF29QuqaQuFjnwf8duV07RvwX9fnFE74F8qTLthi5rQyj4sdO6dgs0wE9GwzWB+zI0igm6OtOz+SK7wQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/dHbj9ubwPD8HAbRHoiymIibchH4QPR8Khya08piiEz3tPvu
	sBpE7UwFc4WgwfXb4YPoSlabqS3Tbnn+pGDGRV9zOxcZ4yBhEH6rSid+O7NZNyoY
X-Gm-Gg: ASbGncsd6AsRb+k4TZnAbr9g0iq4chM+lfUNOvI0W62LFTkHGwySUMwktPQMl5i2YZB
	ixzCqqTsCS/7lkENeG52X5HYEO1Mwpkt28A/1Za8joc+XMM+JHCTA8JWjrt3BK6xbhEibq7u4Ve
	UcshjnaTcjX+uYDwaeXoBmikQB3hKDkNh8IvOKS3llqqAAOz7nJrxblqzt/tm5AkgFR1neBEXli
	u57iJdOzycfi59PpIrcZF7j3NmSXa9uAtoXpZHEIu+ArMeLrNfAwu4ucY2ARsAkOnSXFAYPRCOG
	jkybD1T7E1BcW5No8n6LsKu/KVjVmpf2GolXD9+KHhyxMzoZCEiuY2tBOUkDzFpQdTrFVh///O4
	Fl4ndHdYk2UjxOfR44iDnuuEkFoM3VCspIyy561nwhXDjxnaQkb6fgOrM5PdP+TTCSb2gChc=
X-Google-Smtp-Source: AGHT+IHMv3LXHiauT5mLci9+D+/iBJDFVLUHgvGpQlYacaUBih2XAd23TrAx8GSGzVNGaF0LPjSimg==
X-Received: by 2002:a05:6102:6c9:b0:4f9:69a9:4ec4 with SMTP id ada2fe7eead31-514cb1b0de2mr3331408137.26.1755521654193;
        Mon, 18 Aug 2025 05:54:14 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2beff2fcsm1832192e0c.26.2025.08.18.05.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:54:14 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-890190c0ea4so1168138241.2;
        Mon, 18 Aug 2025 05:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdsyF5ROLJxfwiRu8LZ5+F09nPmrrvsam5nzNO32LPZpIsr8PfUMuxO/wQ7cyQlBgjFa/d+tQq6YoV@vger.kernel.org, AJvYcCWFMCpQ93vB1xvYPamJOuu5K1b2GH2ZxU3/xixzeQF3bhgWsQYgpAqeUinzBqVtfYySUahJ6KuY0+OU1NSQ@vger.kernel.org, AJvYcCWkzoJdyfXn9NLF8uW78kbd9nINeR3L8pB28hJ/FggYpbD2oLiBVoO4BApwWNVIuGs6pIhAZLzMZ8xu5U9UNQmG7ec=@vger.kernel.org
X-Received: by 2002:a05:6102:6c9:b0:4f9:69a9:4ec4 with SMTP id
 ada2fe7eead31-514cb1b0de2mr3331399137.26.1755521653758; Mon, 18 Aug 2025
 05:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 14:54:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvgwNVaum+YT5QMZ0TJxGxSqd8wizZ6zW=6zEJ66r+mg@mail.gmail.com>
X-Gm-Features: Ac12FXxHU0PS5CsSUCz7eirxLqkJlaM_eqEX1YTjYuq7SraDrPP0tb_ia-P5fq8
Message-ID: <CAMuHMdWvgwNVaum+YT5QMZ0TJxGxSqd8wizZ6zW=6zEJ66r+mg@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm64: dts: renesas: r9a09g077: Add DT nodes for
 SCI channels 1-5
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H SoC exposes six SCI controllers; sci0 was already present in
> the SoC DTSI. Add the remaining SCI nodes (sci1-sci5).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

