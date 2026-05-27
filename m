Return-Path: <linux-renesas-soc+bounces-33193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COqFMhiiFmqBnwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:49:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB95E0A0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7CDD30028F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D5B3CCFB2;
	Wed, 27 May 2026 07:49:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8123C872E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868178; cv=none; b=uzaS1d2c153o/To7F+30NMKKUBTn00ICM6/rdhk6AYh1UdyCegy6rb2liQjmXOv9BZFuhLGyKxtocokYTabaltnqGh5hesyS0kLReJNT7CBTAJiH0KhAd0VFutTcsuHt2EX3YNOvgvOooENdibEjHmRpPEILD5FflMjdMNfyqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868178; c=relaxed/simple;
	bh=j8lyWip3ni+b0tIn2WJm+uY4Eku+ozs0Gksj2gGBzEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwYg6tmJ9LcRKigNLUc+HX7ckmtfFuOlAFITSUR/m2uvgJoGI4myashXYI+VjDCl/unwgjySmRUK9ZmoQOiQaK9nPeB9QnUB1P676oIaMeHkzQ8GyhHp1Ij8UXdpwf5sIzhabsy1SQuRnouZb/7KUfiUjRliMTqziE/XVyNLNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-960ae134040so2128263241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779868176; x=1780472976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEhdAJn+PWSD3SIUt/1YVQ0ghKtTAVNe27MEz5AgvB8=;
        b=kegL6d1t+FApNRAJJbou0JNwZsWNpCYmv7uA+c3u+grfvZpLP6wWNaRT6THkVX1h5Z
         ZgQ9XeHw41wgRpnQ5T+im8/8z9koZ9SaH1rbJQXdOppcste8a5e8noH4AEqvFko1pxkV
         vj7dItBxlyojFF4hz+ROUE05xZtU9lGJpOEZUkDCvE1NNS5PBe/7O6ATRgP8pzJeXVPm
         kKjQv1PhStI4zmW/vxthdhCh6gYzKzbQoZ5xbmcM+FFjRp3pqh0b6tinxMWdOjZzazMF
         OpwQy0EyqonQPxAmtADsIBe1IjWZoOFBCpJx/2nrSeZ4lB6KI7rEObWAq9pvdwU2m93T
         gzIg==
X-Gm-Message-State: AOJu0YyVv0EB+6oAYfWL4I090G4ArIeC7eHSTAZWQuoUMkjTcdBhH0U8
	Nwmk5c7p2q41d+O+xYQcEBv6+OXc6vc5TWmXvoixLABf2xL0w7oauD6rmBEJhCuFiLY=
X-Gm-Gg: Acq92OE14fD8t+yPh4bwC4A/zjV3v6KIG5tgHBLmGLuy3GuH/FqJas12RKqI9iciUFj
	Wnn3jH5JZw72Y2dyK1bytAwkZvoSJ/FIdNrMx9okuNf9HoWcAFEO/uooWcx2nWcBq+YtzpZBkOl
	Zvg0HsJ2WsaOhxL96xrPxHC7GqyqCw4aRyKMk0q8WsbBux1rcPC7kjVyWgrABPJeX/1e8X2/9RH
	haJhjCVTdfggvsB3+Bn3iEKrSqlM2sdp8rkHVB5Y7bqVVHLD6eZenmex+CZp0AUhgPY23jroms8
	AtD8qgWQZaiHNsCNRwP6C45EiKlCpbyyNwZ9Xe2dp5hh0xWActzIiaJJFycYNuCefERfY5OZaoO
	ZE1al8AgZ2zKEedyWo3skfIuvZ+NInGwr4IHGDYaMjENmZoYxhrGdXKjtM41WnilxlJkF7B/K6z
	lo/scir0cSQV7Df9RzUuDqxlvSOfTqraRGfsP4B5mtXKUl3xPwPUrgPZHcrLr+ef1EQldBRRKQC
	js=
X-Received: by 2002:a05:6102:32d5:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-67c805b5ee2mr10621353137.25.1779868175661;
        Wed, 27 May 2026 00:49:35 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850d17sm16139071137.1.2026.05.27.00.49.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:49:35 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5751e12c524so3980482e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:49:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5e88:b0:631:8665:3511 with SMTP id
 ada2fe7eead31-67c82ff7ba4mr11184297137.30.1779868175098; Wed, 27 May 2026
 00:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com> <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:49:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
X-Gm-Features: AVHnY4JfiVZzEOtyriYMG_UyYpzEp54K25gB24_348nKEGFu3kahakUyvYBwnjc
Message-ID: <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use SCMI
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33193-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.14:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: D4CB95E0A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram, Morimoto-san,

On Tue, 19 May 2026 at 09:47, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Enable SCMI via MFIS-SCP and STCM transport area to manage clocks.

S-TCM

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -6,6 +6,7 @@
>   */
>
>  /dts-v1/;
> +#include <dt-bindings/soc/renesas,r8a78000-mfis.h>
>  #include "r8a78000.dtsi"
>
>  / {
> @@ -20,6 +21,23 @@ chosen {
>                 stdout-path = "serial0:1843200n8";
>         };
>
> +       firmware {
> +               scmi: scmi {
> +                       compatible = "arm,scmi";
> +                       mboxes = <&mfis_scp 2 MFIS_CHANNEL_TX>, <&mfis_scp 2 MFIS_CHANNEL_RX>;
> +                       mbox-names = "tx", "rx";
> +                       shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
> +                       arm,no-completion-irq;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       scmi_clk: protocol@14 {
> +                               reg = <0x14>;
> +                               #clock-cells = <1>;
> +                       };

I am a bit reluctant to apply this patch: with all current firmware
versions, the system will lock up after "clk: Disabling unused clocks",
unless "clk_ignore_unused" is used, or unless out-of-tree SCMI
quirk handling patches are applied.

Perhaps that is OK because renesas_defconfig does not have
CONFIG_ARM_SCMI_PROTOCOL enabled yet?

> +               };
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

