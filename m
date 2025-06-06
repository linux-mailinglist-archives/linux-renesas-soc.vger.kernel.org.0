Return-Path: <linux-renesas-soc+bounces-17905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF2AD0235
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 14:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF3318848C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 12:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00A428850C;
	Fri,  6 Jun 2025 12:29:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051A528750B;
	Fri,  6 Jun 2025 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212994; cv=none; b=eVPLpGvBd9uJDuiN2inDX8BxlxyXuiSVeE3oEnukqw/vIrpSaxhqttYbt2UynHqUv9ESpBgabmNMwts+IXbJD5mF1zy4tlanxxcIzx0mqKyWcXvDOt7qKLOvIDdOaoOGdROP/U6AyXmpCdxBXlPFUSj+zcqCYef5uV37VknL89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212994; c=relaxed/simple;
	bh=Eat/Q7sTNEFbeM+og4RdCseFvpUP6zHJYmzUhvvvbgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPmGR3wb5cnTO5/sOGplRD6/jampjf9bHL2pl3eLoajs96bWrtTWJILK3QmSkrJow4pGrpPkrUShH1NNn/eArFvvH3SkjxPv6a8roTaOB8hSDVHSybZeJv1sNWNR5MAeq4dtFDYeBXbO+mrkOrCyvn2uxPYC2TB+hhJADFK+ztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-527a2b89a11so868502e0c.2;
        Fri, 06 Jun 2025 05:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212991; x=1749817791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GExCOTG1sYNvAgix1/fBXT30B0whNEqEGmqvut8HF5k=;
        b=GQqE/cAczPiF+LUBY+q0UQQHAM+ok6lJMO8d/TWUo5g3LJlGSnoab8D1i44M/gFmXr
         ghCoVgDeqFiuQXDhcTIIx3rDZKzNSSt8MKhFbn3OQPlh+KNLuBPDZPAgIGf9rJWj8E2w
         b9M8v8bSPeupGGIQT4yJ9x/B3XK28nrWQz8uocNvD2kQiAQDLK4wSH+xt9y/pEbHw3GK
         4hGBjv8qKK4jI9HEGVqMe382iOTNbMGesqK7FVtFNyr+ZlDIyWYAGh6QNPblOotQMEYB
         PuC83kRgH9XNhUHWRECeQdYQJob/Rry/ZInwzg6RI8TiPRi0vkxakLD9ebqNMME8qEmy
         77PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGTNX6rX0Y3TvbzumU77Tr6fwv6mLpmvQ1lcG0MfYqZac/Dp4bTM2662i/ECaBSne38FPRqLv7fwxgA41K@vger.kernel.org, AJvYcCV8r+Na3sfbf/XVtlkNh0iuqkKs+7UgMXlcvlPB2XhIZ2iXaV6bneAG/aQJIoVBgVSItodBrZ8MEmJrF+obofm3FZ4=@vger.kernel.org, AJvYcCXZuXuokY7BZAa6Lfk8/QIYN0BWYprnpOIAxR/9/5pPINqoMJVLqYVgonyool46DnU7Su8J4Mhr2ko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0pv18eDddJJ0+8CgQAy/Tb1Nmix686YxgFHX/T18BgIb2weha
	Mr2JHBnwsA62aDjTErvctdS4CQuum2Z5tkL/sD/Z2IqGlWoZFc1IRiMEaPXZadk4
X-Gm-Gg: ASbGncvF//cCIgXapnQTkxCMubP3E4EvQuCX2e6QFJ12UjFYIcLRG6/3OBLGOq8xy2s
	dkdPAwWiS9JmfHj3J76qPQqz9qVeJD6JhThdse95IxFzw46aO82bTV+XGWj58DFRHQNdVvB3fPt
	y2QXbCI19kYOyfvLtQAvCsI3G0W7ak0lof1grXLTGuqu4rmqUgFZQBlU7/yTzFnrjXEn1BX5TMY
	KPHabsZ3gFTjfZvxIwPNlwlwNAXpdvel7Frikp6Oe5sIccr1V+41gYVaecHOUFoJllg/L8y+aw/
	BGJ3yG6C8h6f9LYOWLmwqOlol7HBmg4Xu+lHSegl9/BE8oMcSldAmjq9NMXDuNem86/g4/SHiQP
	n1/LWsC/qRteHgw==
X-Google-Smtp-Source: AGHT+IGhfSSx/FQtz45yoTXzGgleJm98RgxgTpenMFxS2Z6N0clfju7PjagGXadOQ3a2mHz52O8S5w==
X-Received: by 2002:a05:6122:7d0:b0:520:4996:7d2a with SMTP id 71dfb90a1353d-530e48ca509mr2686435e0c.10.1749212990923;
        Fri, 06 Jun 2025 05:29:50 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e63e4251sm1000242e0c.26.2025.06.06.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:29:50 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so716250137.0;
        Fri, 06 Jun 2025 05:29:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsZ3fwe68TxZdEgHgnakMZPHjYTQinTCZs8BWifr/TiDC3vEmouHIIAh8aWRYeFaZ+uZl7hTInnGurTjAS9oXSfBA=@vger.kernel.org, AJvYcCVzgy7ZIb/yNq9OIc2jU+n1H2cMzjt9PpVBwrWqc6ohOvnjQM+lXDdMgvdXvRCJXf4qBiQrAgbdOd8=@vger.kernel.org, AJvYcCXnRWD7I3fMm8hmV/YFeo4V2be01KUEGnQgEoOStRvmMc005KORx+B/mBI77m3NPfk2liW6a3Oy6srviOrw@vger.kernel.org
X-Received: by 2002:a05:6102:808a:b0:4e5:980a:d164 with SMTP id
 ada2fe7eead31-4e7726a12fdmr2694286137.0.1749212990462; Fri, 06 Jun 2025
 05:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528132558.167178-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528132558.167178-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 14:29:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAnXWbvHXgLDLVxPWiNgWxsNN5Vt0jXGdcCG6_dRphbg@mail.gmail.com>
X-Gm-Features: AX0GCFuPxJSj36WTA3iqYChcOwBqPHyk3xTsO7DLXF5cvYDJYarSbZFI5q1mA_A
Message-ID: <CAMuHMdWAnXWbvHXgLDLVxPWiNgWxsNN5Vt0jXGdcCG6_dRphbg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g056: Add clock and reset entries for USB2.0
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 28 May 2025 at 15:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for USB2.0.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

I couldn't review all details due to lack of the Additional Document,
but I assume it is the same as on RZ/V2H(P), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

