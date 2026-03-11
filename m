Return-Path: <linux-renesas-soc+bounces-29212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODHvBux8sWmACAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:32:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0C26567D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A532E300CA3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1292D738A;
	Wed, 11 Mar 2026 14:23:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B2374752
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239027; cv=none; b=e2AmK5FpgL5dOyZ49CrapIEBmVyW64qG48OlWITc94jvolFfydmKT1twWw2U7xwlwyLPep5EC5gQq2XiOOLLlJqKiLMxkUbjc6qm9HPCuf/NrUSYLHZMmtevSvPyrOHIH1DajsT6fJi8Uhy0BZMsYcjeEucPXMNECP5zhqIV4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239027; c=relaxed/simple;
	bh=go8xpircWavEUATmrJLyNKBvdIyWrelHrEc3NwgI0+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IO1XCzuhHwHOUwWDT5b5oweocFB4wLBTsMmsHzSXtxUo5M3kTaQTC6UaMSqwjfIXjuMBoYGPa+HrVMcGyC26lUhOOOfJFoCbFk4SFDfvL+4IZgdr7KLTJ+oJ1FzLsqi0VIRdzSAJY0E2CjdjbvQZAg4jE6RT6p33S7vyYamTTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56af30dde0cso2520759e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 07:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239025; x=1773843825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncWO+6+MzE/QBP1FJeMJxrqlwwccwp83MKM1cztq0jk=;
        b=i9FNfVWCTlY+IJyAFzVjLPa4mluxvQL3h00lHilMUDINHSu2Vlkqigy9SdSB//VSwF
         Au4zh1lhYTQuxubWafgs+We0wV+pC//1R02Knx6TT6a2vOZdQz8ZpUQ7KrT8W0WTJM5C
         4RCzgimRJ6ushCrx/kDQwy5Ld9fCv/QeMP8LMFlTX4dZ48Xym71wjXt9Kex2hRERyAUj
         eWeVx8G+0iXvDxuVQPjMzMG3DL2pyFPaxgHl7sOU4zgmWd/JBm3raP/oBD0alRnQhlbm
         vebNwuNK7tWtJUXp3mqgb7mkYXT+3xFFfBqqBPW/wm/YTzmEuTuUeUvE3cnkJRmKN7tm
         YcHQ==
X-Gm-Message-State: AOJu0YxecFzOynXLFnRbH2XfOQKBFsgi9wC4LlzzHHKWViLR3sV3bBFJ
	IrCYWkLwxJLi316XH4feTdRnAc8N+tuLnkz/einkaJj2ST2oGmM5C0MMR3CMzrL7MDE=
X-Gm-Gg: ATEYQzwG78Em8BWAXL2WjBRwpbFeMeXqW2beIXCCSRAVXPoz44qcSfI9VXH1NVMknd/
	CAI/layJc0m2SbA0gcJrAE3e59M9q+xcnQgJX+6At2YYPKoT+IhLpD0/saWmM4ake+PXLSO9FHn
	5Ahze0K82ngC1lpBh3cVvE1m6wRqIa3nhPAQb0BsVvIN0ONahfVdXM/KxAFQYsEu1uPjTBWOZgv
	X0ZW1PpmrM0HpmzxLERQfI4RlUbX7pjxKEQFWC/ZoksqgB/18hXia1xluneRgyy4TjWnKmkEUOY
	TvyZ8Mb+tRF6GiAXPe3nK5n8ekCRAOyz/8aJLlDMsob86QBIrXwYMc9NZT0X4x863plv6s0kAVo
	tT3XgBVEvI4EvZWJAEhJat/ODZ6LRyTjhWUnfQfZgBVXTODYcGz7TP2ct02EvnC4s4l7ReyjBId
	SVx/p/MZSc1uf+RERcw5R3rInbd5Go6M+r+WSLci9BJUu/sFptsslp/RRurWtj+MmO
X-Received: by 2002:a05:6102:2912:b0:5ff:2569:cfe7 with SMTP id ada2fe7eead31-601ded05b40mr838390137.10.1773239024947;
        Wed, 11 Mar 2026 07:23:44 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfedb663sm617184241.9.2026.03.11.07.23.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:23:44 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b17c0223bso1890677e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 07:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:370b:b0:5fd:fc84:4b0 with SMTP id
 ada2fe7eead31-601df054b88mr864838137.35.1773239024427; Wed, 11 Mar 2026
 07:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305220023.28257-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260305220023.28257-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:23:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7CoF+rgOE6f+XmMa_FdG6Mjctqr+uqc0suowsvOqH3Q@mail.gmail.com>
X-Gm-Features: AaiRm52GN1CKgqB0wsDbUuGRIYTkN2gq8fq9aGDHU_hT_tH6VTYYIfgjHEYxLsI
Message-ID: <CAMuHMdW7CoF+rgOE6f+XmMa_FdG6Mjctqr+uqc0suowsvOqH3Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: add QSPI
 node including NOR flash
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29212-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: D9D0C26567D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 5 Mar 2026 at 23:00, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Enable the QSPI controller to access the connected SPI NOR flash. The
> NOR datasheet may suggest faster tuning parameters but those did not
> work on my board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Depends on "[v5,4/4] ARM: dts: r9a06g032: Describe the QSPI controller":
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260205-schneider-6-19-rc1-qspi-v5-4-843632b3c674@bootlin.com/
>
> Changes since RFC v1:
> * dropped RFC status, QSPI driver updates are upstream now
> * use KiB and MiB
> * use reg address in node names
> * dropped "qspi0:" prefix from partition names
> * explicitly describe size in the "remaining" partition
>
> Thanks, Geert, for all the suggestions!
>
> Works on my N1D board and patch passes 'dtbs_check'.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -300,6 +300,84 @@ pins_mdio1: pins_mdio1 {
>                 pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
>                          <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
>         };
> +
> +       pins_qspi0: pins_qspi0 {

I will replace the underscore in the node name by a hyphen while applying.

> +               pinmux = <RZN1_PINMUX(74, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(75, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(76, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(77, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(78, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(79, RZN1_FUNC_QSPI)>;
> +               bias-disable;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

