Return-Path: <linux-renesas-soc+bounces-19309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075AAAFB0C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EFA23B6F89
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42141290BCD;
	Mon,  7 Jul 2025 10:08:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11AE288CA2;
	Mon,  7 Jul 2025 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882929; cv=none; b=FEZSGzC0Xy9mBMLETe/0JIPGMgfYqI1EKOCdYnZGoFOZqdII/aDQCYoG354F0Fv81ZhbqNpudusYmyiyEMJURm99rbjzL8ilGuz97cTNMc6VH5IEUT40fdQ0a5ow3rvriw5/9QqJkDsPTG/jYY3jiOFnirIuIuzBYHMhgcAkIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882929; c=relaxed/simple;
	bh=M7wabJOYeEFYdcGzXwo9L3S7QpLBsXP2w5nnmZsXRA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/q0pKZwpf+WWr3VjTbnQSFVHV2NzwLhqhqL30BKK099wQhAyrC6lINZu6LMmRtSFCDEbtMLaqbQojRwKIBBAv43pk+2li+t+NUaj/AwDArDyi+0l0PTB5uD+xZDXjJmh2G8GJdakdfiz5SipbNcpyDJaI+nDS4nDjEPnxgUyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5314d78e74fso942432e0c.3;
        Mon, 07 Jul 2025 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882926; x=1752487726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEE7LsEuzsjlHpRv/aMmBqg48cddn8MmPxcsHcoqk3k=;
        b=HPlGSTqjVwYQlC1Ug6R4r6aWFXYBq1v0rprBWPopdMaPldmM4VHtwSTT/qaY6j3KsA
         D5oWqoAzcEHsHq+jq2JEI7m0Hge063yzyxPWYfJ3YBD2v42Gkec4IVv94qb0H26mFXgy
         82h3w3vfm3C2OZ47//PfoHGT30snhferW4pTQj/f9KQQUGuN1tIjJO2TsnZD5eW5jyFt
         d8SAQR03FS6G9AS/FUqpJDQqZlpuBefcVO0/djdK5ihVqOu24hE5UTdU1bTaP0w3hXzz
         AViQ332CWZUCrEoBwVf5YJlQRgi5jtj3C1DgOEEImpcF88ATc6NRNyCqwJeNAB+tjc4W
         kqZA==
X-Forwarded-Encrypted: i=1; AJvYcCUfXSp6P8Y6jmd9K6ci3vLM+nosOh0tOxpWU4DWsz2bBP6QEpGYfXqfsP++u8JI/TnZjD6K4erpVincJmRD@vger.kernel.org, AJvYcCVfG0YJ8OeCJwfEgbsF10VrzVx6T8ndat05vG5JTFhKk7EybkRK7AFUcgATLN5aFTT+oKNbfRQB0eVREZ16l8n6lgo=@vger.kernel.org, AJvYcCWBXDbjDiZg7ZptpLOLNNMLxEHLk1XaH5EU0OBZyxXQJHRzv4gra+a+ij8yB5rWxz5b8kRrYpppOjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkJ3hAswAT2EV4Oakm2Q11k26MAkjsHlIDinkwUIcV3IVjwiq
	YsflV5Ka+wRzyhu3ybLwfZN/nz10daeu/GB3emIhl+S5hP4X+RaRs0EIrS7zTXLo
X-Gm-Gg: ASbGnct8ooYaRfTkV8YF7FtkZSxYryljr6zOTmAldz1pB/76Ztd3BFf2+BV376taGPS
	PEYfE/gDFQvL8vZqMyMXA45n4BCH3PXeVaNlgo8bo+1OS+O0UaVkPto10mtNRLr0eycebSvgTqr
	IxFJyihVsPHcGo+6Ci3Y7dE7d5N8P2eC0alzjcCRPO2bPzc3PpBedL9U+N9Ei/dHONim64JAROy
	gBgKD03Uj7FS6qC/GOU+UoDHGg5qa4517eLojif/rKzfWOaGJSdMuJSjsJbhr6vWTxS8gAYSSaH
	GRbQGPVt/SGzZfhjj0tulK91x2dIbwZtoAcYI05ZGiT6eXt0re254jPL6fzmeEKJ2ykwPtslyn3
	7FHA6HbxlnDiaNwh/VbWbUOyW
X-Google-Smtp-Source: AGHT+IH+2ILCJPgAnLyRHIkPf+P+pmqF5oAekv/k/3enIYvGwMgCKtXVFdWRSqnel2msMc99LKrvVg==
X-Received: by 2002:a05:6102:3708:b0:4e7:bf04:412e with SMTP id ada2fe7eead31-4f2f19909a7mr6696812137.0.1751882926021;
        Mon, 07 Jul 2025 03:08:46 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea541f7csm1091387137.8.2025.07.07.03.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 03:08:45 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8815049d0a8so904922241.2;
        Mon, 07 Jul 2025 03:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtShm3pfxR67RSS+oK+84P+krujAwPSS38sZh7Ks9/7YrNDynkW5IXPKmFq62K0C5tCzjxtllsWjlp/ElakXtb8jU=@vger.kernel.org, AJvYcCXrJ4lcj0AdoVfiSEf5zLuAkE+dxpPgqMAg5+Jh79f6Zq0LolA/mtwuhXE7pzaZEuqWU55N8GdS+V3Hrplx@vger.kernel.org, AJvYcCXxectUB2lZ17pKF5LVqttuxv3AMs3+h6KSIN/8cnOdbsMvzydPCblk6pTiwG6GHU9rUsv9z5uQE08=@vger.kernel.org
X-Received: by 2002:a05:6102:5a85:b0:4e5:9323:d2b9 with SMTP id
 ada2fe7eead31-4f2f1dbe7abmr6756499137.2.1751882925371; Mon, 07 Jul 2025
 03:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com> <20250704134328.3614317-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250704134328.3614317-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 12:08:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyMG9TGVyXa2EcDSuSpMzYK9UiLDqB3bap95u5fCWfAQ@mail.gmail.com>
X-Gm-Features: Ac12FXwrsPyJ9_3hxwPxkkb02TBHHYqK6wuBOagDK7JGzkG2YVl8M7Djfx0lJX8
Message-ID: <CAMuHMdWyMG9TGVyXa2EcDSuSpMzYK9UiLDqB3bap95u5fCWfAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a08g045: Add MSTOP for coupled clocks
 as well
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 15:43, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> If MSTOP is not added for both clocks in a coupled pair, and the clocks
> are not disabled in the reverse order of their enable sequence, the MSTOP
> may remain enabled when disabling the clocks.
>
> This happens because rzg2l_mod_clock_endisable() executes for coupled
> clocks only when a single clock from the pair is enabled. If one clock has
> no MSTOP defined, it can result in the MSTOP configuration being left
> active when the clocks are disabled out of order (i.e., not in the reverse
> order of enabling).
>
> Fixes: c49695952746 ("clk: renesas: r9a08g045: Drop power domain instantiation")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

