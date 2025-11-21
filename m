Return-Path: <linux-renesas-soc+bounces-24954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01415C7A62F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C52C3A23A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20D734D90E;
	Fri, 21 Nov 2025 15:00:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0A34DB78
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737249; cv=none; b=a7SSOsIkpVSJOBT3jOH3cl0/zppnzyKh5GiA8et044AYZOsUei40ZVu4rtUB9ac/GQ/YTnkauy6BOPGjPBeZ3x3XYgP30B5L4L3w1US+pf0ZF8hdHC2OUOIezFTEISsFLsrGQiraVb4nnYWL/MhRj/Z+RSE21dfcD68BuWe5DjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737249; c=relaxed/simple;
	bh=AQNOKwHB3UBl9g7sRvqDiWCcJTkwnsBUkpIpk6Wat1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGXlDdvdOzc3QVVKfQQ9yIKaNNJbmSbUizSe81Rij6s+Nks5dOWCxbSlJ5+D5V5X3ydBVdrvfGaHsItW5SGenM6KanwbMrjxlq62D05IL2DlckYl1uEJoZyZMSxCIzxuzfx5y+LGtou485CpQBFbzarBgUyolVmVJ0nSpCnqMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55999cc2a87so298343e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737247; x=1764342047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjPFQIGsOb/05+Tcv+1sJFrvUE64bOGGUtXswPEQksg=;
        b=L5gKZtDTfGo9X5OhyisDo5AQR3Fmc7lt4xF/WTNnufvTeGQoSX6t6DrI0fHtbyAGIJ
         LiL3WfH5KsFoaeia29g5cG5Fj1zQPt0MK12TjGJXDjKBRaDMLoaa5K8LfAXFSBIV+iyD
         E1HK+2FVcc/rCB2cYMroefpBV2KQNZsPrRN1cOmNjCB/QyrC9qA9Ez2CeGKyOv42OuYg
         yQJdCap2ia9cbO432pALdcWIaRkNGOFCYxYYBdvsQLb5WFdzQKA01/VrvIeVUyscI6NV
         7wMEKrYPqvjZTdm1kyXFuOsKT9xQnaRP0zJ5fcKKGU/J+wV9Oltj5X7plx22kwjvRzO7
         +prg==
X-Forwarded-Encrypted: i=1; AJvYcCUCMs/Fa6kb/PMI6zcDjJLKDtTZGO5OPo6Fx2vjse7pGTQPtFrnVD5bKOBAY/ipb4oSeMw/zX4+MRCMUw8FI77XgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+zsp07wluuQiVdzKEmiI4899zwYsI2J4U4S9Ahcar/czxSJpI
	Zt9iMKsBdHDOo6XyMQ5gBQNhJ+v5rzUptiV8Q/Uy0b7EB1iArMYLexykr/V+6FP+
X-Gm-Gg: ASbGncuIs6acirRCxRXP2C3nPp4MEjkprYnRSdVQx32Rx6nMookaa5eNF9qxyLwnqQS
	KsnL1qN2nm0nzR286xFoyK3DpzNd8h39UMJMv6G2MnYEZbM9a+FWu+ygXz40sHF1M1RqCps0w7J
	KD4xkbObWhXgRKl3qiMLtqmCDvRcDmZ0RfPVdX7oIuiJgBHC31XJb7u/HVoehbxbNVjhA0vdV1Q
	spPu+Q0wodKhXchXjEosB0XasskG5AzHkWK7xfhLoO6v2MZvgkqZ6Hpw6UHjW9G3OS21MMYuh57
	lywBP2cqfygPKCRN2TFQI78v06dmDRktHcgd9fqxF8h/rAFc8bTdQIereviwXARFgUBr2Ya/TbZ
	r95n+lUSdXCSRRIxoLfK1NOyz4tkd6GTwxKW6Mv1teIOTVXW2xgjBA8nGgk+sgSLLVrCADB8CSO
	mdMMcfzX67eykUscRzWpsqOwc+aZuomTc7BvcfvOWw/2UAqzVe
X-Google-Smtp-Source: AGHT+IE/2RJC2uldFBmmMcc72pkObyLTw3lV/kr5/bwBmuesc6htPTNYXllttkGS8A5t5iLR5WcGPA==
X-Received: by 2002:a05:6122:1d10:b0:55b:745e:21d4 with SMTP id 71dfb90a1353d-55b8efd9af6mr562776e0c.13.1763737246319;
        Fri, 21 Nov 2025 07:00:46 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f774612sm2617434e0c.14.2025.11.21.07.00.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:00:45 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dbddd71c46so823592137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqZVvYTNdzasIOdvSwpQKr67p0U11Qrf1VAgj8dXgkG3PjcnVWjBvmHYtMDue1mxx3yNY0Wn5kmDCcWdRTn5n76A==@vger.kernel.org
X-Received: by 2002:a05:6102:d92:b0:5db:f850:b1de with SMTP id
 ada2fe7eead31-5e1de3c0ef2mr643479137.25.1763737245110; Fri, 21 Nov 2025
 07:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 16:00:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZUA5CAtAkcpcfwN+kM85kWPDD88+pNO8jfVoVxvuSyA@mail.gmail.com>
X-Gm-Features: AWmQ_bmonK_A1Tk_afThFkax5A8T6CT_PRaXgFElQ-qoD63LPaFf7VsWtVh5eAA
Message-ID: <CAMuHMdVZUA5CAtAkcpcfwN+kM85kWPDD88+pNO8jfVoVxvuSyA@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] serial: rsci: Drop unused TDR register
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop the unused TDR register-related macros.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -35,12 +35,6 @@ MODULE_IMPORT_NS("SH_SCI");
>  #define RDR_FPER               BIT(11) /* FIFO Parity Error */
>  #define RDR_RDAT_MSK           GENMASK(8, 0)
>
> -/* TDR (Transmit Data Register) */
> -#define TDR_MPBT               BIT(9)  /* Multiprocessor Transfer */

Might be useful, one day. But all other bits do not have defines yet anyway.

> -#define TDR_TDAT_9BIT_LSHIFT   0
> -#define TDR_TDAT_9BIT_VAL      0x1FF
> -#define TDR_TDAT_9BIT_MSK      (TDR_TDAT_9BIT_VAL << TDR_TDAT_9BIT_LSHIFT)

I agree this is rather useless.

> -
>  /* CCR0 (Common Control Register 0) */
>  #define CCR0_SSE               BIT(24) /* SSn# Pin Function Enable */
>  #define CCR0_TEIE              BIT(21) /* Transmit End Interrupt Enable */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

