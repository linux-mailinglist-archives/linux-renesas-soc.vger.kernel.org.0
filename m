Return-Path: <linux-renesas-soc+bounces-15144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21231A76587
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754783AA09F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9439413B59B;
	Mon, 31 Mar 2025 12:15:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A691E1A08
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423314; cv=none; b=c7002DESqwOmnlK14PyePGsT4oR1AXwNV47Sh3y8mDrqhWjL5LKf94MXDwxW2gZhWgYeUWufyTIC5vBuloz+wGAk7wGZzuZHWsIbyoDGGzYim01N1LDDGyE+AkTyoIojO14oE5e+PwYsu5k8pH8sdkMDKVsA8jtEMEmJZ8wjVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423314; c=relaxed/simple;
	bh=f88wQ072wdncfzXTluKkCwX0ij2C886h2sJZCJuizV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Adtqy6e+RSBBZlBcNCGGj6N6EsWjoQEXGHX2ukhqA0hbeuQAapEsdK3C/NOV3cADelENsnHNrPcjWY5A6NWlvwvRyimt5lrtfk838YzrIVhWPJp/V62XSbBGLuO1LdeltFpvF91E2B+uOOJr0jco9Ju0EbBoBlCsQZqkIrU2NTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523d8c024dfso1774392e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423311; x=1744028111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz3Cfxb1NqLIfRp2K1v0IDUCdf2lv2t/Wk4sbsgvAZ4=;
        b=Gwp3gQ8bRGptyNhrcG8it5Vaa58EQeLarjOTDDHbji5NpVfnfq6s7HtBRUuwpDZq5n
         eabKRHLKZJOGzyEJWRuQnuGdgxDP/JhwCBJTlDHBI1XpIfPbhKMNchTsH2SgW/wlIgJy
         G1EwrtctiqBUaBYbKCQ/vDCxJAn+vLtYf25C6eIMqbRi6x+2f1Fujdm0JnmUl9C0GHZh
         YRhyyyTaPHQhs9Lb4tMBey5kg7/a2n8IA0bs9WmPu8rmQm+9yDB3eqVukZ7eQhvMr7bY
         P7YEt9nHa36eC5wJwI5UveIF4dLC8n528ELNTJr1TuyRFjDPjWF4AoPSOeGbodBOfzFf
         B4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV++GcmDfq31EWsqk3QVHakS8sWtkXrPRwN4gXHB09kIqKd8vTodjyJfdwAgqrFnFe8w0gzMZEQiEZWqbC1HZRgAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW3B+1ajdt+SNIOQPNbDfbJlnKSmtfixq8i5BRfXTyQuFhF7mf
	Loq3dXbe1KgXea7q3c7Sl7gUmno5J0JXzJ/c6f2p4O7uSgCl0E/2+PkIwE6U
X-Gm-Gg: ASbGnctwSTpYqGunJaIWwdQG+0MBMhGiid3JtJBOvMJXLnHZwNK31AzRsaPviZOMzY+
	XGWq3FWiuETRepbzX1fSOw/CkojiLrGq0rCD14r09QKN/4y6tfh2Bn14JwvE+u/HqCXSYcujLpf
	eGJ3mbxvyb6gU2TE0XvN3SYM3UKSHGDd0n3Esbuai9kYcgal7g1GB9galztvWs/hXRHLOfpyzmK
	Oc6V6QD2rH2UrCluxth8y4fspdgBnMCpimQCqjFxDYxPMkXiPAbSrKm1mSfSS6ABAZBecFw5dUu
	ogHDXQriXAf+EFathevBkJ3qcUbVXxg5EVD0lKhSqjaXV/5ZSBo2MItS4kja3LmLI1Gc9tNUFvc
	GYKjTDmb31VMzRM2qdw==
X-Google-Smtp-Source: AGHT+IEJ9ggUbllFozvozGCnP0TkzQYxn4cSgK1s9EcrTuSG6zy6G7pefRcZVmzHw/Z3gEP9o6GTAQ==
X-Received: by 2002:a05:6102:3f4d:b0:4bb:e14a:944b with SMTP id ada2fe7eead31-4c6d398d1e1mr4731800137.20.1743423310918;
        Mon, 31 Mar 2025 05:15:10 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a33b141fsm1533097241.28.2025.03.31.05.15.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:15:10 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so1633788241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:15:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOBjG73gGSNPVhT8eima30zis+nfxxskWK2YNc9GIIHyCpRxJ5EPrMad/dzYL86BoKHcVNuQEKPLgHZq80p9fquA==@vger.kernel.org
X-Received: by 2002:a05:6102:80a7:b0:4c1:774b:3f7a with SMTP id
 ada2fe7eead31-4c6d39852b6mr5066739137.16.1743423310270; Mon, 31 Mar 2025
 05:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:14:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2oQviwGwAGMCpNgVovsH-+yQkwkDQimXBaTY4d76zdw@mail.gmail.com>
X-Gm-Features: AQ5f1JrwCmKI4qcwjvH7w_Cyd1BJkIvy2P13HSPZqIDBlhkHE-XrJhQrh98s-Io
Message-ID: <CAMuHMdW2oQviwGwAGMCpNgVovsH-+yQkwkDQimXBaTY4d76zdw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] memory: renesas-rpc-if: Move rpcif_info
 definitions near to the user
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move rpcif_info definitions near to the user.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

