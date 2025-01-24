Return-Path: <linux-renesas-soc+bounces-12479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE55A1B7E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDCCA1679C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB2C12C484;
	Fri, 24 Jan 2025 14:28:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464378F4E;
	Fri, 24 Jan 2025 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728907; cv=none; b=p1f4x7sJ2WHsp7G0pn2Jlyttnyj5fpeXYbpp/pzTFWOQyG6VdeAHqbpu3YNaArC6v09ff4veN1RcHDee7hGK6SNHUkhx7DLMfH2c5HbLr1xG+LnBmpID/+/0WQvUL0Bx19O4t1KiXxhuwniPbTcRdMba3F/4ThdYvWAZ+vCx+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728907; c=relaxed/simple;
	bh=1bNvBA3VIFA9Pmc5f1nYPc343BJoKnsfSeExW9DH95Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHDY/Hv5DrynkpwFBd3UwJlWIG4ufWCPvjxjko92BjbYNEDJyJ5g+iODnmLoAQeIitt1J7sDYihrgiR4DoZctEpD9Wl/7ie+gQcAADB+MSLavMcOHovNAe2lK4jHbYdeMeRjvaXMCJcBlm9qdm63phNrSNYjbfN4aznKykfdd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afeccfeda2so1197084137.1;
        Fri, 24 Jan 2025 06:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728904; x=1738333704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f80Wzt+C7da5n0Wkf0bUKJR8arPqx9+zMTHT9w/x7FA=;
        b=mzBo5kEEW/lc2aXIxNu8Si9IIg+1lRpGwCuxGcV40DOt+EbgZ0945oegUx1bVMxj3J
         KLIM13Qq/HWf2/OwcUNo09XLx8qednv/n96LHOUL42cc+0E30RiHtdr0ZAxwJ0dlXWq5
         LIxps2y8DoAcOK7PS0anXjWJY0nyx1YA3Pkxtd8ZvdS8lEbVPGcAXksj25KZ4oReZbnY
         FcoQR/DruWw99gcZlQKPj6bDkonBO/+mBN1Hxr8Wr7oOZJTkHNHPZacs86hat6zWajTY
         9f96HgL4j4zO3nsHBMNLvTqFb4HdlmiAFfe3b0BB6aIH3a35YbASuCoZlfbjCKtTQ1Ax
         HSyw==
X-Forwarded-Encrypted: i=1; AJvYcCU1u2DrQbtEYmJbhztJ+bJSqWIGJvhZhY1iglb+C9rL7ycEdFdkq11u76tFRtoY8OvubYhGvk3JG/VFAREJ@vger.kernel.org, AJvYcCVSALrAKRwGgFx4IQo/WAKSEHl9OivV7C7gQG+PtFuFBP0jhqVEWF/XozLKRfT+DT3UWHodNk0TfoOjhEabkHntRnA=@vger.kernel.org, AJvYcCXSdEdLlkHHz9cApKXEjsgv2igTi42174JcZtXSUyWbI2qrZmPgKSk1pqoiywnZMQN3A+lC5+Kfo6VQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqL391YTsYXO2s3ihiUyrnzycnTb2WuCKv8JtHHwdyGq8poe02
	GB9YZMUhk0KULIm+05CEDJsmZ5WtBSJwCb3vTcPZkO0dJARssbYlpWzYtwD8
X-Gm-Gg: ASbGncsjmqyPVl7iMcyaNOl/J6FMaQrJaQmbksBKuUGkmN489JkvdIdeAvl3cLU7gLE
	2dkfOewnJHGc5u5cTAyRC1gqodFfqyTgBPh6QSkED1R0BcjMKdW53KzJuzG4ixdYiIs/1ck64Px
	5mwue/dYUJVK7DthWeO2ioBiHecD7QAkEOXvK+cDXHQzuL3gd0W2+2F+uss7no5GTPAsFZHec+a
	7ZZ+mfIZUsx2H2EJnnn2iHkbLZsUnmnAZQnFmMQFqozNrEAHoyd8mPSHIgbDncsJbQGNcUiZHiD
	SDRRc2CKi1eY13xpBzyHvNbH7lgEEhiOSOMIxnyXFu5wb6M=
X-Google-Smtp-Source: AGHT+IFq3BhC9xlDK/yTmfR2P8xEgf8jWBR6S1sTnHl0KM3tDFK+qi5guKYAUV10KvvOwh+nvN2MEw==
X-Received: by 2002:a05:6102:370a:b0:4af:de39:8daa with SMTP id ada2fe7eead31-4b690b7ca31mr22551686137.4.1737728903905;
        Fri, 24 Jan 2025 06:28:23 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c98e0esm423683241.34.2025.01.24.06.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:28:23 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51619b06a1cso1270597e0c.3;
        Fri, 24 Jan 2025 06:28:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgX/IS5HYrSmFGFZm1GctsMLicdxBpmK7PnO1f4/s5deG7qwIG7GYnROjFIqCTVkcAkWsevQT9ZweMXcyH@vger.kernel.org, AJvYcCW9BLKmtM85j8tFQ8VzurCcNuuesYWXf/GdpQTD+1iSiEccGTak1mM0QZxhpt3RW5bDtI2/XO7JAuT+M9cfMWWvqKI=@vger.kernel.org, AJvYcCWHhMOgCBc9nGR/5/slOpmOM7H2Rg2UcP28SvywOFNCE1uvOupMUn6E5FbwYeJuYvHSSI5j5dTIKTDG@vger.kernel.org
X-Received: by 2002:a05:6122:d91:b0:510:3a9:bb87 with SMTP id
 71dfb90a1353d-51d592b421amr23225906e0c.1.1737728903128; Fri, 24 Jan 2025
 06:28:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-7-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-7-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:28:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXw_PGnBLYm7sHLffCpN=og58kOsG1o+nZAK_cJQmkHLg@mail.gmail.com>
X-Gm-Features: AWEUYZkpTwRqRVj6DIDEQ89dIst5jaJIth6HjwjEYZ05_K-L_Pv0q1QLnxzow58
Message-ID: <CAMuHMdXw_PGnBLYm7sHLffCpN=og58kOsG1o+nZAK_cJQmkHLg@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] soc: renesas: rzv2h: Add a callback to print
 SoC-specific extra features
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 6:05=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Some RZ/V2H SoC variants feature a Mali-G31 (GPU) and/or a Mali-C55 (ISP)
> IP(s). Detect and inform about their presence during SoC identification.
> Also detect PLL frequency and warn in case of mismatch.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

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

