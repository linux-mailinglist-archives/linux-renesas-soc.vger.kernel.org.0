Return-Path: <linux-renesas-soc+bounces-14050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340DA54642
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 10:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61EB6171E3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 09:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC96220101A;
	Thu,  6 Mar 2025 09:27:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3E20967A;
	Thu,  6 Mar 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253257; cv=none; b=dL2nf0Vi+LBfnrS9oXTiu6KbF5EbJakLnZzJt4+RuDJ+BkOpUOi+WP3hB6JHq9l3it0Xt3CJUNtgAY/9JK0GwwHf215lE/qmNCG4t3zj/DxQiRSMHih1e0Mjjy8vAT4jseGqAAzPyHGzW9GKaD0jOr9owW5BtLYOmtES066AFFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253257; c=relaxed/simple;
	bh=Xclms58GZcd3iNyePkg8sI8vYZGcYSOTX4hu3NAdpV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVQzHN9+3Gel1wCGfN7XOU3lftsOmo3oDPt00kraTN92uINuDuwWQMq/As0fD2rvcjJPaYljkaPW3jb/jmeMBswKum+rTZTY/P6Vc48G9LY09hlm/3yVDAPx7pKW0B7g4aZw63rqZlAvpnq4yOMlkoNwabE8Uo/8fghUclz9TUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86b6be2c480so143242241.0;
        Thu, 06 Mar 2025 01:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741253252; x=1741858052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdQx+KIJsDnJBVSMaGvkI3YSEHabOEVxnWoOVvE9sdI=;
        b=pevN3Qw5qJRtO+4f7bTvuO1th8AeCmYEIoljoW5GTYM45jWb1eK4cG2xyjLXwPXgo6
         327dQsj00Pwt8KhcWByuYo3+sMOKkZVjEwtka1LSQrxWRDDeBPNWvcY1GU+p9RRoleMd
         Lkz1foEOxraMqNR+9ff5cfNr18xXcPAQ2C3vwg39vN9k7WiwBT1RNbTzTeO+fYJ4BecK
         oyzRp1vL95Lz/5nL7BYKhTJSww/TgtHNtZIaFntvJep3gbnP5UDxCrTay9XujuUM/H9M
         PqcFY9Tvcck7llKTNkOrbqApHvfW2ojqwk60HjqL/wDv1gFWcDKyx1F1GEl6CFA3/xJ6
         lnjg==
X-Forwarded-Encrypted: i=1; AJvYcCUx3rHhLmmkMbf6kLX30sp+ir8T4XaZVu4oWk/s1hNVJQOt63gjcTkbwnPvNhBovcV4/Hr41mS5gPU=@vger.kernel.org, AJvYcCV+gCseCusZ7HvQ1jz32YE+iKnq5Bb9pbBUIvqAautLA6SMq4JknBWDKykkurvoCVGUV9OKRGcD19tslrUEaM7+k00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7UTT3xBrTZBQVJ6FLFJ6lT6yOC2AP5wpj1E8uTVilu8Nayc+
	ypX4eCSWWrJWSV1x4Zz7bjU0MjwsLhBHFaTbNsXICTeQRNaE6stxjfSeEG/9
X-Gm-Gg: ASbGncsTsnpHoEm9ZmZWqJYjdiPDrj9iYAgkozcypUHZuktAFAl25fdEwBhTtyVQEEe
	qHwGwfVojxupOcFwBOUUHtEj93PqrEKVzvKsnsrH1OCER36PjtHFW6cPTyD6uICHophwRsW/Rht
	DHTHo3UHCmbrOzuO4PLA1uR7/TcYJabAeTAgbMQECME1SLcP5aByYxMhSkjxnrVnd7WPv5yWc83
	Cwdmb8NwXSOCG+JALR2M4FRD7wMqa3dv70IXWr4D+AZUw04h/gdkVYarYLgB1oUGPZaPaYFaoWj
	yA8CY+T2iU6Qqs74bSX5UoaQZHbG544IS+GXw/8X2Wh8Zbs6k8hZAVAhzcTqDSXQG0FMqIyXAW3
	LQhOhl2c=
X-Google-Smtp-Source: AGHT+IEFSU4sQz7l9qOmoB9JxeviVy8pk30eiCgEzyNPfxw/M+wUNjq0wZkCZiEe/Tzzcf9DXuUfiA==
X-Received: by 2002:a05:6102:5491:b0:4b6:5e0f:6ddc with SMTP id ada2fe7eead31-4c2e27fe211mr3940422137.14.1741253252465;
        Thu, 06 Mar 2025 01:27:32 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d33bdf83asm149878241.8.2025.03.06.01.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:27:32 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so154394241.2;
        Thu, 06 Mar 2025 01:27:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKcxLvWzJV69kODeq6y0MLzNbk8c1EOqwqpZWa0NeIY9royuhcDUcX2AH5wRtlW7c8et9bpTbpnwQ1fPA3lP6X/5Y=@vger.kernel.org, AJvYcCXK0sso1u/rkys/n7Zml6WH+BNl+3aPOSSmqxfNvvgakYkRkd9TNa4nej0xoAGfLaLb3WesixhhunI=@vger.kernel.org
X-Received: by 2002:a05:6102:f90:b0:4c1:9f48:617e with SMTP id
 ada2fe7eead31-4c2e2971af8mr4003174137.21.1741253251858; Thu, 06 Mar 2025
 01:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222142009.41324-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250222142009.41324-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 10:27:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4EPzc+_kzpgfhURu_9yq1eNJB2CeOghis04GZPknY6w@mail.gmail.com>
X-Gm-Features: AQ5f1Jpw1tHYD2UOe-1lIF0b3MJIrK9V3tez1L5A3Mfugh9nSp44LVgCDu-MAts
Message-ID: <CAMuHMdX4EPzc+_kzpgfhURu_9yq1eNJB2CeOghis04GZPknY6w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h: Adjust for CPG_BUS_m_MSTOP starting
 from m = 1
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Avoid using the "- 1" for finding mstop_index in all functions accessing
> priv->mstop_count, by adjusting its pointer in rzv2h_cpg_probe().
>
> While at it, drop the intermediate local variable index.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdX1gPNCFddg_DyK7Bv0BeFLOLi=5eteT_HhMH=Ph2wVvA@mail.gmail.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

