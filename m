Return-Path: <linux-renesas-soc+bounces-13044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F8A30C01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A742D3A32B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 12:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC3B1FF7B7;
	Tue, 11 Feb 2025 12:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD491EF0AB;
	Tue, 11 Feb 2025 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278153; cv=none; b=i+KSwNYo4Nj0cUS2M5eONcwVxS4Ru1Y6MZxrAsutpbYDExKInPd0/oarRGehHId+5CRJ8szYiXDM8XupuUddGIdR/u8V2mfayxLc5D1ORTXMrDw01eEEkvF02vTJhqs7HzI5LZPXTPbs7lV5N+bfu6RnMKru8fImtXHSqON+eqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278153; c=relaxed/simple;
	bh=l+CC6+nSAFq9OJoi840nOPj6NovoZi1J1VPAWVt7dGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFXA0JB44QOFqO+04p+oT9W+DRJndbEfatIobO9Q8WQo8vO8kl6Xd6jCdHAwVLkIRJjsNA9LDVFNGDstlpe0uNGQDRTZy73MVjIs1teltr7Kng+BisH0xB0Gtkd43elqBQqVs/yjEAS8sHkIruWT61ZQS++w/3a5JxID6Ww4KGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5203e0d0139so1337669e0c.1;
        Tue, 11 Feb 2025 04:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278150; x=1739882950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGtFWXp+pMAK0o0VAaxlwivxYMoaZcCQGOwGsegVqC4=;
        b=GVUEIIVNhRelefDJcz/TiVfa2JfQGwcypZ9EMFygpA3bXy88t6UQEoHKe1L00jZ7wV
         Y+c1mJKD5tVuTwUgbdmKXcwgianyRoOgd4rqGlUS25DAO9Yhx8JeNyRBo34X2I0cJmQY
         EFgCYU6VrkY6GpaIs8JBXFyvXKUOv/kCxDTtLr8+JcmUU2iVpNFDecC9zzovXYEo0h5g
         cMQvlmGduVlfNeTZT5tUan6lM0VBhRKk9fXk99edZxH2b0qWtfuH2X7Ox9DAUv6nm1oq
         C66c7rHTBItBvQJW27Q45P3ENoUdkpMCikHoGQ9C6vbsnmCIcp1gVSIIX7Zmqtc2p2uo
         PdxA==
X-Forwarded-Encrypted: i=1; AJvYcCVoYTH2Wu+4TVMlHNXzXxIz8H7fOwhKXjM8UjiKcRyWLhiUy9QcHsprCnXtQPa+gFwQrayISwRMxI3e@vger.kernel.org, AJvYcCWE5yNqBjz2SXNhmh/ayAJ3C1+y+FFqWvis2aaWGmXNDlpq4YHMR2onLSDUKIrohlZkLYEw55gkKHTCMaFLHCPeCkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXV5ResRKIYXzwvR9fFvYrEEWYyit6nQoF8pINn5TZBx9gs1PG
	3PLUc4HciRVEjFCPr3E7BpkKM9V2VK7nuKqgsK4tuoOgR8a35zZFPckAg4cIWl0=
X-Gm-Gg: ASbGnctJ0es6isRSl7h+ubta8Up2JANreJRiYj4jXTkCM9S8RChoo3A+bIVZX5ZnZ4T
	i2VhOGWZdCfX6J273gI12OYbK7ah8REAISMx8XEd7w7M5zhvI4U3Tu7vo4UXA6GeiAXeZT7VgCN
	TpaL45aSyXd9KojMhnU/bYht8xMkLUzY67wUxesna/DjVeYeAzeX8vOKyNp6HL2bBrNHIjWDq4z
	hVPG4SNQQmOPZ6cnreG2rEWFoLHZRLgk8hbFQM+gtxFZbyOVi8cxe4C8J1YinNoQmhyKGXm7V2N
	PB8IfLlu1zWQLV+i7H4kkxx6dkgMJ+fR6Poz7l+g9p9lOjUFhSzIIA==
X-Google-Smtp-Source: AGHT+IFFMEW6AK5ytgVPtS4FSglp6Er5F+ARJiK9r/fug5WEAWVbKz2Svr8HoLsyz7VwbHyhrR59oQ==
X-Received: by 2002:a05:6122:1d44:b0:520:61ee:c7f9 with SMTP id 71dfb90a1353d-52061eecb62mr395136e0c.7.1739278149677;
        Tue, 11 Feb 2025 04:49:09 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5204d483369sm395027e0c.7.2025.02.11.04.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:49:09 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-866f0d69843so2971371241.3;
        Tue, 11 Feb 2025 04:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdR/v1A8Wa8OG6zzmoef01QNP5ndy4hYPAarPC2YZc+qdvCN2pCnItL7VUPKCpEjF4dqPCeRLhdsVlhBEi/a/E9Tc=@vger.kernel.org, AJvYcCWZi6mNMnEDMhLPMmVnoaZmdfpSrcn8FCEKJ7v2tQxuVEFrORF1JFjqXgjXJuacVt0+c43rKu8d3ocI@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:4b2:ad50:ac27 with SMTP id
 ada2fe7eead31-4ba85dc5d9dmr10820670137.9.1739278149202; Tue, 11 Feb 2025
 04:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com> <20250206134047.67866-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250206134047.67866-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 13:48:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV416e7V0dXrM2d=hE_a1yiTy0W1svpdgG=g3Cm5BgExQ@mail.gmail.com>
X-Gm-Features: AWEUYZlOUy9KsJ74tpP5ytn8CFFPOnOnrA8dfTfuG1pYiJcUbWE8SF7LdZbj32k
Message-ID: <CAMuHMdV416e7V0dXrM2d=hE_a1yiTy0W1svpdgG=g3Cm5BgExQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 14:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Renamed node sd0emmc->sd0-emmc
>  * Renamed sd0-emmc-{ctrl,data,rst}->sd0-{ctrl,data,rst}
>  * Dropped header file gpio.h.
>  * Dropped overriding internal regulator name.
>  * Updated regulator phandle.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the DT
bindings by the MMC maintainer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

