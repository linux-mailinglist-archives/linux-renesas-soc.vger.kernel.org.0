Return-Path: <linux-renesas-soc+bounces-17871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551BACECF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 11:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EE7A16B1FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 09:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7C520FA9C;
	Thu,  5 Jun 2025 09:38:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3E220F09A;
	Thu,  5 Jun 2025 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116286; cv=none; b=XeyhIrHjCwZcIE5zFzpEVJ/POPDR8P5oGKUj+k/qwQP4g1hTKUsQatBwyOu8s0RbcCJiwyg2PH7p7dg46qtrOd75j8bz7ct06LwY40xCU0L8WL92OoARRUA1M10EC55UBEBcNsV7hO1h+HD2uGxIYOnKnfeYE312TdH1dIfm9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116286; c=relaxed/simple;
	bh=BzVm+XPOeFFW4LJD/IdLn4mnoH68spNXWpCbuIXhtPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ywj2LhiELqjTlXYrVdkV5oVhie86Qy1Z0ejBhyTkQEsUBBAE9zDeBAK/P7DHvF1OO/AqSi7odhXhwrF5+AB6QO7UkfzdwFuF6DpUIc8UriZT1ypoPvXxu/fjPwzn3O1eNiVky0L0yl6q+HVVtIe5KSPaXC541OSdssqTiHcyEuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87be9d1fe01so270336241.0;
        Thu, 05 Jun 2025 02:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116283; x=1749721083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2oZXmKHpEN/EPsDWfGFgwQq5584YE3Ndgbe3HHqLtg=;
        b=QDw5ddEzKuz0re+vVat0ZRzxBgc+mYOrURBa7UQiIDaZOB72+59/FMkyL1WIou/dTc
         5gc21A79Ui4LWlre0F6tIihKv08XK98deppXaz8BUOe9UUZBflrZkYag1zA52/JOwdx3
         HdFgpau8gRLazWe3rHuQVWzh/uHF192ne1cClEeO+CWLhK4o+qzuLLuzH99EilQN9GDE
         fgnQceKShpOgLzK3mIbFQIQgvEFARm+4JFQX1em/zAGpXLyqVB85sFbkce9ZAKBH9Fhw
         AMWpCf1n5Cgmord1Eyeo8U/jSjZvEj5MS8CxfO7EYmA6STXSZ19XmATlSYIKz6Czxnnm
         FzsA==
X-Forwarded-Encrypted: i=1; AJvYcCU+xB58r7zqH/ng0Y1BrXwYen7mBjtI29VL5CEtf5HmtSMlUm3d7U1xDrArd7LgLpBOFqmg36FI+yvB@vger.kernel.org, AJvYcCU7uioa459e+qb4WX5nkCWXkBkHZ8hE/WV2KmhBAcvriIGOx7+ewDlSQcOi48tneZQkBhBFUCx3Fo26IIPZUPoVUBQ=@vger.kernel.org, AJvYcCXBwPZkuvR5Goh4j4CQR9QT0f8YTqJgwU+PHVBaeGOEEkZch3oWcIeSEZBhbjN4EatQ+YTz1I9L5k9O@vger.kernel.org, AJvYcCXrJzx9vNlAJLPdFIpJRGL1ggDug+GsFb3xClH2R73DsGWin9NJi+TFsKoVkh3bggjYl0bQkOBHjuBzV0dz@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGsiO6yyBq4raWAy1t9M00ECITZRdFmVLaBXmY/VpL2rLL57M
	K1C9g5QJAwV0LrD1hB13HpYcUYUCUNDlQCdwR18YX0uPZAKsWNEWUupmNn5FQlEfJgg=
X-Gm-Gg: ASbGncsR3l67KYOiWqxVCBFISJ9CMurOJ5PP2etNetTG6vz0E0ozDp0328mT9IgV6oD
	wW9/UUEM4oHWLknnR57tNbvJW5LWEjbiZZ6QI864yoSwIVlEv+i2MAxWTTQ1Ki1hY+WZLdTkb1r
	8Kvvt3couABqzigSXqkBjZ7gSZqz+Swlrz5Wnthky/Hy7oiUlfLBXCOEIIurjhSSP9J7N5CxhYv
	c1c1syqKEYecpj5ePkPd/BwDe7GubuHyVicaBf6Znc0nGTpY9wSAkN8Hz6KstqCbzvhlpZYczII
	5H3CvXkLKIAvwUSVDtaZgvGmTH1YEjwCTtz8Ibgg9xmUfZbuo+fkrxWvQto9s/RsoAROhll8ia9
	SogZrpYKuZXrlyQ==
X-Google-Smtp-Source: AGHT+IEfdWiX56wkdsZ0Uq5vrhWdlHUxSLNZG5J1Zx2YSn3vPW80PyjvlMQ3t9tq6VlciZz0pKLEfQ==
X-Received: by 2002:a05:6102:1625:b0:4e5:a83a:3ceb with SMTP id ada2fe7eead31-4e746e68e2fmr4427768137.20.1749116282864;
        Thu, 05 Jun 2025 02:38:02 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a2c28d8sm10058823241.15.2025.06.05.02.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:38:02 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e58ef9cb69so236956137.1;
        Thu, 05 Jun 2025 02:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUau2UC63S4aBekKzndHKgJ/lEARzzUZScP3TMorR8QkgD6G9tYEwRmglpFmAdALWXUXE/stqULD3K8ahg7smtO/co=@vger.kernel.org, AJvYcCWH5HFQoRZ8rKlp280BLWElyEkwy4BEtoROMRPTWH49ghlAKsFFMEsqdAzQLwGD05cLn4/pOKhRT8qk58fb@vger.kernel.org, AJvYcCXuLf+eEpY5xRnvmzxODcIfFc+EzyTa5PBIGG8cCOy+smNqUfFs8CYGcLUHSyaTrwben7CY7/KaXMDH@vger.kernel.org, AJvYcCXxXgL3absefRTGC7WXWG4jk0DI5thKUEVKW8GtpmlMeFUWQb3IyREEQDAql7+RZRzZt97T0oZlnlNI@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:4e5:a83a:3ceb with SMTP id
 ada2fe7eead31-4e746e68e2fmr4427759137.20.1749116282376; Thu, 05 Jun 2025
 02:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com> <20250527112403.1254122-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250527112403.1254122-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 11:37:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYr2_VfT_60koZ8jgRYAgsApwjy3qB2WEP58cYR23xHQ@mail.gmail.com>
X-Gm-Features: AX0GCFvMhq9AnaKhwV1C9lR12QDmU5XjqkQhyYd-4Xk-gHbvYtmrQ5n7Yfrl_OE
Message-ID: <CAMuHMdXYr2_VfT_60koZ8jgRYAgsApwjy3qB2WEP58cYR23xHQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] Revert "dt-bindings: clock: renesas,rzg2l-cpg:
 Update #power-domain-cells = <1> for RZ/G3S"
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
> This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the
> Currently, there are no device tree users for #power-domain-cell = <1>.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

