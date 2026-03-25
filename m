Return-Path: <linux-renesas-soc+bounces-30261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKqpCOYJxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:14:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F2328CB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5183A301947C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 16:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6410B3EE1D3;
	Wed, 25 Mar 2026 16:14:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96B3E0256
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455261; cv=none; b=s03nbY+mi3LiQB3/fq1/uGnbDc9n898xF9ooxUvZqF8Qd9uEqMMIXfThiIMrjPS4558t1Orj4tflDWke1fjmtZMCp9oJr7XYijXoz5HJ3HCo1TvNr6iD2/I2RhpRs2qfKiM86pUrHBkssd5Luqy6yDsNWRIKjAq7B5cBIfHHN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455261; c=relaxed/simple;
	bh=AwxLjzrdk9/Z7BE85Y5oP4mxHmoYxY0IGia8Ki6oFXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKA0jrOe1kRXTUmfLzI3fLql5d2kVP5+G/smDr4Txw6XYPzg6YVeJ2iMn45LUADqFNB0DNPx7fcoUhTZ3nZEtprjq/FtZwDZK18MfdjcNdq//svDybaxXyZij7RVmEXZ4q/Sp281KgEOBs2o/uIcRJ5rx+i+XoGKE8t0iXgHSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b982b0889d8so359998766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455258; x=1775060058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7hxFHeXhaKh6ezauoVCeEqUVcF6/z5+QCU6EnsyTkw=;
        b=AUXhS6ruNYxWfBArm2D3t000a7Z9mzOJaWK0c/gndzWuGqC0Osxhv/xKQdG76z+o6Q
         8ikpjAjwbFETDrvQa+2WEleOtTukmbFR/CdvxO+WdTW1MlLx74uWFCpwv3H3XGsKhIDz
         GCoUFmB+C1VWiXizn8pUNmhTQ/BMZbrXVgd1hzy/IGo1lw6lUkx03Xq3k/KWKk5q3B+k
         ekB6JX71CSfUdfGQZWW4APxgd0ajDmC0pSi6IknAaZ2ZXH/hRD1nztjHhk9mGPyrw6+F
         jhj+qjTvmhxQhokZEne13rX/c0C0PXjOUhXhv6iJtJzi37XISLiUIuuFvuIdngsyHI/8
         Njgg==
X-Gm-Message-State: AOJu0YxTjMSubxQSY6RmvEvHRMqnbRZDBG7HBRgLlrYq+vJwHGZdauho
	ZAEd6wt4vc4LeGGAUm6YSbl44FiIHH5UFusl8f1cWLL9P4EzNjuD2i/espHSK9lGrJs=
X-Gm-Gg: ATEYQzzws1kj6/0iAMCC4auMii2ZXxfEhBRvk6V4iOW2U80C1/I5JiTAL4knhHgB69U
	FZm0xS6vCJz2uDhJdyDfobmZHjCF9xSwJyYcjDCjJy87ii2wxhRyyXz5I7PIuwtMJkEUYFL9fgy
	hd/MjN3GbGqQA5DbJZu8ZknloY59T+ddFL1mxEH/HAJ3T1QlnFsp7ZnxiXpTD7kFsn83QTROcMk
	4uoQBsSONqLMaVaK0GHfA8chkmxCxkCCljEFLhxnTTYE/ag4N8OXnCwgLHU4VmYba8gSxyQ7Kq4
	hfQo+tcZNM5RUqBnk+z2fY1fPGEIXwuDzewg49cZx0LGL/HouTfnktdrV+mZ+v7YbQgMGypX7DS
	zDtPjqTe2XqfRJijyrTIEgucTQso0q0OczJfSiu0vpQb7YdYpNH3TY04l26oTernlOlZqpWGiWT
	BzAtXGVF8VbBpIDQzu3CsDk+Aq09Mfc74lKMlCvYd4AewplcBzmjtG2JFzyJck
X-Received: by 2002:a17:907:1c9a:b0:b9b:1ea2:97d3 with SMTP id a640c23a62f3a-b9b1ea29afamr40942466b.35.1774455258070;
        Wed, 25 Mar 2026 09:14:18 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef450sm4267166b.47.2026.03.25.09.14.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:14:17 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97bca3797dso913766b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:14:17 -0700 (PDT)
X-Received: by 2002:a17:907:6c11:b0:b98:4551:e796 with SMTP id
 a640c23a62f3a-b9a5423c83dmr299006666b.30.1774455256810; Wed, 25 Mar 2026
 09:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319132907.2350458-1-aford173@gmail.com>
In-Reply-To: <20260319132907.2350458-1-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:14:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsa=TM8oX_cE8XZZWpDBH2m+q-Y-uc=v3xzCpkef-dMw@mail.gmail.com>
X-Gm-Features: AQROBzCHMIm0U58LxIOB3k6KRzR_C4wVTSUb0Mx4rQrhRbA8aVOLRlAYZiQiDA8
Message-ID: <CAMuHMdUsa=TM8oX_cE8XZZWpDBH2m+q-Y-uc=v3xzCpkef-dMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
To: Adam Ford <aford173@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, marek.vasut@mailbox.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mailbox.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-30261-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B45F2328CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Adam,

On Thu, 19 Mar 2026 at 14:29, Adam Ford <aford173@gmail.com> wrote:
> The LVDS Panel was never shipped from Beacon, and there are device
> tree errors, so rather than trying to fix them, remove it instead.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -101,38 +101,6 @@ led3 {
>                 };
>         };
>
> -       lvds {
> -               compatible = "panel-lvds";
> -               power-supply = <&reg_lcd_reset>;

Shouldn't you remove the reg_lcd_reset...

> -               width-mm = <223>;
> -               height-mm = <125>;
> -               backlight = <&backlight_lvds>;

... and backlight_lvds nodes, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

