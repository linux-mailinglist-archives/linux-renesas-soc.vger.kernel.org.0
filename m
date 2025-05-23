Return-Path: <linux-renesas-soc+bounces-17426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D28AC20A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55DD17BE6B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA0122A4CD;
	Fri, 23 May 2025 10:01:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA65228CA3;
	Fri, 23 May 2025 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994473; cv=none; b=h+cH+TscMT8+47LmINj4Ai1KKir80J1cMOHBXrNWGJ/5BSWZ2DvZXuXwflZSTqn8Gl53ddiLH1n/AvoTQeWbB4TgIYjD8EBmFMiuKd76RRaB/Mgje3FMPsVx5ij9vSZrwvkDrBSy6iaVBDzGitX3Zs4J9A7JgskTINTkMoT5PYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994473; c=relaxed/simple;
	bh=vIaTNJ4TMAmMIjcDWA9pdJirJzgSELc0CXBhmu9kCDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTdeZuR1lHpmN4lqQU1n4C+BwYseZq8ecGMf8h0uPujithNC/+jfvqa2goINPGL/Vt4FRMmsfIHIx3mY86TQkDqy47muRSJUld9dPc89ZqeCzOverRUhIgag0VpvljTIkhH2Ps67F9UVWTEJK209nkkdlOwRL8lG4QbQCPle8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e14b17c181so463632137.0;
        Fri, 23 May 2025 03:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994471; x=1748599271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljUhw3l6mm7ATweF/oxpOjmq5hPZR5pDy58kOhqgMu8=;
        b=arSLv1pt0nqnaBTl8uszFaRtiUcZgCEpCjSTyZJwt4m5Nbc1pkHXvkcj0v5wDKfycI
         4VVty0vnOi6ErwXEVf8yxxg5mh0tWGBx0ubVo8lxBIhlWzJeKCNEjMctOLZyzgftsLrT
         8I99STZK9uBA6bLr0j8JiZcVM1WzlntbK5wHCc4uxPBrmIZtGiw/xKIH+4EuvFae1Uc+
         OypS9hJ4k3/2VR7xjDNuO03LMaITUPiM/uUfAYkHS60L5Nn4pDkWMlnpYCFLCyYo+XvZ
         djmppowgf4oDT8/XAnyXsOaYy+nuyRNwv1RTCLnWuYa91f5rWDo5J8qoAARfzKzD7Ut7
         wN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdsApAnSsrF0ZkuLcc+UsKZGbIPE/LSXPI5Hyb0YdcWoHGuRSQ0Rle9j11R1i4WwuNM3xtWI0VBd0tbfo=@vger.kernel.org, AJvYcCWHfEr87ZpPKxHq/OaI5rjfpoyvCCr9Aj5lVwkHfmxfhvFmuLuTVXhCkrn9uY3b+dHIBpH0RlEGLtvo6wXEeAiaJBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MNs3koZm/nxCerG1MMkgQAV+BiHXOobIgGJ9ws/S+jL8CGpZ
	YhTHmtrCzHOxE1COa2G1LID0zsOS6yjpjpY/y8ytBERVtS+Eg86qFCF0XnlITblj
X-Gm-Gg: ASbGncuqV6ZJGUMrZmWzEU5I7CKFrTKqhYCeELEGql6vOH4LqYvAr2MfCW9aSZzDGMy
	KtJahAYV7BRruSoHekeULwIE2qCDJMLGGJRvigYauvGnq5sCVozF9m+apWP17eOyM+p0iNAiRB0
	HAiXU9Je63X2k1kvBycNKepP/hF5pQI2Y/A8JVP1ppeH46gIT6PN+w2NC8ddRviyWcnMYpQ3tyG
	c6UhsL/YJTJ1OahCsTNRLi1kFXCpNB7z4yvy537VhgAABCpD57sKhVA3h8n8g6Px2OsxZB9Ew65
	YR/Juo0HXB9i259l1j98wcV4K+CxAlbH5nWJI7AzVHgNQxyAPHEeDgmTHxQbLeuB83cLNwwuZTL
	ZzVQmxb5DIuEaQQ==
X-Google-Smtp-Source: AGHT+IFdFazaumxVqQJ1rU3p4iqDZXikjIMezvNxb55f/4NHPoRL6Wisr/Rz52vLxeTm1XrH8asXXg==
X-Received: by 2002:a05:6102:50a6:b0:4dd:ab6c:7654 with SMTP id ada2fe7eead31-4e2f0817ff2mr2420288137.8.1747994468225;
        Fri, 23 May 2025 03:01:08 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87de30aa6c5sm376842241.7.2025.05.23.03.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:01:08 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4dfa28eb4d8so502195137.1;
        Fri, 23 May 2025 03:01:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVav8JFdxvePTgmpgIEqEMevImWsmSRZe+w+jDyqkZ6inRhTZnmbuQ0rrJMn/V64ffpY1CFj/+VumRvCb0=@vger.kernel.org, AJvYcCXkOSX3pen9LMCKER505QX5sM+dxc3MzbZDnNvcFPRUzQlOJiQdQLAWvVW4cCzgRgHR1284wyG8gkHq3V/Ke72fVhI=@vger.kernel.org
X-Received: by 2002:a05:6102:d8e:b0:4bb:baa0:370b with SMTP id
 ada2fe7eead31-4e2f0818050mr2002599137.7.1747994464241; Fri, 23 May 2025
 03:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 12:00:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCmb-7-m0D9Lxc=mHKr9T98CeuDDcB_gkzn8Kmj6LF0w@mail.gmail.com>
X-Gm-Features: AX0GCFuUTEn0v1DK_5u2-5NxJ8qOKk5xtnN3mQwOPq-QJt3fSz36MTQILzRUFRw
Message-ID: <CAMuHMdVCmb-7-m0D9Lxc=mHKr9T98CeuDDcB_gkzn8Kmj6LF0w@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] soc: renesas: Add RZ/T2H (R9A09G077) config option
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 16:18, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add a configuration option for the RZ/T2H SoC.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

