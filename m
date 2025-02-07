Return-Path: <linux-renesas-soc+bounces-12933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CEA2BE4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 09:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AECF7A53B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 08:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB80188907;
	Fri,  7 Feb 2025 08:45:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175561A23BC;
	Fri,  7 Feb 2025 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917920; cv=none; b=Yg7VhVq/J85EdPpEIMGEFeMxkmGA/JZMeX/dtMetSp1mc4IFYZF3VDU00LFeM/ZgGrPM+DVSabHhkuBqbz39MNKJZHwQME5t/C6RJr3Nk21hy2pRYwEXbDbBhRwXHyx9zBsBJgBSxeS6HGXYUTsPuCpfz4NHTJqty2GlBff9Dws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917920; c=relaxed/simple;
	bh=u5uf4Tir0xtyLJKs+PEP57pDaPKUCR5Tk4tC6W+Pwrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alAUzNizwhXFfPJQf+corWFAMQHXGlEQhrISOzr6NeelD38DGsn7wCDkMQF+DHAGlhyvWH3AA7ZO+iiOSFvZr10FoMNKh5fhKX4WflB6EBaqNTMd9XAZxb/mm8VhTnQEhixdwxFtHK6f/JcCXcC/+CDPLpNBEs4OJwiObFU4NAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-866fbf798baso366979241.2;
        Fri, 07 Feb 2025 00:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917915; x=1739522715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBXViw2B5++lx3lKvCWR8ZB0A4ECbVpnUmvGe59jHB4=;
        b=LXekXXfTj0Z+jhDtTQCyxXnRuHaYIU8gLAXcJXinj9kWyW3rR6Tc5H3mAP2VFwbezE
         o22NYUT84p/L0+Nt3wdoWucSJV1bDLdE/9Bz6jZcp4y3jP9f8RQuaBBGhL7eQk0phYyO
         r65q4hm2EGfpiAqunfLQSLrW5W25Arrg71Xj0+RxQh9+4i97UqqaeY50+VLezlJj2x6M
         ERzsr4ZOFQdQMXGEBNt1b7lpLawAKbqKk3leSu+gmMwLil/k70aG75GjQvlLATYIH/yJ
         OaEOk7BM8d8uzP1y2EQ8FsFwrc6q5GXZbPD4fyaQp5WdVXKsgFehUPPrRt06af78RUEf
         9ZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/I3P5q8aURyA1sFRR45B/z/AXNyGe+z0d9Gz7SMZmDIXG7I3fctAau5lgbaWVp5DzO19gxaBEwVKv@vger.kernel.org, AJvYcCW33S/JDRTFmkcD/Tc4vBX0pFPmOkOfIBX54ikZWgoWXoCfksb6R1vDhysfeQcfO/6H4ytXDgcAbboJuJKy+rgbe1Y=@vger.kernel.org, AJvYcCXrn+YJwB/zUl9VUTSM1v+peTrvPNps72bnPwM7ZEkJjLIxkl+HO8OwStk+UqahGh2vJJN7OFiUX44cK+/i@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXQmau9PlsJyYGyZR3H7t/L63ZFF1+/HQBbDPZKFbbl+8zxxg
	CWlLgOkSuCYJQyvSWzFhQTlDyxaSJjX+rEmKQQz347UW6HcyQYfj7xpQa+gn
X-Gm-Gg: ASbGncvsUaWrWo/BrIdfpd0BG+CGuJrvMJbhGUs/ktzJRA8+zT1HR0bBKOsLpb/oShK
	vb+LqdJhDCbAIQmvyeNgjopO0/9t/MnKjQOoraqSN4TehHARe/PPOqYax4pijP/czHRVnGvbuip
	lYpaDw/ksvFbifiVwCgN4VEx6qASAnwV3LCWMFsu3bjBRM+LKNNOknk6Ugf/J6Bt484x+Yq7wP+
	rZpnLfJAubO3bbHo4U7PasbPOuqRX4rFdWDo79xuvODGk3gxnfqJGerDVaSL1v7NzpEbc0WvEt1
	M6cLR6l2xcC0YJ/L6BseE7Z2KWmI2Kzb/JgnkF2NJWS/DtA2/+aQ4Q==
X-Google-Smtp-Source: AGHT+IFnQrVzR9eRppe56mDFwd3I+xj3xG59VzrBWgMBhhoNMgKb8yVkQOAbZPDqOowSoAPJ3kTx7Q==
X-Received: by 2002:a05:6102:578d:b0:4b1:340a:ce63 with SMTP id ada2fe7eead31-4ba85e3dae8mr1279456137.11.1738917915216;
        Fri, 07 Feb 2025 00:45:15 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba773045f8sm560930137.26.2025.02.07.00.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:45:14 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so517213241.1;
        Fri, 07 Feb 2025 00:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV65zjgcQQACjbK/qJd2Aj2I1d3wkGWC39AycXTsG0fACPIfBaQqN43bg9yg9mYd7mKoIDszHYrjfIR@vger.kernel.org, AJvYcCX37+8vENechgh3LQRrgXn0OhKb78H4ZkOlbzXu7FEjO+8Tj5UhsOpgq2Qx2YWCtF5nnPzGcb4pfHs99Xao@vger.kernel.org, AJvYcCXuMJf+Etf9d5kHH9v4BPYJHJwk/NnMFJ/7b8M84+nw5U0G3g0Bv+ZzRLzWiodJqPgYrRrw6oe7FWclASI3zReU6cs=@vger.kernel.org
X-Received: by 2002:a05:6102:4b13:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4ba85df078fmr1195440137.7.1738917914082; Fri, 07 Feb 2025
 00:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com>
 <20250131-myir-remi-pi-v3-2-2dda53e79291@collabora.com> <CAMuHMdXAS6pnNcT=A7i9La22tbDXYf7EKqbJzHuK2ze2gf6cgg@mail.gmail.com>
 <950770a2406dd9ac3163e677c6d887d06df5b8c6.camel@collabora.com>
In-Reply-To: <950770a2406dd9ac3163e677c6d887d06df5b8c6.camel@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Feb 2025 09:45:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5yn-ups7+uJqmEXcZjZ=LqxmxRPfFM=zLh+EvWsC-XQ@mail.gmail.com>
X-Gm-Features: AWEUYZmxZYxOa7pFoJM9l8ZXRqq9cw7oUCIl5Wo35rPZxgOoflR7oSAg2hN9nGg
Message-ID: <CAMuHMdW5yn-ups7+uJqmEXcZjZ=LqxmxRPfFM=zLh+EvWsC-XQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: renesas: add initial support for MYIR Remi Pi
To: Julien Massot <julien.massot@collabora.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Fri, 7 Feb 2025 at 08:16, Julien Massot <julien.massot@collabora.com> wrote:
> > On Fri, 31 Jan 2025 at 10:58, Julien Massot <julien.massot@collabora.com> wrote:
> > > Add basic support for the MYIR Remi Pi (based on r9a07g044l2):
> > >  - UART
> > >  - i2c
> > >  - emmc
> > >  - USB host
> > >  - HDMI output
> > >  - Ethernet
> > >
> > > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> >
> > Thanks for the update!

> > I fixed the style issues locally, so if you can confirm or deny the removal
> > of scif3, I can fix that while applying.
>
> Confirmed, we should not enable scif3.

Thanks,
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

