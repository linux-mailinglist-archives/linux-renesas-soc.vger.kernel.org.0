Return-Path: <linux-renesas-soc+bounces-27334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DBNJix6c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:39:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C37664B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E8E33024119
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3C8231845;
	Fri, 23 Jan 2026 13:39:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21525EF87
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175593; cv=none; b=TjgelaVnRnF4+idr8EaSHNCyc7BG7B8NuP7SwuaUudEiYqa4eBFbwnbIw1VzjpWpQj3VXricvl/kJQEFzszLSxV8Q18SQl7S4nRBb0sWVKSJukRPDJ7qVxbe6kAtjyPs/a9sG9kFeeLLnrQkRQ5wTwp1qJLVLlki9/Hr7EhWkJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175593; c=relaxed/simple;
	bh=SezjN9CTD3abCICIhg7/y+Vi1HPlELPv7Rr1jPC5d58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4KGUzMqOukdBtlEmlRjtgq/z6OlfgRKIAyj6wzE6qFIrHj+K4+GNBTlU3uPps3k8+xpA/fXyS8P4Hj5R4podWFecwaVrgFg0m1BsRWDXlNhwPWse5gpjzJbBBataOGX/MVs03rWyFEKaz+uXktzkRUa8tyqqWaCpqHM9OipK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5663724e4daso1524780e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175590; x=1769780390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T4Q453c5FamHIEguPjFSHxEM5Rnl+xXzrGuGiGD+qg=;
        b=Wb4ye9Ypx4sO+7OfQhsW1wsI66eNI5OUAaH4D4C9AlQBeRYHRG7t/Gz3z9QOcBCId/
         o1Pz1iyU0I4fzFSFnKDG+PSgQdWz0IjmIFgVNXIs3NAHWLR5lkVw3+UVaq6gO1fafyM3
         kTBCPb6LHRRKYJOybhw9sgnGm1S4jF251hXLQonjzjK2Vi6VUcm7I0WyOzV/QE1R8gDl
         HqhU3UIzDTPAlxLZOKHFT2KuAT+tcNAlNR2a1VtHcWfFfqQwwKcXikk+eIyoHeGWFFvn
         GGqhBjPP8PvaPL/Z+5Cn9+XcnnotWq6DXFlobPFUYEaeyt7rWg6e4kLEWXDvfqTS+v0g
         jeGw==
X-Forwarded-Encrypted: i=1; AJvYcCVLWtx3ob/sY2P/Vvxxpa+oGB3cX2He75ACXJ+ucOGyqI2rI98Z9RHor5nC0HpM4n0ACzkD/cEe0ONGSuPgbG6xrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/z3bcjY9hl8CUVOfwDnMeIxnlr1i6KUi3a2/uhxJNyqCK7wSq
	vp+mQCJAwloDv4vrvVSif+U1mO8wPdKHcnnzw5zYSm9OJYCqaJfWaFXKewO2Zdwj
X-Gm-Gg: AZuq6aIxADtDqPs7kVLWkEeXg9JP1PKrA5FoVzzV/8w0J9AWpBOrf5HWXuI4WUZmoBO
	bQkL6l9lK5vJm4nq3V80/pmyjDSpVh4vxbhsf2PGTlD+ajZ5SzRJUVscpfiUILitlIDm3v6KYsd
	hMlVsKQN+3YNNWYL60QMs8UdiRkbJ67/BskLTpZ/gwbFrCau573qfEPLKa4YBEO2UrrvZX7Yzx7
	rH7BEqhuugjNv/mg6HOh9Ko8zXodJvuqcSB7eDQmibe3rCSvaOQDebBJLbNtu0T46aiLGF/QhCO
	b9y4qmULtRI27lt7nva7Jdj5n3rQbOXt0UIvIfuDG7t1ZwDdb4M6n54idWvxn1fYfczRdXJaI4Z
	Hm4UGOkAUuDHiB03LTwV4bJCMP1AVWbGgvx3wj1Ty/KVcJSbdy1OiGD7+MJ329fyITYwfZfFKfN
	/baIRAKQz6IwRc/vstblZprMwfx07mSSIh6oexGB8Tmmoymka8
X-Received: by 2002:a05:6122:1307:b0:55a:be72:7588 with SMTP id 71dfb90a1353d-5663eb445cemr911803e0c.11.1769175590500;
        Fri, 23 Jan 2026 05:39:50 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e321450sm481877241.7.2026.01.23.05.39.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:39:49 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5f548b7ab61so964244137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:39:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXV0RNQ04L9qW+a2qDtFrIZXv58dcNahKg76V8S2/dntzspD37duisBsR2AcGLxHLXDBz9GFJTpf5f3LdGn87kwMQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4405:b0:5f5:41a4:f166 with SMTP id
 ada2fe7eead31-5f54b9db4d9mr883093137.9.1769175589225; Fri, 23 Jan 2026
 05:39:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:39:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUERxbGJN7muntQyyYZL6uy4eh5bJUmMPBmppA8y803DQ@mail.gmail.com>
X-Gm-Features: AZwV_Qj1omzI-6qmH4tEn10AVrvuRYh99XIsZ2j_jsDkAgxLig7Gm4WvDQM34Zk
Message-ID: <CAMuHMdUERxbGJN7muntQyyYZL6uy4eh5bJUmMPBmppA8y803DQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27334-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E62C37664B
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on Ebisu
> board. The clock generator supplies 100 MHz differential clock for both
> PCIe slot and BT/WLAN expansion port, as well as for the USB 3.0 PHY.
>
> This configuration is valid for SW49 in OFF position, which means the
> PCIe signals are routed to the PCIe slot and U11 9FGV0841 PCIe clock
> generator output 3 supplies clock to the PCIe slot.
>
> In case the SW49 is set to ON position, which means the PCIe signals
> are routed to the EX BT/WLAN expansion port, and U11 9FGV0841 PCIe
> clock generator output 4 supplies clock to the port and &pciec0_rp
> clocks should be changed to "clocks = <&pcie_usb_clk 4>;". Once the
> BT/WLAN port is tested, this can be implemented using a DTO. Until
> then, assume SW49 is set to OFF position.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -578,12 +591,30 @@ &ohci0 {
>
>  &pcie_bus_clk {
>         clock-frequency = <100000000>;

I will drop the clock-frequency while applying, as there is no point
in changing it in a disabled node.

> +       status = "disabled";
>  };

> @@ -871,7 +902,19 @@ &usb2_phy0 {
>         status = "okay";
>  };
>
> +&usb3_phy0 {
> +       clocks = <&pcie_usb_clk 6>;
> +       status = "okay";
> +};
> +
> +&usb3s0_clk {
> +       clock-frequency = <100000000>;

Likewise.

> +       status = "disabled";
> +};
> +
>  &usb3_peri0 {
> +       phys = <&usb3_phy0>;
> +       phy-names = "usb";
>         companion = <&xhci0>;
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

