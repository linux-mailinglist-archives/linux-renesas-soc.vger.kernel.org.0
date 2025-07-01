Return-Path: <linux-renesas-soc+bounces-18969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE1AEF7FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 837E6163781
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36A6235346;
	Tue,  1 Jul 2025 12:12:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B101E1DF2;
	Tue,  1 Jul 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371930; cv=none; b=JLLhHV9ZU4M5zFsJBdwz4llw2vKViTmnkoFjF4h3UCiHygEydNBYzzhJj08s8ozIBpwzymmPkv5anKjfpNi81jFckHa+c96kUDNM+r6uFYhBRHJgtPaKPQWMwD4AZBRBEZxQzTSiaU1eAW3TuuxY23G3wPOBnmcA9XwmCnJPH18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371930; c=relaxed/simple;
	bh=AoUFXLo7D7QQsry62v//yPqbsOuPy2TxjHRdRdOxK78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPUCXmTlPFpULHAGfi3zI8Fn/Hc1AZGEfSu5cEO9Z4q8nrxWHjWmHNO+MqJqpg/exQzK7MKkrlcj2Pfjr6BoFqsIYEszUb5CvS78r9qu091GpEp+9OH4PYHUQWw1D/qal5w8EHH1q4G957QSXJKv+LUqdfaLDaOuESrTKSdn9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d3cc0017fdso340773585a.3;
        Tue, 01 Jul 2025 05:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371928; x=1751976728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOAD2tb6Dh85dGzwJxy3RcScPy/E8XEt4srq5E9c1Z8=;
        b=NVVNeD0TUr02KMQRp6JbusA0ULS7+A1o52tzpXBMgy+zzJEQTG9lLqfO32h208Bw3y
         5z0al1/m75UPNZhp5lBKWFActl91J616hXNdkCmNhQpsYFGwEyQ/+od2oe4OzwJFu644
         XZomtAHAiqbankuVcOYgP7H7nGC+GfpGsvaFW7OxmraXDZwgqYZ9fwStpFpxI9lbZCs3
         mIlg/ee67q6mOw7DLiSNfQAtbw3wiYdtEAPPKXUZ7KYw0H6qdO/M/0urJh7GxGNVy/so
         oH4oCoj8+2RLQqj/PMiUke3PRbwcXmQR1MDVBf4UPjp1zzmiphfajtT+zSvNcfhkEG6A
         u/VA==
X-Forwarded-Encrypted: i=1; AJvYcCU6KbFMPE2EmuClM1Oa/4mMFhxhqOjW68oeT/ITJ3fwYlDhqznmR1NorGYwNerS6BLaTEBNi3VjWE4jFPN8@vger.kernel.org, AJvYcCVb8xShF1+5g8i2UJ4tZkyShLslIIBLQp9OuYXRg7cU5V9SDhAbxy7eu3zJublNIbH397cVYAOvTRCmYSrgpcZ09cQ=@vger.kernel.org, AJvYcCXEBIfJ5UAVtofcTsGzqtvQ8qQV+8Sx5CvMgsTytMWSPCLAZe/d88G0O3vPU0LW+SwInqNn02WyqpVm@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXrBhClDFfOKstOYl+rGZFI0r9XV7QlSbwQIzfasoHPZiyxzq
	et7VUR9VNdyRK01ImyDa/bgkN1XVUJTIsy+cdvQYrHgfUT1mZ1dCsDKnMz2XzoqO
X-Gm-Gg: ASbGncubNKJCxdwoJuRbv6r6FDEewpcsw7ndXYqdLY6VZuFemTKOtoi+mNl1vX6iGjA
	U7wnW5hWpdOXk/n5ln7f3JR47EAIwoUcXVrfz0WsqRR7Dz9pxThTyCT3DUDJO14nkGtlX7IMfqw
	aISuu4l6fWlWcUCzNX2aBS55vHM7yP730Gwq3vpjjt4eEMNyHqf2ufovx+Cu1BR8f7ku+iCmNkN
	+X+BaTTXKFk+BwCAVinhaP9EKlUom217NZJ4UBlsLMf9Vgssib1hn2K8AwIEmVab3YmxxfrTMSP
	o62H3n8p61qDB5VgGLOMf5+uhnAe0vspo0EfKFxJWCJoJo14kW8MBuL6es8eV+MDCyFJ0tluNwL
	4doeLjI7ZFZ2PyylPs7wwB/aVwtmV
X-Google-Smtp-Source: AGHT+IFmwRaEPl2BFv3KnLxo3Ag22AA9eMiITWIRtPyRhx4fMEfr6S1a5BYR198czQR78HzSUdFv9Q==
X-Received: by 2002:a05:620a:424d:b0:7d3:f0b0:39b2 with SMTP id af79cd13be357-7d443944ff4mr2448156385a.22.1751371927457;
        Tue, 01 Jul 2025 05:12:07 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443201a7csm762596885a.64.2025.07.01.05.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:12:07 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3cc0017fdso340771385a.3;
        Tue, 01 Jul 2025 05:12:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGmblqo1X7ng4+noxuYehPjRQp4bUYKp7AarVHd/MPiZ3ad/DpKmZCi3lG+KmV02dXDZGKmkhQAxDSpkaJ@vger.kernel.org, AJvYcCVWDWIes//xVTXuQzhpZUbKO2eYXEqoxtvo16Xs0PmEL+2EBGqYzabHGUOOm9cxKGg8MxfH9JSXQWn2@vger.kernel.org, AJvYcCWvPkhqGMnf+GSkJUh6UE9saUFZn+14AgvzIJlditj/nluG85JbBNPCiZ8ssrCQ9tt1jiiXGrSn1ZzoyWwrdVmKMbM=@vger.kernel.org
X-Received: by 2002:a05:620a:ac1a:b0:7d3:e710:1d3 with SMTP id
 af79cd13be357-7d443923593mr2349956685a.7.1751371927017; Tue, 01 Jul 2025
 05:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250624174033.475401-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624174033.475401-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:11:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmfT=n8qf-2bPBd6VDvbomB1j9urkwX579MtttmPTVrw@mail.gmail.com>
X-Gm-Features: Ac12FXx3DBPZG5FjFsQQAhJewDGEvSimKkmZHXwnLAwtprfWeNtS85ox4V0IBQQ
Message-ID: <CAMuHMdUmfT=n8qf-2bPBd6VDvbomB1j9urkwX579MtttmPTVrw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 serial NOR FLASH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 19:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable MT25QU512ABB8E12 FLASH connected to XSPI.
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

