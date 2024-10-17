Return-Path: <linux-renesas-soc+bounces-9830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C49A237B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 15:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5704E1C25567
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 13:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAAB1DE8B9;
	Thu, 17 Oct 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aftDWt84"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235601DE8B3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Oct 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729171064; cv=none; b=psoXk56O8dtnholcAqW30AxGpTAyd91p46RNnRPEa81p4aF7Ov7rZFZd7t7PTY/6e6qaNIoyy8SIi9rKtmeTtrHRZrpWaHnampM6Rc7wIOKizBOfnQAHCejc/UohbnNotagXt9MlKiuSFDLqa0ZsFeOC+9NSpbk2pAcTTDEhICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729171064; c=relaxed/simple;
	bh=M80KJaUJhwYjKgSWSRxGEkNHoJKkVbBVNZbxQNfoSa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7JfoR8GjbnuZPb1uMZNYAEBj0nT2SfHJhcJ0CAMzd5AcqZhfdiNzscDHtot7nt+pIYVsTRiAtzy/2mnPWUkRsHQVwcQJrqXqBwdCpLDE8yHzrOGbIw7qYSR8JvX8vlV+gbtuS60rPhkgi/LSPpzSs49yhoLmy2xIxnLrRYw+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aftDWt84; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e34fa656a2so9755517b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Oct 2024 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729171060; x=1729775860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M80KJaUJhwYjKgSWSRxGEkNHoJKkVbBVNZbxQNfoSa4=;
        b=aftDWt84hAC7wHUkZm6vXgWrflNsT5qLxnO+/kzev8dLjsLbYYLiCYOCrxmQhYlV2I
         /zsrk/m9d+T/KOeGxpqno2I9KKD67npTA41WPw9302GFBguOj1zzhqRmxVsx8JGkUqP1
         93RHUinqlekrq5EdIAeUmaaM/sqgG2WdMpvUWVaWANSJcQmdynRxamLBWf8Jnk9ZHLoA
         qbYAyB7HlvQXrvnm70I6t7wEQt32iY30dhUDVfE1P0P2BvMoKfhUm5OstlYbTV9mWEEt
         3J5p0gqexfTFpDyLU0XhXpkvTMLQnDRvE751oNEblttODwhHbs7A+hifTI5x5sw3KtyK
         ibMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171060; x=1729775860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M80KJaUJhwYjKgSWSRxGEkNHoJKkVbBVNZbxQNfoSa4=;
        b=f8pxFROixsPB0kR4v1g3LFbEE8vcSrMno3vh0mN6kXwe5/hwKWcdGQr3BanM1jKsAx
         vhPNZkkOjDhr+DYRKFS7Tjk9MWWiuccjH4RbGnY5DsMTy9eXpI9qLlWhHNMZwrF3LOwh
         q/MicwMiJF5e0rh4FKdfV4hN1aQZ7CLZ21IBD5fu92APQIM7POXFWiYM1kUgZKkrhDOO
         RXErFOwfh+2dlrAXNlUTrVR2zb7hKCZOvzxqndnjMAfAsuPD/LBhCf0fCxP0xXsb1zts
         MZ3C7p1o2lK9NZTkuJ4q2B07/Wzjy2982J0HlV+7znG6tbbPRpZOzvTmNctdU/il2Fqa
         E0yg==
X-Forwarded-Encrypted: i=1; AJvYcCX0O8WYZf+2reIy5A5aFXiVych1WC/9vum3KMfpfbcF/lWMJhAw+hxpNeLIqnTkfpY1jG7+p4/f3pX8THbbm/++RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1S+FRJgMqteamy2eLwQ32+d24D0vHR5kjDT2tqA6jlBwbPAx7
	cXbXG9qMZ/ZuLc3X7Ga812T8iw39odnDutWW1JgZ9BErNgVx9TjyXxTBUPa/pg2AyP3hoWhi7Q9
	Dl9xblFvJLDW/qcEH/EUtEHoLOUoH45m1tSPh7A==
X-Google-Smtp-Source: AGHT+IHQyuuZiFyiR/8CqgHZ3Ze1mX3TGpRXO2WJHrKDNOMyyMzBPjljeY9XOAQRYtgoHlWy6njYbOGztV57jWUiMbI=
X-Received: by 2002:a05:690c:6408:b0:6e2:a129:1623 with SMTP id
 00721157ae682-6e3644d2f53mr155636427b3.38.1729171060105; Thu, 17 Oct 2024
 06:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 15:17:28 +0200
Message-ID: <CACRpkdaTT1DDi1qVXJ8OBBrfQM_BxpESRuSx2repL=vjhJd8WQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 1:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce `pin_requested` API to check if a pin is currently requested.
> This API allows pinctrl drivers to verify whether a pin is requested or
> not by checking if the pin is owned by either `gpio_owner` or `mux_owner`=
.
>
> GPIO pins used as interrupts through the `interrupts` DT property do not
> follow the usual `gpio_request`/`pin_request` path, unlike GPIO pins used
> as interrupts via the `gpios` property. As a result, such pins were
> reported as `UNCLAIMED` in the `pinmux-pins` sysfs file, even though they
> were in use as interrupts.
>
> With the newly introduced API, pinctrl drivers can check if a pin is
> already requested by the pinctrl core and ensure that pin is requested
> during when using as irq. This helps to ensure that the `pinmux-pins`
> sysfs file reflects the correct status of the pin.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Provided that Geert applies 7/7:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

