Return-Path: <linux-renesas-soc+bounces-9672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30430999C9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 08:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B4E7B21D6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 06:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9668D208208;
	Fri, 11 Oct 2024 06:27:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E82581;
	Fri, 11 Oct 2024 06:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628033; cv=none; b=jnlXWNCbO6OAz7LCUkeOZbWT5+B3nj3l3OScZDtf4AnQooxX1jBGaiHI/rh5AE6vaRthoikCX8tZDwxqOhVHvqH6Y6h6x4W4yLB6C0mFxXTwSlziaPGTE5GSb6p7A0PY0dewffrr3dyoNqDLQkVyaf3npOq0DQumGbMZi1IZKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628033; c=relaxed/simple;
	bh=Au8e1y4UJ5JVpJtCtQLIGrvNo1nOKnU3QcqpVfdC9SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0sDQkZx+yvdHBstqmyhEcq0TB9ATwwAWY97hEEnIvwZpmOVfMCnFRzEdqFxXlHIVhRr/ncEzTO5LtcKeukSDFcr5elKYCkdO1TJ0maFXmVvRR9/KNrE56JlqWPFEDcJJd3GrL0CI6CrmKumXPGrXX7r1lhd0bO/bE6u4bcn5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so126933276.0;
        Thu, 10 Oct 2024 23:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728628030; x=1729232830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EFRVBKoHDi7Rk9YKtPxZy/EAUFpof9x2Rx1WtoBkFE=;
        b=mPENFvG80XOGH3it1T1Jkc698Ah1zPdsxMgCMEP7aUP+TGBVrq68rhtqPO6AfuPYBh
         aFraPJ+qoVRxb6JYbDVL+r8rsnXAG0GyNDFYCipoyeWwlJkzL04pM36MYAhp8MxGHhP6
         1g+L0H39pcsasIrRW3pzn2Z+Vvj4adF0Y3QSWw5MpPijSsFxu+KupQDH07xjb8dyyrui
         3snmLbdXlsFlYljiVrgVcVzKBY6B8qDm/7u83HrY7mkSyhmmZbWvX8LfYSzPKiZ9hXNn
         j1uA4fyUKJFCQFF31PeTSn0xITo2kWJ6YgAX+b4PIBMz9SYZ0ZRGbyrFg/EvGdV7+VBh
         ScuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbcZqWOC0L4duouEDcROso+RqsYiUuIDao/HZGOYlTPPLQPz0yQ1bwkFUdzMgKp4a8uNuije0HLbJ85gc=@vger.kernel.org, AJvYcCWp9HWlWsDU90hJSQD/iwkOyBmii5NwJUW3Juf2W/v1aDtmt5uGyF69ZffGhJay0x2E8jrDF4K3gCA9vPA=@vger.kernel.org, AJvYcCWrMoKY2tAfwd3mkwk8sae1o++C7R+hLzuqhx9hj5n7xIAB7uEEvf4IkGpnJqfQizoYTC7IikneUiCXs0cPxBm/Ed0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hJkweYbubA/uwP/DjP/+G+mMn7jncMMYZxsAB9Xn0yCNB8ka
	5vsp10szByH3UiAygIMMoClSSg9FLzGceeTqocy9KwAz4KIs+T9OkjoZpas1RVI=
X-Google-Smtp-Source: AGHT+IGlr41BzbNo5MyCHDTCDpZ4iZGk9KHGlo6eDXydl+AeI8xo26+ry1u14RcVvgWJ+BLYTdigew==
X-Received: by 2002:a05:690c:4585:b0:6e3:3a22:7205 with SMTP id 00721157ae682-6e347c6b940mr8956617b3.44.1728628029692;
        Thu, 10 Oct 2024 23:27:09 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332c6e29bsm4749117b3.114.2024.10.10.23.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 23:27:09 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so126920276.0;
        Thu, 10 Oct 2024 23:27:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV03iedsorFJwL4kEEigIIZxhu5hEYax8k6AmBn8I9miv8BfcDZBPucOziGkAbD3a4OU22KL2ctSiH3J8dQMk6W28w=@vger.kernel.org, AJvYcCWOgPG/wJX8bMev9D43xvSVrajoNgO6hb8IT6FdoCh0KA/Wo9bV5r/FTNg6+IfAieEqujPhbuvvJlvk6iU=@vger.kernel.org, AJvYcCWz2x4mWyUKec4t/8ZlsZRJ1G5C++qwNpUjEJNlq/RD6qV/SmcXyueyjADkyDee7m1hkMZ++rzmv0zyRlY=@vger.kernel.org
X-Received: by 2002:a05:690c:386:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-6e347b5133cmr9785587b3.29.1728628028537; Thu, 10 Oct 2024
 23:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 08:26:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzTyDvrAGZj0gp4QuW72LvS49VQxBT5UZP6OYXH6xtJA@mail.gmail.com>
Message-ID: <CAMuHMdUzTyDvrAGZj0gp4QuW72LvS49VQxBT5UZP6OYXH6xtJA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Oct 10, 2024 at 4:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> I was intending to rename the sh folder to renesas, do you think that sho=
uld be OK?

That's up to Morimoto-san and the other sound maintainers.

>  sound/soc/sh/rcar/core.c | 7 +++++--

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

