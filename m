Return-Path: <linux-renesas-soc+bounces-11301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C919F11C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB411655D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD541E3791;
	Fri, 13 Dec 2024 16:06:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EB15098F;
	Fri, 13 Dec 2024 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734105977; cv=none; b=tgDJL9O9Z9OcT5jwOKI4DwDRYG/xAsGkFifOtUrgHTGRql/Lu5V1fxrsXIUGLxa5xhCT3h+WScFGLx1cyaGYXAiVjSiqpjoMxZ99Qadc4qEUNTQbdEfGMdo1IwCtkq9gdjZfknDNNuoocEoQUDJAjJBumj0EWl1m6rsUrQr8U3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734105977; c=relaxed/simple;
	bh=umwQbquOmQpSyqT8CeD4qRvdyuRZF+hkF+vQy8sZSPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvbPaMXDoYYrFl2WK0qJoGR9nndMP8HSyRHIYwZMtPPLYmhceMxEv75oVFxcXcTbM5iHosb5j30KkahcaiUVIFthhzi8qWwbAPyGHpAOPtF0TzNpTbyvxWl7764/cf3TfipDKJR4YSdsN8eKemc11HWvZmSxrgnR/5hEJhm/gLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b1b224f6c6so228002685a.3;
        Fri, 13 Dec 2024 08:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734105974; x=1734710774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hxVTlCHR2PE8KoCjj0xfYDTwL0zPvBBh0MBs4/U+9k=;
        b=Wn1i5w/Fb9W1VrtK37B46dL6zT8kUd2xO3oiZblhe8+xI4oVJ/Z7gn/1HK+4N1R3lt
         fJNpdDoZNw5sGcFjaAyxG8BQ+/lFusYOA6EYWw6z/kt9zGWW49Xqynu+QF4i9zxdnJ7J
         CqeCdguOl8y7tVnJq6Duc6B3urilibDvrH53n6KD8jKydJWlbXOXiDmqpBJO0qinTXNH
         4upOZZyGkaxo+vPRjgET8cdnliix1vzUc5CLN+QqZ2EXyaqILgisbRhTTjSTSZ4P5loI
         DN+DjyPGzK8IEFDjR7WXNSY8hXN4ZMZIeMrlJOjdprX8RqZRlwpBDTSoKa3PVQh+pSjX
         dUpA==
X-Forwarded-Encrypted: i=1; AJvYcCV+IfYyc/4czqEUHk33al0UsZv0YtOl3GC9zceK56PTvQsBy0xb646cjnk3b59a+5L0P4X2UTgpGOjXkPPA@vger.kernel.org, AJvYcCVUnA9h7iATBW+skEOXjO0xjAq28bxNaKQEoJL5B74dymGhAgix8shd5px8hIr+39FkM+EG2/F/IPI8@vger.kernel.org, AJvYcCVlKhJ/mo8laygBTkMn/q/Z1xVD8awAMsFV1V5bQDWH9/XwvAUH26uDcG+F9KKqxPlYRW1IzdIb7GhHF4Q2aBM9zo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmhk522ZZkxkfsWx4SEOqWI4wQvzK1PSOhunxrLprpMql/F+Ys
	ZqkWXCAE07B4yxeCgybzL2DgRV4z6qnOM4qYW22ZXI6pje//zr3EXFgCHdCL
X-Gm-Gg: ASbGnctzP7iBpv2jrh9dQ+ZRl0M5AANGl6LAuaRpJd8bIhDm4QxoikxfSFce8OA8b+V
	1sfsQW+GdwTkluBob3RA02fQQC8jxq1JCplt4dvajU6T+d7+btYoKlxyEI7Re6bT6zJ7i4QknRz
	nBRTmtcJjQjErpCFhTsTT7gMNWDNVjmbhmguEE5mkBYWAhl+w4iUCTOAgIy6oN6YvVLBSxf6CNK
	lEyi1Sr2vwpt5nqC422DaMDOjs/M4+416/64fCAEHMxCKbW5nEyfT76ZS/Y5O/xJmqUQaTuHiHA
	P6EckhkKugVe/vzqRharcPU=
X-Google-Smtp-Source: AGHT+IGvzOZYGllSP47lVqz1SCLhFs9EC02BOKziJOgX7Pts7ptKM8GfugYHZ76ro0NUqhQOx0+N4w==
X-Received: by 2002:a05:620a:2412:b0:7b6:6756:eefc with SMTP id af79cd13be357-7b6fbf14f55mr565192285a.27.1734105973915;
        Fri, 13 Dec 2024 08:06:13 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6ffdf1577sm34182385a.122.2024.12.13.08.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:06:13 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b68e73188cso220735385a.0;
        Fri, 13 Dec 2024 08:06:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6sOvWYD0g37WHYQvBdMA2SwRwVFFhXnLnpg++2Gebuw4ythFjQ3BLAdJ9HevtBoYPD3K2QfK450qRpU4j@vger.kernel.org, AJvYcCW+VyXlLKUxnkR0mGcvSWfQAnX9yI7ztp46Z/T+IfnLH25Gl26NaDq5zqzEbn5FwXEL8F4ABTJAsxoZ@vger.kernel.org, AJvYcCWqIIzw+kr8oFWl7wUPfQE6T9pqSUcGVyQ6VP8jBc+OIxOQUgBjHhHG/A4H1tQz9YNSpbsZOlbDgG/cKAwKlCYBCDM=@vger.kernel.org
X-Received: by 2002:a05:620a:31a3:b0:7b6:d4a2:f11f with SMTP id
 af79cd13be357-7b6fbcfdbc1mr463124085a.0.1734105973379; Fri, 13 Dec 2024
 08:06:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com> <20241206212559.192705-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241206212559.192705-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 17:06:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAy=1bo2o1rbO-Z0EVD6LPNbR5N6zTH4+agA4Q=V6gXg@mail.gmail.com>
Message-ID: <CAMuHMdXAy=1bo2o1rbO-Z0EVD6LPNbR5N6zTH4+agA4Q=V6gXg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 10:26=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Document RZ/G3E (R9A09G047) SoC variants.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

With the subject and description fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

