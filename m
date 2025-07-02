Return-Path: <linux-renesas-soc+bounces-19032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E954AF1629
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 14:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 389373A5CB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 12:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63947275851;
	Wed,  2 Jul 2025 12:55:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E827465A;
	Wed,  2 Jul 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460918; cv=none; b=GFOXpAZtsN8/c1wTU5KdOgH4yRGGDaMjx9zw8+eMaKd3KmhX3YScsh058YOGfnK7NvnHYcJO5qsvUGHgAODWGKP4x1zlB4naWeomSyAK1tSkc9kT8ePWZr+eIwiEqT8ofb50Cs/IEIxvE9cChrtVkFIJN8mc1+LY97JoL40+8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460918; c=relaxed/simple;
	bh=4RMRk7+aVwR+3Qw5vc1Ge0MyIELEc9PS8LA/+Ea8jc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBs92xRnd2K1r4L+e9hHy7A7VK/qghT5+2W+pGO9FFtuYZWx0oMytX8CZPjUSilvi8vMtSnrxY3E8ZVUJ40Cijb7CZKHw8SDDPQr+fTkdIqPAZ9//G9bIUJIP0rWkol2gR55zlvuj5HjtkG9NIP1VV1PQGKifskHbPQnY0xlsi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-531466622beso2144042e0c.1;
        Wed, 02 Jul 2025 05:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460915; x=1752065715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7ECsAw6yB8tihJqn6f0QSOOmPwyyTIsWvoJ6n9vWgs=;
        b=lM7PkMjfIZ54SG+C67uykIS5xAgwa4Qm0TZxWx5uKwDKi+3OOzvH17cH4PdDKhGaaw
         y5kIcdKsiSIuWkoFuvXq3EQ9yLfKGa0ppKYrQb8lCSY/TNg84YeG3AZD3x+140r0N5o1
         vdDkGSjz2CAETjxFROGONozWBun6kAYhz20ocqGdyKyKaLWGz5Ej0emWEgsL3w2qBA7r
         LeWTDuTrxgQmVQf/pasfV2ewLLFgmt8fqRP4+8ROOUsKi0HIJ3F4kweP8YqixOVaGLXo
         fteicsqJTNH5uZ9R4AxbvfmxwAXSl3O0zkJApHnAD1mojVjA2Fbh/rnn7v844ne0ObL6
         Q+jA==
X-Forwarded-Encrypted: i=1; AJvYcCW609MiAIe9RFfdrsW+4c3WCqR3PPf/cAzxtwcXMLKK7cGdSp1AckuidUkTJ/eLhYUIclyhYSSjHnhyF6FJtMp6KLM=@vger.kernel.org, AJvYcCW67kj1JEAEGRiXSE85Gym5nksoJrcH/VHIGJUlr2Vn/E7CGQou0NkTi5Mnw+wq/asl8CD26MJ5HZ+5@vger.kernel.org, AJvYcCWe+3K/fKNZaeAu0miM9M0zvjolpnPlQ+MaUafkc/k31V0mK1TgaI8HI+d2qNU8rvTcwY0n7VYGIZqbtRUM@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhQiNOLsnjtJOwfOv+UpEP/zPRjcKTozCX7C63ODX7oYc/uRo
	pG1rirwooDfoyirKKJWJ8rmH6F8CoCyGZUi1s2e9dNM5bEsT9jnAL3e9wLgnuRoP
X-Gm-Gg: ASbGncs9EfRTRj+daCJoIua0oEPzkQyIarKZHJhOPVE9FGFzHX7mn6dPKI2dJmHJXIB
	QCaYUxOVLyFo8Bv5nKp8ktYBq4bPjNzdAP9aElfvKn3jaC2Kqe0VnpYYHaz+z1/PoE9qhT0oQnl
	IT9On/h1GwfWS0kBlznAhX6kIvvevvj1AqrzUHe8so1pUEvwBFb8RgS8ftBCyeauSwkuoQMmcs+
	xzR2ZF9oYWqTTcXmkDBf4cj1KoE5t4Wir6L+wLNMf+TUqWrywvs2VbX2xJ3Xg4isfqBNHK7WjKH
	8x+LuLuRUq1G5BdbbMfljhhlLZKNsEGKcRS414jB4jkGxK3oPRHHPNUMDFcyXKSFrXdQI+4IFYX
	fMu/3F76n/EBwS91rzlDo6Ncv
X-Google-Smtp-Source: AGHT+IEOZa61rOVXqWUImLBUueXdZ7FsJrWVa2PyZ3BfxDJAIJPFIRmop0rm7aoffoIRG2Y9rasRiQ==
X-Received: by 2002:a05:6122:7d3:b0:531:2906:751e with SMTP id 71dfb90a1353d-5345842cfadmr1652539e0c.8.1751460914878;
        Wed, 02 Jul 2025 05:55:14 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533090c46c0sm2112924e0c.19.2025.07.02.05.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:55:14 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso1574726241.2;
        Wed, 02 Jul 2025 05:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTAACNnnR+uYKz3sco/knX8WqT0Ck6jlqaVN9/y6er829Vf7IJj+YVEhInTX/0mnELJCJEyVoStncO+5Hk@vger.kernel.org, AJvYcCVnMlvNt9V8UiN0idA6B85DnsmYFSm1A4fAbmPjuDuOzoQBUxMBDPirqnGi/qvMIdAeQeSmJ8Q2xyMu@vger.kernel.org, AJvYcCWp9QtGIVcjVUmRjtv8yeY8N42UlHcDzkkrWW09xxx1NtVsqTPQw48Vc48KvZM4T50zYTDxsC308HEn0UBqZRifUHg=@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:4de:d08f:6727 with SMTP id
 ada2fe7eead31-4f1612b5345mr1087681137.13.1751460914346; Wed, 02 Jul 2025
 05:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702092755.70847-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250702092755.70847-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 14:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUp90=Mt5_NsEBWwy-JZJN+oBHwoYPmA8CORZiXt2Fk+A@mail.gmail.com>
X-Gm-Features: Ac12FXwam2Ru_p8NswoQrhU_Ll5UaQya1Z8AGYUKOu7OYX9gkB0z4zqCseLiccA
Message-ID: <CAMuHMdUp90=Mt5_NsEBWwy-JZJN+oBHwoYPmA8CORZiXt2Fk+A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 11:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> USER_SW3 and SLEEP button with NMI support. Add a DT node in device tree
> to instantiate the gpio-keys driver for these buttons.
>
> The system can enter into STR state by pressing the sleep button and
> wakeup from STR is done by pressing power button. The USER_SW{1,2,3}
> configured as wakeup-source, so it can wakeup the system during s2idle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added support for sleep button
>  * Dropped the extra spaces after the define keywords for KEY_*_GPIO.
>  * Dropped /delete-node/ keys as KEY_SLEEP will always present.
>  * Moved input.h to r9a09g047e57-smarc.dts

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

