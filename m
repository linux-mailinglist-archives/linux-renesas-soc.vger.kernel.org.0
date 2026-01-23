Return-Path: <linux-renesas-soc+bounces-27331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBlkEuZ4c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:34:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8A8764CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1C373017386
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70203314B79;
	Fri, 23 Jan 2026 13:34:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455193233E8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175267; cv=none; b=NHheR5wZ6xvKnysq9+B2992VY4J2qMcDMh6AuhItBA7Bh4f09oglAOK5f2L63VaxoWB6nnzH51erCvjuq0QBOCHdJx1sm3C1gETotToIMUi38yQtQtvAu8HV1HShoQFbjMRmhJNzKQGEdsKBubvzPEC+5qy3OMldbwJyYuBDbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175267; c=relaxed/simple;
	bh=BBelxpCNfyNgrKmosQxaTVM+6G81cYYiiZT0HIE7b34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hssKTUy0So1p1tKLGV/Yirg84MGx3vaeiNkXU7+tYUeP2nEon/7NWT8mnApHckLtvLKfrppZIbHMqCsZgyC76Umq/B/YADvLJK6s8YF2ex+PzMnnZRTYXEuX9XyGD05A1Uh+4wvO9QFBT51YMkjUNI5064q1UTkvHIonYCD4y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5efa6d5dbf5so631430137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175262; x=1769780062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FaJ17quXgLj3q7lesyxJ1BD4hQkqNGO4klrnGmMXe0=;
        b=b7B1LC6X6W5Nac8esffoCwC99hceOCIfhXjjo1brXTxQlTHPn0oUVse/sgqV0Xh+pP
         ggy42f0lT4fxHD3rzIAM32yBe/+e2L/tYyANtXPyoUPxJ5j9ZGPkNOGa5JxyCM/tuzg8
         7keLKUTOusnKTsSXZ7qDHkg26ak5CD+qcGNMDXFwiwhlNRgS9WHW4JC6h2GwiTili7+W
         Fdy94YPJuoCK3GHDtvBRMimt6QnR/HP2Lbm15I3muk7VMP6TwkwTOGyvMKIgM0AGQrem
         Zl/T36WQ0/30OaptH9MO2SIwjxaN5YHbVlKG+ywQCqSE4oZHOccW9HqUIYdmeMcPhul+
         +AeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDYug4gKpJjPFzJtAN59erDO+EwUydP4geKpinNBBIz0XqhQ0FGrC2r2ammTHEpOvvcLXmF/jeVoP7osAauSOimg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39QQCaiY5VdkkWVZcvZYrTln4iIxodk2DGXigoLpqyC7sPPWf
	BkDzoAXN235BIzyH2PhN89yLkMECFfo9B6V/ZBm4bewxyXEVpJtYuyzj3Ep8CTZ3jEc=
X-Gm-Gg: AZuq6aLSEYN6AjGKGuh13sggiIYFbkhmYYOIh2l5nOsuZuuy6WvRblcRAGcRDvOs9+B
	3JUNbduVpKQw03OLk8ujI3L6eYabEHL3/7BG+9Jhs2M3nq8I9WETZyvi9zK9Y7Q5w/Tscb9odxw
	lH/hRKukmlsWFJmD5kjHzhhl2wn+5CBSlHV5PzMUR0u1f3hHB3TeqyXL4pK4lD3qZ7eU7NzjWsZ
	p5yekJfdZFCneMDJwb23+J8scMseREE3KvPBvMOXVNia+GZIei6RKAxOq4PVjzlca7GRheF3n+F
	OGKUPBZfkk27ZApI5sfVUaMuY5uQ1q8Wc77ISWVG0rTg8PSDyZ+nGJDfsBMXNFq1PQc4metFUwu
	cFPWrq6V4tMyG+0NCIaP+iJSw6OowgBCJOC1WrWk39tdNfJA/Cwn3G8j5DvAxSctLY/yJ0hOKqM
	rznW/Ibc9ZXjyAr3msSUiAlyJ2clxsbKd7as80JMvyhcobPm/8
X-Received: by 2002:a05:6102:12d9:b0:5f5:5c89:12e8 with SMTP id ada2fe7eead31-5f55c891584mr124776137.3.1769175262120;
        Fri, 23 Jan 2026 05:34:22 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d40ff80sm509335137.6.2026.01.23.05.34.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:34:21 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9412cb281acso602632241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:34:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIonrZeAFtFAFEsLpqeH8srCF2qALdNct87Pb8YqpQyyNKf/yReEeMSMY2rWpbCmKQKHMU1TT+xx4MCMaNnfD/9g==@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:5ef:aeff:8304 with SMTP id
 ada2fe7eead31-5f54bccac8amr893050137.33.1769175260730; Fri, 23 Jan 2026
 05:34:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:34:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhqLnfZdg_9-JmH7Nrae1MfzM73R_NUFuwXioYnNoQ8g@mail.gmail.com>
X-Gm-Features: AZwV_Qj-XKrZ6tI1NWPXXvOntE-HmWyNH8CYB4F0u4KrKnplhkYq6k74VqQHwH0
Message-ID: <CAMuHMdUhqLnfZdg_9-JmH7Nrae1MfzM73R_NUFuwXioYnNoQ8g@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: salvator-common: Describe
 PCIe/USB3.0 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27331-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BC8A8764CD
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on both
> Salvator-X and Salvator-XS boards. The clock generator supplies 100 MHz
> differential clock for both PCIe ports, as well as for the USB 3.0 PHY.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -641,16 +654,27 @@ &ohci1 {
>
>  &pcie_bus_clk {
>         clock-frequency = <100000000>;

I will drop the clock-frequency while applying, as there is no point
in changing it in a disabled node.

> +       status = "disabled";
>  };

> @@ -1038,11 +1062,13 @@ &usb3_peri0 {
>  };
>
>  &usb3_phy0 {
> +       clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
>         status = "okay";
>  };
>
>  &usb3s0_clk {
>         clock-frequency = <100000000>;

Likewise.

> +       status = "disabled";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

