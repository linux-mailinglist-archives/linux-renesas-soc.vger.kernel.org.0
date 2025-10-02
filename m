Return-Path: <linux-renesas-soc+bounces-22583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C72BB3E9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FAB73C156B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355B0310625;
	Thu,  2 Oct 2025 12:40:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B522EE5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408802; cv=none; b=Yk+n9uJ1lfMCquFiZv1UtRoPvThpiTsiZKkB+HxUtfbuynC0mUVugOu50uA8ENIuKyLMbeRci4Jqdc5FvYCXyDOPeTQJOj9tT3VdqOGwFlfvbZct7X06yzaLj10YMJRp8Mytinn2MXQhAp2hOkqm1ni7nnCRF6AYuuuJT7aBBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408802; c=relaxed/simple;
	bh=7O8Q6H/V342Hk9kSuK7PF1mqEQCZDCjvYkaJgb/FMnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uou3dubJrsO1qdiND7qsPpa8Ow3lECFQRfHAAxg1noqObgYCryfY8T7vlCMu5Z6n6xnwbaxETqC72TqAzB05NmF0HuBDeFBj+QMJj9iPItpliVXKXRR1QgUkLi0OOgvcn9kAN65/ngmWovKwdbz4a/A47yCi32iBRs+euky8JKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso922427137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408799; x=1760013599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJG7Pi+JGjs1abvLn2qtglQhq0wRNhthICu3ohkXyqQ=;
        b=hFIuIdOG5aUOfMo2jpeNWOJqFx9DD/m8s03Erf5ZMAaleJxJT9MY6mElGG0Zp6+vPr
         Fkk6r2rI40Yzxcpwt5aKQMzvUWWbGfdLjrrSxj//tOZAffUTRQbVy3+BaPVqn14voVwI
         3DA1OktCDCJJUqYlTrbLl7cP03ZouSKUzNr9L13jJ+v9VMwVWOYzYiqzyvnr1QTmmY6H
         xHvyn81RKFhl6vbJvUQK6ELsyYdYrw9xIyKQ59pxfLOBRbfUAlvdWNXAnfiW+Ynx1UMH
         vSWlnBhSK4U7uKxAVnyFtrFqKTfrMKWV+YHIlIL7oxB0MXFZZUzi/Rf614QsxmP9pO+U
         pCrw==
X-Forwarded-Encrypted: i=1; AJvYcCUNTHuokfCoKXs+TYZt1ljo5KWA3R1yZHydWrubRmlUFhEWwEq9WK5mRiryXuCBWAEgDDpa3+8cpVceeLGxwrO2qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLKy1iji4LOMsPUavfrWvN4soWCUJyH3GF5491bcsv2v3bQMnE
	SSlv4RCnEQTb6H3Br2nHeWgHgG9bgftasWEH13g+Pz9tea8RcmwqI6ux48ynqGm1t+4=
X-Gm-Gg: ASbGnct29GJEdTjPYvdAISsvpuRJ3UXe0U4RPmfXQbHAlyFffbhwVUMdFIa1wf1CkU4
	v+8U8Z6u25GGUelzwpFdYNFzYg5Pj/Q0B1SF5Bpokzasr2KO7CyJKJ4QsFifEs+UElpvRJN0d0G
	44GMK0IxoAMPwVMXuPVvvtUiAxu2+p3O5Vga86Y+zX2tPIH0i+eRIHvIN+rMtYnYK1BxY7PQ/Va
	KWez+I2e/rvIfgc2O34euWqPg2xfeHaKl0js5LOaAchAdWdQ1lHMo3rdEDXGNyPbf4HjWQ4xTvf
	Rz1OD6MmEtxCEBHzIEzOnEKpS7Urz88ReHnS4DsqTkajnn8j9/oal0NS2MW2YX0vr/nivoLqAqG
	miBv8fjkKQcRQAC7ihacefeS1q0y8sTXCxapBWGQSJXCOKhD9S9KOg9PhGmtzJNvb/2KbBe1b5f
	56cqQs/fT1oTUYr3grFtE=
X-Google-Smtp-Source: AGHT+IEPLgiuJpaUEo17DBaTkFkoSbKCKcD7UzvHB+HLgORKKU/JehaEnqck2vmswhj8A6ZvW8mPOw==
X-Received: by 2002:a05:6102:390c:b0:529:b446:1749 with SMTP id ada2fe7eead31-5d3fe5260edmr3029016137.15.1759408799373;
        Thu, 02 Oct 2025 05:39:59 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4d83c19sm465345241.2.2025.10.02.05.39.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:39:58 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9000129f2bcso736066241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnT8ccAsG0BiR16klPODlGUgas8MaFlGAfAHtgif7J/XFk0xGNjnVOADhPS8yF/+eQeyoEYt2xzVU0fa/46G4Jgw==@vger.kernel.org
X-Received: by 2002:a05:6102:390c:b0:529:b446:1749 with SMTP id
 ada2fe7eead31-5d3fe5260edmr3028987137.15.1759408798147; Thu, 02 Oct 2025
 05:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:39:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1kbS-KvD0mFXHiApd7K6K1scm94WBg-84MQPtN__h3A@mail.gmail.com>
X-Gm-Features: AS18NWB_Zolx4Yi5Ewsp7mWBmwmwJ9vX5Skmzp6rXOAIB3SYIXAxIWXsQiZ4XoY
Message-ID: <CAMuHMdX1kbS-KvD0mFXHiApd7K6K1scm94WBg-84MQPtN__h3A@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] arm64: dts: renesas: rzt2h/rzn2h-evk: enable ADCs
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The ADCs on RZ/T2H and RZ/N2H are exposed on the evaluation kit boards.
>
> Enable them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

