Return-Path: <linux-renesas-soc+bounces-21698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D219CB5138B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E843A36D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F40314A98;
	Wed, 10 Sep 2025 10:09:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0EC3148D2;
	Wed, 10 Sep 2025 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757498973; cv=none; b=ehVevokqt00RUsafc6FxBtZm2yC96W7jv9F4pjB1mtAvWh4xDCZtAqA+23IDPuMt2QFgHCAgh79vlj5X6mo1Kyl3J3+1ZQJh7WEjiF+3BFZ6WHVYRnPXVy2vJxmPptOKYUo/Z3jfrrlanNoZy6wOhnXGCE0mihKacSaQ9JJkf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757498973; c=relaxed/simple;
	bh=cDhTOr4I1jTr82iS2xV04YcUezFBdxfaJ0nH4J8d8Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfZtnd4y6U69gtcdOMtodhUzXR0QrR2VumUVMWrc08GDIJVUl3h0smEycuug6Yv/Rtr+5iM7SfN1hkPN29E376MG4azoLaoOu5erYkQQJiJlO3bNMIzUR9Dql2JajZzBLI0zPrLsxmB0X7TDRRRZ5xkr3Bo3/mnN1Nr/EPH/SmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-544a1485979so2366412e0c.3;
        Wed, 10 Sep 2025 03:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757498970; x=1758103770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxY1qhwyBfYPDESuvbYL7S1JXtCcusOAEQm0PcBnmF4=;
        b=c9ZutY/2owDKTAmpVI0n9PAnxGuYvlcpZgJ/9aym9hese5qrAy5SSMcpiZGir2dbM0
         6/zNzbI4EoIHOw9ObJuadkp3ZNgK8JCC0aAGKFnF4IPfNyny8TgzcUYYqdZimWeko09/
         1W7GF7/OmOoQ5MRECKJCb+tQvnv6k2lQWehmM6z6I24OpbN64GvC8Uj7QVTR9CsTHgon
         gKdbMOdufRw78fO/5l1gSEsGv9McJoo4zsLZxyh4Qv0a+6arlHtMIcr/KwS1Kt/UBBTi
         umdI2yg02aK5Lhg3cLyiCaMzfNOyz1yfvAbVEPwXUm+v7tm/b4czYZ5oHfV7oZ/OhEbC
         qKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA+bT8idFwX79aZBN+xAn+xC5vKBF0huOyFwdv/WLYCLFdK9DfHxfge6O+0xVFHP3dnVLEigkK815I+5N2@vger.kernel.org, AJvYcCVNPgMWXmk/rTz8JqSots9RqBjjde9GGXZB+xzpZjb+ul4zmajVXekDnNFuUeXZA7McOKcyaqTIzBuvyKm5to6KRt4=@vger.kernel.org, AJvYcCVvCtymkDxXF/b52+Y/ChxmLmQ5q74vuqUaRiW9FD9i2IATg6ajqFxWtPUFIurohUKG1D6DHalyrvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4ZKv/7Nour8/JN/rxaGuJXrkJkHEWOVRAVrJm8onhomxjEDf
	YQ8Y5E43n6I/ZxBBSftHAooDGdh/8RO1PNRENoG3pyT4Qi/S4cz8CS14xLChpseo
X-Gm-Gg: ASbGncuiXOXqkm5GS2BtraV73hPAkF4j2vrzzt1LpyZzg0EXbAXJv4aur1xC9XBRfn5
	a/Prts2rRmvLuzp+GN+VxS68V3ayjrlLV2aYTNDj45nU8EseAkODTKLKJ2k6zayEL+7tMMEcEfz
	7v3/fOhR8cdnO57LJhO/J5MLLS+TZqbslTdhNHZvGDiEFqPSsmH00ZgueHKhS1BDRlplXTbVszc
	4X1hqX+rctfcvRGzC7FmnhMLEXGXfuYYxpiCq23S5eMIVAuSrVWr47XzzpC3ZlyIMtDeEijEs8q
	R4LAFRTvYvjGB4gF4gpLKbH4Ck6NLKFzGgK71FOSK7eMMmwQKg819d1EaIy43HdfLmq4xkAVMtt
	R4heCU8w/5AH8COJ7gn5wS2I9hay/kvGZzHcRsNKU+EhMm8l1k9iSaL6bW0ILOYPWIL6B/Xc=
X-Google-Smtp-Source: AGHT+IGiwcalsZC8lGuNm7SWz/BvCTxCnKDfcHEzAORJQ44qm6CS7uddKkz0jd54QE2aecY9jdgTGw==
X-Received: by 2002:a05:6122:2a41:b0:542:1516:2701 with SMTP id 71dfb90a1353d-5473b0c6e03mr4035575e0c.8.1757498969752;
        Wed, 10 Sep 2025 03:09:29 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491467546sm13802907e0c.17.2025.09.10.03.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:09:29 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-52992b299feso2086069137.0;
        Wed, 10 Sep 2025 03:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2RQeWNlAnzGmtpRg8kN3nZwL5r8dCYPLBqFXpibx0dUfHi4hi1cGDR22Uz+cXaBseR4E3P2KtbQzET0On@vger.kernel.org, AJvYcCXdigsInE5yNckvHLmmwVUYKfQf+jj8kFaFXN8hR1lpkroulkWm634hMY4qcjEQhXP69SNQwKy2Uiv9+98KHuibQQI=@vger.kernel.org, AJvYcCXfZrgUTX7Gpcnt+JV36/fTXx+KQEdGhYRcCEe7jJ6RjgxkW/YBYTFBAntwFMH7OITUDcmzH4bJqIU=@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:538:f3d5:fc12 with SMTP id
 ada2fe7eead31-53d14d92f28mr4334701137.32.1757498968564; Wed, 10 Sep 2025
 03:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904155507.245744-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904155507.245744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904155507.245744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 12:09:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuQ1KTk+R_34weVboaVt83ah-c=4PfiDiGGXdELFAt5w@mail.gmail.com>
X-Gm-Features: AS18NWA3OTTwJ_CxY6UzEYcSMc3nFyo7jLyIXduZmdWgbfu_wtr3l3kTXOKh5Nw
Message-ID: <CAMuHMdUuQ1KTk+R_34weVboaVt83ah-c=4PfiDiGGXdELFAt5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add clock and reset entries
 for I3C
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 17:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module clock entries for the I3C controller on the RZ/V2H(P)
> (R9A09G057) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

