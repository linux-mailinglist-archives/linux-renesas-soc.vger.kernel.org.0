Return-Path: <linux-renesas-soc+bounces-27324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF4vO4Jrc2mXvgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:37:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860575E7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2340301DE24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FB428136C;
	Fri, 23 Jan 2026 12:37:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247F2749E6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171840; cv=none; b=ea1O8apNlwlKqRzgQDZOqh0XOtgIQWhEYvpQXNIQHLIoWuQ5nmrbnKMXe2kBDYqRoH8MuzMi+ungImTOqkfcxVnX+wjZ/XLeH/j9EkLfM7vOdxV7CGlwRHRUtRnh3E1KqXDWjbsiScIh6SXMg/r9+UH7J0JFNcWzMCtefA9IBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171840; c=relaxed/simple;
	bh=yBUtN/MAAzfyVYJKr1rkjdhxNB/HNAj/eFc+Ll5mxD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MX5U1VKl7bNF082NE1grC28OORIuFY08wjNF4gJFJBRKH4BzNyO1FWFpRMmLCCqjyYCGxcEApUDrAlrItqXkqYf/ptD2MmuvSj5X7LP2rGtRDaPcpSxc+zxOldYB7ieBriNKeIP+TS9B5MQ4d5F5zjyFPFtZehZ26x6/uf9cbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-5637886c92aso549791e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 04:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171838; x=1769776638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q38jzkPx1g60SamYoKJC73aUm2LWWuKa/1fao66YJYU=;
        b=tdYrMkt7yX2p8k+ltHJOcZqQoOQLgYvN2zXe+KHij32Wi0RC1XRo2uBJAOuM1QJgcC
         3xtxhBdOh8g1k7JFycL0h/V6TP5urt0o6M9ynV2Z+335+RH8Z7dlJ6VcNZ97Sx72v7mw
         VQEbsjlr7MjQ8nkQTHj7hBgbb4UE++cBcmyACaJtzn12q5+5Pq2fJ/qHU+twezB3+Y3n
         P07KRz74NNhaJ6j+Giu9Xo6kuX5BktZen4FMIxg51V/HWSpwPlf2uvw+X9k/8+W+NUoo
         dJvTMEoSwA722qfujEMr188yAc9FFWr9VgMDJu1aYqofSD5r8kp6mADmiG/ehNu0sJRT
         Basw==
X-Forwarded-Encrypted: i=1; AJvYcCVtcPxt/yG8vJqcSdrF+e3pr5wNc2yaTf5MxGvVNQAcxSvrIBixq6QPSTWjusWjYi2yE68HxMm9JDULS//ggl1vEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmzva0PCwozMYJ7J0ITGtL5rvx1+gstGuwYCLgT2x6Oknwp0WW
	EjDR8jMVbQiUGyb25QBeuRnW+rKNxuVnszetFTVkQpW67xI8R3lRUOAx4pGmWPUZcdQ=
X-Gm-Gg: AZuq6aL8/41+quZNS4mD0Sxm/kRUSi/H/pIYuRPGPGDLuLjfMRtvX2OrQaCcm6T66xg
	m7ukaiKYj5cBgn+OLAv44GW6xC10GDTc4w06td0e891wgXDL7syXQwmP3U57fz4MFJqqtWwwb7M
	msXPK5S4zl/Mw4rpH7jj8sjqDWzJZBD5vTVyjYd5Dv2BYiM/CU4+TF86bMrqk83va0advQC5IpX
	UycRo9jL2URQkf/FKqTVy8tQW68EoRDYMA5X4/2gEUZb83baYyiwWMyGxsrx0V/xYxUhc42LOn6
	vunA7LA0hUvW87XtkYdH3WBao5GRtspDGY7n9+82cP2k9oKlwmV8eMupl/M1lbLp+BOyz+kZbgK
	pp4KYw9S4CC+4ur8fVFFEsTLBjpaVmk6h+JQMMxTuMXukSQHuDCmK0yvKtp5xCT+RVXvSo0T5Co
	5F377/9s14zqCojqqoStW565n7jmlXMGqcYNFZJzlBlh2WbZi/
X-Received: by 2002:a05:6102:e0c:b0:5f5:33e4:12ea with SMTP id ada2fe7eead31-5f54bcbdbfemr801824137.31.1769171837536;
        Fri, 23 Jan 2026 04:37:17 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e3727d3sm477385241.10.2026.01.23.04.37.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 04:37:17 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-948104feb8eso549370241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 04:37:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0XTXXc7gO2DdpBHvFcuf41UF15yOP9AaLZUhDdWnxSAnD6qzVoRLJ20LH/H2ta4/isd8ch2483rB+F2uYnKYn8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:5de:db29:5c07 with SMTP id
 ada2fe7eead31-5f54bb837a7mr778264137.19.1769171836999; Fri, 23 Jan 2026
 04:37:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112234642.225993-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234642.225993-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 13:37:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEVbpMS3WHeKM+0ceBe6kL4=n+Cqvx5cMqru8wtBitkQ@mail.gmail.com>
X-Gm-Features: AZwV_Qiqc9hwYXhdCgYeyWKGptEN-lT8NQP_8jN-_ExihaOm9H0gRxTpdmQNyzc
Message-ID: <CAMuHMdXEVbpMS3WHeKM+0ceBe6kL4=n+Cqvx5cMqru8wtBitkQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0
 pins as bootph-all
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-27324-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4860575E7D
X-Rspamd-Action: no action

On Tue, 13 Jan 2026 at 00:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The U-Boot SPL is responsible for initializing the hardware and it does
> also initialize HSCIF0 and its pinmux, mark the HSCIF0 pinmux as needed
> in all bootloader stages. The SPL also uses OTP to determine the exact
> V4H SoC variant during DRAM initialization, to determine which is the
> maximum allowed DRAM rate, mark OTP as required in all bootloader stages
> as well.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

