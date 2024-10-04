Return-Path: <linux-renesas-soc+bounces-9428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB8599050F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 070D91C22A15
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F0F215F60;
	Fri,  4 Oct 2024 13:57:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDB2141DC;
	Fri,  4 Oct 2024 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050237; cv=none; b=S26COxbZB05YpaL35/zTvC56Hyg6G0X5zUai/qE4vuQZo+red3bOEoD77Mw8SQkmqlwxbuZxa1xpX7ywIlU9/0XSfGFiH/IPW2w6xusBhNjIzsz/njXF1FJ0++9+KeL0FhJYJf9j4+YZ+1uELGp20oqYTGE2yGC+UMlcWlHk8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050237; c=relaxed/simple;
	bh=kzvehQB+L0tO7TxiItTIteZGiHS/2QUiwTEDDjnbKJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMg98fpacP53YY2tQtaRNlzfqqgDpVTSZC3MgVSBYQJV+8gtu5eVnP+N7sFLrP/3DzHp97FvM2AH9i/tOsr62qQfLP6bKEVTSOHeS8hHmMifmAuvpqZiSuyUtw/ZyaJZfnUA0zeuv+pUF+yI965VUHde3EvTvQNH7d+TCw50qwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2d36343caso3393927b3.2;
        Fri, 04 Oct 2024 06:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050234; x=1728655034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dt+tRMO+kb7ohi6uzJ4m3wlyh86vOBzqwTQQZZxmxyk=;
        b=MbpGwpqaW9LyLLfQXrQyip8oQwZyL1Xh40DZdNoHEWgYBwsnFBFVkQqEk/7mQxHJ78
         GPx4+tCZxfSuO48vgQ1rlt1AfiGmIktH1YwixjzuwaCv+rDN5eZ23FyEqK6wWPQjsvpM
         f4jJ6c2ZCChxnBgB93+MM7j6OyBEBZAIRb0CWbFEKzZTWWNXMxIKPOTBZ2KCmlBgLmcN
         3wrTrFdjdYROslZQ2yaZ1FIEouzovR/oyWgd1ThYG1HZPNrdrjnHqxumgmkvfGRcQzmo
         lp6v5fSDlP6e0BM74Pc7KYA8amW2uQpTj/PfipCfRFvf5G1Der9q+Y2GPJQwJYP0+W5j
         2seg==
X-Forwarded-Encrypted: i=1; AJvYcCXaJFGH7PdJxI4eT4Gpmc6wX1Z5RD7KNNpQ+rczJ73omCIPV35J5AddEwGGG2Fn2U6qM0/1xbJZiuKp@vger.kernel.org
X-Gm-Message-State: AOJu0YzPImVB+8lGo1z//xza5BDiv124t5eYrOO1tpokf7xdIBdHHw3+
	yKWHjsPZLMEjhhllXboF2CVFiPOn8DiGwfZ1vBfBs52udF3a0k4Dy9PpGhKVMc4=
X-Google-Smtp-Source: AGHT+IEmWeahiyD7O/sL4Sc77bEbOACzT3z7xAmcJTADAEWIgJwdhB1wKEd4NDtgHf9dvziy1Zqpww==
X-Received: by 2002:a05:690c:d8d:b0:6e2:ac0a:890e with SMTP id 00721157ae682-6e2c6ff5155mr24969857b3.6.1728050234438;
        Fri, 04 Oct 2024 06:57:14 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbead375sm6587637b3.51.2024.10.04.06.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:57:13 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2326896cbso18280057b3.3;
        Fri, 04 Oct 2024 06:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdnUvu9GteiO3AcmlNCjoglZG7WXuqZihdFlAnaJ3FdoSl6jYnS4mj+wavVMcmNinZpu9BFLHWLJxN@vger.kernel.org
X-Received: by 2002:a05:690c:60c1:b0:6e2:1b8c:ad28 with SMTP id
 00721157ae682-6e2c72423e7mr27736847b3.24.1728050233336; Fri, 04 Oct 2024
 06:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926103340.16909-4-wsa+renesas@sang-engineering.com> <20240926103340.16909-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926103340.16909-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:57:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNa-5tE7CCEypD-7rN60euGEphGmmBxQeixannP4+HXw@mail.gmail.com>
Message-ID: <CAMuHMdWNa-5tE7CCEypD-7rN60euGEphGmmBxQeixannP4+HXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:33=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen1 has an LBSC which has quite a different register set from the
> former BSC. To match H1 with M1, rename the nodes to LBSC.

M1 with H1?

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

