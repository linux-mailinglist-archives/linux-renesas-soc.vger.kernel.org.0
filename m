Return-Path: <linux-renesas-soc+bounces-32748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNDuKqS+CmpX7QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:24:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30087567721
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFAB430471E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 07:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091993D0BE4;
	Mon, 18 May 2026 07:18:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1083CA490
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088712; cv=none; b=QGJ9tuvBaGlhebVLFNycHfaVKTkLHq9Kps6ye3x8Y5XHQchjKvqng9NHBN8H0978LWdbSQjO0UcNTD0u7a/xWZmLsazginpSIc53pO1xWxKJ0zysTqsw+7gLtj8y40/vnfSpKHxvJM01FL3w/MIDo5m/SCLE8PYpyccW+5pnnfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088712; c=relaxed/simple;
	bh=gAm9dAc2+cW11CY5gvrmUlDm6ZyHpaeF3uB9oM9NJYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLuQQzgg5QOqqVYV+u/KWREhPXrhO/i/H1zCWU2n8cE9Fu2JI66zSeoyawz6KI5UFdQV4h5KPLVwu3S0BMPJ9eTfPsmAxRS1LlrNaF8lIHKxOPmAOg0BF5R2LnHdS1jAtpfnbVdMdUtWDheChBdvBDjQY6/Z6KxVLEorrTyfQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5751a9020faso1475256e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 00:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088710; x=1779693510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BaSm/XjGBh4son00sA6wyvpPsCewbAXPb4XTuwg+MM=;
        b=Ob6+Be5yvN1aQy1VCmkKs8dxVnT/OW/eiSUi0GnVq1MJnnsBOJGToqdrgW+i9al+vW
         PI1fnwc6ugnJf6V8iGGNL/Jemhd1SdXPbVFqr1BSktU3diVrPkFG/dYVDaP0PKioR3kF
         3Vh+QF9nOoxHvgs0wTfGWpvTk83x5KzHR6V6F550Q3hkEQ7AKx84R5xGpY++2idp0P66
         0hGTM+EyDtkVEAJvO9904iguiBOTcJTymN/aEtw44x1tYTJhvO44kwmTheRWkhdg46fu
         1tABKKZGjm9+jqvsDQDzXSOtcVhIr4r1Z1mUj0MVbiLq5O05bTZH3V8BEzVySsPYpHVI
         ScnA==
X-Forwarded-Encrypted: i=1; AFNElJ+oDPGIYYB9MBk9IoS2J0s/vlWQBiqhdJIeryyDYV0vlvdLINDGTfNY4WKMVkpbITWlcYJpQh5e+oXZ/t7Gr99QvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiViRzd7CzZOLMFOvzBUnYIcxr/0jg7QugaEj/OCegnuVRMUb
	raAXmszDCWSvD2qIwBn+DbA+djj8leUsG04NPk4Gh92SCfrHVDOu+rRBuPxRhMTQ
X-Gm-Gg: Acq92OHbxzMqK7fTdaY4IxVj5gNC7g5QKvPm/q4MuxwuQ6A/Wy/Ud/1lXjh22ni0rq+
	pqhHUsP6Brc/1fffhxck7MlvIbsWTRMBLOvbWHQXgwqVb09/bt5Jc1Ro5JPF9jQs7ihDMZLWpSZ
	x+H5uM01NpOrYbsr9kL/zTZTL+kaad9C40PTldwzm+XyHqu4vxqdhSV2y13kTfBaeVWJvjb1rHK
	Neod10YEWCtuvJioxoxWHoFUCALgzVH1rTe4XheIi3GuMvuX/RtX8vQ5SmIPBXaNkbPowNj+2qJ
	SAWQQu9oRlvAfI9qBqRMX2kR+BNa+57C3jxkrdPIKwTvfDSNT+nLUGXl5fe4H/1ywbTfaWjkm3M
	PYLh1Ml6zK6owwfYA9YQJxs2/fS9pjUsTfm0PFbehbhHn3HMUsaC4djpP2LhYz01CbpEfd0zNf+
	ybvp0YuF+82H29nFZG3aVW7PzhzM6SMYH9V09Gy0TpaNtEBSomlQ1rYK21dyGi+N4trgEYnKg=
