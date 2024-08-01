Return-Path: <linux-renesas-soc+bounces-7669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CE944539
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 09:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7207B1C219FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 07:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2768287D;
	Thu,  1 Aug 2024 07:15:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7E14AA9;
	Thu,  1 Aug 2024 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722496521; cv=none; b=XISkHM5xYgVmltRUBzTfN2lxuWsI1/6Kvw+2JGaHy2As/jXSZZlLASEeO7Z35/6yCMonCI2YyEOnbqe2h99IVvkguhUmMkHnNDNJV9tbpWjXEz9Dovwq8SuZW+n0mrnk0ejaRWhuxq8FMzbEbtvxdUfHjRsxJ8w0fRv68wdckxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722496521; c=relaxed/simple;
	bh=dWMNS79lKv+pmMcQtK2n/vi+2G/hwGMu4kXCeiu599c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOnnXBcqWkbS/TmpYPSVzOz+QG0MICbPs12EcFHUEheByS5Mx04kQoxTilzJRVwmBVJUMnzY4BOJMaC+5z96q2UsAFyY39ZY6QN3KawHJSg6Fr6N1Cdrh7guiy9d7z19vRBFQXFj3prxWfh0iWusvSQZP1Yl4wTxvMAsZzaINvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-66493332ebfso49344867b3.3;
        Thu, 01 Aug 2024 00:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496518; x=1723101318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dem1J3zNv8iNCExP6wVrNpwG6B+eUcgBpCcCcfiPk8=;
        b=mEQbdU7ReALWa92g+GkIcKXlyL/zHbliMQjZeIeQsZqhk/ycSXLKyNovtbZqU9uj1k
         L6IZbewYsMx+pdEbbbbVxzIPVVKUEaRxrQ6Y9P+2+GXwAB0mhXSLl3Em5Y/iojmz86g1
         YC71+wpspkinjQX/zMGa+GZEvFcZUye2qIb6Zzm4Z5LBr3WRsLIeWMl9ce+poYlz43px
         ZRX578DkaY9jWE1vgCzoIzMSMta0pw4aG+h7kzPDOlXfKS0UfQ/CZbc5JtNbsrNtmZaf
         jEhKd/DER/3mX/2l4FNHquu4hHMdmcFxKeSH6Bgx+DeHCVu3zNbpx4P0Pf+pCc4pZflf
         Wqsw==
X-Forwarded-Encrypted: i=1; AJvYcCV/TvOUKW2IfpNvf4Ea/5Rr8o5PeESiF6rv1/zrbQPzUZPWd0qHhZp0WRWRZfrhB6+0i/rLRbejhz3eF75f2nO0hopvgrSjlrnTd4fQYYZJ65/Hje/Ki0D/FjW6WPbsAwOiCmDnF/1z9CadYgrjwrLICgqTymY3bPA1ZicuOd1L6NLjsfFXmeT+JNo=
X-Gm-Message-State: AOJu0Yxet0DIv1XUBQKDo3Meund0E8eYGuKZlrx3p93nWn4D6ZeoXDIs
	PDqWG7cHaeBedDPrGpdPDrs9JxvnOCqi0Yv3VS7PxMQUrjFV3Ue+feUc4eUJ
X-Google-Smtp-Source: AGHT+IGX4PlOT7KR/j/pJY+L/UV8kVSqfgsQ0+1oKgd/1Dudj1ZU2HQ/EAmjW8djdSxnrThnwCMzDA==
X-Received: by 2002:a81:6905:0:b0:64a:5493:e0bd with SMTP id 00721157ae682-68750477808mr18516737b3.40.1722496517850;
        Thu, 01 Aug 2024 00:15:17 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b024da8sm32425587b3.84.2024.08.01.00.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 00:15:16 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-68537c804feso17311187b3.0;
        Thu, 01 Aug 2024 00:15:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSMPYewaygWFJAoRZ9Un9FSwTvDOqmDI9iER0lw43H3ARAxuhzFckGm/gB7i00SLZ6MdP6XoAvnBElgl+cjgpEva4i6vJ5SPHibqJnVY2WGpmJJmr5QM/HmvEyjHS0cWaRKng3dFnvxJkRxwFiSm+c8wjGOoDL6qayixk8aSQX9ckxJWjrlAAIukU=
X-Received: by 2002:a0d:e903:0:b0:63b:d055:6a7f with SMTP id
 00721157ae682-687503827dbmr16460057b3.38.1722496516446; Thu, 01 Aug 2024
 00:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731191312.1710417-4-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-4-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 09:15:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdQv9FXDKvMurTBds+zF2nkYkS=njNKYa_QvgaGpkE2g@mail.gmail.com>
Message-ID: <CAMuHMdXdQv9FXDKvMurTBds+zF2nkYkS=njNKYa_QvgaGpkE2g@mail.gmail.com>
Subject: Re: [PATCH] clk: Use of_property_present()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 9:13=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions.
> of_(find|get)_property() leak the DT struct property and data pointers
> which is a problem for dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  drivers/clk/renesas/clk-mstp.c    | 2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

