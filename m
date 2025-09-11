Return-Path: <linux-renesas-soc+bounces-21772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C42B534F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 16:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3DB5A352A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739BA1A0BD0;
	Thu, 11 Sep 2025 14:16:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DFB2F37;
	Thu, 11 Sep 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600179; cv=none; b=BAvnkyGmBX136JbUH/lQwPzIc7BLLxywzHYDyjjacojKPd8SYEPeRtDi+4pVN0jVwBcq+8xNxTAaKAGlTeIMGUhNLCWiElu/FTEJeQTgwr+ISRPqptH92MAaHMm/XrPJoL9tix7bcfRYZOKXpfK9p+eVtXS0Fiq5CchADW0az5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600179; c=relaxed/simple;
	bh=78XtLP/BTOocTZuOujCHVMdfqbYWpr3uMcENeX+6wSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xt8stPnfLF70/hSqBm4/D8z+hvM2/uRmWARa9C82QRA0CD3IszIes/drw4VfxyNG3fvk4jLQFO9BxrUDUri5DxGT/oxXZ3bBCYbZs8zNDkXCYl1ocVnFHau6A91Xe67xFAw4qLZl3F6SlmoEQzEgPAMuuscZ8DtkhQmvekxI0J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-52912c1c805so434271137.2;
        Thu, 11 Sep 2025 07:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600176; x=1758204976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx4aRa/DYxNYojHtYq5HLhlClHIAo1vhCbhvxpbrlU4=;
        b=fPuGiQNScCtK39hdcywPw5LY388LDBD621Dm0ujnmCV+wYz6dEV9ttaYye+fKfCKnh
         Se3KYaPRwyq1vXWUo6gusJaGgtN3O/QNw8k6DO8BvCPQ4ej1gFA0O96D0APok65hy0Gf
         4ooVTf+xo5l+4BTyqaH4WHOMwGDLRzCUcsJf0+IkrTI2qdbFh4ac7DL+CmL/Hc+VEgY/
         QKAojIT91/67fAaQDALbkOcuKk/3yWxRew9/PrEQzDk5Jc6xpwFD6ixMU8uvZRE8mC/6
         M6MQW34U05Z5z6b/beKtSRkDcD+eV6LVshzH9FZgJiE67eEzhXAP7kbUsdo8pKJVKYBu
         YlrA==
X-Forwarded-Encrypted: i=1; AJvYcCVhoZi/phiOMGcl4qKpnYn2Gcrp8OZrb9Tsl0IO9bc9nlse9mbnjwItU1JvaUm82H+yglo8bXyz6vzohQKSUDsfb7Q=@vger.kernel.org, AJvYcCWxX6bsZaD/lAltwCUBeu3Josvz08cfzdjr7nl1UpXA95KRWljBXWczwDG3JgRNOhp0VwFdxlm3OBw1vrju@vger.kernel.org, AJvYcCX8PvIIsrpO8YbInFkTZjVc9KTS5Uo7v+The0AvIu8jadL/iO+0kr0anlBZt7LgEH/C3yW1fqwvKHP4@vger.kernel.org
X-Gm-Message-State: AOJu0YxWZchsBgdETqLOJV7Y2lfzaj+gWW0m6WJ3DxQui7/Oyy8Nw2jb
	cK5wNY4p+ja3UDMGgCdDgJlN0bNPC3gZTYDS43bn6FeFlVfLwwfcrZiWYD48mx9J
X-Gm-Gg: ASbGncs9kOocOgoOtNaGTltwPeU+kH/AndycrgglFPTNOsrs0Y3P7iK7fZgl8gLrxSz
	LqX9d9ciBog2Iyxz6Kpvqgkawg/2bwiTZ0BbSH1ubPBajotw4txEpq8L1Zzx3DiGxhf3J45EqEX
	BpIrtg6vkoCowu2nLstOcehOZEto1vaPaQDhNXz/DeGELoZxxz1mSr2Ck1X3/MG0yPMJpyO8NDy
	Mp4BCiuePWsoUcZ7R3KCoewK+HT7WSdRIaAc/wlqGcUNEH7/U4WWqXjfqyoVr3yQGxbCwfrJR+V
	o1VN7A9EG6U39sWDdkRMVOnwdd2pZ5j5FtwoMR1CKlD6YQLWejAe7EknKMJW0LV37Boc6ZN2O8m
	fpWx4euWCgz3FZfOCYzM9j6Fbved+erSQOdsiChzOzc22fwx4Z3//JqwvfJid/AXLXSx58Sk=
X-Google-Smtp-Source: AGHT+IEgRN8yI9HrUXhgMbtS4cxoahhDSVs0IISa2glL2tFdMOyWevPCJDT9gFlfHNLNyEDpRj8B+A==
X-Received: by 2002:a05:6102:c8c:b0:534:cfe0:f854 with SMTP id ada2fe7eead31-53d22e1e7d4mr6760746137.29.1757600175699;
        Thu, 11 Sep 2025 07:16:15 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5537062ca23sm335826137.6.2025.09.11.07.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:16:15 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-52912c1c805so434255137.2;
        Thu, 11 Sep 2025 07:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1ourneaNmjkgdibOgUGi+ZVX7BFZDm60iAa+VHCOUwO9fCHM3ua19PkFEGmfZcYc4fbXkJvvsSFxU@vger.kernel.org, AJvYcCWnUCLp84Uf3+i5i+SJdRcnzAYLg/7WoNCJwDiPgdEuqwuHKOg9CeCPuJx7FA0UOIU9VSUmN9KBh9T4VJ1J2IxQBuc=@vger.kernel.org, AJvYcCXHNE3U5aBwGp5uIKNXYJ8EXMzvaHAtj+osT+/QO61t8GWV33zJPk/aq/bsZ6/fBh0MWZ1Cjk9S62CmJyyq@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:524:b9b7:af01 with SMTP id
 ada2fe7eead31-53d1c3d6e5cmr6980412137.10.1757600174723; Thu, 11 Sep 2025
 07:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814153456.268208-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250814153456.268208-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:16:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU6=sLCgAe6pGjdt8wpq6yvx7e1bEYPO5TPQwnHyziVw@mail.gmail.com>
X-Gm-Features: AS18NWAegn5j-m-Dd9bPo2kyKUVHNv4W-i4tNuR2hLzsoad5LDvMrWiiXXRuU1I
Message-ID: <CAMuHMdVU6=sLCgAe6pGjdt8wpq6yvx7e1bEYPO5TPQwnHyziVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047: enable tx coe support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

Thanks for your patch!

On Thu, 14 Aug 2025 at 17:35, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The GBETH IPs found on RZ/G3E SoC family are compatible with the stmmac driver.
> They have a MAC HW feature register used by this driver to enable respective
> features. While the register advertises Tx coe support, it was not enabled by
> the driver due to the 'snps,force_thresh_dma_mode' dtsi property.
>
> Switch from 'snps,force_thresh_dma_mode' to 'snps,force_sf_dma_mode' to enable
> Tx checksum offload support on both GBETH IPs. While at it, also switch from
> 'snps,fixed-busrt' to 'nsps,mixed-burst' and remove 'snps,no-pbl-x8' for

burst ... snps

> optimal DMA configuration. This improvement results in a measurable TCP Tx
> performance gains, increasing throughput by 20Mbps.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, with the typos fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

