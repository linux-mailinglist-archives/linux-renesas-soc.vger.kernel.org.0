Return-Path: <linux-renesas-soc+bounces-22711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA2BBE7E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE841898A7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB9E283FE5;
	Mon,  6 Oct 2025 15:33:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A7B283FD4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764817; cv=none; b=WxihfkBaCyKWuSode3UOyv6AsLa1InVf84ZWpu2UpOI0di+Npoq9RrKZsjedTJ0pqyGApT9h+HrndfAnAaHULNcehzBi+mv95hFdjVfK0SqCffoZ/O6K81jQEgtSvDI9aPijmV4dDV1iNWX86hQwxBjM/8+46PCCjUoIPG333pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764817; c=relaxed/simple;
	bh=dSnfb3yL4QKj2jW1vkztCLpaRi4oy5M2m+qzcux2G/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Td26602WuPrsWBz9wBkHbBDfILdCQ66DcDWEWBtywUoHXsU5QsiesJ3kzDPMvoR9mZfgIkPwdQOtZQ51EEycugWMEAuQPg4gJP7/DW3H7oKQlA2372LIUznZ8gJDn47h3F5fVJ5s8KQk2JYahA5bbR2IuQEVQ9NVrtkr0mvQiDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54a8514f300so1703968e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764814; x=1760369614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jg3+SSfQDF+38T7p3MLG0Dd2g8S6PQVTqm3cXu4YzM=;
        b=Gj6MTe4Qr57M4dLrb/mUE2eDIFNb/nnO98DSXQVdn5ki57ZsO6cb+kSnmnuynjOsO7
         BNbqQAwHUDejl7CXYA1Ko+mupoRar0EaQGOM7jzTwMgCrnmJUhSrEnG3SsKiizMes40V
         rPjwPm5Djr6Tl6+OtzvpJDmxKu5lgIZOHZXJPiYQBbfyQMRLgE//jG1eJ0DcKVCa/6s7
         tV1NcKIW7YGfzL7hlwlNKazA/cd2ggb/xm1XFGdh8PQFQrRNVMTn4qc/CcqRxt19XxnX
         TxAf4GrbwgBp2mBkMjeFEiJwifE1olQrfRXaV/hEBAR86QdpLn5qY3UfOxy5RhE1Nc/z
         eo6g==
X-Gm-Message-State: AOJu0YxuVnQPSS/9gypwWGxwPCK21omunkHPz7gEAYBewjVmvhJ6ChPt
	Q6eYF54FU3LRlxK/1vTriIzHRtPrmBrSao3JurzfhgWLd0Rs4bzbTMfUgYg3Wvt7
X-Gm-Gg: ASbGncv04Zn2wbcYO3ehm2DyB55OU2VXvFIY/cDb6wr7a83dC73e1R+nMPUrUGVB67K
	k/XJqGLfDBjWtuntdmGlu9MntQC0SHmPEeu0Irti+Wo/yj3Szz/+CeSOwUsH+TQqGIMTrm4ODIo
	uHez1sHZOuq7ySJkTvYVHiC/fcdWBnNv0z1R9BtGi13W0mX07KleycjH5GQFTcL6j6xfhe+MlQl
	XHapgWHYA7XQQfWRwSs+S2acmnNm52GOvCbkuwqmc0DkK5KqwXa1zE553WbdqIxz4jVzFx+PL0t
	PTd+pqb94dwotjgXYX2SQofcSK0R8dH96R1jTR/4OVYQWQZrH3QHyaR6gGsFO2JZNJkEAW4IRnC
	74CXVr75G3ubspDV+QywszWH+C8JL92jwKpAzyNxKDdsRz4aIAydb3BNPXSFCnwLgKpotSFMQyM
	ph/zNUXF6g719s52edTVs=
X-Google-Smtp-Source: AGHT+IE3is2/NuQvO8fq4XlWuWrwy3gEJ+XNhqPxDJk9kzi2vcaK36I74D9CjFjSww1veSOelBD5UA==
X-Received: by 2002:a05:6122:32d1:b0:54a:a048:45ae with SMTP id 71dfb90a1353d-5524e846a6amr4548735e0c.1.1759764814258;
        Mon, 06 Oct 2025 08:33:34 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e877sm3064981e0c.16.2025.10.06.08.33.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:33:33 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-904d71faab6so3605142241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:33:33 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:527:8b63:790c with SMTP id
 ada2fe7eead31-5d41d03254dmr5118602137.7.1759764813699; Mon, 06 Oct 2025
 08:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:33:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJJ+Vef+kHZcm2+OadnZz=ukY_CMeOTmoO9nCM817YAw@mail.gmail.com>
X-Gm-Features: AS18NWAbNGa1AsJZ-Y-KAMjjloR3fHODpxDxJEyA6s4bxkWy6COg3JbaqbmNuNA
Message-ID: <CAMuHMdUJJ+Vef+kHZcm2+OadnZz=ukY_CMeOTmoO9nCM817YAw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a779a0: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

