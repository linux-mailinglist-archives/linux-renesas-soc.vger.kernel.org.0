Return-Path: <linux-renesas-soc+bounces-13959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E055A4E021
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 15:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22341644C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6C32046A5;
	Tue,  4 Mar 2025 14:05:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32221FC7C9;
	Tue,  4 Mar 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741097104; cv=none; b=iiTaXEvajUfivbSoWwISIBuUdsLqcjEYkFgvlRCjJ/CsYFnFEJlxdteQlgbhJqN0WPTuuzsC/0IJbyRyTLDhbE9GEIk1siRGaXjykOGmjSesXO29d7E1M/yYFrr2OKaeLB2wWUqgL1NwNMCq4BI4dc4SDUUwMyy1Oy68areSBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741097104; c=relaxed/simple;
	bh=1eoIIC4qiHRnKRLjedXcJ5O9iur+JZ4LV8C6XUhe3qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuevJAlDf7VaTcrZoMg1ElXaKN/IvQ4jRm5U/cPH1jVulYXkH5y5aweBtqNjLs6Wn+R+abKbEeqR7tYyYTqgj50iZI4h/yfgdwCHXb92dkjuMsnLNL7g2bQSk8XZRVwN0dJBaogmbQwD9UEJT/QehIC3POiwSJkvt9MFci/P/eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c3b533a683so243580985a.2;
        Tue, 04 Mar 2025 06:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741097101; x=1741701901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEGRTygTyU6cymLHKZseFJhmsuIezHZQHssj+Olk7dA=;
        b=oOsKP2EtuHAiJzsKQi3Xjm34nzzq0tlBwOyeYJg2xzAhZIKzINZy339df/TMIcLM3V
         mU1JKcoTLSLB/z7Z/iky372RLBLwZc+IGWr1XepxhPmS3rpWOiZ+KoUMfXfqnhaxm+by
         Q8WHCqpe0f5UIHmmxiMMcF4CC1kXIuA2XDfMjNFYb97q2BY809vQeXx+NBbPUxixI7ps
         Uxb5SsXp0Gqmo7wPU1fQKVPNnMOjwpJjSGfGZBnvPeuk2a8vxgXG7jg8EzPFG7vOB0uv
         mQE4dq7Dq1iTZzG6rr+KNoCK3lNYtjKsW38DNH9XEJ5SSjw0M/7XvSYIflXiLIvH1hBx
         2ZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5J2JyTtRgoYdZueHCW3D4XBjQqF/oT2ulBiyOvfw1mKcqEJ2Gmkj4/xgMmkVyRNnrX7km+k5taqZaxWXr@vger.kernel.org, AJvYcCUoa5KnKP9KKAjCP7XRUTrj3sQjT0K5k68s/ERxI6puTaqE7tc3IRGjVurzGW+6hXt12MK9rRnrbIdXmSmIQCiyO1s=@vger.kernel.org, AJvYcCV9L7EyFH2rl28/gTrIGumLj1OHEDMXpPBxT11qMfcdpUjKI//6EyyJOKDAxzhL5Czo7G/bSDQm@vger.kernel.org, AJvYcCWBOGagp1egzs4ihQY4vIf8K5IqnXwzT+GHn3VdSYRR4IH0rlqWgLWHrDAcvtzkb6Ms5TwWXBlOHz4g@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQ/xAZeeWqFjSOAovnEzA45kSWYbErSUSo38qYa8/65K1ahTv
	ltVPod5QNjdRKcEzcuvBoDUh5WewBgR6mp6l8XUXPtqWEqvAYgBaJYGcuIfu
X-Gm-Gg: ASbGncsEt83bXHlolzm6ekHY0leFM0XYb1GRMM9X2kDyzO8DlkshjcUm5+Ko20INCpg
	/8FbZG4ZRGCo4WDutH283okyhZGY6pnifz21QFw9lnB4cR8kcnJZcEtVvcylKdaFF0bpxYoiw3P
	6GJ5T2z2ro3Q92uab5RhmhkKH15cq1/Xzt12yX7l8T915vNliswMDzXknEtWPYyI9yW+rQ1TRTm
	YbDMfEZ8ArEtmeVHJ+Hz4W5yBuaEGjDRjeLd7vlhsLr5uqMpFoE2WqrH6OdxPD8ddNUD/Gr6mIz
	4waTLS/CcIDwWamnNJdRckmvXfPvRHpDcPpBuyA6Bbz0Q1W2zJy7DuU1i28oWgSN1mf+UPOBftd
	eB6q13sI=
