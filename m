Return-Path: <linux-renesas-soc+bounces-34738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lokrDUJtS2rdRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 10:54:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BC70E539
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 10:54:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1B9C3251386
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 08:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB55933BBA2;
	Mon,  6 Jul 2026 08:16:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997023E0C6F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 08:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325806; cv=none; b=aS3/JXsAQXUMw3zHjiXU/SByKH46CfKB2fqMEbhC0RZPQJjGQgU68mV/+mLPtEmyhcsLoNw7soema+d34c+yiDmS9RAiw1QVB40kK+94XOk9ZvYgM9mXb2Mmp+HFoW01CCwvePWBxUbjr45nl32WzNo8TxBsmE+9cnJeXE79lvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325806; c=relaxed/simple;
	bh=KJatOBmAq352QrXFVmfzjgc8bnC88IRW7JAIsO6hyz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHtXhGnpzTdd2UyClxZTE8z5jHgiNb74Sd/302I2J/vf/gv10jsogAYptVv0unb4ij7h9J3Ohv6CUxgbK7DonOqu7LywEMX/ZSF7RjDhVKNFG7USDjXx7TQE5q9U10i2MoMDNkPYV5mYvFgicZ3gDAo71orrLTtF6SBMqcc5oeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bdff8c02b2so725627e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325797; x=1783930597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dbFPkCHMyK2cMipYCshkg+R5wrSHUFxUQ6/ZQ0r9elE=;
        b=jRB/49iCsIzw/fUkCxj41UWYZSEztoNO95ufn6AtWPHX6LAVd28ivdG4pQwg8X/yI4
         51hKK4YLp3d+OuoqdtL9E48QGngqR0s36vB0xx71v8pmR0GiJyq1iJH/for/Y4xxcVFr
         KZ+UfFgUTRFhdYOypaj0/7EkiM/sq7egLwbua2lNTyIGjEMCQHC7EB39xvuJr2dIeYYA
         PwX90a89jBk/p9zr5Q3eBbZXL2HouDRImO8Xf0TZ3czQpNb5PxzbG2C8dO/WK9P2m56I
         NHSgf9Wh2MYILV2AyCQv1bWb6kXHsFLri6wc5u0GVDGNkMHZD54PlolGfD6PZxf9V/Ve
         pTUw==
X-Forwarded-Encrypted: i=1; AHgh+RoETt30Ipw9qRehW4vVByqV0kZCCSeVcwJUvaDSDwa/FJWDuMfCPc10hQiiZ5XsYoTFUlq4qHO4bX6kBVyEucH9oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEHdAPo+n59WXeV50asrtat76ACzgS3gue19B1bAVgtEiLMCze
	JDp4qvBk2ejxMIubQvJu0r/UhoBo8whnTeqHh5geZqHPJJIkNnBRhwqfuY1tzhgd
X-Gm-Gg: AfdE7ckbh/KYo+w8qKo66QnLdwD43MwUCA59aCEyOig737LT5hK8X/ORv00MkQ5WZdy
	YYccRDHeJ1GUBhz4d1jBEkGzMPyaTtTzW552e6VOyFhzl0qSjOBopqgPtLkS8jUs3r8x3hJHjmi
	m2IT0TaRLnUQ/+dvWTH4PaSDbGSK2nLpPX73U53Pw1/6xONW+bpeDUFIC8d+I+P0FY/Zeg64bdH
	b1L5scQij9TECuEDldrhthIFZ++LuQ+7TflApZkCMIdIMzbkrGjihlDaMjWe9Dzmm/uBAoa2/BG
	XHnGy/hS5dT19DKYFMsQiugK+UjegIXFdqH998McC09HRFTpMlfQwueBKwtogda8D8JXCuMQbh8
	DGKuOMqPP4gfIwRv7ariVSq0Ap3ZiBqlFXm63muIbrIQNzU7gbTrCh7fzR18SwbaqVv5XaU9qAZ
	RvVcAggkfPzJU7voofO54K7NWOmAAwkZoA4xsWyGeFCV0hK98zt8/IQQ==
X-Received: by 2002:a05:6122:d1c:b0:5bd:cb85:a49 with SMTP id 71dfb90a1353d-5be10180bb3mr3147353e0c.6.1783325797051;
        Mon, 06 Jul 2026 01:16:37 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be029ac8cfsm4469125e0c.7.2026.07.06.01.16.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:16:36 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdf96b3faaso506083e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:16:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZWhvhP8sae2LMjG3F/dBr2q/ASJ0g+c450VqBhlleRXF2lhCv76sJb3/Wz6vdU5RFz/vRbbiwcomGcCpPw7aIXA==@vger.kernel.org
X-Received: by 2002:a05:6122:550:b0:59c:b1f7:4df3 with SMTP id
 71dfb90a1353d-5be102ec434mr2809370e0c.12.1783325795169; Mon, 06 Jul 2026
 01:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com> <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtK2qKHLWfyWYaPx1cYgmF0jtzh3CAPrJ4QbZ0VxypXA@mail.gmail.com>
X-Gm-Features: AVVi8CfGdsdm5FTOvhTH4n31WpQq9-pZfeJYTHCuuEYLuLxyLezJUgX-zWbA-go
Message-ID: <CAMuHMdVtK2qKHLWfyWYaPx1cYgmF0jtzh3CAPrJ4QbZ0VxypXA@mail.gmail.com>
Subject: Re: [PATCH 4/4] [DNI] arm64: dts: renesas: salvator: Add overlay for
 Dell P1911 VGA display
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34738-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,banvien.com.vn,linux.intel.com,kernel.org,suse.de,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,ideasonboard.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C3BC70E539

Hi Laurent,

On Sun, 5 Jul 2026 at 23:35, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add an overlay that hardcodes the EDID of the Dell P1911 VGA display
> connector to the VGA port of the Salvator board. This is meant to test
> EDID hardcoding and should not be merged upstream.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso

I know this is not meant to be applied, but nothing below is
Salvator-specific (except for the comment).  Hence this can be applied
to any "vga" connector, and I'd rather drop the "salvator-"-prefix
from the file name.

> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree overlay for the Dell P1911 monitor connected to VGA port of a
> + * Salvator-X or Salvator-XS board
> + *
> + * Copyright 2026 Ideas on Board Oy
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/vga} {
> +       edid = [00 ff ff ff ff ff ff 00 10 ac 74 a0 55 4b 55 30
> +               2b 14 01 03 80 29 1a 78 ee ee 95 a3 54 4c 99 26
> +               0f 50 54 bf ef 80 95 00 71 4f 81 80 95 0f 81 00
> +               01 01 01 01 01 01 9a 29 a0 d0 51 84 22 30 50 98
> +               36 00 98 ff 10 00 00 1c 00 00 00 ff 00 31 57 4b
> +               4a 56 30 41 4b 30 55 4b 55 0a 00 00 00 fc 00 44
> +               45 4c 4c 20 50 31 39 31 31 0a 20 20 00 00 00 fd
> +               00 38 4b 1e 53 0e 00 0a 20 20 20 20 20 20 00 ba];
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

