Return-Path: <linux-renesas-soc+bounces-18454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C185DADCE98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DA1D3B8BB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06AD2E06DE;
	Tue, 17 Jun 2025 13:54:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13252E06D9;
	Tue, 17 Jun 2025 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168498; cv=none; b=hpoX+c1zHnLK3V9fRkk7munQrQysuSN22ehZCFcPnl5J++bdXG2oMxbGUbpx2ETN5CvVuu36YxIqpX8pT/IHQ7e1Z4/S/ffDsYsI5sYgo41RAthDAIFiARrdAj3YB1eL2D+Nc/9mi7cRvohNIByKcjLIvJn8RwrRXmMbbzgLrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168498; c=relaxed/simple;
	bh=MH4f7ssedlOhhd0/OlUlv5GCda7tMpUfS4PTAFm+JNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4IS7QxGedPYM3j73Vn0X7T2dVZIx86hoKCqKw8HyOC0J2fnoVJtfhWhPmvZMLN2M/rBRwSPXePuygXPldEXwCsymJm92R/8x0fk9Hw69KjD0gbGzSPzcdAdI/uVGKYFqHB9lN5yZfPUKdgvjWwJ7SNRcadLWG7FtdUBz8ectmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ec4ec218fso913943241.3;
        Tue, 17 Jun 2025 06:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168494; x=1750773294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NPFOGmKwe57k8665KU6g7tXyTNhIGu+1JDxa3K0Buc=;
        b=n4OdgwnKqhpe2CLKmrp2dyGfQkRcnejPOV0FCeUwbFhD8bcBH2ltwjFYuzKS9T9OwZ
         oF+yomAmqvCOpM9HuxYCKxHPdNHsWRRZkrGFCIYliugQM1WBFxsxMKdbKLPZQMoF1Ye5
         EeFEYDehjh5o+uQl3orYK+utcGkzEl2ncQDQfllag2tyC2+E4lGh/fkM2VfA5WjTczxW
         yHqYzYhKSSOQTOQhQ1dqdYChvMkhLFCSHWuUFORqBAf2owh26e1Ct5fS3NgbhT7UWWn3
         fHTA8ptg93kbd1rZ+T/kXkQBAUwZS+iTmlIVs5iuWpI9Z0w88azR1jtXhVoqTncMgkKe
         WgiA==
X-Forwarded-Encrypted: i=1; AJvYcCUEn26O5i6qZ6/pyCCbgg3IEHdAedYwsspj5cq1fugQuussagXsnkWy2c8NUUlnGMh28SlEiRNjGKBCiufmwAaAX2s=@vger.kernel.org, AJvYcCUv6uxbdoLfU5L89h7L1azk0qeYlSAJBtb76N3EJTOEohrp2MQWjGcNJDu6iceNBUrWSuTHsthMiVwOgAHt@vger.kernel.org, AJvYcCWkO7t1NYD7QZ8FkjZdl/+G905SpXbhxmirl3yjrKK/Fl8rH/u737T9LUb5uVI6KJmHapFbFF7x1g+DjcEk@vger.kernel.org, AJvYcCX6o+SckBnts30cK1aIV7W8wlxRfXxXrswy5qWg9PwuNaoJUgLE5s/XKLH4IxuSCAXOZOuogzKPGi+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTrWOG3s/7HCyWoniqCoS8gIg7IjWpMy8rs8TXjaYIWk++jkM
	Ezs5pUP1edYq4SCkP7YZ842Xzs6OuTXfvh+M/eAq50UIhiIdwh5/pxmQlfWdThwf
X-Gm-Gg: ASbGnctY9GIHuAaggjRGDkanJG+Ng/zudQDsfkhruEYivi9rwuPqUb+4gw4oSKC0iFr
	Z9NCcoK7syARy6uLxXUaeAWrwgsGo3F1e5NRoGyyUNViweHi1926spktWZw2wWlpd75Xlu5xRsR
	wrxNvn44dbC7FfLkXGY2o2I5VMZwuLCoQzD+ru6pScj4L3e4AQk8yh2I1WFxVcnxsacIhXvSrSZ
	rSAikKK2qNf7r33onLPkL0iB3rq8kAm8EdHUMfB+4h/i988Lbj+YjcoYsSJWFXmdE53fLXYGi+K
	/KMRtr/tDJ87gczOoWcgMKVlwCyuKHKth/6aVD3x8Oq/WaXC9VqQ+oFVphZmG0AlOjDK7Hnb13E
	A9J9YPaPEafdw100FqZgHQCg6
X-Google-Smtp-Source: AGHT+IFGw6LmJ/SAiaHvjQoGdgf0CMGd58YqOwuiu9L4GQSVNPHszkgSUJed45u4aG5Z8ALkxKJ9Sw==
X-Received: by 2002:a05:6102:4193:b0:4e5:963b:738a with SMTP id ada2fe7eead31-4e7f6260e2bmr8202500137.16.1750168494020;
        Tue, 17 Jun 2025 06:54:54 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f28c31f33sm987522241.16.2025.06.17.06.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:54:53 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso1300695137.3;
        Tue, 17 Jun 2025 06:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLjIwrmgVRj40vDfcGsP6C0LjqfFt7rKyDgu5hQJgKYU3mKfwF3lJTKhTgtAQoUZDFSF7QOmgkQt3q@vger.kernel.org, AJvYcCWrd4BVgqK6nEj5YETJ6i8uq5IlB9RMS0PYYElhtqZwMUjEq7io8DlZtHmtvL+Qwcc6CsKqEAAA1SZ69GBv@vger.kernel.org, AJvYcCXH99TCjoBViOJmJHH2wVoJTklxZobOlyj/J2tFqJULN0TILGHz8te5t1wtgZ0o6JFon9MuJf7nP5yPilrDEt3TX7o=@vger.kernel.org, AJvYcCXTr8X+BztmCjj4KbZmtIkebli0E54efRj2sFmWEQzRHG9/GL08dsL+nIpkOlBxXWPmNaVPlZyFs/V6AnhP@vger.kernel.org
X-Received: by 2002:a05:6102:6f0b:b0:4e9:8488:ceb0 with SMTP id
 ada2fe7eead31-4e98488d207mr923020137.15.1750168493078; Tue, 17 Jun 2025
 06:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617134504.126313-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617134504.126313-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 15:54:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuh=O5HJ1euwed6NBHWOyi_sMuKXVttVX+QzbgbHNfWg@mail.gmail.com>
X-Gm-Features: Ac12FXyhfEkegCCAJkC3v3V_yqUqFj0Dol0lfCSMeSBROmWrtxx-3LxVrYZ7Ujw
Message-ID: <CAMuHMdWuh=O5HJ1euwed6NBHWOyi_sMuKXVttVX+QzbgbHNfWg@mail.gmail.com>
Subject: Re: [PATCH v12 4/7] serial: sh-sci: Replace direct stop_rx/stop_tx
 calls with port ops in sci_shutdown()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace direct calls to sci_stop_rx() and sci_stop_tx() with port ops
> callbacks in sci_shutdown(). This enables the RSCI driver, which reuses
> the SCI core but implements its own stop_rx and stop_tx logic, to reuse
> sci_shutdown() without duplicating code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