X-Google-Smtp-Source: AGHT+IE2N8f8hUagKLqg+WW0SX5zS2E+TiqiD9xESm5aR7zJzYlyjIWpNTeS1f6CZd3NHj8CEiawww==
X-Received: by 2002:a05:620a:26a7:b0:7c3:d3a1:6f43 with SMTP id af79cd13be357-7c3d3a17071mr174218585a.57.1741097100956;
        Tue, 04 Mar 2025 06:05:00 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3b53ce7a6sm322668285a.31.2025.03.04.06.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 06:04:59 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e88983cedaso43141756d6.1;
        Tue, 04 Mar 2025 06:04:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOSmxwrOqyDqku76a94/WWmtz1pA64t7uJWEGottWGbSsATILfz4aZ1LBlxlUJNZBDOmWdP7IfjHodPeem@vger.kernel.org, AJvYcCVktdYIZriim03kjfud4VwPDbrwe9ztsi4T3WggTkF+6Jm0nQUTOeIHMCDqdqsrPdf4JpU5OzuqjVzg@vger.kernel.org, AJvYcCW3gFLL1eK2c+VVADAINAdnA0hhMxvzykcz3pK2Gc0dAbXkAgmXcMAQaRiILgZzeNFfuHzNWeifaInXpThtY/G3/Hs=@vger.kernel.org, AJvYcCW88syuJ+YNOxeSuZTUMzT+Bw3L/4uHdXwHgTZugvglUtDRWj0HpetljevJ3s8u0dnzdPfdNOUB@vger.kernel.org
X-Received: by 2002:a05:6214:21e7:b0:6e6:5aa2:4e4f with SMTP id
 6a1803df08f44-6e8a0d80ce8mr261405046d6.32.1741097099661; Tue, 04 Mar 2025
 06:04:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk> <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk> <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk> <TY3PR01MB113468803E298C5FA6FB6712886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z8bPPaT4Vsob4FHH@shell.armlinux.org.uk>
In-Reply-To: <Z8bPPaT4Vsob4FHH@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Mar 2025 15:04:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQkzDhJmkpGah7omE7UqTgM3GSpVVDE-1mh9wW7O8vBA@mail.gmail.com>
X-Gm-Features: AQ5f1JqGYJsTOdNI9PAwDvGf850hGSzvpOQrNGjb6j2I3wF8GT8UjrisfucgoQw
Message-ID: <CAMuHMdVQkzDhJmkpGah7omE7UqTgM3GSpVVDE-1mh9wW7O8vBA@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="UTF-8"

Hi Russell,

On Tue, 4 Mar 2025 at 11:00, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> For the failure to happen, you need to check whether EEE is being used:
>
> # ethtool --show-eee ethX

Doh, that's also not supported on Starlight (BeagleV beta).

I tried unbind/rebind regardless, and it works (sort of),
using the old Beagle V Fedora rootfs on microSD:

[root@fedora-starfive starfive-dwmac]# echo 10020000.ethernet > unbind
starfive-dwmac 10020000.ethernet eth0: stmmac_dvr_remove: removing driver
starfive-dwmac 10020000.ethernet eth0: Link is Down
[root@fedora-starfive starfive-dwmac]# echo 10020000.ethernet > bind
starfive-dwmac 10020000.ethernet: IRQ eth_lpi not found
starfive-dwmac 10020000.ethernet: IRQ sfty not found
starfive-dwmac 10020000.ethernet: Hash table entries set to unexpected value 32
starfive-dwmac 10020000.ethernet: User ID: 0x59, Synopsys ID: 0x37
starfive-dwmac 10020000.ethernet:        DWMAC1000
starfive-dwmac 10020000.ethernet: DMA HW capability register supported
starfive-dwmac 10020000.ethernet: RX Checksum Offload Engine supported
starfive-dwmac 10020000.ethernet: COE Type 2
starfive-dwmac 10020000.ethernet: Wake-Up On Lan supported
starfive-dwmac 10020000.ethernet: Enhanced/Alternate descriptors
starfive-dwmac 10020000.ethernet: Enabled extended descriptors
starfive-dwmac 10020000.ethernet: Chain mode enabled
starfive-dwmac 10020000.ethernet: Enable RX Mitigation via HW Watchdog Timer
starfive-dwmac 10020000.ethernet: device MAC address fa:58:39:0a:37:37
libphy: get_phy_c22_id: mii_bus stmmac phy_id = 0x00221622
starfive-dwmac 10020000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
starfive-dwmac 10020000.ethernet eth0: PHY [stmmac-0:07] driver
[Micrel KSZ9031 Gigabit PHY] (irq=POLL)
dwmac1000: Master AXI performs fixed burst length
starfive-dwmac 10020000.ethernet eth0: No Safety Features support found
starfive-dwmac 10020000.ethernet eth0: No MAC Management Counters available
starfive-dwmac 10020000.ethernet eth0: IEEE 1588-2008 Advanced
Timestamp supported
starfive-dwmac 10020000.ethernet eth0: configuring for phy/rgmii-id link mode
starfive-dwmac 10020000.ethernet eth0: Link is Up - 1Gbps/Full - flow
control off

Apparently the MAC address has changed, so the board got a different
IP address from my DHCP server :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

