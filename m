Return-Path: <linux-renesas-soc+bounces-12220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B8A15418
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4672E3A1F3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC42A19AD93;
	Fri, 17 Jan 2025 16:20:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D49443;
	Fri, 17 Jan 2025 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130814; cv=none; b=VQOZoCkZ9Tj8A7RcYr5kk0NjvjODOFpGvstqwD5p97aPX+nqrkPaXD0QCgdXStJYXKA/VXjNFCa1mULHRJgnHAYvX1bD76IBulRhcs0VQED3NrosjoqBOZK0+E2321XNF5ka/YGNxPRHll2oWDSa9MPecIYSJSHu4NGBw0rwqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130814; c=relaxed/simple;
	bh=8prsR4MFGpGZK35A5Z4vPv1mB0H59uGcxlSh3mDldvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKpiKPU5vRsa3ZxjN26Pml819VGbJX1IWbgXRdp1T2WGDJf665sXJZ/7HggO/dfU/LTOjk1qcFHtgmcoqAKf3kMRtRlVmhzUPd1KzHoz/gOdRlqYynZP4sfyxhTLqxOoN8Y/O8LrPPE71JSrt7RQV9g6BV1efj60fKVXzpjhdlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679fc9b5f1so19831231cf.1;
        Fri, 17 Jan 2025 08:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130811; x=1737735611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVo3glyIgUh/AMbW96oMRJiT8yIIQSoBYTyXHXGSdF4=;
        b=qq4oY7bzB92CfkYvabsg9wrC4Oq1uPde9zGGWrwt0YVtEXx0YgIE/byDjQGs/2aOVt
         ATYCkbfv8IVrK4Gnzbpu1Xdqs1WI3JtRqKmh4kjRca0+ecPgVqVXxyPoiw7HI5SH+9F5
         4ftyVThzG1PGxz9yFBYzrtakh+xXsud2QOIX5rXo6CVpy3sw/mU5L2ggYTLAgrDBF/4U
         VWfKXJmJnzpmHPN6ymsv8Cy6XC2u9kjQKBrZT7Y6pELZEC3M2Nv/PNGTT7LnpaBCYwL6
         sZYdOISx4Fr0Y9HQBZZIRbY1ScPaCzSY4VZXCGgqBaeGecIw1Oa/59W1/O2osYrFFwtT
         +cmA==
X-Forwarded-Encrypted: i=1; AJvYcCUb8Yh7N2Z15FAFzD0jszXTW2FGe9y1va6mpchrQr/4KFVeXDFDL16aRSWjMGpNDkZm+iV878+9ruM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcnHtQ/QB6elyMyQXYygr7oJUpTv+2brh23dfduKClo3oTl4q
	0RPK+qhdTIWcj03/mtq2mhxgNQ/C7Qg2/Oajy2ycfV6MEMafIB/8zx9JfNRx
X-Gm-Gg: ASbGncsICqwurBDFLbobyrLTTadlsHA4qkP2PYKGj+3I+6kwAptL8H4p0GNKC0rT3U2
	tCoQx8dfLiMH6f6dS8Oxt9MiFjXOWvxXVXz+kD0goI5uKEoRHuxyjMxJqiU1zvf6J7FnDztAoCi
	JIBS6G+gfy2zf0J0vU5GZVxJpziBI5OP05fqIsmkYqPV7unv9xnXBqCi/UDbgLXkvRS1txHbfQ4
	9kvnOkXCvfTbeY3tr9xyLLmve5SNZq8qhzKNVNSqgKsgXKYBWtqvJ8nf0yc4nCiXsN/H0lIJ+AL
	XQpmRaYNXY8g4CvvOV0=
X-Google-Smtp-Source: AGHT+IFoaH2zD8ZRHH5zy18rzf35iT18tKdH1xvoxmmSpaaT43sEh0MKjNg//zIA227U1IZatUx1Jg==
X-Received: by 2002:a05:622a:201:b0:467:5ea8:83df with SMTP id d75a77b69052e-46e12a9a0a9mr46373441cf.30.1737130811171;
        Fri, 17 Jan 2025 08:20:11 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642cb0982dsm545515241.17.2025.01.17.08.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:20:10 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so603540137.3;
        Fri, 17 Jan 2025 08:20:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/2XCmCDCobO6rx01rtOQzvzN+cmUy60GiW9uyuTtSpzFvqALxtclLhU+Bk4RFaZ9lCoXSHg4nxj0=@vger.kernel.org
X-Received: by 2002:a05:6102:3751:b0:4b2:9f20:51d3 with SMTP id
 ada2fe7eead31-4b69099f768mr2964165137.0.1737130810765; Fri, 17 Jan 2025
 08:20:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se> <20250114183005.2761213-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250114183005.2761213-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:19:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-4XjNP4f58n0amXr7w4bZfy8kYRy5cA3XhBNR2ux0Cw@mail.gmail.com>
X-Gm-Features: AbW1kvYvtToEi_0sa6FtnWTke3Cs0oBddrt7mbbXrVEGCQpFodmtV521X-Cl9HQ
Message-ID: <CAMuHMdV-4XjNP4f58n0amXr7w4bZfy8kYRy5cA3XhBNR2ux0Cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779a0: Add ISP core clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 7:30=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the ISP core modules clock for Renesas R-Car V3U.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

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

