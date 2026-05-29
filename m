Return-Path: <linux-renesas-soc+bounces-33343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIPaB/CDGWouxQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:17:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC960225C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E20A3072FB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A3B3E0234;
	Fri, 29 May 2026 12:17:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C83DDDB2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780057048; cv=none; b=G/s/p2WUjSZuh4Gwg4Oemx8KaSKoyHZ1WqydVHa5vAkwaNgFX5Q8V1eBEA+55opT5V/vZ8LhW6MiT9ixYaciPtOBGZZg/h6i3R76pnYiXPWgXlm77wV63NAK5WlYvJumFG55M+kuofkMBJ5nKOHlCSVTHvwvHVcCaieOwPt+rb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780057048; c=relaxed/simple;
	bh=6Es1YygK13lhvi/gkYMQbaFw9yC00RjnyCu5Erw9q88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd6voxJ4XHHmAvjomHMcN/GnnRcYNoDqmCPPJUmmAALRplUNl8HYvxDqu085LROGPVihwsAXMLLZIM9+PtDvnO07sX8mW8+cRptEtPvJRpbg4810P2oPZJqcGND4lVyeuIjIhZb5fNylPHpFFZg/3j8mE6wnKp9LuaTR7Fzevg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9639d7daff3so963325241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057045; x=1780661845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WuaQKbiM+t9dvJovReE2gh8Jl4CO7/nRuyMCaYJ/ns=;
        b=NeoPOjlttYQ1C6ay/5xUcKljeoZcsjNUuM6o9/9OHGefL0oKwn8tOXJNDwoCUvzTSD
         bqrVXwYJu2hJT71DXntUtwcRtEkVfju1QyneAHSCsYLHA72de/K4Le7e73Bhco5wUKzT
         AwsBL7MHCwX0ctFqNCzuNeDbgliTJRwmJNCJwn8zh5TAP6bfBYtxzQKy8ihG+ppQruao
         QvGGLpW7cm2dScyGLgfSc2kFDorWgQ5j5O3uHwTHp+RDdOq2EL2aET2OB8yHa1frbgDh
         0ulxSGNVZGa7i9d+Xy58QpY96n3ZYsqbFnJYGcWuGgJoqKUqxsPPZh662GfnAmm+JK61
         YWLA==
X-Forwarded-Encrypted: i=1; AFNElJ91CE6HXgHulBxSTOaqir4vcdz+BN3iY89WfNtTBXcN4NEY1SL8TWcIx4z0iNFWd3tyj5TSzwl0zdYYnXsZjuDAUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYuXb8FDt2ePhaqn2a3Qg8HKlXcrYdCceHRy8TfRN9r0OSwPyr
	N5WwKKHs6ZSaqgZG4UOBogOGmCNxmcbKXg1FoHKBxgV+ef9qUFgAhQkNQFw2WzF8rWM=
X-Gm-Gg: Acq92OHYixk8frlMKf0I/nqfqUAGOH5y5BNIVVOpgrxpUEov+0M3ucTOYb03+Eqm86j
	rasN9dipJ85C0UY3akHK0QiPhPj5zLsW4D004v/qIzImP7YUBktW8Q7Lc6G+5XVMklZ3Xmn1VOb
	i7+Pqfo//RCbEnDy2SSeOyCp3MF3CV0icywvAiLKmpZUKzsd8ZuaWrSm17bk1of5Buuq2Vq+h7t
	9RXjz88pTQ7s0qGSzNTcbiQqZDhu+EvjzuGYAwQvLwBvcXonTUkQGJo0udr6SFGUQPbT4UzMrJL
	RmZgGk3del0yA/dlrD5Yj2WcVzBKIQnGTzCy0m+f2g4BeLCwjOYVj7fUBMh3ipxEk7ikJTJ5B55
	Qo24xqO8q1Wsb5bHpeBOxxs2BV4uGtF3wsgCOIq1avUH1vOkPfEXCNTTxjn8f6bbFnM+WsUyaGa
	x74Oo4FHLRootr593HqhwD9U41Da9MFaiVEaRHSrnvj2vZDMK0L9FtzsrCBc2NxLTFyntoWp6i/
	uZ6gJPpgw==
X-Received: by 2002:a05:6102:15a9:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-6bf3d5c7d44mr874966137.25.1780057044999;
        Fri, 29 May 2026 05:17:24 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba8b912sm667220241.5.2026.05.29.05.17.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:17:24 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6c28e1511adso179033137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 05:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8R0DXjx34nNKEy0moEeBdMTTB3IPVTjAfXOnWt0yMZS6acWJENunmMLttkCXbt8lbdWBHCPbk2MEZyLK+uH0T/aw==@vger.kernel.org
X-Received: by 2002:a05:6102:8008:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-6bf39267a54mr993523137.17.1780057044184; Fri, 29 May 2026
 05:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 14:17:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ruURO+-8NwYhftojpLOSHE=eMGVktMC0TnD1h=JxZw@mail.gmail.com>
X-Gm-Features: AVHnY4LEBfBHPUiYx8mfjuBDO91FAYk3AhOWo-uI3g_bofZbbSK4hI5wATwCuDs
Message-ID: <CAMuHMdV5ruURO+-8NwYhftojpLOSHE=eMGVktMC0TnD1h=JxZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Simplify AA1024XD12 display DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33343-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email,mailbox.org:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: B2AC960225C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Mon, 4 May 2026 at 16:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify the AA1024XD12 display DTO, move all the differences into the
> panel-aa104xd12.dtsi , rename OF_GRAPH links to generic lvds_panel_out
> and lvds_panel_in names, and parametrize the LVDS output in use using
> RENESAS_LVDS_OUTPUT macro. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> @@ -6,36 +6,5 @@
>   * Copyright 2021 Ideas on Board Oy
>   */
>
> -/dts-v1/;
> -/plugin/;
> -
> -&{/} {
> +#define RENESAS_LVDS_OUTPUT    lvds1

Both Draak and Ebisu actually have two sets of LVDS and backlight
connectors, so you could connect such a panel to lvds0, too.

> --- a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> @@ -5,26 +5,52 @@

> +&{/} {
> +       panel {
> +               compatible = "mitsubishi,aa104xd12", "panel-lvds";
> +               backlight = <&backlight>;
> +
> +               width-mm = <210>;
> +               height-mm = <158>;
> +               data-mapping = "jeida-18";
> +
> +               panel-timing {
> +                       /* 1024x768 @65Hz */
> +                       clock-frequency = <65000000>;
> +                       hactive = <1024>;
> +                       vactive = <768>;
> +                       hsync-len = <136>;
> +                       hfront-porch = <20>;
> +                       hback-porch = <160>;
> +                       vfront-porch = <3>;
> +                       vback-porch = <29>;
> +                       vsync-len = <6>;
> +               };
> +
> +               port {
> +                       lvds_panel_in: endpoint {
> +                               remote-endpoint = <&lvds_panel_out>;
> +                       };
> +               };
>         };
> +};

With two panels, the channel-independent "lvds_panel_in" and
"lvds_panel_out" labels may become an issue.  I think you can
fix that later using C preprocessor concatenation?

As we don't support the dual-display use case yet anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

