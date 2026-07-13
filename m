Return-Path: <linux-renesas-soc+bounces-35093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Js0QMKysVGrrpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 11:15:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A07492E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 11:15:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1564B303D727
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 09:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0030D3D647F;
	Mon, 13 Jul 2026 09:12:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65E3D9546
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:12:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933922; cv=none; b=t3Ay5C4qL1BZZWFsS2qxOTQZz75Y0MxVqQuRsvM4Y3w3BlU4Uc9hHMXpbOnPkWMCnX57es0mvJ03NxTN0qXxLmcc3lODGZRjPyPanRIFpeAJQPWgBBhH4xN23KAo7xAlHoF2cl6srrGaeMl/qLvYVCc69yqD6ZuscRR+d03Q/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933922; c=relaxed/simple;
	bh=c5+FxcOGmAmceHhtPcpLKMS/cB4l1dpKb753xDlDMDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4xmYKosRjV4x8uauGNQVJKXyzY9iTJoWLeEqYpW3CkT90W+Bo7dlF7jP5qfQAvfxtJX4vmcFkbaKkNHmTC1udzgsqk50iQ3I2Q8EH1AV/pQJ1GcnESed+6uwb345dcelPQ9pju6fGMEdi879E47e7E11r/pVXs+1htoRO7+TXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1249303e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933920; x=1784538720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0GhslFIBhV7HjGc4JTm9mx3d3RqP/ws4R5ft90HGkM=;
        b=KZxJJdN04sCMvLPrYC0pVELBIlv9FjIjAT4vPWMRSKrO9/J6BqCidm+LEUk41Umb+r
         a4iflBGX5um4XwDyU+W1VEswtsX5/BOZfW3G33iEL648nClSjHJgb0qPx+q57PoPm/tk
         s6aZiebPo700Rdqk4j8hB+1uOqMHLnEK08ivxCiULIy9b+J5wuWcyjT8ExM7x+LKhZrT
         M5ooXD7oee2J6uxjo6IiCz3YWA/EauHo0OO2hvOjPLGvaWWoPUwY9lMP9XG8Euy5jBCn
         0AtXTqVz1o1PtUrvANRSkT6715feb1yMxMfHmmKDOl0dgbTfsr9m2b9MXzstLKZ3o0Y+
         32Tg==
X-Forwarded-Encrypted: i=1; AHgh+Rpt3qPkEzk1jFTfWIKjUCIlhr1mgy+SIZk/R5GaWJf7hmLcsCt46Vc9jG49lsfDlZmb9ikzILl1maMAGizd+Jk98g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yFzyfwWRzGL+fn07JwVP84jHZWowaEWHqt42CGZKLUnyGCLA
	GCAm7yB1YPXNABUJkhj2JpFdyHV+SPhYRdoPLV/5PnnQ5NMeE5DQNLvLEYFtab7U
X-Gm-Gg: AfdE7clPkvA0Qikl8w9Hqmj2uv6koyZD38u8r1UtJhvpIQOkLsBcfCom3OcFz1NgLO6
	MCgInkmfepvAAfyNCNweNReDTX1KOdYLYBl/GyYxehES5fGb0cUuXwNz8t+C7csU/HFbmTe1CAc
	I3dRxP7CuTkCiiMLJ/MPen1mKC+fMVP3+KZHYZrW1vds1iev4VmCWCzlxhBM/ttA4jutwy77I7m
	TWUdA6WsWJjSchqgTwtld1qK83BbVkZtIBqrl1/QvMNMq8DwneIhiGnyLS0k5YRcGVBb7z4Ufjg
	922VE+G5zevAbB1S13ygW9lrB1HZmp6E++jBLo5zKuvJkFIuXykcRI+7F0BRI6kV9N9gU4pDNcO
	nAXGu37k2wG+6ISvcb0V979XcJkdY83AxTLJwwHi7eyNYgGHEQtsrPGYShrkB+lXix+Zh1ReHvL
	S/PaHak4/kBLVAZMqtPenxQGZu7zYvvBDb+t918W+XDtV43U05k6xHdJlw9bJjvDUA
X-Received: by 2002:a05:6122:459d:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5bfbf41eb67mr4558771e0c.13.1783933920252;
        Mon, 13 Jul 2026 02:12:00 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e0f38sm9074747e0c.2.2026.07.13.02.11.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:11:59 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfaf91daa2so634684e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq2ncIIP28XsVrVX8fDS1Oc5i6GvKFsjPPtIMWuHPJsABIklCFtz6FGjPIH/gORhvr/IcJPmWkypHNgIUqIHHoQug==@vger.kernel.org
X-Received: by 2002:a05:6122:4881:b0:5bd:ddab:59a7 with SMTP id
 71dfb90a1353d-5bfbf36c0c7mr4476532e0c.10.1783933918601; Mon, 13 Jul 2026
 02:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:11:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
X-Gm-Features: AUfX_mx2_XwwyHYURvzuCSrFPVED98PoIu91Ql66CsUnywXi7izjAFqbWrYeOLo
Message-ID: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35093-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:stable@vger.kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 135A07492E3

Hi Marek,

On Fri, 10 Jul 2026 at 18:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC.
> The inline ECC utilizes areas of DRAM for its operation, which are
> in the DRAM address range, but must not be accessed or modified.
> Describe the inline ECC carveout areas used by the DBSC5 controller
> on this hardware as reserved-memory, which must not be accessed.
> Include DRAM areas which are unprotected by ECC as well, those are
> parts of the DRAM which directly precede the ECC carveout.
>
> In case of high DRAM utilization, unless the inline ECC carveouts
> are properly reserved, Linux may use and corrupt the memory used
> by the DBSC5 DRAM controller for inline ECC, which would lead to
> the system becoming unstable.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Include the unprotected data areas as well

Thanks for the update!

With the ECC carveouts, Ironhide survives booting with "earlycon
memtest=17".

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -107,6 +107,47 @@ tee@8c400000 {
>                         reg = <0x0 0x8c400000 0x0 0x02000000>;
>                         no-map;
>                 };
> +
> +               /* DRAM controller inline ECC areas */
> +               ecc@10cccc0000 {
> +                       reg = <0x10 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@12cccc0000 {
> +                       reg = <0x12 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@14cccc0000 {
> +                       reg = <0x14 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@16cccc0000 {
> +                       reg = <0x16 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@18cccc0000 {
> +                       reg = <0x18 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@1a66660000 {
> +                       reg = <0x1a 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };
> +
> +               ecc@1c66660000 {
> +                       reg = <0x1c 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };
> +
> +               ecc@1e66660000 {
> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };

Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
start at offset 0xcccc0000 instead of 0x66660000, too.
As a bonus, we get 4.8 GiB back ;-)

>         };
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

