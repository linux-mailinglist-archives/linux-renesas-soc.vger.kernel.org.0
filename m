Return-Path: <linux-renesas-soc+bounces-28716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHlXOZjvpmlKaQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 15:26:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4271F16D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 15:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64C1830523AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 14:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24AB429817;
	Tue,  3 Mar 2026 14:20:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D76B31F9B8
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547640; cv=none; b=WWOM/l4fKJMXl7WSBZmS+grEmy1J03w0sOfvqndyQ5D/PeMZbD3V4VtArWEsv0ekNXvhPPNM6oqR3poCsBL7JcAIB5zvPN6LKhdl7wMKlaMaIkGssR3VQ9yWJS52tVAhpHiXb9S3dylTSwkEHf34OP2i1WtoK3q7407G4VGuzyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547640; c=relaxed/simple;
	bh=wtZfk5pgxHXPCwGOwabIDD/nd1aHppTS+y5luRZOARQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxyZCM/k8k83+Iec9Dyn4seLujpifRRzfk2LPM0urHmL2taWWqoQEL8II1Hj4Z0gIMvDr4CUecE6bMIplHCnA1/97eh7UMm3LDixjeMMw6ovtDc1LLAs5KQ3brxl7gwKfFeDQnrK2eiHgk+esrcxm8DPO4kFcwKF/xsHtCgo/7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56adf76631cso92522e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 06:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772547638; x=1773152438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzpuaoWo4tTBT1JIh9AqPNnIh72mJI2cM1ZUvKYy0Dk=;
        b=p2IBZkiHMM3ecBKjEUaaHV/9dkfNK7ckh85qAc1A4ZikHDhfitkRttorq0CGFtLj+M
         EKZTpGbeVpTpQjrVqZlQINvMF24Jo12z6fPGO5ha+iQrAPDz0f5PEgJLjohyg993zpQj
         hqzxFoPjarLBeLsh11sRspY0LdtqhxKRO8mM643ZZ1XiS6GU5/ZRyXTomwgOQE4z+gk3
         8Jz5qB3jkGwbGRbnqG5gtlb4N/4L6gb/H1ESGnUTpf/WBHZHMmHxxAw6//Omd99TaIzl
         HlNpp2iLVn50cR77DHokdcq93lG7YaWeoU+r0BNsfmkWXYNK/zJLLU7Quub952pM3nhU
         6zHw==
X-Forwarded-Encrypted: i=1; AJvYcCVexMB4uJ0mbS6BJw8ao3Miw0kpvjm5nHb4pET2iC8rQfycz6CQI5yNIXrZBOzIEqt7vffk0LOYwb17w0KgLKZryg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUFzP+TgypUY+VNtua5u7xZhSF7+UX8HZf0UvS27j//SQjP71
	zYgg0bPV+e5cyUuyZDzOTgM3rT5AnDp2aXVSkfAUvEThQTJecfBVuAKK8KmSlvIl
X-Gm-Gg: ATEYQzy7TdFeD9d0KdKh7qk5l6+d1AixWcuzB4QuoyMnW48Nvw+ZS68SDiBN44nbGJj
	7R+hZyMeTWHpjJ8RuneJiApa7ggzoUlT9MeRfSAfiyClm/yngd5fRW16AfbvVAlRzJkud3K3Bl7
	fnRL+VLYo5bJrd30fcbw8XR7nlTzyYOLmH3yoDBaGCHqigmWM2nbsY5nonx4z3pzzqgVgInBtsn
	TmiWT8vDEhnHXVaF2YhNA62DZYnBeACDzXJ0b3qhHoiNbsWh3G6ni9ClhVWnz8UbMBbwxv07dHh
	3aKtVLnBUtNxuW6Zpw/abQCpt/Wb9qxsO+kbzuClsbTyBQnAnt7FSgb2BYlbKdXwsaN+LEgxjIT
	T4wIs2pPIgoeDryWqjWnpCAaXjjFSFOqnFUd2afL54W7vWhvT/nDuABtFfnMFM1oPLurm3DrsnX
	q1r48UwwWY36k92TEIDuksuD5kYHz+fLtE8SDJtwlIJs4Ah3orrJLNNERA6Kzg
X-Received: by 2002:a05:6123:51:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56aa0a17572mr6285476e0c.6.1772547638305;
        Tue, 03 Mar 2026 06:20:38 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb97absm19203916e0c.6.2026.03.03.06.20.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 06:20:36 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so1367694241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 06:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWV+XFrvL8W8r1Xhk0Vxqu1tco5g6UvoK0ip1/OKdOi1RLx0dOZV+sbcSKc65OzDN+rVHkH8ZhQYZTFhD+BOMavcg==@vger.kernel.org
X-Received: by 2002:a05:6102:d8f:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-5ff3258ba0cmr5792258137.35.1772547635180; Tue, 03 Mar 2026
 06:20:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302135703.162601-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260302135703.162601-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 15:20:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsTqVEc3DFvgSZxTvF_F+Us5-RtKa88TYN1S_fGjdEHQ@mail.gmail.com>
X-Gm-Features: AaiRm53qSSjkvTClA8LrrJ8BcCzq-ceTd4NKfpQmi95ie9fBdePR4ZDrlLHB6KU
Message-ID: <CAMuHMdWsTqVEc3DFvgSZxTvF_F+Us5-RtKa88TYN1S_fGjdEHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc-som: Set bypass for
 Versa3 PLL2
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DD4271F16D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28716-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.172];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 at 14:57, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The default settings for the Versa3 device on the Renesas RZ/G3S SMARC
> SoM board have PLL2 disabled. PLL2 was later enabled together with audio
> support, as it is required to support both 44.1 kHz and 48 kHz audio.
>
> With PLL2 enabled, it was observed that Linux occasionally either hangs
> during boot (the last log message being related to the I2C probe) or
> randomly crashes. This was mainly reproducible on cold boots. During
> debugging, it was also noticed that the Unicode replacement character (=
=EF=BF=BD)
> sometimes appears on the serial console. Further investigation traced thi=
s
> to the configuration applied through the Versa3 register at offset 0x1c,
> which controls PLL enablement.
>
> The appearance of the Unicode replacement character suggested an issue
> with the SoC reference clock. The RZ/G3S reference clock is provided by
> the Versa3 clock generator (REF output).
>
> After checking with the Renesas Versa3 hardware team, it was found that
> this is related to the PLL2 lock bit being set through the
> renesas,settings DT property.
>
> The PLL lock bit must be set to avoid unstable clock output from the PLL.
> However, due to the Versa3 hardware design, when a PLL lock bit is set,
> all outputs (including the REF clock) are temporarily disabled until the
> configured PLLs become stable.
>
> As an alternative, the bypass bit can be used. This does not interrupt th=
e
> PLL2 output or any other Versa3 outputs, but it may result in temporary
> instability on PLL2 output while the configuration is applied. Since PLL2
> feeds only the audio path and audio is not used during early boot, this i=
s
> acceptable and does not affect system boot.
>
> Drop the PLL2 lock bit and set the bypass bit instead.
>
> This has been tested with more than 1000 cold boots.
>
> Fixes: a94253232b04 ("arm64: dts: renesas: rzg3s-smarc-som: Add versa3 cl=
ock generator node")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

