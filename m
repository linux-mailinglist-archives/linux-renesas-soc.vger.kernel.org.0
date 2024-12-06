Return-Path: <linux-renesas-soc+bounces-11024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1D9E719D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 15:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AB1A18876BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E390F201001;
	Fri,  6 Dec 2024 14:58:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DAF14AD29;
	Fri,  6 Dec 2024 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733497089; cv=none; b=IJ9R1Kg5TRy0XahCqImUVE7oMSXQjxcltQs+o0m97IAgxneakmCIZ7F7/0AbfiZ72QQo6q2DbAsqOVybH9w7vKRGaQtDVIYqxkvNN9pDlOkZTUlL2c64kA1thVkJCrDCNghApRBB8bZYLqGBb0Wgc+8wOJ2YnEdjByDzHEFiZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733497089; c=relaxed/simple;
	bh=dNzs88DXm0DsW0ColNww97VGrXRlHHoDcjWPBTgdGB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1w2mTCD0xIVNzgZ4fsRXmPZSlSd9eRVvk7FpXcfqmcTVydscPv3nl7MMB8jfUd7AW0/JNLAQP8J3SCHx8i/3jKjH/aNW3A6Wry4z8yk8brgfPVyX8f4TswGeViSQsiJYON4MwpfMCe4yJL3U0mlD/Kwes+A0vaKocU7trMBki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51529df6202so600311e0c.3;
        Fri, 06 Dec 2024 06:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733497084; x=1734101884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGs26nf32J7IWFe5gQzebo3VoEYybxmOCRS8t1bpYOQ=;
        b=VdADRObJPDQFH70UmMe1Socn/2R1PMpMY8T8Ilq1NDFCI+mDCnD5AYfVkC8kNUUCxi
         b8bu/uJGymJs5LgyYKaMpXVUMSFujAaVqgN43eUs3N2e6acnH3FqISissO/UJXNpEiOQ
         dO32cQYzPgkSMeS4jtZbkeGWSI8qsb/YgZh7hmA/dJJMADZdyzGEIKJsbovNRauYuMOm
         LHdNjA9VwYESQhqG69pZuRmk3YH3EcqDa++iU5Kp0CwVDQtVx3HgMU4eUz9tNdkN8bd8
         UC8hnO21ZW0AbUeqaFYGxg302Jl4csfRxsRzwrs/Emx9Lv5dwu8d9X4rpeplNBxLQY5k
         T+mw==
X-Forwarded-Encrypted: i=1; AJvYcCU4XXmj8DBo0Phj9q8Hwzn6v1+TMfBwLEHjv4iPAIZ5IDsahiN7OQitdFwRIr1fkrDOxbESAy1Z4mwT@vger.kernel.org, AJvYcCUAHQ/SyuPPXgGuskrbv4qws5bHTAZ9TFF5zsihfsG2kwj8vJkRNlr174JCkzcrLLLjJ450X7QwAKxkc259fw/RBtE=@vger.kernel.org, AJvYcCW9NcXK8QCR40bpONcOgMDVLJvjXXXtSV6b5gzSCEko/6rBYN4WfwMRcj6qv6HXQbKCoaY6dYKz7wGoJxnC@vger.kernel.org, AJvYcCWO4AP+r+k/y3OQiZJ2UiwneiIWXmHMx4TL0HYddsIOUWLxecBcXJ/4TUhThVhWFuupzecQBfFF1ivBMGQ0@vger.kernel.org, AJvYcCWVYQThLgRg8U6B1qfAbNcDiMBXAnS4bWe6YJ1jMH4yRv/ZqoBPQXtwcrqa0PEg+pcs8O9N89dvCcdh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Nty19rZk7qBTxgs+9cWElBsYSOCv31NM4t1GQWObdE9mNi34
	2U+GDGoaAhEtcKWm3G5q4O3vV0BvqCe8acSY2DPsh04YmKkaYznJuEjMG0+V