X-Received: by 2002:a05:6122:4f9f:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-5760be34e4amr7440781e0c.1.1779088710333;
        Mon, 18 May 2026 00:18:30 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f3031b0sm5951675e0c.0.2026.05.18.00.18.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:18:28 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so1335586241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 00:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/EkEC9KLZlB7WpGG6OdXP1jEEPiazfhQBhBeozS5hE0mUmqXWGaPR1fmMIUa2j8FqUECaxIN/oGCqGHKuWw0xekQ==@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:632:137d:3ab with SMTP id
 ada2fe7eead31-63a403ad984mr6556785137.31.1779088707988; Mon, 18 May 2026
 00:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:18:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
X-Gm-Features: AVHnY4JKgHlqd5SaFhNLozD0z7aZ9BTFwj4ug759FlpKdE8vGqFRTa8yvRVCDYo
Message-ID: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 30087567721
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32748-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3.156.174.192:email,8c100000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,8c400000:email,8c200000:email,2.98.90.0:email,linux-m68k.org:email,mail.gmail.com:mid,64.95.126.0:email,mailbox.org:email,1e00000000:email]
X-Rspamd-Action: no action

Hi Marek,

On Sun, 17 May 2026 at 18:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fully describe all available DRAM in the DT, and describe regions which
> are not accessible because they are used by firmware in reserved-memory
> node.
>
> Replace first memory bank memory@60600000 with memory@40000000 and a
> 518 MiB long reserved-memory no-map subnode. This memory region is used
> by other cores in the system.
>
> Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
> SCP, TFA BL31 and TEE.
>
> Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
> upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
> round up to 512 kiB is slight future proofing.
>
> Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
> entire OPTEE-OS TZ protected DRAM area.
>
> Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
> any way with any new reserved-memory {} node to reserve memory areas
> used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
> those areas, which lets Linux use all of the available DRAM as it is
> described in the DT that was passed in by U-Boot, including the areas
> that are newly utilized by TFA BL31 or OPTEE-OS.
>
> In case of high DRAM utilization, unless the memory used by TFA BL31
> or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
> used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
> unresponsive.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -20,10 +20,9 @@ chosen {
>                 stdout-path = "serial0:1843200n8";
>         };
>
> -       memory@60600000 {
> +       memory@40000000 {
>                 device_type = "memory";
> -               /* first 518MiB is reserved for other purposes. */
> -               reg = <0x0 0x60600000 0x0 0x5fa00000>;
> +               reg = <0x0 0x40000000 0x0 0x80000000>;
>         };
>
>         memory@1080000000 {
> @@ -65,6 +64,36 @@ memory@1e00000000 {
>                 device_type = "memory";
>                 reg = <0x1e 0x00000000 0x1 0x00000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               /* First 518 MiB is reserved for other purposes. */
> +               firmware@40000000 {
> +                       reg = <0x0 0x40000000 0x0 0x20600000>;
> +                       no-map;
> +               };
> +
> +               /* Parameters set by IPL. */
> +               parameters@8c100000 {
> +                       reg = <0x0 0x8c100000 0x0 0x00008000>;
> +                       no-map;
> +               };
> +
> +               /* TFA BL31. */
> +               tfa-bl31@8c200000 {
> +                       reg = <0x0 0x8c200000 0x0 0x00080000>;
> +                       no-map;
> +               };
> +
> +               /* TEE TZ DRAM. */
> +               tee@8c400000 {
> +                       reg = <0x0 0x8c400000 0x0 0x02000000>;
> +                       no-map;
> +               };
> +        };

Shouldn't these reservations be added by the bootloader stack, when
passing the DTB to Linux?

>  };
>
>  &extal_clk {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

