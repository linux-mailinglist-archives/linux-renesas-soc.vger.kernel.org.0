Return-Path: <linux-renesas-soc+bounces-6007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3679021A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFFB91F23C7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 12:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384280027;
	Mon, 10 Jun 2024 12:29:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E97E767;
	Mon, 10 Jun 2024 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718022589; cv=none; b=ngw5RDXLZugvKD5fca63PptDvhcMi66veR1Ey8ElkCTjQTwPSb9QZL2RtcOam9h9B5G1LX2VDYem5fSsxCr8/n8YBzp4rv3e05vGQtD5A+ICGKPb0gYYJ5qb7jij5HT+xyRiagrz7JC/j8WH9Ot/0u4A3u1WKf7Enm6agDIVzFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718022589; c=relaxed/simple;
	bh=VIqDUZJagne6zz+2zSLweAY3KkWozkQKO/O688GBJLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bscEzQY+7EokYcyPRF2gyvfsQIZWXHVx7paMWxS7HBnUXFOsbQrs1khZS0JmO97033+nCnQqbHI8KsDex52YZ7YZftOt8R0fsSVfXCYlZzoJaivpStfRgBPXTWDtd8xExMySbUBgRbJL+C5Zk8vpjiJJCK24xhJ+ZL5pcPvpKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfa48f505dfso4726712276.3;
        Mon, 10 Jun 2024 05:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718022584; x=1718627384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0B9aDmcWue3KnNlLkfet4LKN9uGSsJqdVbpd70/2GI=;
        b=Xz8daYen5gZXJBi/zChs5BNd+kAnu5oo9CGiPYAuDNlxW/APEY45A21wZ/i10LjYbh
         by48eJCaGPib5lvOidVrbQUiUdT4DUi0lf30oRo7fhDg5MpI0Yb9cezFH3T23foo3pZe
         D/1cOgO/0ZfdQSNhZc/8+T0c1i/wF7apHv2BwGWBj3TFYV9DRGw3insJ2wpbewfFXAho
         lL9kQosC3stLJCCsrGajNDg8xrDTuYx5F86uC4JtXEVFPbLrPKbAFsv7BOA0KwE8wW17
         dLG0lW73AgBoZmYoimUV39AuRVB10NxtoyC1OVQO6f+SGEHjD8V9BR/rg3jZ+N9Gmdmv
         qSvg==
X-Forwarded-Encrypted: i=1; AJvYcCU5CrLnMZSDpveZX30ZljwlVgnJa0pvi9Bou5r//upKw91BrlX7oZb72t4HcELgcufDENfYqemP/2rEgWifIwboQ3GV8KdC3jvL/YiPSOvusfUqd+D5bPGdZrtbA1gKOTdPSLVVePILzNgNq71Aum0=
X-Gm-Message-State: AOJu0YztQsIB7NW8TKTJQjVXeIfLJlx9sUHWMHQRHADyl1r+ynJ3iihm
	hAq6ZjhsnrHZv/5RvyKmAtRsy558aDo1p8aQswNO5HIMiq4+Q2NOAMTgfoXQ
X-Google-Smtp-Source: AGHT+IGAqFtQ9rXh0+V2oTzRdbhH914JMzDzpxBkDSy5SrUE/wgKIBXF+D77w//qWLMJnrD+/gnKfg==
X-Received: by 2002:a25:ae44:0:b0:de5:a13d:92a1 with SMTP id 3f1490d57ef6-dfaf6532148mr9163409276.27.1718022584441;
        Mon, 10 Jun 2024 05:29:44 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfae515a8f6sm1612730276.0.2024.06.10.05.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 05:29:44 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62a0849f5a8so42271277b3.2;
        Mon, 10 Jun 2024 05:29:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6bdksejr/jrS8sKevU6QLCC39OsVB5pcCcCc8rT0wTR/IuA7wXHrx6gPyxMiOlFX8cVAoi0lIeABvvpPwQ4/DYLax7Tzk23Vc7ZftbJjsgGL6zqlsJsMekD5IZx817TZEjHMoaTw4RDwQmzm5f40=
X-Received: by 2002:a81:b1c9:0:b0:622:f7ef:7bc4 with SMTP id
 00721157ae682-62cd55f6e71mr87651227b3.31.1718022583526; Mon, 10 Jun 2024
 05:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605153708.613610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240605153708.613610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jun 2024 14:29:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=w6OokwpexaSeJABWXtwG1VDOZEBQE1UP5pQ3gbj+dg@mail.gmail.com>
Message-ID: <CAMuHMdX=w6OokwpexaSeJABWXtwG1VDOZEBQE1UP5pQ3gbj+dg@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH] reset: Add devm_reset_control_deassert helper
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 5:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> A typical code pattern for reset_control_deassert() call is to call it in
> the _probe function and to call reset_control_assert() both from _probe
> error path and from _remove function.
>
> Add helper function to replace this bolierplate piece of code. Calling
> devm_reset_control_deassert() removes the need for calling
> reset_control_assert() both in the probe()'s error path and in the
> remove() function.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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

