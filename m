Return-Path: <linux-renesas-soc+bounces-17032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFDAB4F9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 11:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39EF18C45DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5E0219A93;
	Tue, 13 May 2025 09:20:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F717FAC2;
	Tue, 13 May 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128034; cv=none; b=NzIPKUCRoVLLX39Gv0GbfQzt08mCKD2ImdwZVZHWQs8cEREuD5qhUMAsGXl7g4aB/1a/J/FNg4EH1X66qsxJp8aYUuFaqJzNUBtcd+2i5AJBmr70a7YLbWqkzRvSn5Kpr7GKq3oGuskttWRcfh9etOfLCiriNbUiHazxkXq5YcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128034; c=relaxed/simple;
	bh=gAh+nP8oHDaCItX2W8AUIB5VYau8vFNOeTCgh1wf3Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n59zzKQOPUePfaRyKyhMYH8u5+IAlqAA8oLMzyh2kA5L8/oVvAOw25zt2UNH9PhIIR8YQsCbBs2zRKrPdWaOFlgMcksO/UT43Dpt8XO1oxRlBraiS5+hepHCVFJEgtO/8QGJjUrIiCcxWkc47TKEDuvEN25bddIRkhqDU0aMK/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-52c8849d7a5so362882e0c.0;
        Tue, 13 May 2025 02:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128030; x=1747732830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN3opsO3/g+LxryP1yBP9cYOCycIuBUFJorH2YtVVx4=;
        b=gYiaJcdfdToy9M2JdGv2m6taG3yms8ZySWEtPgY9KWnhfI72aRYXgPzBGXVuZ80Bud
         8D7S0FubcDJqqQ95kACmdXfpk5/e7WyChA5Yb+8+qNurdT07IijRE7tZL6yhDb9/6/Hm
         8o+DiVfuNz0aUK+dna3aidre1+KfvErMqkJELV8FW9Inuko+jDm/+R0bmoRGnBuLZMJd
         vQhGSaYOIRaP8AaXlLz5hQxMTg5xnJz+yWs49mzUruheoIUbgW0bZ8GUmJ78aTjGuNhJ
         I8INmYsR49l+cg632v36EydhsSIugZvJMJ07AwQPy66HKydjRrmBZVpAZQhLqmR7O1eu
         i8Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUxuyIfqeCBjwXg/G+jwDGCXtvos+VeI+zm8FWf3SueUaQ5aPhVPZbw9qHozcc28jzLr3Fw+ABmmKK7gVUfEB3oTWA=@vger.kernel.org, AJvYcCW5kKDZUJaHd4hFAalRaIejvuJw1zlDZIuW0QNHo1UTP0b+t3eYL3QjdHCoNuptCsEcieUnIjYSNGu3f6g+@vger.kernel.org, AJvYcCX6mTYQVLq1cuXx1WIUpQV0tsiF+QHhEIJhDWa/PDJo9GBuuyxgnH/t3B0HYIGDQTEkZE3Dd+wMe+4i@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAlNjR6VGXo5kpkY+Go/vDtUBvYo4T+Ewi4CEOk9KBlsjB4Zh
	ngtUGR8qQptPbZ4EViEVLl1uner0z40KOy0X0XKFmf94WZgt6pQko9xWTPtB
X-Gm-Gg: ASbGncv27XbGe+2tT79Bls2VtSC955nrE/WT/K+K9p0nJPYwGirJO0jsttbqxJ+tH+V
	8+g0JZuJXa9oeSpks/DF3wKnfN5CrWOGvQl9su5zpjCbNH4LiFcBh2LfpVClehJd2nxdhkuPbu5
	aTay8J8sB/FmppQgv1mQMw3+NwpkmTtjZfyvTpSUkb4oQmJ/UNWJZzPEjgGrfd2XSgzwIUaipWo
	xTi7OnjGTLICpC3xPeseeqaIUvvJeBmO1XppjaFndtgoJB+wIEWIj2WcmbaljyuRim4AYdxemFb
	ExgDN/G/oiBg0mBgl0lHpZDuBU+UXkL0pkzAIxEDnWGl7DySs1SxpHxKAoo5gqSEkN/sOHNfm/I
	jYQ7AEScFf9VymA==
X-Google-Smtp-Source: AGHT+IE00wgvZAAAmOlZ+gOs9MOzZ0xn571L4Pza2IlGSu9/m8zZoBp+zmy5XOKtoOnfm3HLl38T3Q==
X-Received: by 2002:a05:6102:2b99:b0:4dd:bb2c:491b with SMTP id ada2fe7eead31-4deed351cc0mr13604706137.7.1747128030495;
        Tue, 13 May 2025 02:20:30 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f613b1absm6551996241.3.2025.05.13.02.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:20:30 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4de317a6fbcso1887202137.1;
        Tue, 13 May 2025 02:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4W87GwgoHjpGTMl82cRZcpmDyLZUtbNtPAUgJGyaaPiux7Rrw1pKIfoZpkYlgVWUjjgOx5gMo5m6r@vger.kernel.org, AJvYcCUgCVoytxPjEX7AX4xPNS6zEqDr5SAGfIbsUcl/7zFkb6xPRc3uDXBXjhON9F0L2vut9eQUhe0edsKTATAk02agoNM=@vger.kernel.org, AJvYcCVa4sLhvBYSuxPP2wK6l/MAhWHewQivV5c9l299yDm7x1P56CYCfbsWciwOLGqQJcubPEF/gq0h9LFafzl0@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4deed3ff7d2mr13399818137.22.1747128029801; Tue, 13 May 2025
 02:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-3-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-3-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 11:20:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUa44r_V2Y6GJEE3h=8=zBhnwA5XF38PhAtE1Oh23R0KQ@mail.gmail.com>
X-Gm-Features: AX0GCFtsYqqZEtQ0tTrtIH-cPJFu5TVoM5HCQliKxZJlKd3wefrwd2YjVQ-mot4
Message-ID: <CAMuHMdUa44r_V2Y6GJEE3h=8=zBhnwA5XF38PhAtE1Oh23R0KQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
> documentation.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Already applied as commit 6147c5f081708485 ("dt-bindings: soc: renesas:
Add Renesas RZ/T2H (R9A09G077) SoC") in next-20250423 and later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

