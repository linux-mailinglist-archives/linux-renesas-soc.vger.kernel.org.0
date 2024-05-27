Return-Path: <linux-renesas-soc+bounces-5487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF368CFD30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF681C20A58
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 09:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332B513A869;
	Mon, 27 May 2024 09:38:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3E13A40D;
	Mon, 27 May 2024 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802715; cv=none; b=uBT8lXUIFILFkpfzUy5dpKY5Dj2yKexUfk6qZl5fT1z3cXfO+tf0eOTSJYb7HduMu5s+aT7WYDZdIQYg73tH3koiNEhKhKHuIwVOiPJ46MZieuitzvl749fEGwysPdx56nQSu/xOBKGOdZpG9x7aV1FMo6KBNBwFUb+84xfKIm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802715; c=relaxed/simple;
	bh=AN//DizJVCyUg0QCrDZjkYZgMBSSJ7AIyufoQQ22Ie8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsb3xmhrVOpATq6UqWDr8/cLqpN+q3t1v88/K6I+Y3GimjVaPZBEK9pvQyvFZuSqZYGTkUzmN9+CHhrFVzDu95OMSWatH0wr+29VePG4Laxgk1UTMb4SVQga+wY6k6XDr9zkYxwfPQ9sgPFcTaePJ0W4c+1EKrVivkeZHjuuy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-627f3265898so51318257b3.3;
        Mon, 27 May 2024 02:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802711; x=1717407511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwobYBfmNmsLhAXC5mjd8bY4+Dv8TEhrLLXdGOAc17Y=;
        b=Q3sKxgm6yTRCG9A1bpCemvtMj5BsDc6lVDrQtBqpzDdVx5Gja0hUSB6za70tA6kpiH
         hi9G4ePbpx6Tbke4GdTxw50R+/3RflhfSUIftk9l3FPq8U+RSCZMdN3h7RO1TZOfA+5W
         uQyt3ptIYakAbBJybcbcSrJJR+YHt6bWxYtkfs1yP2qzkWUvC8GNv7HWv0N7ysMWACMB
         mPwT/Va0bDCldpu3+bIXNCeN+nelP/D0UbCG/eS8j2QR0ddRzQgq9Enokac/vgkAAtup
         zluE5fz8JIRD3GtD2vlYfsTrY/ZVxk0kPLFg3sDJ8yCNxc/kIlSDOxsiRRg1KC6o5mzO
         BJxg==
X-Forwarded-Encrypted: i=1; AJvYcCUv3ioA899d6FOSscTnB7I1qGotK3VMXpC6iPrp6rGc1gCQmh7DieNifVZcpiM9f23Bf/jfq1bwLdqkgYoI1k6EtIQSHDogxsOaB5uAB+y0jyyxUEAWCkbjiTWrHkkz5ffp0XHcUgSesA==
X-Gm-Message-State: AOJu0Yzp6WG1FwZu0gb2+2JM4KgLpCjchJZjhWjCzF6M1UllRk0R8jXu
	SAhrM5EQA7pVoNMZcsSacnm5ZCm1hXM6QPA9Yo5PpvrJQDUA1Xe0Wl3yHB3b
X-Google-Smtp-Source: AGHT+IGHEo1PZ1IVkOu8bRhycjnn6xE5oebUk/CZ85Zw6PaF+E2njsiJKvbbsxGjIeOg3jJL2ytc/g==
X-Received: by 2002:a0d:ea4b:0:b0:622:f7ef:7bc4 with SMTP id 00721157ae682-62a08dda7e5mr88557877b3.31.1716802711637;
        Mon, 27 May 2024 02:38:31 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a40a5c7sm15662617b3.60.2024.05.27.02.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:38:31 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df771fa2b8bso2947148276.2;
        Mon, 27 May 2024 02:38:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxZDea29cXIcGmT8MO4niwrTB6EfmJwqCVTpp8SAB58HEEaY+VJPKnqji2P2s3Nb1+YZVOjhIBzQ7SHwlEEnJVls4GG29FJuAx2e0A9YoJcl+jAe9dqy3fj0RG274hHXtMV+2BIhK/nA==
X-Received: by 2002:a25:e30d:0:b0:df4:d62f:ed9b with SMTP id
 3f1490d57ef6-df7721b75fbmr8517962276.36.1716802710871; Mon, 27 May 2024
 02:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523205041.7356-1-wsa+renesas@sang-engineering.com> <20240523205041.7356-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240523205041.7356-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:38:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP6e1N=L150jkny0gWHBKUZtA+R98N4pWtic28z9aH8A@mail.gmail.com>
Message-ID: <CAMuHMdVP6e1N=L150jkny0gWHBKUZtA+R98N4pWtic28z9aH8A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: spider-cpu: add aliases for I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 10:50=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> They are numbered like this in the schematics, so keep the names in
> Linux the same.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11, with s/busses/buses/.

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

