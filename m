Return-Path: <linux-renesas-soc+bounces-26853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C0D2482E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 13:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B4130263E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 12:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374B8399023;
	Thu, 15 Jan 2026 12:32:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0D395268
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480378; cv=none; b=Lo8hgRGKu8GDcr+GtX8goKZ0GcEBs2NAs/0EoG/P3sXhvLIbAKVRkzHdqTtZzE+knuGNMs1dNVBdjkklQegtKwaSPBNm6dgzH5dIxaWv8WRnXCsbfTDFrCjSTnQh9Y/6iVXzXd5UZPnsMxnhBsRtSypg/j9h+z0I3bynwZCAjHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480378; c=relaxed/simple;
	bh=d7ZNqBYfjHGLIFNDjs4o4v6qyIP3tQ3XHv96Nc3lMck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z03qM2Plbxsy0UAbz/AYrIpeBFmFIKIXrDOhYVuCaTbEn06/Mq9wzMG5uiUY70fsfUU/31GyaNpTwt9k9YoCgD5QvmA3Fd26Os0mTkVtKHSSSOGfyhhUrDUx2cCz2EEq6l1Lorl9cx/fcYTCbWUdYFheuourAXUraZrkd2tB87Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso261363241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 04:32:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480375; x=1769085175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8x3sVzg5glkCU2pa74pfQHyJyhKJ96tDZ/fp0KcykXU=;
        b=OWI1lBtXXlw17w/AJ4DcEkrOGCB2r5apzx1mZdtWMFSukyncwReJDzKwxQceq0t1rm
         PMM70T0j1y5/GISAmk5YuBjkV2aEYn02ahlmvTEC1OjJWjwaLRzhuzSioH3+Hwthck9z
         GCMQRb2/OYqm3znKF+sLWXGoNQZvmRasQIuH/aKXb17Lcs8035KMXMo09rscf53w5QJN
         4GU8/khbJ1SwWwRkM/zsgJzXkjEzqJ5eU/bPaRhWNUmPlsn3HTL3xSam7MvLoyHXkrY7
         H0RwDewjY+/xd0W5yRjAOzULzzJ4+QR9eyPMeAo9QECfZJHGj5v24YB8ugIMZRqLSe0C
         7TcA==
X-Forwarded-Encrypted: i=1; AJvYcCVdKlDzUIVgC5Tit6gLXyMkixswK1+VG6MGeim9ije5BCQeGa5+zJrswGxoQ7AI54c8fFk/hBpfgiFr7YvTU9opBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UeCYnq5FOQtOl+fAqo/oLW9b24BWdcppc53gp3C7Obxucolg
	spotXkkTn++bNvoJWohffWawQZgv0LSnYsxRdWrDmuiO2yKxs8a/3jxp9kwR3iFACxY=
X-Gm-Gg: AY/fxX7vJAYIVTcIZmnT/XR0YLdV2HyeKzgNrOBoAC1lmVCaS7FPwBon63d5K1Sk7DN
	FGGC4ALNnLS8Tnlj9QSIPKsVRvqYRMAX95qsjp6bQDxBDdPH1cOsDDIn8y2tHZQViqdhsjXX1Oi
	WrlGjcsxr6naKk+JY0XqY9igWij4kHGKrPRp3cZ+lTa8xuWyxJ7LkissYbydiy2wagrOb0DkRxW
	pSODVM7897Vi3sR6He4+w01A7XwPpFUF2W6X8eTewgml0Aa5JakuKbfqR+P6AaK2qQPQCnJRkOJ
	JO1gmQtrejBr623utUYSKlSVUk0vZv02xMhRcgWtqNcAw8/M2vAUEECsXCkIzFQ+6U0HYt5j1zp
	F+Qh4R+aytVqFD4M0+xTRUMzrhID+vPtoEfrnvYN2QFHBmR672rTjjKKKU+LAdla9bhsz4AmgCk
	5t3NHIKPEQWh+ICt9Mh+eRTjYn4P5ENVsB93EpPkLXqBGRiEEALlHxpXdduM4=
X-Received: by 2002:a05:6102:6898:b0:5db:fe41:747b with SMTP id ada2fe7eead31-5f17f4cf491mr2160762137.18.1768480375140;
        Thu, 15 Jan 2026 04:32:55 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ecc521d7b1sm25336826137.0.2026.01.15.04.32.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 04:32:53 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-941275fece4so219849241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 04:32:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjLFa5b+e67TiM7KWIYZTdF8riE6RIN9KLHc127YVRriamzcB+rZs2dUbUz5KqV7QRJQM4JLIUl7HYZbVNJ9Hstw==@vger.kernel.org
X-Received: by 2002:a05:6102:41aa:b0:5ef:bd3a:ab1f with SMTP id
 ada2fe7eead31-5f17f642b39mr2643247137.34.1768480373240; Thu, 15 Jan 2026
 04:32:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115122210.3971063-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260115122210.3971063-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 13:32:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHTG6bU3aiGWGu8CRJxbmLiT6+qjuUcY+tmOtgmOHiAw@mail.gmail.com>
X-Gm-Features: AZwV_QjXUmvz6Ry0tFbDErYTi2YIK4IrSJndLM8HBQCUmn3-A1WVimxJF8qSSLk
Message-ID: <CAMuHMdVHTG6bU3aiGWGu8CRJxbmLiT6+qjuUcY+tmOtgmOHiAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h/rzn2h-evk: Reorder ADC nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 at 13:22, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reorder the ADC nodes in the dts/i files so they follow the same
> alphabetical ordering used elsewhere in these files.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

