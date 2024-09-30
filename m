Return-Path: <linux-renesas-soc+bounces-9192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685898A70B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DF001C22645
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2BF1922F3;
	Mon, 30 Sep 2024 14:30:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770C1922D6;
	Mon, 30 Sep 2024 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706611; cv=none; b=j2wE3PlYc8NTaiqF8c88R0XoOf/sxzRNLz+ZdLr4itndekH2WqQJoB6K4pz+aOl51zv+Ha4+l1DHQQY6hps0n/+HZckc9oTzoEXEElR8jcZoZoOPRKenTc5fI2x80+Y1IRsRfPuksopvKl0wz+NXlPatp8BHzlkWfPP14Q/+Txk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706611; c=relaxed/simple;
	bh=MGcnCNqoEXzmE6FYl89rTUEJWSI/J4QNKOU9Kc4vO3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Byk+pVcXmf7c88M7+bfyDceVYZUA12kv0/VyxX7OW9Gk5sKF2cgitNAUyITM1rVWQTJBkptEnO2hXfiUs681PNZozMlmCbJ14+1bdC1C1SunW0pRZECkTnB2HIW0ITgENjZ1FTzy1x1I0jMFqAJo4v+srWUsoyR2hc6Uq/y/iDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e26048d1235so2770786276.0;
        Mon, 30 Sep 2024 07:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706608; x=1728311408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKcxK9GNB9gaSWI8ggATPf6ww114POrT/2xNc2BTkd0=;
        b=W50J8qFNli0+fkt+xqPKz8JSiHuXanJt3qBFg5clAYtjaDRtD5gboMMZQM0bh+pTsL
         esPEDjFxDbM895sP0HsjQF/E/wSkKIcdHI0wkw6Oe5fnHWZCNjLTxVj+Nm2Z7KhXylfp
         6GjnRVIgo/KPOShuBbBUPER0o/Hc6oK2YVXIHXS0S9uUzRgckdlJTiH/5Dh+0wueyuif
         H8AagRa5gigCASgWPQv1IuD07hGJQmDM99DDrfSWz6MvOb/SZXBzLKOcnSQDYqHZcufu
         7DpE/hAK5GMwBbfEEl1X3tTK1DBf7jKipDKnUZZsUNmWdk4I9SH/vVUCSjya0ChYJaa8
         pGeA==
X-Forwarded-Encrypted: i=1; AJvYcCWm77Z4P/XArXQPvfqxDqNypxPUWUBgqWvhA2nbR7Q37meo4cvpQ6QZmehgfjdQGSqPcK9CUgA0EaHf@vger.kernel.org
X-Gm-Message-State: AOJu0YzuCPzguduIEO1/lEP3TFcotqU85KccXjDuIpCuVqCi99O5c7O5
	KZFneR+tlCJ5T0QJJAtfHPZCwn9ZhCn7svDrb++3Yl4/1djwC4vogL5FkWpj
X-Google-Smtp-Source: AGHT+IHPBweyCp6QP6bqV2EqPy8UpVs+uVGTEpGM5CoOeAVlniy+d9rEFShuVa4gelDJorPNPlByxA==
X-Received: by 2002:a05:6902:11cc:b0:e26:29dc:8dd2 with SMTP id 3f1490d57ef6-e2629dc8e52mr428672276.6.1727706607028;
        Mon, 30 Sep 2024 07:30:07 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e400f721sm2280979276.14.2024.09.30.07.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:30:06 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e25f3748e0so14258937b3.0;
        Mon, 30 Sep 2024 07:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQjCrBxTQmrgkUJ7XUByG6nIHRpsSL2WTy8tyEz8uAqXy6VrZzkzJYQX8XoXw/yMgtS2DYc9SBoV11@vger.kernel.org
X-Received: by 2002:a05:690c:d96:b0:686:1240:621a with SMTP id
 00721157ae682-6e2475dff92mr95945167b3.31.1727706606288; Mon, 30 Sep 2024
 07:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com> <20240927095414.10241-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240927095414.10241-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 16:29:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6zirejEvH5O6SF5JWFocqAtkYCEruo61agzEsy8eW+A@mail.gmail.com>
Message-ID: <CAMuHMdU6zirejEvH5O6SF5JWFocqAtkYCEruo61agzEsy8eW+A@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: renesas: rskrza1: use interrupts-extended
 for gpio-keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 11:54=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

