Return-Path: <linux-renesas-soc+bounces-16016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E7A8A129
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1513AB776
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53F128BA93;
	Tue, 15 Apr 2025 14:34:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD91B0434;
	Tue, 15 Apr 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727697; cv=none; b=bLsN6Ds0RCVOB7UvndFiDQhbvpc/UvcCtSj9hD6dPYAmpq2CeRFHAePqd0tUkFbNHJz6Fy0Nj31siKmls6sQAF6t9AtAu8tBC+dDagZeVXJ/9Z8LGDvIKZ+/9rCLSVyixQge5xeXFPrBlg/pyO3qqthJajfr8QsIMgXu1eADPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727697; c=relaxed/simple;
	bh=PmB1zjmAZjZWvzNiO4TQbJw0i7dUjdu2S3DtwGP9vZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIA8ebNk9qmVxg0BFXAyFffw9vEw11X10uCZSMK13LsRsnB1IGVOHeXNg59rNKZJpTgNoUJmwSegZ1i80flNJefFwZNklJ2TlZn5/qBqU2X2cxoCYH/QXFQ6thVayvpUz+sPWJMwrkxi0ad1zhW0UinOM9XLbTtdmJR79ZHeifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47664364628so57761501cf.1;
        Tue, 15 Apr 2025 07:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727694; x=1745332494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dIwFnAyWIVQ/97VeIO7ZRJ0fP0x1GhuAcnWEKsiUpw=;
        b=a/W5wNpVkM0EvtcMEYN4uNdw2rF5sYmF2pGR+RNJsrFODmzf7UaaSxQjtCOWz0/KlB
         i0A3oltddLUCDLi6G+zVKYHzVR4KlnNM0tyltSz2a4Xw3+rB6UoIqwCmj3TQ4BvVfp5X
         B+2UMX7F6jZylncnkYCLJYf+vbWw+suW0b3EqjZulm1H5qBtHqZdYCxWslus61XQBAtj
         toYOHbrA4B6aLcZYRXtml4MY9LrKX6D0E9z7uFJNNGzjNo/nibTgoRI2fHXpEYW6Pzbi
         tPp2Jg9OLh1TW/m5LnP06dWb+VC8yi+3cCHMO1l3nqTgaN/LMapybmGBRMSihOHgXsiI
         AyDA==
X-Forwarded-Encrypted: i=1; AJvYcCUFie7hg9hgfaRY4z+Ury2wTWWLu1fo5+o6+y05cQO7+6OTpn5jVVInMJdFvklO1EU7rwkYnFgmjoSL@vger.kernel.org, AJvYcCUNInxgae2Ml08UBNdnCzRXzsz1FO+ZET0TKowwYLKKEECJqOgA7fdOWDIu1zFQmrMeXGNO6G2WztRta4wx@vger.kernel.org, AJvYcCVZn31vO0jdGYZLb2WmIYeCgFkmNr6NYba/+7bbCh/TUbgkcoDbfnf3VRmGj0vspVJhJKT5cJpII0V6RYeoRC7+ShU=@vger.kernel.org, AJvYcCX1BJyO4EW/D+sSjx52xrBvOcNbs5LEqlJbT4YuvBg6nmTP71WxO2ldZJ4O1SbeL/6GYpEcTSons5wb@vger.kernel.org
X-Gm-Message-State: AOJu0Yybaa0JaZbmi0ClHSEpNG4T8yic9eqdVDT9NivA/SQX9Bgc7QEI
	R7ROwbqN41SbA8djjzbb/VdkO3JSODqiq+IZ3ouRMmIxQ9yA/uK9FpguA91m
X-Gm-Gg: ASbGnctWB0h92Cr21B4TU0GmNhSZtTnbEBRWKR+gxxSNoPAh3vSE0cObRJ2LjIenEg5
	l2MuHsDtRPDa7hCqYRC6s2iRip9FgmTcgDmvLVpKax5Drckj84Dv0i4ZtIJDcwiwhEOVRaxuDhL
	eZzq1j4gNcZpGvy0XXYBn1yCt+bybi6ES6pJz/KAw93ovfnbySQz0p06RSzh+hLHnodsjX1RBZJ
	3xc1s2RcAXr+zzJ0wKCcFHrGZoa0ulhIA9TkCfgO3YwDqlLW48hxp6gQrnW1I7HW6cLo4AZuCw7
	KvIjaR/xL1ozDlnmN1JcT7D80y2K6854ZSETagT8rr0XGmdWjuJo/guPXDbbQDCtvtfXpDOAM8O
	RiuugkAE=
X-Google-Smtp-Source: AGHT+IFzm4KYkeVQ3CcnGZMtBwxphQeIAp9W4/7YBRbOFzcV+MxwbjDYpPEdxtf7rCVUUBN800WQvg==
X-Received: by 2002:ac8:7e91:0:b0:471:bd14:a783 with SMTP id d75a77b69052e-479ff2883b6mr54446751cf.25.1744727694496;
        Tue, 15 Apr 2025 07:34:54 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9bccfsm93952251cf.64.2025.04.15.07.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:34:54 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c54f67db99so632882285a.1;
        Tue, 15 Apr 2025 07:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg5EoktkK9jGz4uArwVI9rpTPPtB+8izD4Jac+9xAKTWCAE84BcVnN496deoUkpRGUwMTWsMs2tfD4XueWGajhZqo=@vger.kernel.org, AJvYcCW+MCyHIkzLy82mEyl7gawr+7E68nnP67eDyCLUVcrNVS7BcF4eHXxwlAR6m2Pzin1/WSlD1WEwt3U5tsGj@vger.kernel.org, AJvYcCWNEMgl22rEGz4VGZmuCatSz+YIVeyEQk4ghW3c0xKTuBqf/SY5dOPNhJ1KsnLVpLV5Ey1Np6fruksb@vger.kernel.org, AJvYcCWR1XvaLBn33WLhA2iIyl0POsW3lYXpZQe8pSOyR7Sfhr93/FspiP+pvpoymf27FSK8Doe3krjHJ7p1@vger.kernel.org
X-Received: by 2002:a05:620a:178b:b0:7c5:a542:10a with SMTP id
 af79cd13be357-7c8186f1201mr539874885a.10.1744727694083; Tue, 15 Apr 2025
 07:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQWCKmuLa3Taes9iLNcHsigzABnh45=tu1JiQcPxf-jg@mail.gmail.com>
X-Gm-Features: ATxdqUG4nAgwGdDFQ07mt_S0rwGxqfKo-pWf7EciVb0T-IgnRUssFww0w0Ka-4g
Message-ID: <CAMuHMdVQWCKmuLa3Taes9iLNcHsigzABnh45=tu1JiQcPxf-jg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] clk: renesas: rzv2h-cpg: Support static dividers
 without RMW
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for static dividers that do not require read-modify-write (RMW)
> operations. This enables the use of the generic clk_divider_ops instead of
> the custom RMW-based implementation.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

