Return-Path: <linux-renesas-soc+bounces-16651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC83AA75D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680F57B1186
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 15:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7288117A2ED;
	Fri,  2 May 2025 15:16:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA02566;
	Fri,  2 May 2025 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198991; cv=none; b=Wfb9JBsZJrPwA7wPtfzxABbWbg5Q0DUebP72Hm6rzoqmVySo+FuV9zPounTFDgbED3OMtopZH6d4LyBOvASxVKkVY7t8JcPS/IvJeEEIEtkmDJ3aM0iq2rto1NsEM1z/lhy0vu3OQyJfSAz71tSmrEqC+K5d7XP9cKcWkXJYRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198991; c=relaxed/simple;
	bh=MYKwIW4ii66kqqivzxqGKw4hsC4aS8QCVXkRotLBCXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fa0sMugC85GNSfLuE9MTV1RSdmJNwjvsKbvMFA3SdrbTkXu1aprqp5RXDAIAzsgN1Ehnh7QnqamVosnZqTSiorzB6FgJrmlK7HMU2fUE3su+GK7oKG7HnEnrgr72+J5vIMp/y5PylqWlPp+bXFLtvK4Gw2U9gH6ZKEqhdN8rvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47677b77725so26971651cf.3;
        Fri, 02 May 2025 08:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198987; x=1746803787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYuT0Y8Dr244yQMpf5DoOWLTHV02NSRd4xx0AE8mam8=;
        b=UHiHZU7428ZCrei5GwMcd62BZSh69cno7hY5sOjgJNx38m/sb0I6b0m4P9yFzuq8ax
         AJz0UBeqJrEaw+5MFr/OxwLd92qtU4CI11dtmz9XrH0toycXT9R3UqEUnt0JgbJ12eAf
         VwdQ7cxKWfu8f/MvOqNACzYqnptNVE68elSp0b9DVi0cq/N/UMq/j32Ip/dpx5U1NijH
         40o+s/g+vEN7///jE97AMnGPMMfzwV5gaBkOo0NfVXiFzx+vILY/bl42kRTr8Mwy3mdN
         uaghqYyUs1OjTpDV8DtC532sR1TIOn6CDXa2rosR8Ze+hc83NEsJgFO2FovaQS3Nvn8R
         Lvsg==
X-Forwarded-Encrypted: i=1; AJvYcCVl2yWMiukGHbkuWcVe642tSkn6k++zLS+P48xhANbAXoqj/ZE/7Qgkc/XBKVXphmGtz+Z7sJdFKDHsclw=@vger.kernel.org, AJvYcCWenkV8g3pblZsEx5Z2TsPFCJT7j/tZed7LdxiYzklyvFv0tASWXVf/QWSF3PE/xRJ90cMCfLv1hvG6kVkW9DsJUTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTZLJbQedDjBUAU6VCPCtPhcBpYX2qTYol8QRubfmhVoa/UxHQ
	nVLtZMPXNL9d3WxFGUmLQDlDXUfvWYYKGy6THl5mwtKCnWflJyoHjDp6Nw5Q
X-Gm-Gg: ASbGnctrSXTttzv1jnozG+8pk+n+Fqh7k6mgice8ODmdpDYwwr40Ed2vrg092GMn0v1
	ueJBI/LTqrXvP1WYGuCLBhqRAT1UpWGAHAeDenxX5FszyBSj3GwOoTGoR9wAXnEbL5gTGL1cK2v
	8yOA0WkGojRFEl5qM7QPLdznaicx43PL71r2zxAU0zlMx8LLU5u3BWzqLdR75iEAMCp00db6pSt
	LQMbgJxNEIc7koOQ3IQvdCSnYIuxjTdgPWqLCH4JnOtLXM+NZ1eNtY7OCxrJS8mk79qgdVuCRLI
	YmFGWfdd9s0nTiObl/zdhshd/QHStuNraEHQfVWNTeeQmDRG7i8ERBKP64Oxg3Hjo5hGYENzOjw
	4Vt901oQ=
X-Google-Smtp-Source: AGHT+IHkpv+n4CVzRvCtQ5pMpe/zwO8rwSltiBd6wH3OXh+PZqz/601DXHd6bXAZ4JX/GPIDZCO1ng==
X-Received: by 2002:a05:622a:2b4b:b0:476:9e90:101d with SMTP id d75a77b69052e-48c32ac95efmr56067131cf.38.1746198987490;
        Fri, 02 May 2025 08:16:27 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b966c8007sm19189921cf.18.2025.05.02.08.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:16:27 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5b8d13f73so268774685a.0;
        Fri, 02 May 2025 08:16:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBFITz6xdsnap7aQPFF81QyejBUVxeNaUQWupLZBLO07qo7Q5hUTxYz0Z9RFyVsqorvRnMjbYfyaxNwH4=@vger.kernel.org, AJvYcCXq7DmRpi4+TEAqo7vYquTG9Whhlrfvs8PFdBgeT/wyYmznZUzh08VZF7zJ9Aogv8ykGheJQO8dyKrnMLsscCEKxmk=@vger.kernel.org
X-Received: by 2002:a05:620a:4505:b0:7c5:d1b2:166b with SMTP id
 af79cd13be357-7cad5b23d93mr540185985a.8.1746198986798; Fri, 02 May 2025
 08:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404080045.367845-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20250404080045.367845-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:16:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWg-MBH-3rThZeb=dXgaegvsDk86PhR4fTWkvmvyrd3tg@mail.gmail.com>
X-Gm-Features: ATxdqUEBL5d0NldxcsKp49t-4T7zEkCedlXK0CPN-aqdZN49PjJn54GCq01w5FA
Message-ID: <CAMuHMdWg-MBH-3rThZeb=dXgaegvsDk86PhR4fTWkvmvyrd3tg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 at 10:00, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> Triggered by noticing that the pwm-rcar driver isn't covered by the
> Renesas maintainer entry, add this driver to it. Instead of adding it
> explicitly, just add a file regex for "rcar" (and drop the one entry
> that gets redundant by that).
>
> Looking at the output of
>
>         $ git ls-files | grep rcar
>
> only shows files related to that architecture, so no X: line is
> currently needed.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

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

