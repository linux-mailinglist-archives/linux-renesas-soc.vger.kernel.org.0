Return-Path: <linux-renesas-soc+bounces-16968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3201EAB329A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 11:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B780317B14A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DF02561BF;
	Mon, 12 May 2025 09:01:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4C433A0;
	Mon, 12 May 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040514; cv=none; b=q/gygBXoaN3AVQMwWroRfjo5Z20KWzNqWZiGWTKEuItYnZYLd6FYRPA4hW/kF18/bfCUlyx3D+ptLpz92ggN8QVWTMWcG/kLZ/gvdVWBfjD4WK8C91p2dzGUlBAHn3xKy9fqU4/odwtxsio+yfsdI16+TYc/gQgV2Sj9iOfkQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040514; c=relaxed/simple;
	bh=xgpu6nv8xGo32K09RD5GFRpesBDnRQyLEEpj/5ovfK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izAPilbFHnLu6NKW2vh1x25jQ18GIQzH91v2cPWwasYjslNWWy2tLZaBSOi4jtgGnu2Vwcea67PpK8jCMaeAhabCnEl1c10C7r7wSwqs8/aq0PYHGrRTVq/KdBbvv27KJgQUKyyO7frnAiyvcJ4/ewn4KfQE/4JJKgu5ZNm82wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-400fa6b3012so3526669b6e.1;
        Mon, 12 May 2025 02:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040511; x=1747645311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJ9B+L/0pxk/aAA36fM5U+1DbR7T5khcLMrOecJLuZE=;
        b=f83jHVgwkksBwnZoQOW0TcrrYUzmcnEi3RQPcTGabgC+f3rlTFwBKwwY9gbkVPvD+n
         5OWd73ChO6sDGF54Dzxc0ODXmRKNSmr9BUqpCD1U2chxC9u5N9frxIdGRgcPNoy5LI0z
         OihIfIBuAuITXMQtfxxB1+zyyI6d0F8x+cy2dfxXFE/nNp0c+vN828LStxUf49uh8rr3
         /NtYKv+MWF5aZeo0ChVY0lepyKrsroVyus1N3tFN9/xZ0jwKXPIpPc3fw+Y4tL+2JCG/
         lI8j4RGMN+wEjTxlvmV0ID0ltcUZYLJKt9mLZBEjBUE/cooJb0lyRH0IwnLzMwuSJTyE
         urXg==
X-Forwarded-Encrypted: i=1; AJvYcCUdwsYJQjzrD9iseE+AVcY0lFrnU7LSs36ZXMcnLaGZi7f5rep31B0IEhl2T8x/Sn4YnTb8cNAY4te5JpmE@vger.kernel.org, AJvYcCXwVEWxU7S2qatfVu4t6CfJjkeM7mcP3wDaJv1ZNk/rNtiVuk3pbSvaMkGKKYz0oH1foJC8A+19s7Os@vger.kernel.org
X-Gm-Message-State: AOJu0YxolwIhvqEI+MrwBLg8TFANjb2TP1mVixKm44UvIophyVI3xeZA
	8u4PEEeXuQR7eh4p+75qKrIgIaC+8aZ9PluyXOYWI/3zeh4/CkB4PQhc3h0V
X-Gm-Gg: ASbGncsnOGOd6vFG4n467lw3CKoKBK4efrA8wNL7+U5aU5w0b0a/vSRKHJZ4M3rdShz
	tC8RrggWcVoZOxqVG4LwYBBv3aWcctce2UHB+9C8H1yFIPuGN0laeZZlh/OBWkRcszVvJbgLlzv
	JiPOFcWtW8VZa0ndDykSqjKztEEV0LapvRtEoLORitrMM7dWSCFW7UlSc8H9UfwDK5MQfmRIpFc
	X37zK1wcIRJWnJiZyxFxDjZ73UjzT3Zsxk8tBUZti4wqBnUvi+40Hn5lZlXTlGfTW5Yfy0SPxzR
	NWILeklrY5lprV9BXFAhJ4CXa1azD/JOTO8X3iYeMPf16AmkKhUtLHgPCDVBPM9zUym+7mCjVt7
	i5tfSS59QHm9r3Q==
X-Google-Smtp-Source: AGHT+IEvGBQ8w3Sv2wrt5hNkC3jhlCfgmsRJvtQsOBypbFgMuKy8CjNV82p2JlW9yDCJagmxUs/MBw==
X-Received: by 2002:a05:6871:2b19:b0:2d5:2dfd:e11c with SMTP id 586e51a60fabf-2dba55bfc86mr6541901fac.7.1747040511070;
        Mon, 12 May 2025 02:01:51 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0797479sm1768906fac.21.2025.05.12.02.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:01:50 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2c12b7af278so3246547fac.0;
        Mon, 12 May 2025 02:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWh2ZQN9mbigyVAqNuTnTyBl+1SDdx45P3ERAC0MvAvS8BmoQEMBovOo2dgLQEdhmGLSJkin74Yn5vwdQ5b@vger.kernel.org, AJvYcCWnJ9dJcMwbQ9ytlq16Pbk6bS2A9sWNYQRuO1/vRbohXeQWq2uN+Af5MtxJtVLhsgJ3KEf2uOG+9rOV@vger.kernel.org
X-Received: by 2002:a05:6122:4710:b0:52a:654e:bd98 with SMTP id
 71dfb90a1353d-52c43a928a5mr15501650e0c.0.1747040499288; Mon, 12 May 2025
 02:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
In-Reply-To: <20250509-dwindle-remold-98b3d03d0631@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:01:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
X-Gm-Features: AX0GCFspRySgDb6ycd4xRu9GZUWvVUHvETzhZOkoOpahhaSVXdE-xy2cDcixKwI
Message-ID: <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -28,6 +28,7 @@ select:
>  properties:
>    compatible:
>      items:
> +      - const: renesas,r9a07g043f-cache

This name looks a bit too generic to me, as this is not a generic
cache on the R9A07G043F SoC, but specific to the CPU cores.

>        - const: andestech,ax45mp-cache
>        - const: cache
>
> @@ -70,7 +71,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>
>      cache-controller@13400000 {
> -        compatible = "andestech,ax45mp-cache", "cache";
> +        compatible = "renesas,r9a07g043f-cache", "andestech,ax45mp-cache", "cache";
>          reg = <0x13400000 0x100000>;
>          interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
>          cache-line-size = <64>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

