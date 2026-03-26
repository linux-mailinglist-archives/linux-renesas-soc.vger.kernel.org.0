Return-Path: <linux-renesas-soc+bounces-30317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFQkKsz9xGny5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:35:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A584A33267C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F62C300D0D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3890733ADA7;
	Thu, 26 Mar 2026 09:30:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29216344D8C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517404; cv=none; b=XAshrYFGv2iyhX0K+EtNmrbc/mfkVSZRm5w/ot3Iv/YvMz0H+XTDMfg0sYtfLyAQCLL5+dh1EY/c3C6rVJMD/AzOCJ44hHVk6fu1MGRMZcTGN19JA61oCpKW4onPm5SXIdh01Wpj4j58E+HQ53YymwO65W/B7l+6f17yTe8lEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517404; c=relaxed/simple;
	bh=k9HDcRqBnuJFvwQk6gqRTKhQzZwVzR+lN2z+BoG0Ts4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPh6+RyadUS6WGF3ZNRLTHl/m/95wQ1m71qQt/I6bQjby5VuXYYQznNUZE9NtlRSF4LIr1b4rS5VGgIlCim4nwkbHCsb3WwShcBnv5AB+dlnrHUpiW6OPDH9vZ85AYIC87onaTD9mFVk2WsAvFSvbNMpXvkJMIRupMh8Sm+6zEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so1191864241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517401; x=1775122201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PE3iyzx6jIK3ZsNdv8OtLecBaLX2UfrDS1pqoPXCU0=;
        b=q2fQSrqajsLOIH80c0YThtftcPCivBOYvybwVZbchxcAhIOaPZF3IGlSPk6gxoSVBw
         9cddOp8Zq+P2lFEN7waYKsNgEBdXoZv8maamYaaW8KcG/E4ifZJqq4ibZkOyoYnJU1iN
         sNqRc8NoSFNg62V5MTk2ZCNB5JtaWBz1n3sOiqWgTk2HYVZf9UEvGAui5zkhpV2rJ4D9
         e/edMlwvV50xK0qmMewhX1ZmLmzIIUEdqVkPuomcQl//va3kzewh4067mGSB3Thr0X/T
         KYUNK6qtvRV0D0zorBVviXmCo9LVv90PBCF8tUKyNmfTdDuM3NF4+Wjfu7l9hvOGcn4L
         OvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/jMYFbbJ1pPWlky15397FhNaMEqwoGCzh9kRcqmynA/b/QnjrO5EJgYotDueedB6CMBX+Y2vG2DevDgaIfW/VGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7DnaAS+vmbUn86kQP37+xLQW8J69KNb0vBlCKTm4fatVEqQw
	MqbPAln0ieXF4dPH9m0EXl3Qdomg+i9ImmmAd/nskI+7ceZ3o3z/tBs06LCAJiNFO1k=
X-Gm-Gg: ATEYQzxZJy3NSG4IB7D1D5qwLP7pf6jDbKQpIZFE1Y+rF0jyhVEZgZIcePrLM3fqYcw
	M21oWThbcrRZBUMncrDL+7KLEQkk6PAy6wq5wkO/ib+LIzM4OSPAptFs8TsSuY8UNtMTO+RkO5v
	5Vljs+hqEc7bgew4Ao2IUUiR6eWXKID4exfME51UR7IrkjGW5x0pcPLUPv5aqLKAuNfbUuut892
	UW+iz4HO/U9z+s3RxEeM7wfoc6zVt0UqPEyiVPuF4qEFU3YSgMwdndIdq0bgnhHI5FKJ5k2w47X
	9CIzRjxzCZhZilYT7jUOLDrdQ0yqpyMDys6qxQvKKw+PuhUCH6rbdmru0a1HQ1X4EZ8Gz7H0ejK
	UgpJbk9l9YNi+YJ4L8j3K0dkA9H3Eg+f/5NTpRWGBB5rYkvqYNGAXPkspt88gvNbCfIdq1GWRlE
	69QMhmJ1rIwGvXwzgRbfXU1Wt2nUg0Sio+GKltMtrM3vOr0vAaT3D6LbLiYXbWpXtH7PI3YQ4=
X-Received: by 2002:a05:6102:4414:b0:602:90b8:9840 with SMTP id ada2fe7eead31-604e4df69a9mr259776137.18.1774517401067;
        Thu, 26 Mar 2026 02:30:01 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1065ffsm3078999241.2.2026.03.26.02.30.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:30:00 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94ac3958788so437632241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn6anFL1rY6PbB+GoHLgmZxPnH8WRC77jEBpLbqx1+ZY0aQ3AP+lpBUD4XlzhqXm8T+/jGVYU50di0r98kuyLpww==@vger.kernel.org
X-Received: by 2002:a05:6102:f95:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-604e4d73ea0mr248413137.11.1774517400168; Thu, 26 Mar 2026
 02:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203123503.314755-1-biju.das.jz@bp.renesas.com> <20260203123503.314755-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203123503.314755-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS4QuPL31T8TGhs_iK3oG0wkRgtoMXF0n0YVBdBJk-ww@mail.gmail.com>
X-Gm-Features: AQROBzAm_WIhUFg5CDklg-yPQ4dppCZIKqU-HJ1ZQvbi70s_CgoDPHKhQhy0-xk
Message-ID: <CAMuHMdWS4QuPL31T8TGhs_iK3oG0wkRgtoMXF0n0YVBdBJk-ww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0
 (GBETH0) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-30317-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.7:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A584A33267C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 3 Feb 2026 at 13:35, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interfaces (GBETH0) populated on the RZ/G3L
> SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
> added later.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

>  &extal_clk {
>         clock-frequency = <24000000>;
>  };
> +
> +&mdio0 {
> +       phy0: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";

Drop the latter?

> +               reg = <7>;
> +               rxc-skew-psec = <1400>;
> +               txc-skew-psec = <1400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;

txen-skew-psec?

> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

