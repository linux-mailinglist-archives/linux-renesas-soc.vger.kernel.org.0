Return-Path: <linux-renesas-soc+bounces-31820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK0CDKpG82kMzAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:10:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C354A29AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32684300A396
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCD437C938;
	Thu, 30 Apr 2026 12:07:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FC1E8320
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550873; cv=none; b=YMcrejGteAQB9sWZhwC1ozrTLaa92o6QbPZ8A+8SZCW93+TDrd8pfIAeTj7cTwVGGr+Id6F6jSBw/Z9ILd5EUYk458yiCNR0HcfTjT5ysKMZo+bhZTmK/yOsSRFdOoaQwN2384s+z7U3Mfb0ecCuuTc53JtFjpfcrZiQIBl/QGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550873; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqjdvK/UY1W+K7uBmE1UIpYUxrITwJvmJxhaxsBuKrXrfxuvCa9QneZvcRpOetgK7gWihiPy+tdzVcph5Uf6pSnf/bEuof2u/LW56mGAreGjysf7lXywkNgfKlDhsToAOuSKjRDRiJpXMGUpdWTr/dLmY8qeiKrZ7xKjODfTbVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-42321c8b8f5so676181fac.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550871; x=1778155671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=BAFuJzcgxDECbZjm2fPVkJ5Rqear71/Wzwjsw2TEQa3fImFHvvvlyD8FfEgsOO9w3h
         /u3nHoOq2PsBZmr1fS8Rk3DazV3yiRLqbp9kvGgaV4qBydt+A73N8r39cald1X0MP/nL
         DBlo+E2eBaoVenauCffrYPD/zwiEFKgZ64GutjblKVA+t8NW5PZhjFqBmS9IuH/pwxiz
         GUKKFvHRpbQLkqnQJUk4WJ+J+QFO85g6LTYtrI1E58Ec5UZRstZ4AePVMQo/KIV+Pmc8
         KkrcrlIdDrtHIPx+nqLMDzi+bIAqVJddsPKsxBlnP+c179RL0Sdo+A6UtviEl9XJk/8z
         ISfg==
X-Forwarded-Encrypted: i=1; AFNElJ/l3B5zHO/kZwfk2iq9jblwcvqDm+ga90r67R8shFSbE08gR31gmfUBHiJssA+oHghYvcVGZBLX7INBSnaBAhGl9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZzv3agSgGGb6mxmTZokxb5eC6B3gxudbBdwSxduigiOCNNNfv
	BSzcn15d59cfDbPOiIiGKkNSSED358VvrnZIQ+z8n9yod3qHZ00XrdLS4qwPHNHCAIg=
X-Gm-Gg: AeBDiesfxk6gtpZ9O9samGQgfr/DYJuydPNtiQXiMB4vomHIjxt7IVLlW3Y4in41S58
	hYLNuRU+YBOuNVKPOJgRi/+eBDQTPVjZYfDHL/L5YCUCdCoeUKhdEJbNwDlrcFo48rBMZeLQjL2
	SPQ8S5FdbJ9GyzyCqo32xlee8cnwzHX4Df7J98740udfP+9C+k4kDT4Hl1X+r6jPjaM9ELN58O4
	F+oiPAKkh4YYLwEkmMj5D+88NRwkJza+ve8qneETEVpBPsiGhQW6t2c7uoCKxwVVJCYJhEqzUwc
	UKH3q17+eiBrQZchibXgg1mXz0Gu23BjhUxnzZ9EMSRV2nFdleFGfRTbVkKSpuIpAjPp++OnKUH
	9B745FyKIkPh1K7CIw1FHKIGuETptmBTqBMiKh0b4yJlfJgvAjywRf8xVV2GBYrTdyc0/XvC/8h
	wUxWdBZ2dxl7mQDBZvPmGPtsUI5OhuJ4Pk0I+oquuSx00sJDKtrI8VImZ0Ej8DymYbFZ5tDeS66
	v3r6A2rNQ==
X-Received: by 2002:a05:6871:520e:b0:42c:7f7c:461c with SMTP id 586e51a60fabf-43438b4edc3mr873336fac.17.1777550870744;
        Thu, 30 Apr 2026 05:07:50 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43436af06f8sm1561300fac.5.2026.04.30.05.07.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:07:50 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69498319ee7so1042976eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fPpoeUPNo8FVejWFW0BsVtZm/0FGhBCEfhbGOfk6Ta8IkxUiO9Z9FjvAZ9yl69PVcaSp5YzWwFD/DifAMYr1XkQ==@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 78C354A29AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,baylibre.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,glider.be];
	TAGGED_FROM(0.00)[bounces-31820-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,nxp.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

