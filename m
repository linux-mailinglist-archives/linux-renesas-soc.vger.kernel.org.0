Return-Path: <linux-renesas-soc+bounces-20053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5BFB1C875
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 17:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E4B3B3AA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 15:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D3B28FAB5;
	Wed,  6 Aug 2025 15:13:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90521D5146;
	Wed,  6 Aug 2025 15:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493209; cv=none; b=YpHoRWc66H/ZbKi2FoSAD7b1Y5hvIQTwyp2VhnMXAkum/0zp/SgsamCv7GEtFGNpEak9mlPZPEH6wMcxvom0ltTXtxNlF6/aOSwVL46+HDN3pioSZpUUuUMQ7j6jINjwvRZ2Jq5yHLvD5Nagdzw6DzpJtz0spm1bZjJVVoo71Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493209; c=relaxed/simple;
	bh=KQ6T1tqJTAFmw+hALCPyyDbSp/c3MEZxUWqEZgIRMIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4yjA2S48zAvUSTf6JsdIf7LSpOHVKYf+zNsc0tl/bf7ksm5wpcrf2mL0snAzCFDcYN/Di9I2ApiV8ULSxnebvrlPCUMQb6/LUtHPXPzVcDQB42y7RgBI7qvZmnX5Z0f/PeOfQd8LZlq+Yy1kYTSGW9AGqKSvCH2YLt7HQDEiV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-539425e3719so20072e0c.0;
        Wed, 06 Aug 2025 08:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493206; x=1755098006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ob+wZFgLLDZJ43IatvkYFPa2ZO5eiOMoVFYqdV+7TU0=;
        b=cYjYRUNoWbKsPxfiymXlgM1luasm4vdeltCMzvxCYxWRz0a4FMpdTSTS0zRFPp3Y9r
         Eug5/6jaaZ4sdkwq3QKQwIsx93Bl71ZJkZCha1AwPhIfOrKJRnreS+yl0mEXFNajz+lW
         ga1u4SJsPrp4OrhZG6psiC1OvCqc1Leg59ti6BeIwIUbYA7F3BopHq/gr49BNVso2fH2
         ihuCMN8Ij+0bgZxQHnSCzzPNl//vr95eqTzn2LtlYaEQxaf4emleLKmBwkFDrKsUcNna
         oKnc1v0fOIyUn1ccyq4fwkOFe5srX3sDSZ9PclgXc385eBxucSPtLPiqJtuAFBifMdK/
         gvZA==
X-Forwarded-Encrypted: i=1; AJvYcCW55yAIDqKQyaYd6zNlUK0NsibxskbJN9YQYOLaLPWCrtdrS0ynioxxhwt2Y1pqc988U6PpYBIG1qED@vger.kernel.org, AJvYcCWoGyFhNWyRVX62D+AORVa2L0B1ZY57drCsM7/ufms95F30PNBUagyseJ51sJb74mnGcDcK6UsYEWrMXZ1ibBQa5dA=@vger.kernel.org, AJvYcCXdwkoiyJBb09Hd3IAXdASOLXh1F9QoInorUdImBglR6dJBe1Qkns4RijWCsHSmEPTg+C4AcSOHcpKDZyRd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw73VL+xCidhC9feb2jmKi6MZ8whWCf9bOInaNvcOk77oEtAYzh
	t6HOjDmlYy1z/bdFqwWZduSarQX7j2/S+3rpEhsl1ZnyWXkMkIs+ETuWd4p9PLV+ap0=
X-Gm-Gg: ASbGncsI4TEJ+DX31ApZqnAjSfmwkXbS+NaQ2kkuYJ55wnEzj8MZnXyOyngW3WNMpTn
	i2pZ4IVlDGFPFCXYmI7Gi7Jy0p3R3gFnm4RpuPN6bNIe55n+Z16K5pPlymx3lUKxj+/hEuOcoMm
	e5+7J4TYhKYiirLz28EoLdan9a0wqKl5DpaXUhderuqvbIzGpMuqKaE5S8hnPVAueWD5e0oYn5V
	wB6C16IVwe8R1cuWpLUry5MUTXkdP2HbonJNobHZaVnstakQaYXDJ7Uhv0oCVreaaYO8uKUggjJ
	KUkEOkBAzwOY/ZuCBcwblvTkNSN6bmpk89JdvorHD9/wXjFhGZfDos82AUDFWoRJWgw264Dvo3A
	UIsY9f5kkvbquG7IhcutuoKGNeWmPstpd2MGcbAR7fM0CJXwxU6lQbUWBiaIE
X-Google-Smtp-Source: AGHT+IH7/bxOaH3EUtB1IWTa9qc0jzHV0w115HdqBS7KN5Xhu1xUH+jRLqBZo5BGchLHFNoPoLiBzQ==
X-Received: by 2002:a05:6122:920:b0:520:4806:a422 with SMTP id 71dfb90a1353d-539a04d8246mr1637619e0c.3.1754493206483;
        Wed, 06 Aug 2025 08:13:26 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b5909asm4265423e0c.8.2025.08.06.08.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:13:25 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4fe2e89d055so1037000137.0;
        Wed, 06 Aug 2025 08:13:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZn5lrC14HQCHWrnL2oPqW3jd+1Z4JrplPF379KLnGA5k2+WzgAaECkztYGjUWfGhxUqDvsaU+LC9i@vger.kernel.org, AJvYcCUp9HhKrF2C7pVlOHjub8bhVCVGY3pV9SrHraaiWNbHGHqu6rIH4G5OVBPMQHllI7Zy9u7GKZ/KrGAMZokH@vger.kernel.org, AJvYcCVg/boyKvgknHH9W9qf6gORbXPnP0IETGi7Q8g9u/ErHtthm8o+gM1ckw4QT5AFmIQShboGIaRqw1167F/whmEInA8=@vger.kernel.org
X-Received: by 2002:a05:6102:b10:b0:4f4:af8f:589b with SMTP id
 ada2fe7eead31-50369c4b172mr1682169137.10.1754493204657; Wed, 06 Aug 2025
 08:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806150448.9669-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250806150448.9669-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 17:13:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgEXmT4S8Xo_FE3QeBiBHvG4VmnfPGK461=Asj+ov+0w@mail.gmail.com>
X-Gm-Features: Ac12FXwQoExk4huWs_17rN7WL6louaDbB_hlfPguV1KepD9kIFWu1LusOmMdzc4
Message-ID: <CAMuHMdXgEXmT4S8Xo_FE3QeBiBHvG4VmnfPGK461=Asj+ov+0w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: Add boot phase tags marking to
 Renesas RZ/A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 17:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas RZ/A1 SoC.
>
> All SoC require BSC bus, PFC pin control and OSTM0 timer access during all
> stages of the boot process, those are marked using bootph-all property, and
> so is the SoC bus node which contains the PFC and OSTM IPs.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Drop blank newline arount bootph-all , move ostm bootph-all to board DTs

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

