Return-Path: <linux-renesas-soc+bounces-23871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F3C1BB79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5331C664A70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BECB29DB65;
	Wed, 29 Oct 2025 14:52:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109AD1F12E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749550; cv=none; b=jLxj8zoDoeYuaMMgpxntfGRdimL38WtVWhvjzGWYb6cfpUSw1dsmbeFN1liP5nB4e3pdsBD8klKHyCcorNlt7rGPzjODYR6qf0iFv2+SoA23e6sEGdbwvFg9KdfTfMwDZRaaN8VR8+BjTp+qnX73+DXXrx1N05xWqU4xioW4Vzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749550; c=relaxed/simple;
	bh=lfiaCy81o+Yc4E3VYzi/mV8FENlkKHuoO0aA7zcUcY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWhquJr5RXh5MqcZCf3JhiA1DWBOiJvk97yaEJ0lWp25xIguonRhTIreZcYaJgf48BvomZndq8x+fThnNfMT0oSn9YExB42UN8PL3gCS/IL239ziiXugwJrvwb+QYlDxjYbO5o03Oa5FsNu7ZSmLRN8Z14ybvMtbmg1Mj4SQp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-932e88546a8so1746241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749548; x=1762354348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FLpuySnjEqiS9qmBmDDye9ClI7f1GY+eT111Ebu1EY=;
        b=XdV3H9/SRsRCWtUwkYfuJegoMqafxztPwABBfgKDTZuBjmJmtjkg90r53bLAszL1Mi
         X+SLzzyDoewMwxgBMXV6sjopKbECAo1rmG5jg+8hRMEAsK1HZ3PTm6e8v7OzMk/PFyLA
         zEpfuyupWKPyDM4hlplUnzdbiPpWdn8LdiLFvip17sfqfOtr4gJ1VvuKzQl+ppHnol+Q
         rjwqLjZGh6Xx+exdGrQVqH+mpGC+0HVCOqGe9ueQ3S536P6n1GI1Kdq9te6cgjk0G+vO
         1emAjje//eKLLQPEoGT7+K1jkaqdq5Bm6k+ADc1XEfGTOphBRKwvNpW35V1Q3Zda2ZJh
         WOtg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ipG0aQ26vLrIBG8hfc65rvuXC5RNEWTNvEKJHzkC32fNpw6urAc8zaDlKHQn/8grsXgJ4i3Bz4MFbUSVrkYbMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0ZqL9lbSFMbFFng1jDfKHz3M9LxSAaw1PIekAqVrK6QwX1y2
	rq+tYSdUzFM0zE07ARDOfqyIJobp789ueT8uoEJ0SmD55NpsIBzOsGQmb+WRv5X0
X-Gm-Gg: ASbGncuhEWYVOMmbOikqNL2IWsdSFHwBPbQQ4CZdGnsxkPichrT64Fbd8YaM80AGupc
	/RonVD9FbT9IqBLMUOqArvNOWvlWPZphh8gng8jGrX5YV+fgCTr7qsnQAx4mCuvhEzFzb34O+sP
	B9RbgolCEba2AHLYnk7SKbqnu3k/cbL+E+1EcqEP+E+7SePpZaGT26ntSuxkEfE+x58le2ecnO4
	tqVD6gBWIwuVWYyu0WSNwnnm4SE5eCm3xJRu/r501KZxTdyAQpIJPb0cXeV4vbso7+wqahzRx1f
	ZkFW8ssHyOlmi3p/XmeeoGnCoeE+43/dh+JxsFd8VwY9DuABIaekWOMlY8JaAuOPIe1eserkSJL
	c8RlUG8jHFr6bUSONEVSXqAvoXFKEu5vggdIOFpNplHVitJMZ1sZ7AmM9h7taMczM7LJo7vJXre
	Gze/k3iIckqSzKyytLIFB2CLRkkPR9e+TnQhVZkeYf2A==
X-Google-Smtp-Source: AGHT+IEkjxLRP3oeZZhRCHytoy0CliO9O6gvydJ5lbF+BCg2KhAaHwsOmEYMHaX6gDjHNmkbcHnZlg==
X-Received: by 2002:a05:6102:54a9:b0:5d7:dddd:5709 with SMTP id ada2fe7eead31-5db8fa5dfccmr1195741137.0.1761749547575;
        Wed, 29 Oct 2025 07:52:27 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb3004bsm5419703e0c.11.2025.10.29.07.52.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:52:26 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5db24071011so1184694137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:52:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+N2hIIR8DGOCmps1cOlDIbhunO9kIwTqNSnx29qede6AbG+kjRIGFDsciK0gjq+KiYIGH8t6fXrNGN92r8onDLA==@vger.kernel.org
X-Received: by 2002:a05:6102:2c06:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5db7e20592fmr2373437137.10.1761749546310; Wed, 29 Oct 2025
 07:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:52:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
X-Gm-Features: AWmQ_bkKsdjAWwO1kVg5eGvvrllD1NL0DkP6oF9YOfmHIHPrQOIMjaePzAGpSiU
Message-ID: <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X with R-Car M3-W.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

