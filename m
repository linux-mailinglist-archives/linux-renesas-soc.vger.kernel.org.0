Return-Path: <linux-renesas-soc+bounces-33586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BFRWNoZxIWoPGgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:37:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99C63FEE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:37:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 576CD30CF45F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE07A477991;
	Thu,  4 Jun 2026 12:34:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408A3A9852
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:34:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576493; cv=none; b=bbXd2EXDHvzFzQYtNT4+yInQgbqpj10kUkWvoxIKd0oyl1NBiv5HZLd3MbU+ivn5kDVSQvoyap19YteNyQxyVtqJsZphswRE30/nxGZLr796e/TvvDe8d1+z0Fv2j/Mb9mlSlEHAT8lM5aiDNqaT2ToY4CPHvlQJ+5Zy4Q49PWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576493; c=relaxed/simple;
	bh=yW03jyIaXvDzqIO05bz6BGBjkIGqHU8ZE+ZN1NOsK4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZkDZkcIPZAFsC5SE707PFe9aRM9OOwoDhBMOXfZ/ij0AocOOTIbJnrwSUGeY8Epo8Jzc3/yfI+w4mGl9ihYzOghOldJw3o3heFubrVaUcACH/EXeexmApbR6GVHz1DrYVWk8djl/pHTpKA/nTtV/MqY9ynRrspBkvDMEenfy8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c67361fa3bso1252602137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576491; x=1781181291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocjXr/qWGa2IO/F+fdPQn1MjiaT2nZR31qV/kAYxrTI=;
        b=raAmvdOhUbqzk+tBbRF9EqJlsKbFfjHs8215zEpaU7vljy2PWYaa5wIXVi0NLX5hxu
         we+E8nRzPrpSv0557Qe2ioaQV4BCBYahf4Ofduk7mihVmX0yqy7KCN3n3zcMQEHpS873
         6UPjZGenFnQDzaOXFiZcV2BKIbF5LMmamPIb/YEd8JZXrkajkOL7Ae4wEwU56PqcFihh
         ASk5IUxGG83pEqWl5+R5xJJN33RvxdNl7J1LNU/yW5Sy4K7RBatwixcOkrWdW4osCLqo
         1mag3mehcmaYDC0BR9u5P/LJVg4jd8TGVmRaFomOsVJk4H41UAMxdzDLKcVro0uqHcYl
         I7xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8R3zIsHQXx1ootb2ujn99nm3AnJmM6sNGPddCtDPbTmbT5dknMB+kn9o88Qpu5JZF+rtxwfmsEv++Bxj6bSSoDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+S2Qn3U8P5zZk42hldMZOGiL6PPYeqgdY1vvZp/YkmfDHcfsa
	B132EgqP0CYPLue6Zv9i1UzM5xVJQ65pEc0xOcNWLk61XAhXWAlsXdhp+W1KvKs76fs=
X-Gm-Gg: Acq92OH5D7iVFpz4pCkBn2wXVr8KVNHlqmD/sMyvsSL8+c6/4oex25SgNa8xuf0me/9
	57tEDeC/6grUmwdI/9pyYVJQpeI/KXAwnhOxYIf+NZyMdhX4FxxYk9sIBuyJmxk33VDJJieuqRO
	2fIXrnlJNVjVHQ9sQ0RJWx3ipOjN9aWvKoPN0v/ycTHqSzv0jNkzUqBTKMUz0Ex59dAw8ZjDeUA
	m8KfkUXp0o3G0SI9ZLcZVakP21CSB+TjLG3BBUD7vt6ma25EKf/6HbdNzWL7Dv/d53orQiiUtsS
	1JmSEuhvDwM62QIG/ODlI/YKDrBDZoepuC/gUHCMsQTqxVsgNVP2z+rxpFjetR8HV0jtujhXWIS
	PyqY/Q/iMW0pprT7/0CET1mvIOrO/chnik3fUN247bSB9IC9KMV3ZW7+1qo6PFvsKlAgPp9NOlw
	FQF7qXlVAiONzmtTY8qrHEKtxescexHaXFPDDf+FOCSpZ8ZhbeHCnFMlRuQJJjNeXZt5DbtFM=
X-Received: by 2002:a05:6102:3e12:b0:65a:fec7:137b with SMTP id ada2fe7eead31-6f52f48203fmr1566603137.0.1780576490808;
        Thu, 04 Jun 2026 05:34:50 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5549144csm4881108137.3.2026.06.04.05.34.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:34:48 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c6507549c3so1240970137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+aprO8IcX2T6+XpCqPqbk9mFapMEOSVplm1vI9Q4pyeaNKBA2C+ysBG1fjnW8FwvNR1A7RkUd3Tb7Xub6uVUTe4A==@vger.kernel.org
X-Received: by 2002:a67:fdcf:0:b0:6c5:94a0:37cf with SMTP id
 ada2fe7eead31-6f544240339mr1047511137.8.1780576487197; Thu, 04 Jun 2026
 05:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:34:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSgVe4ufTEvrD0ATwApF1xwiVa8t=P9O3rxh=sBegV_A@mail.gmail.com>
X-Gm-Features: AVVi8CcBcbjPZ-LGjktNLR06D20t6UAro7xtsfCHuzIIFQf2Ba_2cx9aOlEskTc
Message-ID: <CAMuHMdVSgVe4ufTEvrD0ATwApF1xwiVa8t=P9O3rxh=sBegV_A@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33586-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E99C63FEE8

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the Renesas 5P35023 (Versa3) programmable clock generator on the
> I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
> audio subsystem.
>
> The Versa3 provides the following audio-related clock outputs:
> - Output 0: 24MHz (reference)
> - Output 1: 12.288MHz (audio, 48kHz family)
> - Output 2: 11.2896MHz (audio, 44.1kHz family)
> - Output 3: 12.288MHz (audio)
>
> These clocks are required for the audio codec found on the RZ/G3E SMARC
> EVK.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

> @@ -130,6 +136,20 @@ raa215300: pmic@12 {
>
>                 interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
>         };
> +
> +       versa3: clock-generator@68 {
> +               compatible = "renesas,5p35023";
> +               reg = <0x68>;
> +               #clock-cells = <1>;
> +               clocks = <&x2>;
> +
> +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> +                                 <&versa3 2>, <&versa3 3>,
> +                                 <&versa3 4>, <&versa3 5>;
> +               assigned-clock-rates = <24000000>, <12288000>,
> +                                      <11289600>, <12288000>,
> +                                      <25000000>, <25000000>;

Please add output 4 (DIFF1) in the patch description; it is needed
for Ethernet.

Please drop output 5 (DIFF2), as it is not connected.

> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

