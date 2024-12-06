Return-Path: <linux-renesas-soc+bounces-11022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A59E6FBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9C728383B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4263F207E10;
	Fri,  6 Dec 2024 13:59:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C09207E13;
	Fri,  6 Dec 2024 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733493581; cv=none; b=nY8kj5koRiuExhy3Hqb26au/IhuzlJHjRlw5h34gGZ5PdP9nsfNv24Oq+Z2K59fu6n6qAlkUySz839+mkcj8ysOIW1AvJGrIdp5cy8rw09faNdXrj0uOT+F10cwq31MIFuxEP95Jw511ER48BD4Vd9GKyXwuzaWcYQrmXjicrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733493581; c=relaxed/simple;
	bh=btRys5gLur1fqtp4iG8VOthFKKUKgjDun53q2k8wUGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw9gvEDXFebZX+uh3fSoXCRQDUY8iVbzHO/QyM00mxfcZRzXRHRqAVyNOQHxHZWeqmvgI0m6Y7lPR4uNOtqBL8+a8dilPj3MtKmuibIsNkjd00GAe4dCx52asyOnPA0sDVxgYC5KQON8b6Numf5FI25EjlN0siOAFpDel+m+gQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afae40c8bcso609024137.0;
        Fri, 06 Dec 2024 05:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733493578; x=1734098378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOOMHpFA7ul1mhFH+l4yk5OCK3gZSUbfgc+7Njpqkds=;
        b=weRyINqAHzPUGbF+v6j3jVPpKiy2e6HaJ+O/1xRA8KeaSTVQyfK3w2FbGltmmy1IPL
         zf88iQV/Y+wEoZF87BGJTWyS7ab2QCbpsp0sKLPKzyhpqnklLeSmVw1dzVLbAs6VzW/8
         4kmglVR3wAu/5sqIHuEok55Jnv4l81NlvcuzTAsRnxYwPlCx5op+J6p5wUQJ+mdqVL7V
         TXeQ15GV/tGDiVeGNlVuy0xE6U3fRbQCE1W0feVShbRwtCzQ3fyKUL3anxwJukiAQDV5
         lgsBjlZwoy/fdfX8NmMilcDcYN1gbPOK4Yh4bhU6e02azXdJWizdp1Jr146CzABiXQUC
         AYgw==
X-Forwarded-Encrypted: i=1; AJvYcCUlnmhR9i6LnMZOOClhSD/kJO+PLa+YjoqJ730vyNuyF/iVWv627e/xj8CZY3+QybKf26HUmU1o/jypbXzOBZcPEV4=@vger.kernel.org, AJvYcCVOYNzBdpUpqnnFltpb1qlXsWKQjQPu3T2pI/PlAHAvi+Oulp5yHxdrvupPwq2dgvzukVB9WYmxAhnJpso=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4P+V7Z1GcNY9LXvRayE8AMeRe4ZPj6fMIpow+PGIagE+8ffm
	894kqkpcFsJ+HbBxaOqnw0v4jAJMgFhHbfpgzXBm3+S58feZbEB/eTYvRoaE
X-Gm-Gg: ASbGncvt7wxQnKmHMdG1eYh2Q0/QqNjl5yfRvbVXMFIMJ4csZc2Z3YjmODNdApJjZFq
	WfRdYVKnRWmZ2RM+hIjsXfj5wKp7I6xco/nUdPYQDBps3Dsy9VkUkviCGg90wyh+aoCxLBW2jYZ
	HY/qCfoVd0KoZuP+LrNOnCb0tD3dQBcw+Uu1hGEtxPb3A133L+DWgtQNu1epNN9IaLbrWriApy/
	piiJnSTjoOw/N3WwqgclpOHRtIYXM7drmuiyV/GjUucEcJM9uy51MxjaKnopXg5GoYV5d7qeHQG
	R3ZbAiKWRZX5
X-Google-Smtp-Source: AGHT+IFTkapc9WLwf7CowDntmTO0XCe6QPAhlGh3XQ92vYNnloBWw6FWpCnYGxkdJUEbaW7g8fup3w==
X-Received: by 2002:a05:6102:26c7:b0:4af:ba61:faa with SMTP id ada2fe7eead31-4afcaa35697mr4197894137.7.1733493577810;
        Fri, 06 Dec 2024 05:59:37 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afbc619640sm439812137.18.2024.12.06.05.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:59:37 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4af5ed9c8b4so564390137.2;
        Fri, 06 Dec 2024 05:59:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0X2WSL0k3ON1MqTmHsgf72N7Rzc5p4qtNqrJz3npT/rsyvhs5A+8okThvA0sVJfRnryBC+0M0EzzrwrW8GsNPrtw=@vger.kernel.org, AJvYcCWRrOkw6LzilVL0v+XhEKSXBH3wIZHCPs1UIjRK2rxg0g8OvEK8SgPyQ+hksxu53WO5e+pBE7G0lPZyxMM=@vger.kernel.org
X-Received: by 2002:a05:6102:316e:b0:4af:4902:1599 with SMTP id
 ada2fe7eead31-4afcaaecf40mr3428766137.21.1733493577403; Fri, 06 Dec 2024
 05:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:59:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXa9e9NAsb=bWuSicCsF2_qM_fW7_+3AKHgaTgsPCX0og@mail.gmail.com>
Message-ID: <CAMuHMdXa9e9NAsb=bWuSicCsF2_qM_fW7_+3AKHgaTgsPCX0og@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 10:34=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the watchdog driver for the Renesas RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