X-Gm-Gg: ASbGncs4//jfU8ZaH6pf7iFeaenkySTgMvBB+8EdVwJXuto5EpQUGyJw0ihjmaP90dw
	2oH+ZipeONKuMFYOUJihOVFri2HBptWn//wn1Ldqz2eyCQsQKkgAovM+6DYRxla6BgYFL38dw8d
	lKF45H4e2QaMLbcQyjDbJK8BVEJUpVyBstzAxKKDLHrBe+u9n1MATIfPdBfzvcYEE/Z/5hAAYRB
	pxNZSt4UoTZOWhnaH9MsdkL9Ebtll/fy3XHSfTcmuUMXlE5M4hICxKQj+DbeJGd9/M1GWvDdukM
	3rihoa+zfsv1yZ4c
X-Google-Smtp-Source: AGHT+IGBnN9xSt2JyOO6oL5msc6O1e0S7Sai6fx1X5GsLtKd5puVckXOjGJoBmWJE7WmWO+MpxB7DQ==
X-Received: by 2002:a05:6122:458f:b0:50d:56ee:b9d1 with SMTP id 71dfb90a1353d-515fcafc734mr3116130e0c.12.1733497083732;
        Fri, 06 Dec 2024 06:58:03 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae16d19sm318366e0c.7.2024.12.06.06.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 06:58:03 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5152a869d10so640314e0c.1;
        Fri, 06 Dec 2024 06:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5dO8N1SOPn9JxHeAGpUyuVJu3VhuDe9dgMLYQTGmzjbBh8ToRCPcHKo8PXc+30eVw0YtwbmxY/hZt@vger.kernel.org, AJvYcCVCF1Tg/C3zwvFC/tNjTOPhMgz6lv0T8gJa0uUnhbO9ZxPpE+5JaqoTAzOcpDnPoPsaqtilC2VPAlGysA6M9SdecqE=@vger.kernel.org, AJvYcCVH6vW5WjBMrEGwLvW0WGtUv4y0+C3bkcqpjnFSMXQzwYtbiIyZdYgDXAscM3SI5/DGqnMEjKFYf6IHt7g8@vger.kernel.org, AJvYcCWH0hPGClDcB44PSnTQLhsLLwQUwUrJfKX4jGd3Iy9uQzOSRSg3QpKZ8i7IJO1GvK7jOPssLfOJnq/X@vger.kernel.org, AJvYcCWksRyzGxqEDAVI8ym6m8sUDiF0O5NZuk778qPP5iDoT39Fpp6tMPR2V3Zg7/l8ks9+qNwPLeIqT44Ir5xD@vger.kernel.org
X-Received: by 2002:a05:6122:2804:b0:515:3bb5:5625 with SMTP id
 71dfb90a1353d-515fcae7824mr3399476e0c.10.1733497082367; Fri, 06 Dec 2024
 06:58:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 15:57:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaMZB0Dmc70DXTPnNu=Vp0p6K3w0A9y53B2OmrR6MeFg@mail.gmail.com>
Message-ID: <CAMuHMdUaMZB0Dmc70DXTPnNu=Vp0p6K3w0A9y53B2OmrR6MeFg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: renesas: rzg3s-smarc: Fix the debug
 serial alias
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, lethal@linux-sh.org, g.liakhovetski@gmx.de, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Nov 15, 2024 at 2:50=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The debug serial of the RZ/G3S is SCIF0 which is routed on the Renesas
> RZ SMARC Carrier II board on the SER3_UART. Use serial3 alias for it for
> better hardware description. Along with it, the chosen properties were
> moved to the device tree corresponding to the RZ SMARC Carrier II board.
>
> Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S=
 SMARC SoM")
> Fixes: d1ae4200bb26 ("arm64: dts: renesas: Add initial device tree for RZ=
 SMARC Carrier-II Board")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -43,11 +43,6 @@ aliases {
>  #endif
>         };
>
> -       chosen {
> -               bootargs =3D "ignore_loglevel";

I'd say please keep bootargs here, but as you don't support using the
SoM without the carrier board, I guess it's fine to keep it together
with stdout-path.

> -               stdout-path =3D "serial0:115200n8";
> -       };

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

