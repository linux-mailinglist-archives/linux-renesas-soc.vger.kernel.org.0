Return-Path: <linux-renesas-soc+bounces-33978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NUPqLRaLL2qcCAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 07:18:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E06836B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 07:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gI8aEOLD;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7A8D3002521
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 05:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22D3305662;
	Mon, 15 Jun 2026 05:18:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835122F8EA0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 05:18:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500687; cv=pass; b=V/wyMETkqiTXJUr8g/XXuYV2Oyh5P8y7rt6VRowacjxnSDbWQ6e7lqj1gtTJ9zVAKhJMMMshlLJ0SaQOohfptxjw0adzQip5MiqL10WWldEal+c/1DaKYinJ90PiJGpoKCyc+D1wQfGU7PQ6d8UkTR7Fbrb4zZnE/1z6QKdLe5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500687; c=relaxed/simple;
	bh=Q5OPxhP+CspScS1nLYEDe5+mVuYgOaCZiuJROYkIGgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQZeRnf4985mKJ6gxpkAWr2NK8VCUzdU3cq6WNeoajZ/YCuaFC/TIHYpFDwa2QH/dmeiwqOS4upZt8oAfhkJ7FeWLJZ6cmz8d2Y3RjTCQPSU2ZEAG/915MBsOBq07xU6pE4G7vaRsOsFtoK66ti2QytxIXWdl9ah6lINTIIqTlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gI8aEOLD; arc=pass smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c859a374903so707255a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 22:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781500686; cv=none;
        d=google.com; s=arc-20240605;
        b=EabXzdIKA6YvIJvqTgmwQy3YlaWTCvUuZiK5Z/e+ZT8miafibEmXGz/Pkqn4s/ycz9
         vWyreLrV4GtYWmmgoBB0h9Ryfn78pGpWSFBH2j0lUCQ1uqKM0PYLbImAlEmhn3dcER+c
         Y/tjIWXW2VmX78Q5n67kJoLdP+NTne3ZoqP5gBwlMSTj0P0nMISF3biaSdewGHeV+yq5
         u1B9VNBo32fV9FVbJoE2loFHLMhzPp/8tH+bhGwK5XiHNV5Jkf4QFcPQxT1MDGRRYVhV
         yIec/FUY+OaR3cEHz4HuF9z+eMF/nF97BDSMvhUY3LspLy+IBy7jGTDLALL6XWiffC0S
         0DGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        fh=TDHSnc6M5meTGMs5pWb2X2aMptABNk2oBVWpk2kTXFI=;
        b=ItMnvaKE+rIHJaaq0lL2dr9+b3uJB1+88DzSB7+haKjONNE5ZFRxlQyffnZrkdQnMt
         X3vn6XFB4I3bclU3pBvyWqDIkLKfJgtHB9SIP2r5KGewNB7bURi2SoXrZR2j9UAnhmZi
         WwpplFEAKL4NXQwZXImBn64d+PoRF1S/LwsDJr7hzve/jSzY0xqgM7Znf6KeReOmnyOl
         pZBisEltv1TPBq+wUEsvPRfO30Ps/Q80ImfRskI5K2U0Eq/hhHxvSkfe9PZ9mwvnhDSH
         jPPLqUEVqvWV7dNOXVTy5db6hwvfAjp1f2LSyIcY1zp3jEJ3V0jHyxhLbjeZm7GWu5MQ
         +aUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781500686; x=1782105486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        b=gI8aEOLDJHxr3vddWqxcSkPia4NVb0rgcMWjJckcfXgs9JMMdHuRPmGgdgXgcE+gEM
         fSOCjCnAZlp4chumWjLUpFFkPcmhvU5Dm6y9YH0heT1nAZb1D51RZfWQHDopB5T4XDF/
         EjdZYc5kP/9xfRpZNxAOvLpPCUwpSI+yS4uFPxIVBTsLlSeugQl1ILJnsJNG9/+kr4jL
         MMBgdTch0V/RKzed82CLFeG+DAjDaKsc8m6QYIwiJ/e4XWYsIQ8dbmTt86ddQVJipFsz
         ZMtoqzab4YL3pBTbtUWDz/dNuY15NJIXRfo4tUaGbwma5NjC3g9bS5lfxNaUIGCAS4IK
         RoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500686; x=1782105486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        b=n1dDyU0pACN0jv+8mFdrRDUxvy8pOYOKLkugy7HBV54EUEn5r+vaUZan+s45vtdH3/
         SRrrtMAWbAsw3OMjF+eQ8TrnA9s2VWundKN40R1fvbqNzaNEQmgYkPkdoWFhEZFPgwIs
         tZjq2S+sRZYv3eufYj2ehn00FFvB0AgSdEolnI/JlAKsHgIleHICCi+IFc4VNc4TeGmR
         x/AadDbBybv39oLJAYeWeh6O3WrIDrQB1bJ/mlAmYdkGhGEQjjx69SOV5l3YuLkzPfgL
         j7guObghpugoYahCi3fpmpGvp1heD9lg9nNrengXM147Uf1r+C637t1hCVwTsxPc93IF
         6RsA==
X-Forwarded-Encrypted: i=1; AFNElJ/4n2x3BaUCkN0kX2ahfF0uY77KLxEBuvflgfXA8dA/wyAB/PsmLfYOJA2wbpp91yY7jljTDer5MOkhZ0azPQg/Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66H+k5T6ulHBwy3G8LGSVBIzrATmDwvWUw1SpzZN1+Vym3lAm
	2A++P2KacoON2uk1tUWUQnkkB5VyM/9O5f7feVnJwzAw4rasNGQda7KU0oDr9Wnr5J/IL8vBR3s
	lceMsfPdr1zpY4qgqtjAoUF4gcSSO9/0=
