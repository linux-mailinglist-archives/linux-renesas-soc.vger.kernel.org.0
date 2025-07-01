Return-Path: <linux-renesas-soc+bounces-18991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA15AEFAD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5BB1C21C04
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCB4274FEE;
	Tue,  1 Jul 2025 13:32:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51D274676;
	Tue,  1 Jul 2025 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376749; cv=none; b=RKxR9dja6zkteidGn5ZirhyP9n9szmhTyrattF5W/Hlonz6/h6/Z3o9OzWiZDTwG1WxSAKBx89BYR1ZuoOOkupPJgkPtLZ4TU7ZfPUWzy+KfNkAA5pTiyis8z6MxLK7/TY5kcMtqwFfDX8DeDtKwvfhiGg7pwIz4JQbBkXsHrRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376749; c=relaxed/simple;
	bh=5es+Q21GGEAhFLN7zXBc+xdr2k/RbOI1/T+a50es0X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVCBq8gojfRBaZPtd4rcApypXaQXzJ/CuJauhnl9gbUQiLxOeGESDNgpKav/7xwOx9HyBfZouh0apHpfusdW9zeMxGryY7aPEucrzO/uLKxk6+qVDVzaLecUqJ/VljRGRP7igEg6MEBZ7mPj58CC1iJS78SolxJ9KxHJvKhx7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58c2430edso59609561cf.1;
        Tue, 01 Jul 2025 06:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376745; x=1751981545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eYKtektCOaGQToLGqZH+f97CUTW0Kn8fzCe/qtBPXI=;
        b=WGkNEpr0mdZ38IFbXZbH72YFXRjntCGiSVB9uI3e5Msso8ad1RrRmXq1kwT+jWhUpT
         yAXx1gL2FYoxRrYRYIzRrFC6+dpM31r2jvkG5Qx0gdl9bbsYAJhNNhZirzIGyfDlLLKk
         cA7Fkp/HwXMe+i9Py1aC21HGdX5P1pNjl5vvQEZ5U8MlJSEOXItyz9uHRMTvUs/0Z1dK
         XM6lE4+kZdyL7ceIpZ937rt8Oh7dcmymPBpBUxAPj7eLoC1U1k6CizN5pl0xwdlt8GT2
         mgQtDWufUgaXlaq5V6hs8CUvdGrL5KIN2lQ1jIfEMlhT0p6H5PW3fJ9f/pSL0tZ0OoH/
         OTRw==
X-Forwarded-Encrypted: i=1; AJvYcCVUjrb//gxKaqgSOFvoXg3XBft0veRoff1X7WrephFGTp0oFby/A7fmhLmQP8sa4wJhLXoESu643blI0p6j@vger.kernel.org, AJvYcCVtdDSYFzioXNdFROhZQV8BJ+0eCpEaaV/Y89GVLzTZSZjbQe9WqFaxeUoRz8ai6y1UMChOHkr4OCu9@vger.kernel.org, AJvYcCWPmvYzfH3cHSAuDM6OLQwOa36y+puKVm5EZFrpFR6ByJDxTHzwMA/47bafLgQYnoFpoKNahOtfqXk//XVJ6Z3rdsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJknI33TRpf3b6antWMPKrqw9rHCFSJRSeQs+tJ1JIB/PtUaDa
	u4ESO18YHkr+CbAerD4LIoyKDq87+n09dIwDnruOx6m3c/xR4sMpmo2wlJ3eiAAY
X-Gm-Gg: ASbGncu48in4dVFZ2OHdSqaPqjk7TNUWHYb0JtB3MP64Don26tikkjweIRnffGMYQq4
	MtiUfP+UTeE0NB+LK/izEfb2tVEQrWs/J8J5RWXF76XKNTYr1AR7vzubL+dlkKYnKXpa0jkfXm8
	GBa7QDCrPnj217Y7Ny0BiZ7LRlK1K+NOP4aZac7ZM+t4vigy9eBEtR7MUfrX1wSruWLIBlcWt+3
	F72ZRM1W+0e2ffI2IpY8ptW3QmBxVBucKtuamUUCnX+DcY/vwv47vcQ9MWdNU17XvAbjwAGkjzC
	Oairysnz35/K+QWZdClDRvHmYB2+r6SNNOREJRbDsHjhjxrrGpixh8EJMPNbJHRNMGSNf80/AZD
	YjF0gSAGQVK8fpFOYQwwZ3f9463cG
X-Google-Smtp-Source: AGHT+IHhPFkHPBbgKIv5DUEdTN4YaAJbgIeBI87gW5xRYpPn0pKH/p33HNy+fjjcAutIN0hL4jSang==
X-Received: by 2002:a05:622a:347:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a846d1d1a5mr41483201cf.21.1751376745286;
        Tue, 01 Jul 2025 06:32:25 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13a34esm76105121cf.24.2025.07.01.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:32:25 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d098f7bd77so628860985a.0;
        Tue, 01 Jul 2025 06:32:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAgcq99DQq7KYqQ0Dgej4lpHzZRDc9f3QG6ilPc6lKjz44ufzEMLtgy43/hkMXQ92x+cKegrGtI9X8V3D9YHWyFQE=@vger.kernel.org, AJvYcCVWofIhkz+4arHkpQw/oLIOE+MdFfVfjiMr+RdRJV0fN5nJlssFtwtLEWtBKv7Lx5oZc1Bpab9WrSLH@vger.kernel.org, AJvYcCWzL0pIg74dOteEb1f93hHBP6Rb9o75fyuT8MPuVKgF2lJ7JSfLdXzvyDvw+pAP87OgJP9K9Vh1JJBecYCA@vger.kernel.org
X-Received: by 2002:a05:620a:4413:b0:7ce:fc0b:d39d with SMTP id
 af79cd13be357-7d466d0c890mr475498985a.6.1751376744763; Tue, 01 Jul 2025
 06:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com> <20250624192304.338979-7-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192304.338979-7-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:32:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS-o-qYuEiWc7=8x+LFyYuiPWiL3APzYVxjgX6GbsROQ@mail.gmail.com>
X-Gm-Features: Ac12FXxLNsiZQut0NHC_hcHtjIAAiZfSCe46zjqrYTUTXHYuStv5cvc5V2NA3Bo
Message-ID: <CAMuHMdVS-o-qYuEiWc7=8x+LFyYuiPWiL3APzYVxjgX6GbsROQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r9a09g057: Add RSPI nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 21:23, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add nodes for the RSPI IPs found in the Renesas RZ/V2H(P) SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17, pending acceptance of
the bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

