Return-Path: <linux-renesas-soc+bounces-12698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D5A21FE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 704811881B33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41CB17BB21;
	Wed, 29 Jan 2025 15:01:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718D54C83;
	Wed, 29 Jan 2025 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162895; cv=none; b=HVSAx7PijNuBVoegWJT41X7+U5UYOjf01v8QAt88/i7cd4aVpD+PhwU1+l4D53ncZI+sNIfn3RgU82fx/MpoIryE4Hgd4AazEeD/vwxTqtMOGseKB6XdJlEhvRU4RoFKiPK/pPUrdnmVyjYt6sg6roXdR3H4sGGQZ9TCEXaZZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162895; c=relaxed/simple;
	bh=SiuwZjvJH3IubcmceofQKv3g7Kmc4kGfBx7M+Gd6WzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBskn0xuRnMwDC9K3/e2wmrNSHrziAmWaLcYQIMdIpWlnoLOyfb2yUYEOfD7fOc8HzzzMa1hqUpeL8+nENHapNwetbRsUNlghygZgI68xA0PA8LLr/R/M7UnV57jsAdSGNUJpQwOQu4AhD7bItMNnya2eX2pGZKmS3M1ca1Yakg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29e842cb9b4so2182670fac.2;
        Wed, 29 Jan 2025 07:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162892; x=1738767692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9NNp9sBV5eEE4H2/70jc62LviUVnpeG1pTsD5oZrgg=;
        b=Qt+yNkJ/K5JBIiJDZHaKYFlTXLa9//ms3ZbDsk75rm0A1Z2DP95wre3wJogVT4ue04
         jMuNA3M0V6kZ8CTeIe+mllxF19FaA/lKcejF19DtWH8QHbRCda/R5o6hb1csWYDfEhWe
         uw4ymQPuqyRPoYF6VEgUjAVxTu+A3mUAITR7jnTHz1SNDxS5wVgDNDIVWaKPjaxLgAS3
         sUxoYA9ynVP8ZeMYtdou91r5lWi6+OQcYtNNaF7Hu/WbomSnJseRBpY4I2pbOsQ3tmuc
         umBkXJJYOOVPm9oflqbouzVNh+Sbgttbbs6OssPu5SZZYlw5DNaILcy9UJWFH8QpjDAF
         bTOg==
X-Forwarded-Encrypted: i=1; AJvYcCUvTFDgkXA0LT4MiPqcy2RbKzpgExyp6JmA913lBl+eq0/znKMH64RN/0xBnV7X5gJEpSOGRYlZXURhPTw9xJ1XfPM=@vger.kernel.org, AJvYcCVfnUvWJGirlH/uv8ssfXWLchRic9Op8uVrGSx64Z49litfLbYDzw140PYLKg0gpuCusbDCNq2dAVq0@vger.kernel.org, AJvYcCXBvCkRY69CRUnzdt0ngMzg1oPsgqnPme/fRCRBGWwBC14Ei6oCoYrSeXhUWrfzqFqB5t6Vgdg91VFNWULi@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLkEOTxJQhjHWRH4HoRknmLRcER0bdrszFlh1MmAKpPYyqVcT
	EPVo0ZXDQUr4uV2P0vLvzRAnKVASRr7+kD0a7BdudLGTIL4YCZefev6eByQC
X-Gm-Gg: ASbGncvc7kO7eZLR3vcYGG93pEfbsvxT2+o/u8QgKwHBp0Syp9phNCV4mL9nXBa7DZ/
	cFp+T68qSnmER+e0uhYfd0+WmkCAETCHkSqdUsS+sE8GJ31WCInnBLUylnZz4kjdM8lN9C0IGAr
	vraHFu/5EpJMb74dm7p+fj6BxEUO3SImZ6l+KROLfcdmeBzYosOAdTgyuPpiYLjnG7yFIe/CPIE
	xeFphOvopN/xZpQx1OUMp915w1UmO3WEutItAhNQ3YQ0L/UnqrbXJSAzW2RVlVNRhndw62r12V+
	JTnxlSlZM8DRFlvH1HAk6LvLxNL3agLCP0Hw5B8rjrGE75VO5iVDZ4g9mw==
X-Google-Smtp-Source: AGHT+IEiPsRHVI8fUuwyTZCzZtlkD48WHHgkjCK+MyIbBfuzqgSrZ5Ah3RaIoGX6CCCvOXHpE0+eXA==
X-Received: by 2002:a05:6871:a0ca:b0:29e:3484:ae1d with SMTP id 586e51a60fabf-2b32f270745mr2009492fac.26.1738162892439;
        Wed, 29 Jan 2025 07:01:32 -0800 (PST)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-724ecf9a22asm3682176a34.57.2025.01.29.07.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:01:32 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1860080b6e.3;
        Wed, 29 Jan 2025 07:01:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1fVMnEf5uYoFy1EBMCraavIIAKpSn2ItKwe4hawZXwi8GcZvwtrKY6ALxKqvHsPThoVuHZpQtIp8Y@vger.kernel.org, AJvYcCU9310F5HsLPc7oe+h0AUY3p4rAw34WehaHBzgCJrPEO1XGfDzkri71Q4hDvaOs5w7gpS3LXsKgmYX0Gbuq@vger.kernel.org, AJvYcCUhqNVOrKA3zLk3RfF/mGlJaIIj/ejTfu/oUDpjx/Q29I2rQLluXazbseC1+DJevFzOklmmnXkJnfl9/wW/lu4GEMg=@vger.kernel.org
X-Received: by 2002:a05:6808:144e:b0:3eb:428b:fa5a with SMTP id
 5614622812f47-3f323baf4f2mr1690282b6e.37.1738162891347; Wed, 29 Jan 2025
 07:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com> <20250128031342.52675-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250128031342.52675-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 16:01:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9LctwQWMu0m6sfQ5xQYkhK38KEGg7VwWWYmbY71qk6A@mail.gmail.com>
X-Gm-Features: AWEUYZlotRWm_F4DnwEsqHdesmuRVA4I_wvX8bvnirrOGsfk2lEFddDuwaMaV0w
Message-ID: <CAMuHMdV9LctwQWMu0m6sfQ5xQYkhK38KEGg7VwWWYmbY71qk6A@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] soc: renesas: rz-sysc: Move RZ/V2H SoC detection
 to the SYS driver
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 04:14, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> As per the other SoC variant of the same family, the system controller
> provides SoC ID in its own registers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
>
> v5: Do not use common included file with RZ/G3E and set proper hex values for
>     register offset and mask definition

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

