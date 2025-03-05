Return-Path: <linux-renesas-soc+bounces-14026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD8AA505DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 18:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA67167CA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA46B19884C;
	Wed,  5 Mar 2025 17:01:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7613E40F;
	Wed,  5 Mar 2025 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741194113; cv=none; b=bntYNPmWYIq+VetHN1HCVRoPQS20LANTvxM4WNG6ZRzoyqpF/Xodm2ZCLXeDwMv3IKIe0vhcy2BjB/0MNlwVwxijj4p9yz9KpzkTFgfZD1udamgwx+WnRNphBkHdVJP8ox7Xp8YkhVwtLySjWxtq8iGqdrOQRscx1WPeCXIjifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741194113; c=relaxed/simple;
	bh=0rxJwZjl4OSuSkKZCA5Xg/vtBh2/3Dvza6Kix8Z4KMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQObBb77SeHjdNbfEUUFhj9GdoN3I8G7FB78yYQ59rpKZuLrjt/m2cWCOOQSXz2DuJuAheZXFupRhYqScWLt94ieevNFzb7NMJ5YPgghR37jCNK0Ye/Vb9Jt5tdL8cW4/O9twTJcfML7iTL8jgL+Uj5XQh+YlOe+Tz65QOMtwhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5fe86c16f5dso3402940eaf.1;
        Wed, 05 Mar 2025 09:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741194110; x=1741798910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERgLSJO6neI9plyvRBTtNfaSnfLcQ2cGCJ9tZUle5rw=;
        b=N6zVhCofim2ifecBNdkzy7AHR4usTlnHXZkF5VyzR4kojoWZzEvykUQTL/Vu6J5xFg
         a4+uNlIc5HYr2Judt0NOphgtkr2FOfTnT/83Y/4HgftCeFxyjJxMVjU7AtGbdT/L04RQ
         eTOmbnmzZ6wUn8LXeDIjqP7oKa+IESP9V+7sTCDj71W6i33RZV3o3SM1EW3RETN1W1ts
         ebxHKgPid9Q9cRBeKix+rhMvIKGe4T0ZErSXIUyxd5dB9baklPLSThzFUzl5B+Qs9l/j
         iuto18S/u+emcdtdgGsJV18aWQeiatcrTJrmhwmtycBzxSblfMeRzYpvKYtA+4XDPl2j
         uOmA==
X-Forwarded-Encrypted: i=1; AJvYcCU3VVDEMpRrkrZYWDZlBmd/1iBfE/dCA2i5WTcIX4g3iVi2+GyquxlDG1Sry1lOD+WBlGqK3L7gBgI=@vger.kernel.org, AJvYcCVBtXipigANzn0KtoH1VYfeyZgJq2h3XriI15D8usiM5ZNFAArYXQNQ6Y+ng0iXu9tjhtZwvT3ACrvv+/ClR9/V/Eg=@vger.kernel.org, AJvYcCXX6maBgyeii22sTYK5x8eAoS7qRuHywMvcBPfN+aZ3lwoeIJLrtbVyP3cVSUjMvnO2efgw/ABks/9qtPzc@vger.kernel.org
X-Gm-Message-State: AOJu0YzLiah6w2Tckhs71FZEHxUkfWTxwbHea67jsw5dZxle0he2iIt4
	cDFkpcUHz9nD6Uy4MvPyzQL4CUkCihkmKBKQ71NRk1w0h7nKAtBKGuZBtz76
X-Gm-Gg: ASbGnctebWxNIE55JbgFVhLxR8xhMZiJOgDGJV394yBCzFD9qAtq+CFM4zRqM5i0kGD
	kX5rPIXCvMHiYmdaTfwhifIwHwgHXkRrXG4YD+RfPFlJgFieuNnQ1TwYtjMk8uiCR0ImhO9L60H
	zly5rfMglxzCyJLrFCowpuP5Gi1wKY+44FZNwr547pHb+jE+E+o+HmcKCgTToUHU3fIztwdIWhV
	zJxOZBHPmSK8MTeGV3pVCx2aeFdFfsXykDuKvOHFofdpI7dNyDECv9wev1CDzAawX4ZwcjfSio5
	2Jpbfv/yWsGcS2qCkPFQZ+f+5bpgk/16LbJJQeYActjCYCgrvQswux3engms8vcqWOajeI/x7IJ
	90vuwno0ZQ5w=
X-Google-Smtp-Source: AGHT+IFbwnVua+g2QIrCGnGOIBTUVsj2yBhLRW8ApTqfyUVPcwNsVzbJBO/D4aXq0Xet/+rvOQiyqw==
X-Received: by 2002:a05:6871:28c:b0:2bc:76f2:44a8 with SMTP id 586e51a60fabf-2c21c92dda9mr2136890fac.15.1741194109817;
        Wed, 05 Mar 2025 09:01:49 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a178e0e81sm681216a34.5.2025.03.05.09.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:01:49 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f68460865aso467427b6e.0;
        Wed, 05 Mar 2025 09:01:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUon0ixLkxYnLmSNjbvy45UwpTWhNzus2P+k5sGptCN7b2wrZG4bsqz73C7+n1e5aBlcHBFmPalnTXljInKc3Tzjbg=@vger.kernel.org, AJvYcCVlmvnQRcYml1xd6ExTzTCZ9mVzdEnmtEFcq7WeaAf/hkqaNJErggzLmFCDhO2EPt183aBsGl9ob4U=@vger.kernel.org, AJvYcCXIyB2J5GL3FglZ3VY2uMlvlIFMFZelHprkzl2KwKnrrcJEIf2pL88+oAkY74PjdUbS9mT1fZEnrzE5GOIw@vger.kernel.org
X-Received: by 2002:a05:6808:10d3:b0:3f6:6d32:bdb4 with SMTP id
 5614622812f47-3f6831d0430mr1692293b6e.24.1741194109166; Wed, 05 Mar 2025
 09:01:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250218114353.406684-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218114353.406684-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Mar 2025 18:01:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3GnxriLX+nMLH7mv+KeoggP5QORp90pJfW19TgEr5sw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr3uCOJWGic_XKwEuc-_Ab1SKxQX8ZWx9Kt7teQp7oRbY9pxbQ01yzWJLw
Message-ID: <CAMuHMdU3GnxriLX+nMLH7mv+KeoggP5QORp90pJfW19TgEr5sw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g057: Add clock and reset entries
 for GE3D
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PLLGPU along with the necessary clock and reset entries for GE3D.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

