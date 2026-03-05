Return-Path: <linux-renesas-soc+bounces-28849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK1aEBQ/qWnv3QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 09:30:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751F20D788
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 09:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF7B8300ADB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 08:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC94366806;
	Thu,  5 Mar 2026 08:30:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D91374163
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699404; cv=none; b=oCScP2ROJdYqrPfQfWAI7yraKXner+03XJ6quMAwRdcuPuce8UbHPPsXEznCQS1HOg03vWpathv4qx6F/kzvm5eRcMdsvtUDvS+1luaKIP2eX5/w/LSpH5M8fFkH8hOp0kc/Cu/hbiFPXhdDR4GT9Cv5+sO4O2xWKILeIXOJkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699404; c=relaxed/simple;
	bh=CSh/OPgCewZMrxAGotXGAjNREHTmD2ri4RotS2E+6yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNz7XZH/LeWSmunB0KtWplqd7raaBLfATbAHPg+R/CYP62BFpFmv5UnoFPXnlifHl8/TYV1jCX1mWrDhsjGcUDOonYLLMHRV+obSaXobzGzKNl7X3yiamhj6bFsRuqJFg+hjbY1o2j3AnM8saCukU4Crq9nceKD0xd4CGps3MVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so2298688241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699401; x=1773304201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
        b=EOE5UgBfEyxr1srG2N9j4rgbR+l/rzN6KIhGKub6tDdkg7te8Tf07w55HV7i4kIour
         DvQQr+CElO5chHDMzC0hgAoC9p8EeNGsIqBS6VAxoRfULWSmJ0yg7+FS4WrCTsG8zJP7
         zkyxqEKjAXJITGqYYr6dIJDpBYyFFx2INWURAVHvj9hZz4CklCy8zl2vvVWctATNz/or
         +GhS0QMzAkykce6z59leX4OZIaMm0MiFm8E8Rp+Dln1/wfhIgfk4eCcwsmbVzd4XH+EB
         fcl4asHdT80WSPG3Ce/2SCjvlFgk+UqOYroKmONy1jhVBDp150DXBg+kbvYf7rl0eTyL
         riwA==
X-Forwarded-Encrypted: i=1; AJvYcCVBVOQUKC6xd+gcF2wSRqOTOfU0B1lIEIVoNesLTa0/EGIh2fFGV5X+jbM6ZPX6H2VWpPuvkZYl0yQc/yEENabOFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjElobeUPFf8cDr3wzM8YjjStowJKbkBExVrL3pAWXAvHu1R0w
	jlXJ3oaIREDOqGzGlhBd5NBmEKuh70wK6a/mcx3lVINhRzWbUXHq6fRtt56Cb1Ej
X-Gm-Gg: ATEYQzwG+tRftgxtMChWRnc2kgM343KwUDi1QMJ5w5PXcaFUJSq8jPLATDUnJknJ+pF
	NH4VCzXCyHzHjjux1YLrCsbIIfyrO3yzrNaMoFZK1Fpoz5MMLhQJacJ26FCVd4Gv58l+BFltqwg
	SkSc9iSeFJ2OM+5K/V0Nbznjsvjl/0aZhT7D/TUmMa/5w6Jl4WEbkfy3BzZhSrtk3ekWBUnYBc4
	kLTDhS3IUwd4ClPo4SF2y5QEnfKnnWpDjTbfy1E7Aln+HDKy1oIZT+ns1xHjHmVaw2yDBFvH7f8
	jHRPWQ4G6LDg07LADP+z48KwF5R06fwmLcQm9KMeiZjtMF28GFJcXgTOqLwU7Rw2MBdK8rOBWAg
	nv7PE5Fm8o8axRdqUk2PzajlYWl/V1JlEl9zsw18bD7hmS0YnPraV4pbYchU2ww7xvh4GMv8hpq
	WnAhbuJzc4yONI7XQCRx2OjfLf51/T1o5JMxhRxAkATfJjoSJFpA5xiejRJuz72qB9
X-Received: by 2002:a05:6102:370b:b0:5ff:c831:b998 with SMTP id ada2fe7eead31-5ffc831c2bbmr521043137.13.1772699400842;
        Thu, 05 Mar 2026 00:30:00 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffd1d8983dsm341678137.8.2026.03.05.00.29.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:30:00 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56af4aad3e5so153211e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV74nbFhESzH4m3Q4QMy50LFkQVw5pcAzyXJrR+mWGRfIFHr7RIbEYZiOnodvYPke1DWd2Ac4cGzOj4A3qhpl+TAg==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michael Dege <michael.dege@renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4751F20D788
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-28849-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.929];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,kernel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

