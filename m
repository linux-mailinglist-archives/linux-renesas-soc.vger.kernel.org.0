Return-Path: <linux-renesas-soc+bounces-15927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3EEA88686
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 844BE7A1D6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6B725394A;
	Mon, 14 Apr 2025 15:10:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41CF23D2BD;
	Mon, 14 Apr 2025 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643434; cv=none; b=Xh9XfarNpnDYWzUhBFPn9KEtSXV++qgCa6xYoCsgOiMZZX/FQXtsQUHQ4VDcaBmfmWXOvkTCifrLfDkSFaPeieYomjiWhkU96K0rkm6kLkeI7lFlDbx7OHKrXTV4k7Ou1ABXAAE6uAFj0LWU7753V6n+YaSZIbQb1ynV9r/GjjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643434; c=relaxed/simple;
	bh=A6wYZvmNv7IurOuhumfz2gWbRi0VwA2dOLeVCDoHw3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6bw9gr6A8h5b+Vw8BOeLBgkWmRRgG2KaJbipV3Bxl7xvzz6siqKS2YjSpyq4loUDo4ch4iBkH0oS6WHHNClCwAVTG+EsS1mCl6QTLu2Ji6F6p/X9KIYOdDv+rQPGPaoaUMT0ArDnozqB6iLIEBL6I8LS0lFjUtSHW7+TOarlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476b4c9faa2so55897371cf.3;
        Mon, 14 Apr 2025 08:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643430; x=1745248230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+jBlQKFsm9+pV050yK2EB2goYSQpoqN8pn78+k9vqY=;
        b=kRuZIAVcyyqdoSQRZAWdYjYSq26gEjDZgKu/UjtJQq7zXKSX176S8pI7osKKjlctaY
         yc/nT5j0WA81zuR8P/uxx9fV3ysH/6aUmw+y89NFaL+N+VXYChMBsWrpNe0LzMZSIGuB
         BNXjnDjqy7WfIlRvX3tX3vc327+cP78M2LLypsinidqICbmq9Z7Y8x/3Dzm7QXiRkv3H
         8BRvpIVxMHGi7PubryXm7bN3na5u4Hq1e+du//449Yg07w+wWJ4eD00jCnp4WEKUZw+w
         tmmBDdWKEq/jROUNc6GmH1q6TyD3CRS62VUh0y4btBKQM1JWv0fD4ZaKA37PKNGKekm2
         RU0A==
X-Forwarded-Encrypted: i=1; AJvYcCXMQx5eor5Fnec/Ggow/bxSNcZPsyxiwgWuuX1osfhe5IPDTSutIfh0YC8mGb9CS3I/0nzws+DcBCk=@vger.kernel.org, AJvYcCXpZCUtOEexpiw18y6hB2XxvUSQFvwkR8y/Sm9dj8kgEak6+NMx4FndFTTBNq1yLqueb5xHmpFqZdJJKC22kr9EaX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvjbzd9DC6Doark7KKPanBoPup6kluHqhqNl0jPO11vusDI56
	sz3z6kx3WOF3YkZwFOCY8/Zin4Y234VRkeRGBOc88mJS+BGc06O4U+hy4w5Z
X-Gm-Gg: ASbGnct09jwwcbqEax958Ac15jQHmPgbQWaaKMORXtH9Vu9zxRMa6s4DU32IYXEH6FB
	MSwD+HpAbEk+yuDHpbphJ8peK6T1vJpxcxoea1RxTTiIPtwpwgT2Gq9tvQxObYmh5FQtJBDVIaT
	6yJqxzykHUrRHcGw5TQadKkgn4+6tLxfu9MPV59USHcBhIfzJ7O0Xh34/7B6wDbePw+P3hT3XdF
	/sbiQRomoLcNifA4PSEPCLA77qzdr0kDh3ZEpdo56ssS2LxjDk9b2NsItLcbvESFAg6whvSzZRK
	xcXyQH5h9dfTxKCtqQzHWiW80Y4eaTaB9l6v5GTjcYnIVkejijqSs7d+NT0EhbrgGm1r+qGjukf
	sUpiSwO0=
X-Google-Smtp-Source: AGHT+IGUqaqwKMSPrGaBmQWwUBXR9rhSIeeBHENvKl9eoRa1LVX3Fr+MbeO34+RStyKbkUIbokWwGA==
X-Received: by 2002:ac8:7dcf:0:b0:476:67d8:930e with SMTP id d75a77b69052e-479775cccaamr219832191cf.34.1744643430339;
        Mon, 14 Apr 2025 08:10:30 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2ce5fsm78076041cf.43.2025.04.14.08.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:10:29 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c592764e54so548033585a.3;
        Mon, 14 Apr 2025 08:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQXyuViAA3C4nroel2dZ279nur5x1EX4d+kyKdkAKwl3FXBr3hLUmubYut3/HR30VF5dQqI6jFfBQwdHcGIKK2fIU=@vger.kernel.org, AJvYcCWsblPjWG3h4Xd3+QcGKfj731RXLVcz6Iyvj5aLGKD91DkkicmOCgb5Lmuvyo+AN5+JbQ8gT3YLoIY=@vger.kernel.org
X-Received: by 2002:a05:620a:44c7:b0:7c5:50cc:51b3 with SMTP id
 af79cd13be357-7c7af11e446mr1818097885a.33.1744643429373; Mon, 14 Apr 2025
 08:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320093107.36784-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250320093107.36784-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 17:10:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdWaOP1F4Pc6MD-C79SSx6TXVvOKGvog=wmyiuASeTKg@mail.gmail.com>
X-Gm-Features: ATxdqUGTczSwBAWHHhVfn4J3qSO2-wfL3G8zFU7YaICT9E_VacoCkVHgyu_MCXc
Message-ID: <CAMuHMdVdWaOP1F4Pc6MD-C79SSx6TXVvOKGvog=wmyiuASeTKg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Fix a typo
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Mar 2025 at 10:31, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix a typo montor->monitor in kernel-doc comment.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

