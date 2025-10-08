Return-Path: <linux-renesas-soc+bounces-22785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54CBC432E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 11:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD9C04E5F6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 09:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78632459F3;
	Wed,  8 Oct 2025 09:52:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679D125785F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917123; cv=none; b=jxlPMlTriV52wi0HllGiUY5eK28YOwddWmzy7SyUTnSVqW4nntlB6/ME26iSa1I4jWpf59Pk26iM/sn5JzoIjbRrRua01mcG3wZ3KJPoiiZdr4QUF0Gkk+FabVOvNPA/4tPYuQV+qQuIerqwY4c4nILKx1I6OEuDCpa0A8xlfW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917123; c=relaxed/simple;
	bh=QtLPUfR0OllGF3mTP5UJfUxdOHu21qygYWLugc9vnBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ruoFZKqea4gemTYWPyDl5U9sM1LLUzjYvfYP20lD9MyLFbI6fAIFFdp0n87jkGy174nL8hM0GJNPg/sdWyOVf0heNBKL3l5ndsk80bt7pQxoodWxId0XiIMdDqKEKLLhWT7ifFVBiXsTlyiQRTtvLZF5h+6RDifZGCqBBHHi3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5523142df73so5103336e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917120; x=1760521920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaXRh5obJ3SjT+/k5J9GZ74QBenPB0RZIjICzxWz/u0=;
        b=awVL6wylAuRZojFI8BgeviAFTSKJfzfvkdaChe+nijlZTc3JtPKjfU+mgEj6NdGd9w
         1Sgy6Dbhu702uXc+BYkEW/Y59vhUs0Olk9t3ubC+0Ce725JdkmoTa9utp2lL+8DpqVKU
         hBPZ6oOISC7oS9MRtXb0iIAoMPKWuOeRQ+2rO6IDx4fK7o1qxnlyF93twH7Wvj4aqrEA
         Hx8x4NStBNw3qRJGSn3GO/3Jf/s9PAlnv1JsRsZz471n+l4d5E9duqoB7QbBJnJ1JgtC
         2nfs/2FiwL7C1NS/phq0wzOD0G4r9Qw1Er/JIFgXM33FzV02Op1jJNs9b4d5x+tLw9+V
         u/+w==
X-Gm-Message-State: AOJu0YwPuMlvEZZcJ6uE9phfIkprPPFR93956AkTEyx/z4L8e2C8g/pi
	z80aWSi7xUP0naJTxP9I5R53IwV+6wtHOyNcKXdcktZnSKWaDVwi3FQAHWNFHKhA
X-Gm-Gg: ASbGncsa+7hlX86n6oHc+16JnCeUUlzn66y8sBOXDUtbaIPUQ5T5pkmdz0QGMZdikHs
	5pv34bC4UDifxiXt+sR2+sdHxzwmOcUhmAfyV3cNGgUTBzyDZOdwRrFkeHb4g0En7kDAApQAwCl
	wrF0fzPVaFhIgbqcmwOYqiUg6+4fmv1F3F+XhLZwln+aXMkzs/6BNC5lDwYEIBlVPmEo1hrk0JM
	rTg6/ARZBXwQ5yhnt8RC/pK1QjJerBsEyel049SxtcxBS7CTXVh/Ax+633zy/odgibXm5QwSUHA
	C6bcu3DyY0YgQUOendBEWtqj229D10FMx3NpkcEz6PatYVp2eG03MpkwfQb1j4frmpCzH5NYZwG
	1r+OEgsoxVbkBiL7XrenGY/3PP0usHlLLNsw9s3is8GfsXKz4XNN2CGpOm4oL0P1YxH5IikkE9K
	BQugoPSbyXma8D+kQVlQI=
X-Google-Smtp-Source: AGHT+IGYN3LlI1OZGNNZe51bKCCRUmFCFhRcQtc9noEmJW9N5kfD+K5siXzIT9tJ8rrE9uHr1FuIoQ==
X-Received: by 2002:a05:6122:658c:b0:551:c3d0:acb8 with SMTP id 71dfb90a1353d-554b8b1460dmr1018382e0c.6.1759917120149;
        Wed, 08 Oct 2025 02:52:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf64c29sm4354321e0c.20.2025.10.08.02.51.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:51:59 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5d42137abc2so4736790137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:51:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:529:bfd2:382a with SMTP id
 ada2fe7eead31-5d5e23b1d6cmr992407137.32.1759917119278; Wed, 08 Oct 2025
 02:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006172119.2888-1-wsa+renesas@sang-engineering.com> <20251006172119.2888-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006172119.2888-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 11:51:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUATfzL5fJ0Kvki5n8Xa8p68RwAuCm1ayG3SLwuzpmuyA@mail.gmail.com>
X-Gm-Features: AS18NWBHcsodHDDr4jhbkMU-kPE6g2KYhbmfMFiKSoCW3kN2E4jr0bvxNP0kRlU
Message-ID: <CAMuHMdUATfzL5fJ0Kvki5n8Xa8p68RwAuCm1ayG3SLwuzpmuyA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] ARM: dts: renesas: kzm9g: name interrupts for accelerometer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 19:21, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Per the updated binding documentation, both interrupts must be named.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