X-Gm-Gg: Acq92OGFX43dEbdPB1dOXba/LTOKRM1jzdNzVggqxsvu4lJ8l1RSuh3f2TV+Qs7l5TU
	7HhHoVOS9hN1qLr7Rm7H5jKQ2V4Rf/o4Ez8FMxpw3rS5OE9ytZaGFIRLgzvo7Cytd6oqZ+UKimv
	Tt89NwpzDs+CFaaboSSpPg7+OOfeQYK4dpYET3JYa7G8rasRKqz/ZULQtTKUV9GfII2UU9JGpl+
	+3uYNjjR/NtCR2X0DPnf4ZgZNmoJmJ6oFhQosoWiMEd003nbaZYb+ufyKzZs8OtesKItHp/rWk0
	c3V6eAthR87N9p+xv+yXKFf0g+nwRjA9dugbYw==
X-Received: by 2002:a05:6a20:d43:b0:3b2:a8cd:ef4e with SMTP id
 adf61e73a8af0-3b783f23b40mr15009348637.28.1781500685831; Sun, 14 Jun 2026
 22:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
 <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
 <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
 <CAABR9nFoLrYTUqRr0__n33EZ9Y+YfM=RxAMsx2EFnDWxHa4k3g@mail.gmail.com>
 <CAABR9nHtihP+JW1WcaKpw8470Y25LvZgzNqSZaU09u9F=2K5Ww@mail.gmail.com> <CAABR9nEgE=jGTSS7snPxyRDgRj6qiFDDkbm0MBM40RpLy_nESQ@mail.gmail.com>
In-Reply-To: <CAABR9nEgE=jGTSS7snPxyRDgRj6qiFDDkbm0MBM40RpLy_nESQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 15 Jun 2026 12:17:54 +0700
X-Gm-Features: AVVi8Cfvt5cdb-6_WYt2gRmdURKt0pynWpaJM-czjNHwMc5_DptuTE2uMt0yVH0
Message-ID: <CAABR9nFUGY78TxN6yT92a=h+Xe3QQFTKqk0-LFzNExqGOOKK3w@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33978-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A23E06836B9

Dear all,

Sorry for sending two additional emails regarding FSIA. They were not
in HTML format and therefore were rejected by the mailing list.
To avoid further confusion, I would like to summarize my findings here
and also include some additional observations regarding FSIB.

1. Regarding FSIA

The 12.288 MHz oscillator (OSC X8) only provides a reference/system
clock and does not by itself determine whether the FSI operates in
Master or Slave mode.
The Master/Slave relationship is determined by which device drives the
BCLK and LRCLK signals. Therefore, assuming that the current MCLK
source remains valid,
switching the FSI to Master mode would primarily require rerouting
BCLK and LRCLK, together with the corresponding software configuration
changes.
Alternatively, the codec MCLK could also be sourced directly from the
FSI MCLK output by rerouting the MCLK connection.
In that configuration, the FSI would provide all audio clocks (MCLK,
BCLK, and LRCLK) and operate as the clock master.

2. Regarding FSIB

I could not find any FSIB-related connections in the available
Armadillo board schematic. The schematic only shows FSIA.
Therefore, there appear to be two possible explanations:

 1. The available hardware design documentation is incomplete, or

 2. The connection between FSIB and HDMI is implemented internally
inside the SoC,
    so the FSIB signals are not exposed in the board schematic.

Personally, I believe the second explanation is more likely.
At present, the only signal related to FSIB that I can identify in the
schematic is FSIACK, which is shared between FSIA and FSIB.
I cannot find any of the other FSIB signals. In addition, after
tracing the Linux 4.2 source code, I found that for the FSIB-to-HDMI
path,
only one FSIB-related pin is configured:  ' fsib_mclk_in '
Furthermore, when the audio stream is started and the clock rate is
configured, the driver calls: fsi_clk_set_rate_cpg() rather than
the external clock configuration function (fsi_clk_set_rate_external()).

At the moment, I have not investigated the HDMI subsystem in depth,
and I do not know how the internal connection between HDMI
and FSIB is implemented inside the SoC. In addition, the original HDMI
driver source code has already been removed, so HDMI is not supported.
Currently, FSIB is not ready for testing on the current kernel.
As I also mentioned in the cover letter:
>   - FSI master mode is currently compile-tested only. Full verification
>     requires a dedicated HDMI driver (FSIB) or hardware modifications
>     (resoldering board resistors) (FSIA).


3. Regarding Geert's question

> I have one more general question.
> arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> audio for FSI (fsia_pins), but does not fill in a clock-frequency
> in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> the schematics call it FSIACK.
> Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> which function is used depends on pin control.  However, the DTS does
> not perform any pin configuration for this pin?
>

Based on the current schematic and source code analysis, I think that
if we continue to support FSIB for this use case,
the DTS should explicitly configure the FSIB clock and pinmux, for example:

&fsibck_clk {
        clock-frequency = <12288000>;
};

fsia_pins: sounda {
        groups = "fsia_sclk_in",
                 "fsia_mclk_out",
                 "fsia_data_in_1",
                 "fsia_data_out_0";
        function = "fsia";
};

+ fsib_pins: soundb {
+       groups = "fsib_mclk_in";
+       function = "fsib";
+ };

This configuration appears to match the current resistor population
shown in the schematic:
FSIA operates in Slave mode & FSIB operates in Master mode.
However, this conclusion is based only on the currently available
schematic and source code analysis.
Additional hardware documentation would be helpful to better
understand the internal HDMI/FSIB clock architecture and to confirm
this assumption.

Best regards,
Phuc

