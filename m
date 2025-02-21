Return-Path: <linux-renesas-soc+bounces-13448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B5A3ED9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 08:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9D9E19C30A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5189F1FF1D1;
	Fri, 21 Feb 2025 07:51:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2C1E2848;
	Fri, 21 Feb 2025 07:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124261; cv=none; b=XHKPD2tYOgwDOEWrlcDiG1be8xQvxeUiRu0pRZ8JuyGS/sV7j8qPLCsKHVEdgZspKZNVuG1qiwZbKxdCrr609i6V9kWjnBEV8uXrh8bhYn2OiEZ6V7o2ON0WhMBlQzuR4QVNQqOYUg0MDNiChQRsGA6W3/FR57RFElTs5yV2YSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124261; c=relaxed/simple;
	bh=1kMNugAKyH4hzXjWj6B7lPTh+D3yutJkXAiQPKueVDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Avz7W7Xm344nzLHNISopdXupJHSYKLO5qtbCdBcb3biFt5XL9tcizDhtq5KgWUebNw0i9Rm65OWFg00Iv4RRhplrgrj6NRU419cHQG8f3Y+/oKMQf150nJx9HhBp2Xu257dBwe0UybfKqXVXBlJwX1JzrhxZ6CH6ozaiqjgpqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-521b3ebb0f3so511024e0c.3;
        Thu, 20 Feb 2025 23:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740124257; x=1740729057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxSgNBs1pQnNkNjgay4FGLNT4AcgrE/QPtbdFr16wxs=;
        b=SvaNNmCAtt7gBmqCEZ7peOXoaTdsVdTXDTrtg2sHcgykMBgMMLPs+De9lrk1ZnlE3x
         QoYknMQtRQLEyBaKNH3/gEZ9CU4EQiPMTumbco83ENwvKkspkWRkHChAnmjn+suDwRgd
         eWt8VRS2FL+LjzzjHMrCCUXlSvy/h3NIK8TKLtcoXIesmf59BeWMDRzwpqycoElMZMxf
         Lk6lfXYn+HOEeT40jZowYL8/0sAg9kB8QRjj3pe1fra//CirQXm4MdKG6PcaRAXBYBBo
         wDKuTRWaWjj0I7awqCMkLFUaylFij5FMnXcHHpCWpqJdPjlUlM9RVOGBLuJyEDwK6XzI
         DLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlcHrDiYJZyKjJ1KvT/Cih6aJ86Sf1AVuJb+W3jJHf8AUUjdcKCxtzx5lMEbvtSvTQFhk/imBgFDRj6vM=@vger.kernel.org, AJvYcCVeRY2xPYbynM5i1Gwi7oXmzD+S9BxQDOFxlwS/esXE5kDznkGGtuZ1752a91TVEf4/ScVk35I568aHJG0xFy/CzR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1rS+o0KCzG9NYdMqP47TS0XAocICKS1Zt1MKwbr20eAk+2YI
	BNWf0bBOnt2+rp5mhBOx6UJHwx1bB/QD0NngxmzBbX9PfSQuQ96tl/YRNrDc
X-Gm-Gg: ASbGncvZDOR4I/D3vpKzZkwnJmKFlV9PLLlf3eG4WQJxpctqjOEbfZREwm7ui+lytg/
	Ge+lSuJFHIyyXGnhKdsXs8xCKSZrDqro3I763Kg+Sm4XUf9l4XtOj7C8OEaXBsHeI9YVgX2IeBs
	9PfIj/8X1zOkTvr8qOdgFtPk2staHDym+VkbwdVpfkoH1qgdkfj77/KZEO8YATtgxA1QqVyv1zv
	7oI/H0sWEiP2jK5FtDdyoZKRgbfY7KT/BFEFukaOtPkrIhShP+ibRDGtxWzLElZCmU9Xhhy20GN
	KDR29veWhRKOcNNXPE6y0PiFU8hpd94DY2czbvV7Wbg4Z1FlNKLWG/k2awlePbM8velp
X-Google-Smtp-Source: AGHT+IHJ5b5M5eBIJE9mslcjq1WY3O67Dg26G6CSMCsoIUQEDEaH0PwvUI+EI+Vq82lsnk2Liu1caw==
X-Received: by 2002:a05:6122:8297:b0:520:61ee:c814 with SMTP id 71dfb90a1353d-521ee1f1568mr1008734e0c.1.1740124256714;
        Thu, 20 Feb 2025 23:50:56 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520ad678ba8sm2634981e0c.5.2025.02.20.23.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 23:50:56 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5209f22ecfeso466442e0c.1;
        Thu, 20 Feb 2025 23:50:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0uPhNydiQU/xK7vxqfeW3bejA2odxqzGeEROPag/OHI7U8j0muA4DMoRbBux9mPuOWppKH7+mZZTTAuE=@vger.kernel.org, AJvYcCWNCZHXuo2Jg8Zl9N4+X7ONXH15h2ZnvAEBiEzBPB0UjsKCjEttmv0zhm8i+0ZnCpPQb1LKu+56VXs5S5C+8bNiLZg=@vger.kernel.org
X-Received: by 2002:a05:6122:1b84:b0:520:5a87:66eb with SMTP id
 71dfb90a1353d-521ee236fd1mr1320633e0c.3.1740124255544; Thu, 20 Feb 2025
 23:50:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
 <20250219160749.1750797-3-claudiu.beznea.uj@bp.renesas.com> <TYCPR01MB11040051BFF6ECA0F45FD6038D8C72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11040051BFF6ECA0F45FD6038D8C72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2025 08:50:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkf67sGpQt=SKi+3xUMyKRErFdrhtf7XOvoUnCE2XnCw@mail.gmail.com>
X-Gm-Features: AWEUYZmvzCpq9TZOHHJ9beRJMa9M-uoWiYwVWT145YSTckgBloLWjlMkRAXbI_Y
Message-ID: <CAMuHMdVkf67sGpQt=SKi+3xUMyKRErFdrhtf7XOvoUnCE2XnCw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"kishon@kernel.org" <kishon@kernel.org>, 
	"horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, 
	"fabrizio.castro@bp.renesas.com" <fabrizio.castro@bp.renesas.com>, "robh@kernel.org" <robh@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shimoda-san,

On Fri, 21 Feb 2025 at 03:11, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Claudiu, Sent: Thursday, February 20, 2025 1:08 AM
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move IRQ registration
> > to init") moved the IRQ request operation from probe to
>
> I don't know why the checkpatch.pl said the following ERROR though,
> as I sent my Reviewed-by on the top of this email thread, this patch is good,
> I think.
> ---
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move irq registration to init")'
> #6:
> Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move IRQ registration
> to init") moved the IRQ request operation from probe to

Checkpatch complains because the quoted commit description (the part
between '("' and '")') is split across two lines. As this is in flowed
text, and not in tag, it is a false positive, and can be ignored.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

