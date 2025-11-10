Return-Path: <linux-renesas-soc+bounces-24414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC85C47588
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 319274ED151
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A513148CD;
	Mon, 10 Nov 2025 14:50:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152522157B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786256; cv=none; b=XH2+/ySc9Yt3GdcsSr4IMX81bIE5k4PkFFE5j0oQiJH5OUwLWu8OyikMQ+RP0J5pUm4ewSUCZiRcVRwZOUFU+QCFMaXK6ZXtLReTP834qwQ2Yp8iz49+u62zI1MSNwMJl5CgNkMASutaGYl4figkw3YTmOTV2aGZbjH2OOK7pw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786256; c=relaxed/simple;
	bh=IMhWei8UUtQyD2IeaxfNo1cout9WByPftYAKndZJ3d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbPE5CfDMRS7RFfqtPXl9LeBHmqKfPy/0uQeIbczIRd16j6K2ZG7S0K8G6N+zfRXGsJT5bzsE9kLQXI5CspCocUKXp8doDUAnAoEvYSuVYtppk9k0hvNiCWta3n+fhhh6rirMJy7JQMffVafmkI1CyNnltfuDCriFMCO3tPenxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5597a426807so2041638e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786253; x=1763391053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6W+AZvJNrL0mTuGS4dpQpITz95eoR4mgvv8GabBfNw=;
        b=Th1X8IyJHFsWRlZfnukbSIMDV9l1Md5FiQr+8p6AlH+uYpsPOLxHUhDfp0jrgYlz+y
         jxlHNbW9ku1SP3Fvyz7uceYOyhztwLlF2claX09/0OsnTDrC7HiMEyKInIFyXwFf61ok
         bqdyVoDT/8BPfBDkt+OExIYC0V6QTIfJwZ/yat05M3OCdaNd0aORF4feuJX00fx+LtfM
         DSmb7DDk47DtK1NJL8bCfV0gymXXw8YdOJLiLBspGAHmZ4fYqj3/ig2GI63ulcltkvlI
         bRNVrVln5SMCnIey5OVsIm3wydd8YJ9y8GhG4fYYeP4iUkyQv33NQJQDXjCkTFo6HXJP
         X+tw==
X-Forwarded-Encrypted: i=1; AJvYcCWoRK6SOdxuPxQ29MFFEiC9J/d9oYpwR5pON6Nxb9anF7wuYsj/1yy474lSC4DHnQudV/MSY14qw6pUcfImW2mT1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRwmLYAwEFNZsTH6kz9bahMLowCw/aQv814M8hTlaAxdJW6tod
	qmJ9dncdALG2Z+kO+4uhoolVGLYSvNv4LNMHGUsZ2ejCbLx+8KAbyB2U7C5cLNH8
X-Gm-Gg: ASbGncu1rZ8Pig5EPAcrKRYhXwaiEsvJqOIQMok7lQOUmqwpFl2o0TMM+q2bFBuUdtU
	pBZq6W9i4YspwzyTuJmwtq7BSzqjOilhEBE/iPBfmT7TaB51i1gNv2SeUF6o4VU6/9dx2oLIyzr
	8hAMnGNkGCZ0PlArGJsWJUiGX1XbvHagSLi16bEqE1cCVASOdKgyqpk2DL3A29FoyCjkSXiFrSr
	dmLSkOynmThrYD5t6LMw2hhYfmA6KKOuc6ZpCZhb4wwD1JEKCO/qaK0/I1D+g41dE16KvgPERBA
	I/lafVmVptZ8kZhW1h4ysjSPwX7wsu2jZ67qBwEEBcmW9JfFapl2NINCZUXNfGSk3LEwbk0CDpr
	Qn9oyZ+aInUhtUAuzZcfXJ489R0Z9VCRslauwCfd5zy35N1Ft4S/UZ3Ma2NAGoK/rK1ygp3il7a
	QSINqx6NujD7bgejs3vv3F+QO4TsQl5MmHtNCkjXsh22CjjLsg
X-Google-Smtp-Source: AGHT+IEhgECQvRb9AgECXlRq35CPIj1oV4kprixqNARN0UdH3Ay7IeAEOuL/FmvT7YqDhzn+7g4b3A==
X-Received: by 2002:a05:6122:65a1:b0:559:6e78:a434 with SMTP id 71dfb90a1353d-559b3148600mr2894198e0c.0.1762786253130;
        Mon, 10 Nov 2025 06:50:53 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559968c29a1sm7004690e0c.3.2025.11.10.06.50.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:50:51 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so2689106137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:50:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCKRpvsEiuAShNz3a2PEtktrpQX2+JHQBmhcenQCRxdS1u0h/AheU8PqhPO/64F2wJmuSBxmbyi060AmZyLgeuFQ==@vger.kernel.org
X-Received: by 2002:a05:6102:ccb:b0:5d5:f79b:e93b with SMTP id
 ada2fe7eead31-5ddc4781079mr3199460137.32.1762786251015; Mon, 10 Nov 2025
 06:50:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028175458.1037397-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028175458.1037397-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 15:50:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVyMZe_6tCBaWJrHm5oEnFmYQtYjeEw8-4T3KqZOSwdBA@mail.gmail.com>
X-Gm-Features: AWmQ_bkDbMYfwCmJo4-5lhRxl2GtT1PU_uiGdBZlvXcWTikgK8Rjt2psKny3OQw
Message-ID: <CAMuHMdVyMZe_6tCBaWJrHm5oEnFmYQtYjeEw8-4T3KqZOSwdBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add ETHSS node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 18:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add an Ethernet Switch Subsystem (ETHSS) device node to the RZ/T2H
> (R9A09G077) SoC. The ETHSS IP block is responsible for handling MII
> pass-through or conversion to RMII/RGMII.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

