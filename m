Return-Path: <linux-renesas-soc+bounces-18417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B9ADC3AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A96BA3B5ED6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 07:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FBC28ECCB;
	Tue, 17 Jun 2025 07:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5228983D;
	Tue, 17 Jun 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146553; cv=none; b=H8W5B3/kI1sqmcMrLXXzKc/mg7T4rTjh5GRAfc0FtfMWhFfXbh8luKt2PPMPCxRZgQLG4Fvdnlgk7zOEWJYyNBfj1ITD0Gg+CBx9cASNnX9jUIafw4kYox8bYEFf89Qrb45CuZTvYqBDp1NSOoAFq3hBpFHdeiTHo5JI6OVQ4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146553; c=relaxed/simple;
	bh=yJjBc4ZpRECF2hf71qTiHIHrAAo2nQfZj5CEF6HuDu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jm/eLdjvrXnPE8xBRhSzoSHT1BrK8bd+UFXrxKqohliAvI9Qw6bTgTwbLPy1sdb4INfgagkzjd0+kdcfx01E2pH+BTxn1Ayain4gkA4Ln1X681AUMrGgpS7aK6JDG1zXfNY32kM+7r/+InnD8dGkHwtR7b9dBvfcx4Qg1MgRtpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e80ff08dd6so1574509137.1;
        Tue, 17 Jun 2025 00:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146549; x=1750751349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTm5y+PBdNYcyQdNoiO0mMLcIK5R2nxCJMVPA2QnTOc=;
        b=FcpO2fPOBCZVND52E4xcBihg5SaimcI6DzZjeL01I10HXqmSUO2EO+9LSHymSXDA2T
         ElpwvIL7lop0GF6YK/GYMULMJdVYDRvOSssBTRTyH62iAnCvPJDxiuSMCZy0MAj/AVif
         OnFr5ebuxXhrbfmWetMoBFoanh0SbPH/lmW4XaFGuMhDvOA35SVTzBEgqEF/xitYQR9u
         p1Krz0RjaRc+Tkp9YHrg5hiUx95LejPHr9Vw0AojhAJ0Tr8Kp2ptMM4z9b/yEEU/1rtA
         VaFhzVupBTtNJZd58rHLhn77WnClq6SaD5JmH92P9fZuno3A5NlUAJujP3VxnDOfabcM
         lF3A==
X-Forwarded-Encrypted: i=1; AJvYcCUkAQarRASAQU0wjAA8XMhjun9vOgklyznPaATVW3RYBnZltyaC0ZfC1YpL3iwq46uzEIM+G/iVVPXK@vger.kernel.org, AJvYcCWYlPt9NrCddbN6TRPwnmyblTHfi7vUC12Wmv9WlfOpGvpPzjyOTQf8nSGsWp63tx2v8nYfeoJkL+s9q6P4@vger.kernel.org, AJvYcCX9HsBmSne3crEfpGUTYxkq3TSrY4RbWyw7zCED6oWAMOsmEmtvu9VFVymoglwob6glJx58U5tvDJQCIoSbbZjjlLU=@vger.kernel.org, AJvYcCXBL/2NvwuTZ+4fVjXyJ2WHfV227MGuEJM6CHGpGw1Z+rBNivKLPevtjR1hozy3VUxh+MiKn4Q8ZK3xgoAP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5wV3596S1sV1vLrvy03TBEN3nj6m+RtQKfB5R3oHvPIRQQh2
	mv0Zgv1lKtPaXqNMAqxvxLKLMWu3C2ykOWXO/727aKmPZmkXYpsArjdmrCtxFZSl
X-Gm-Gg: ASbGncsldbKvF164g0bGuhQRy0WCumaW+gs/DKdz9qrXz4z9cPkqMwKWQ/4kOxrGMMG
	rldvRUezdOUi8J8AexDDeDlrKZWiZ0McDqtoC+VrMd4a5p/HeUdRT7o3u2VC0j/ccgm1NTLrCQD
	3BpPCT3XmRDM1aMW3oaJu+n0gZaEgoJXDuVg5JbNYyaRmKPYCVnxxaOAP7UjV3ts4Fj2RlsfsQE
	zNMejNOVJhCakiBbdYrQ5IomRf1jNUPsVbXQ01C7HzEXs8vL78HX7lx+4oFaR61i25SNmhyaiDR
	YYpQswSWiZKnGqB7ph46akcsG8utxCQYOTnQANH2/23t+2LXR2/aXqH8ut/kWpnWHzIoPycAssX
	IgBvmevtZk9qMxWYKbYRRVNZSRyXIdVcXkt4=
X-Google-Smtp-Source: AGHT+IGSPVCxTqn0jy3AeHGja7c+hfLTS1h/HxHwaXSmd33baZpr2Ofgmm6YtXdyQ6O1S9RxRLDTSA==
X-Received: by 2002:a05:6102:4421:b0:4dd:ab6c:7654 with SMTP id ada2fe7eead31-4e7f5e5f524mr9359031137.8.1750146549555;
        Tue, 17 Jun 2025 00:49:09 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e70c6449sm1531912137.22.2025.06.17.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:49:09 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e80ff08dd6so1574477137.1;
        Tue, 17 Jun 2025 00:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuu4hU0mTVVLx/r6c0K3UPTLtUGxFI9LR1JcN5CfpcfXPW5eCcZu5kH0oG1dUbsXlhxppSX8tp6oVtM0pD@vger.kernel.org, AJvYcCW4zakN4hUPxpkO0rGm3rgJ8fzSZKdVFGR4V8ykW+lIwl6CJEzgnJUtf8BkCF11V1KgL1IPLjGg/QTfO/w+@vger.kernel.org, AJvYcCWL3EJt/xxH3j64TpkAOlGM+eLTnYCpm6aKSOyYhKvgwxQ4aIz2RqKnWsO/OxfvvbswFOqNAdR14gy1@vger.kernel.org, AJvYcCX7+nw/Z8LApLxzhKEmzXMczJViSk67QSaPhsCFtSQgvHceH1xIWiDUApGfBtlWYFktdqAIKPiF1ngKyPJ28TcRqKQ=@vger.kernel.org
X-Received: by 2002:a05:6102:2d07:b0:4e7:dfc6:5cd8 with SMTP id
 ada2fe7eead31-4e977acc263mr764329137.8.1750146548618; Tue, 17 Jun 2025
 00:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250616213927.475921-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250616213927.475921-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:48:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsipthnXC_Wcmpq2d85TD_TE0wQsL1BLR8XmSkOjnxew@mail.gmail.com>
X-Gm-Features: AX0GCFsdIT17V50Fsikt0kwm_3QHKdq5Wz36JWJqBvpD7no44PEwh_bTd3t85As
Message-ID: <CAMuHMdXsipthnXC_Wcmpq2d85TD_TE0wQsL1BLR8XmSkOjnxew@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: serial: rsci: Update maintainer entry
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 23:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add myself as the maintainer for the Renesas RSCI device tree binding,
> as Thierry Bultel no longer works for Renesas.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

