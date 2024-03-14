Return-Path: <linux-renesas-soc+bounces-3770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E087BA09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 10:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9981F2395F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 09:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB476BFA2;
	Thu, 14 Mar 2024 09:07:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608BE4C96;
	Thu, 14 Mar 2024 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407275; cv=none; b=T4C4R+7cIdBltvL5r9MQ9l0pnUqFCrRkC8wam8/FZeuKeXNtt3RB1fvPxLjuI8YePJ+2j3H7J7KK+xgpEDzC/5rWE/jqhBUGDk8AALe2sDl2TgnTvt9KW1/7ulOm72muKYTJjuG1JAgWEhrC8Gob3OWUUVVMBAm5AUXIz2EmOSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407275; c=relaxed/simple;
	bh=r0Ms/0c+w3Xzez5UMRRwkgAgwlRMVWP1iCoaKbWtQUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO8In/EYZSDSIydWa9MhqV99vXqqlUkt9OT0X5I5Bq7Ecud3wpnShSjBSTDlC3OMsU7p4zNUhHyouxDnYXtAXy1C/R9i1o4UZUckV49U0dQs2wmJJGFuEO7yDlc9lf2d7rwznRAUCSqPH43KrsEv0EuldWu757VL0uCS2qSMOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609fb19ae76so7948887b3.2;
        Thu, 14 Mar 2024 02:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710407272; x=1711012072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHsIDtkvQxOlMnscQiXVojq07MntWgDaFDPSS8+uwXk=;
        b=FIuqiULeIqGWNtt/1BI9e7PfLLetUsLITaC8QMyHh8E/K1SVMXKK+i4HtpryT1zaF3
         jZWtp0DZMjSU11YvepqYw4hVsZL5hWF2ImN4kZZ+EitIz+o/H1d1zcSLNKhCSgvn4JSY
         mb+ws9SeFyGXon8Gi6hcKoJOUmqsz1QKmLr+Fm0D9ehYCvhdac9ec5/9URV3NKBgLfb6
         66nAxPrc1CU1BUZjLYz37YHannCH4uz6YUgVQJ5CXORqZFRgRd2LnttikUcsw3qNwOyS
         iZfG1X+whUKepPuyE9uS14s+2225F1W7VSa9vFVnK5qI7ubER0Ka3Pze/CV+ZcDfnz2x
         f9jw==
X-Forwarded-Encrypted: i=1; AJvYcCU5bxxMJU4+6kDjR8SFEqZ2omskRwL7EuFJycaElefOh704/k6shvzDgViUYYUsIdszP7sjZNN/DTPJN5gTsxFIzaNuy1jl5lhA0Za1b3BYBQCpkfOxv2wDQKNpzzLUlX7+pf0cOuTa8Dii+LggNM68lEPcjfPz9eR9s1prqDnfEwkkS/uFuF+O
X-Gm-Message-State: AOJu0YwNb8d9M/7t4UqQG/SqNToIrHnFTkeeAYSmzzvPrAt4lo6TK6uk
	aE2uvB+4e9komEP2o4Zx+4/1F3mkoGLQmzSxWVof/3zU7mJsNEqxDtEqTL8r7PQ=
X-Google-Smtp-Source: AGHT+IFvi9h9EaNg9thHuxQNmYIULHPeSdySyhn7zwGq5QVK0HxQsbQJYjqrV3rB0MZAVS0mtIfCvQ==
X-Received: by 2002:a0d:d8d0:0:b0:609:eeb4:a5f1 with SMTP id a199-20020a0dd8d0000000b00609eeb4a5f1mr95265ywe.33.1710407271922;
        Thu, 14 Mar 2024 02:07:51 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id y127-20020a0dd685000000b0060a046c50f1sm195865ywd.58.2024.03.14.02.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 02:07:51 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc71031680so588690276.2;
        Thu, 14 Mar 2024 02:07:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBXoUjibJhTaIhIKQ4hvhKSuxF538J08tE5jsSWBlPu3bYP9BQWoWQWLGXUjU2F9yqnSCM9BBTiYJ74b7N1eFVe9dYKqSf0y54kLjMmbmZTBFckwBSv67Qm7TpJxykIjpQxMbUJVku8ChEP803Slb38BIhdqH3rUn5fMjkVHWEMwS/CjiLPAFa
X-Received: by 2002:a25:4f41:0:b0:dc6:49d3:dd52 with SMTP id
 d62-20020a254f41000000b00dc649d3dd52mr999321ybb.34.1710407271524; Thu, 14 Mar
 2024 02:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com> <20240313181602.156840-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240313181602.156840-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 10:07:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKHOi4X_-3WXkEk+2P+bgrjThetP_oZ+GSRn6iMS3SjA@mail.gmail.com>
Message-ID: <CAMuHMdVKHOi4X_-3WXkEk+2P+bgrjThetP_oZ+GSRn6iMS3SjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: renesas,usbhs: Document RZ/G2L
 family compatible
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 7:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The USBHS IP found on RZ/G2L SoCs only has 10 pipe buffers compared
> to 16 pipe buffers on RZ/A2M. Document renesas,rzg2l-usbhs family
> compatible to handle this difference for RZ/G2L family SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v1->v2:
>  * Added Ack from Krzysztof Kozlowski.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

